import 'dart:io';
import 'package:absentee/utils/VideoPlayer.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class CameraWidget extends StatefulWidget {
  const CameraWidget({required this.camera, required this.callback, super.key});
  final CameraDescription camera;
  final Function(List<File>) callback;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<File> images = [];
  FlashMode _flashMode = FlashMode.off;
  bool isOffline = false;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize().then((value) {
      _controller.setFlashMode(_flashMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Scaffold(
              key: _key,
              drawer: Drawer(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: SafeArea(
                          child: ReorderableListView(
                              children: <Widget>[
                            for (int index = 0; index < images.length; index++)
                              ListTile(
                                  key: ValueKey(index),
                                  title: Stack(children: [
                                    if (images[index]
                                        .path
                                        .split('.')
                                        .last
                                        .contains('mp4'))
                                      AbsenteeVideo(
                                          file: File(images[index].path))
                                    else
                                      SizedBox(
                                          child: Image.file(
                                              File(images[index].path))),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              decoration: const ShapeDecoration(
                                                  shape: CircleBorder(),
                                                  color: Colors.white30),
                                              child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      images.removeAt(index);
                                                    });
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete)))
                                        ])
                                  ]))
                          ],
                              onReorder: (int oldIndex, int newIndex) {
                                setState(() {
                                  if (oldIndex < newIndex) {
                                    newIndex -= 1;
                                  }
                                  final File image = images.removeAt(oldIndex);
                                  images.insert(newIndex, image);
                                });
                              })))),
              body: Stack(
                alignment: FractionalOffset.bottomCenter,
                children: <Widget>[
                  Container(height: double.infinity),
                  Positioned.fill(
                    child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: CameraPreview(_controller)),
                  ),
                  SafeArea(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    decoration: const ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: Colors.white30),
                                    child: IconButton(
                                        onPressed: () {
                                          _key.currentState!.openDrawer();
                                        },
                                        icon: const Icon(Icons.photo_library))),
                                Container(
                                    decoration: const ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: Colors.white30),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _flashMode =
                                                _flashMode == FlashMode.always
                                                    ? FlashMode.off
                                                    : FlashMode.always;
                                            _controller
                                                .setFlashMode(_flashMode);
                                          });
                                        },
                                        icon: Icon(
                                            (_flashMode == FlashMode.always)
                                                ? Icons.flash_on
                                                : Icons.flash_off)))
                              ],
                            ))),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            heroTag: 'back',
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          FloatingActionButton(
                            heroTag: 'shoot',
                            onPressed: () async {
                              log('here');
                              try {
                                await _initializeControllerFuture;
                                log('taking picture');
                                final image = await _controller.takePicture();
                                log('${image.mimeType}');
                                log('taking picture done');
                                setState(() {
                                  log('setting state ${image.path} ${images.length}');
                                  images = [...images, File(image.path)];
                                  log('state set ${images.length}');
                                });
                                if (!mounted) return;
                              } catch (e) {
                                log('error found ${e.toString()}');
                              }
                            },
                            child: const Icon(Icons.camera_alt),
                          ),
                          FloatingActionButton(
                            heroTag: 'record',
                            onPressed: () async {
                              if (_isRecording) {
                                final file =
                                    await _controller.stopVideoRecording();
                                print('stop recording');
                                print('$file');
                                images = [...images, File(file.path)];
                                setState(() => _isRecording = false);
                              } else {
                                await _controller.prepareForVideoRecording();
                                await _controller.startVideoRecording();
                                setState(() => _isRecording = true);
                              }
                            },
                            child: _isRecording
                                ? const Icon(Icons.stop_outlined)
                                : const Icon(Icons.play_arrow_outlined),
                          ),
                          FloatingActionButton(
                            heroTag: 'finish',
                            onPressed: () async {
                              widget.callback(images);
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.check),
                          ),
                        ],
                      )),
                ],
              ));
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
}
