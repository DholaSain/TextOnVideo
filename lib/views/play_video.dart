import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';
import 'package:videotext/Controllers/home_controller.dart';
import 'package:videotext/Controllers/video_controller.dart';

class PlayVideo extends GetWidget<VideoController> {
  const PlayVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (curruntVideoPath.value == null) {
            return Container(
              child: Text('Loading...'),
            );
          } else {
            return AspectRatio(
              aspectRatio: controller.videoController.value!.value.aspectRatio,
              child: VideoPlayer(controller.videoController.value!),
            );
          }
        }),
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoScreen> {
  _VideoAppState();

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(curruntVideoPath.value!))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
