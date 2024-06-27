// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CourseVideoPlayer extends StatefulWidget {
  const CourseVideoPlayer({
    super.key,
    this.width,
    this.height,
    required this.videoPath,
    required this.authRef,
    required this.lessonRef,
    required this.courseRef,
  });

  final double? width;
  final double? height;
  final String videoPath;
  final String authRef;
  final String lessonRef;
  final String courseRef;

  @override
  State<CourseVideoPlayer> createState() => _CourseVideoPlayerState();
}

class _CourseVideoPlayerState extends State<CourseVideoPlayer> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void didUpdateWidget(covariant CourseVideoPlayer oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoPath != widget.videoPath) {
      _initializePlayer();
    }
  }

  void _initializePlayer() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoPath))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.position.inSeconds ==
          _controller.value.duration.inSeconds) {
        _markLessonComplete();
      }
    });

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      materialProgressColors: ChewieProgressColors(
        playedColor: Color.fromRGBO(160, 126, 255, 1),
      ),
      autoPlay: false,
      autoInitialize: true,
      looping: false,
      showOptions: false,
      allowFullScreen: true,
      allowMuting: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _markLessonComplete() async {
    DocumentReference userReference = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.authRef);

    await FirebaseFirestore.instance
        .collection('courses')
        .doc(widget.courseRef)
        .collection('lessons')
        .doc(widget.lessonRef)
        .update({
      'is_seen': FieldValue.arrayUnion([userReference]),
    });
    debugPrint(
        'Video completed for user ${widget.authRef} in lesson $widget.lessonRef');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(widget.lessonRef),
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Chewie(
                controller: _chewieController,
              ),
            )
          : CircularProgressIndicator(
              color: Color.fromRGBO(160, 126, 255, 1),
            ),
    );
  }
}
