import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'course_content_create_widget.dart' show CourseContentCreateWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CourseContentCreateModel
    extends FlutterFlowModel<CourseContentCreateWidget> {
  ///  Local state fields for this component.

  int lessonNum = 1;

  ///  State fields for stateful widgets in this component.

  SectionsRecord? containerPreviousSnapshot;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for TextFieldSection widget.
  FocusNode? textFieldSectionFocusNode;
  TextEditingController? textFieldSectionTextController;
  String? Function(BuildContext, String?)?
      textFieldSectionTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for TextFieldAddLesson widget.
  FocusNode? textFieldAddLessonFocusNode;
  TextEditingController? textFieldAddLessonTextController;
  String? Function(BuildContext, String?)?
      textFieldAddLessonTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
    textFieldSectionFocusNode?.dispose();
    textFieldSectionTextController?.dispose();

    textFieldAddLessonFocusNode?.dispose();
    textFieldAddLessonTextController?.dispose();
  }
}
