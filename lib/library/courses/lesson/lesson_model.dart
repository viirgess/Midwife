import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lesson_widget.dart' show LessonWidget;
import 'package:flutter/material.dart';

class LessonModel extends FlutterFlowModel<LessonWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  LessonsRecord? previouLesson;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  LessonsRecord? nextlesson;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
