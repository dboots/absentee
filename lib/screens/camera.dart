import 'dart:io';
import 'package:absentee/utils/VideoPlayer.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    required this.camera,
    required this.callback,
    super.key,
  });

  final CameraDescription camera;
  final Function(List<File>) callback;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget>
    with WidgetsBindingObserver {
  CameraController? _controller;
  List<File> _images = [];
  FlashMode _flashMode = FlashMode.off;
  bool _isRecording = false;
  bool _isCameraInitialized = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final controller = CameraController(
        widget.camera,
        ResolutionPreset.medium,
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await controller.initialize();
      await controller.setFlashMode(_flashMode);

      if (mounted) {
        setState(() {
          _controller = controller;
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      developer.log('Error initializing camera: $e');
      // Show error to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to initialize camera: $e')),
        );
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  Future<void> _takePicture() async {
    final controller = _controller;
    if (controller == null ||
        !controller.value.isInitialized ||
        _isProcessing) {
      return;
    }

    try {
      setState(() => _isProcessing = true);

      final image = await controller.takePicture();

      if (mounted) {
        setState(() {
          _images = [..._images, File(image.path)];
          _isProcessing = false;
        });
      }
    } catch (e) {
      developer.log('Error taking picture: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to take picture: $e')),
        );
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _toggleRecording() async {
    final controller = _controller;
    if (controller == null ||
        !controller.value.isInitialized ||
        _isProcessing) {
      return;
    }

    try {
      setState(() => _isProcessing = true);

      if (_isRecording) {
        final file = await controller.stopVideoRecording();
        if (mounted) {
          setState(() {
            _images = [..._images, File(file.path)];
            _isRecording = false;
          });
        }
      } else {
        await controller.prepareForVideoRecording();
        await controller.startVideoRecording();
        if (mounted) {
          setState(() => _isRecording = true);
        }
      }
    } catch (e) {
      developer.log('Error handling video recording: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to handle video recording: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  void _removeImage(int index) {
    if (index >= 0 && index < _images.length) {
      setState(() {
        _images.removeAt(index);
      });
    }
  }

  void _reorderImages(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final File image = _images.removeAt(oldIndex);
      _images.insert(newIndex, image);
    });
  }

  Widget _buildGalleryDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView(
                onReorder: _reorderImages,
                children: [
                  for (int index = 0; index < _images.length; index++)
                    ListTile(
                      key: ValueKey(index),
                      title: Stack(
                        children: [
                          if (_images[index].path.endsWith('.mp4'))
                            AbsenteeVideo(file: _images[index])
                          else
                            Image.file(_images[index], fit: BoxFit.cover),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _removeImage(index),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      drawer: _buildGalleryDrawer(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (_controller != null) CameraPreview(_controller!),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top controls
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircularButton(
                        icon: Icons.photo_library,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                      _buildCircularButton(
                        icon: _flashMode == FlashMode.always
                            ? Icons.flash_on
                            : Icons.flash_off,
                        onPressed: _toggleFlash,
                      ),
                    ],
                  ),
                ),
                // Bottom controls
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        heroTag: 'back',
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back),
                      ),
                      FloatingActionButton(
                        heroTag: 'shoot',
                        onPressed: _isProcessing ? null : _takePicture,
                        child: const Icon(Icons.camera_alt),
                      ),
                      FloatingActionButton(
                        heroTag: 'record',
                        onPressed: _isProcessing ? null : _toggleRecording,
                        child: Icon(_isRecording
                            ? Icons.stop_outlined
                            : Icons.play_arrow_outlined),
                      ),
                      FloatingActionButton(
                        heroTag: 'finish',
                        onPressed: () {
                          widget.callback(_images);
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.check),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: Colors.white30,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }

  Future<void> _toggleFlash() async {
    try {
      final newMode =
          _flashMode == FlashMode.always ? FlashMode.off : FlashMode.always;

      await _controller?.setFlashMode(newMode);

      if (mounted) {
        setState(() => _flashMode = newMode);
      }
    } catch (e) {
      developer.log('Error toggling flash: $e');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }
}
