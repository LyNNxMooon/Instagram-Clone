import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.filePath,
    this.isFileNetwork = false,
  });

  final String filePath;

  final bool isFileNetwork;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isPlay = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.isFileNetwork
        ? VideoPlayerController.networkUrl(Uri.parse(widget.filePath))
        : VideoPlayerController.file(File(widget.filePath));

    _controller.initialize().whenComplete(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {});
      }
    });

    _controller.addListener(() {
      if (mounted) {
        setState(() {
          isPlay = _controller.value.isPlaying;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
            children: [
              Positioned.fill(child: VideoPlayer(_controller)),
              Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      if (isPlay) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    },
                    icon: Icon(
                      isPlay ? Icons.pause : Icons.play_arrow,
                      size: kSP40x,
                      color: kPrimaryColor,
                    ),
                  )),
            ],
          )
        : const LoadingWidget();
  }
}
