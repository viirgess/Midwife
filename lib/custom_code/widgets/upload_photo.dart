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

import 'package:dotted_border/dotted_border.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: DottedBorder(
        color: Color.fromRGBO(160, 126, 255, 1), // Border color
        radius: Radius.circular(12),
        strokeWidth: 2.0, // Border line width
        dashPattern: [8, 4], // Dash pattern (on, off pixels)
        child: Center(
          child: Image.network(
            // Your container content
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/midwife-mentor-2x4x5k/assets/sbgm4ch9gw8w/gallery_icon.png',
            width: 24,
            height: 24,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
