import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'course_page_widget.dart' show CoursePageWidget;
import 'package:flutter/material.dart';

class CoursePageModel extends FlutterFlowModel<CoursePageWidget> {
  ///  Local state fields for this page.

  String currentVideoPath =
      'https://samplelib.com/lib/preview/mp4/sample-5s.mp4';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.

  Map<LessonsRecord, bool> checkboxValueMap = {};
  List<LessonsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
