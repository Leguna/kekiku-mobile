import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({
    super.key,
    required this.videoPlayerController,
  });

  final VideoPlayerController videoPlayerController;

  @override
  VideoAppState createState() => VideoAppState();
}

class VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.videoPlayerController;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(children: [
            VideoPlayer(_controller),
            if (!_controller.value.isPlaying)
              Center(
                child: Icon(
                  _controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_circle_outline_rounded,
                  size: 100.0,
                  color: Colors.white,
                ),
              ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }
}
