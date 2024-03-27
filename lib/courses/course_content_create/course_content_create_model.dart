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
  late ExpandableController expandableController;

  // State field(s) for TextFieldSection widget.
  FocusNode? textFieldSectionFocusNode;
  TextEditingController? textFieldSectionController;
  String? Function(BuildContext, String?)? textFieldSectionControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for TextFieldAddLesson widget.
  FocusNode? textFieldAddLessonFocusNode;
  TextEditingController? textFieldAddLessonController;
  String? Function(BuildContext, String?)?
      textFieldAddLessonControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableController.dispose();
    textFieldSectionFocusNode?.dispose();
    textFieldSectionController?.dispose();

    textFieldAddLessonFocusNode?.dispose();
    textFieldAddLessonController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
