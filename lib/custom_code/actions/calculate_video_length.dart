// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';

Future<int> calculateVideoLength(String videoPath) async {
  // Add your function code here!
  VideoPlayerController _controller =
      VideoPlayerController.networkUrl(Uri.parse(videoPath));

  await _controller.initialize();

  final duration = _controller.value.duration;

  await _controller.dispose();

  // debugPrint(duration.inSeconds.toString());

  return duration.inMinutes < 1 ? 1 : duration.inMinutes;
}
