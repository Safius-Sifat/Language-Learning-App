import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends ConsumerStatefulWidget {
  const VideoWidget(
      {super.key, required this.filePath, required this.fromFile});
  final String filePath;
  final bool fromFile;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends ConsumerState<VideoWidget> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializePlayer() async {
    if (widget.fromFile) {
      videoPlayerController = VideoPlayerController.file(
        File(
          widget.filePath,
        ),
      );
    } else {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.filePath),
      );
    }
    await videoPlayerController.initialize();
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return chewieController != null &&
            chewieController!.videoPlayerController.value.isInitialized
        ? ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.p12),
            child: Chewie(controller: chewieController!))
        : _buildLoader();
  }

  Widget _buildLoader() {
    if (widget.fromFile) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Skeleton.leaf(
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Icon(
              Icons.play_arrow,
              color: Colors.grey,
              size: 50,
            ),
          ),
        ),
      );
    }
  }
}
