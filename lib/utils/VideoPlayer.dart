import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class AbsenteeVideo extends StatefulWidget {
  const AbsenteeVideo({super.key, required this.file});
  final File file;

  @override
  State<AbsenteeVideo> createState() => _AbsenteeVideoState();
}

class _AbsenteeVideoState extends State<AbsenteeVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initControllerFuture;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.file.path);
    _initControllerFuture = _controller.initialize();
    _initThumbnail();
  }

  Future<Uint8List?> _initThumbnail() async {
// the file name pattern we want
    RegExp regExp = RegExp(
      r"/^[a-zA-Z0-9_-]+$/",
      caseSensitive: false,
      multiLine: false,
    );

    String mediaPath = widget.file.path;

    if (!regExp.hasMatch(widget.file.path)) {
      String tempDir = (await getTemporaryDirectory()).path;
      String fileExtension = widget.file.path.split('.').last;
      String newPath =
          '$tempDir/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';

      File tempFile = await widget.file.copy(newPath);

      // you can use this new file path for making the thumbnail without error
      mediaPath = tempFile.path;
    }
    return await VideoThumbnail.thumbnailData(
      video: mediaPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      quality: 25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initThumbnail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // return videplayer widget with a play and stop button
            return Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.memory(snapshot.data as Uint8List),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.stop : Icons.play_arrow,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isPlaying) {
                          _controller.pause();
                          _isPlaying = false;
                        } else {
                          _controller.play();
                          _isPlaying = true;
                        }
                      });
                    },
                  ),
                ),
              ],
            );
            
          } else {
            // return centered progress indicator while thumbnail is being generated
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
