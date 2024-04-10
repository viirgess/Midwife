import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/courses/edit_lesson_name/edit_lesson_name_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'course_content_create_widget.dart' show CourseContentCreateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
}
