import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({required this.camera, required this.callback, super.key});
  final CameraDescription camera;
  final Function(List<XFile>) callback;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<XFile> images = [];
  FlashMode _flashMode = FlashMode.off;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller
        .initialize()
        .then((value) => _controller.setFlashMode(_flashMode));
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
                      child: ReorderableListView(
                          children: <Widget>[
                            for (int index = 0; index < images.length; index++)
                              ListTile(
                                  key: ValueKey(index),
                                  title: Stack(children: [
                                    SizedBox(
                                        child: Image.file(
                                            File(images[index].path))),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  images.removeAt(index);
                                                });
                                              },
                                              icon: const Icon(Icons.delete))
                                        ])
                                  ]))
                          ],
                          onReorder: (int oldIndex, int newIndex) {
                            setState(() {
                              if (oldIndex < newIndex) {
                                newIndex -= 1;
                              }
                              final XFile image = images.removeAt(oldIndex);
                              images.insert(newIndex, image);
                            });
                          }))),
              body: Stack(
                alignment: FractionalOffset.bottomCenter,
                children: <Widget>[
                  Container(height: double.infinity),
                  Positioned.fill(
                    child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: CameraPreview(_controller)),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _key.currentState!.openDrawer();
                                },
                                icon: const Icon(Icons.menu)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _flashMode = _flashMode == FlashMode.always
                                        ? FlashMode.off
                                        : FlashMode.always;
                                    _controller.setFlashMode(_flashMode);
                                  });
                                },
                                icon: Icon((_flashMode == FlashMode.always)
                                    ? Icons.flash_on
                                    : Icons.flash_off))
                          ],
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            // Provide an onPressed callback.
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          FloatingActionButton(
                            // Provide an onPressed callback.
                            onPressed: () async {
                              try {
                                await _initializeControllerFuture;
                                final image = await _controller.takePicture();
                                setState(() {
                                  images = [...images, image];
                                });
                                if (!mounted) return;
                              } catch (e) {}
                            },
                            child: const Icon(Icons.camera_alt),
                          ),
                          FloatingActionButton(
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
