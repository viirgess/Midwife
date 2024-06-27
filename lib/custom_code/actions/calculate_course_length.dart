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

Future<int> calculateCourseLength(String courseRef) async {
  // Add your function code here!
  // 1. Get all lessons documents from the collection
  final coursesDocs = await FirebaseFirestore.instance
      .collection('courses')
      .doc(courseRef)
      .collection('lessons')
      .get();

  // 2. Check if there are any documents
  if (coursesDocs.docs.isEmpty) {
    return 0; // Return 0 if no lessons are found
  }

  // 3. Calculate the total video length by summing 'video_length' fields
  int totalVideoLength = 0;
  for (var doc in coursesDocs.docs) {
    final videoLength = await calculateVideoLength(doc.get('video_path'));

    totalVideoLength += videoLength;

    debugPrint(totalVideoLength.toString());
  }

  await FirebaseFirestore.instance.collection('courses').doc(courseRef).update({
    'totalLength': totalVideoLength,
  });

  return totalVideoLength;
}
