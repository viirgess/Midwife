import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/courses/course_content_create/course_content_create_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'course_editor_page_widget.dart' show CourseEditorPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CourseEditorPageModel extends FlutterFlowModel<CourseEditorPageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> lessonsList = [];
  void addToLessonsList(DocumentReference item) => lessonsList.add(item);
  void removeFromLessonsList(DocumentReference item) =>
      lessonsList.remove(item);
  void removeAtIndexFromLessonsList(int index) => lessonsList.removeAt(index);
  void insertAtIndexInLessonsList(int index, DocumentReference item) =>
      lessonsList.insert(index, item);
  void updateLessonsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lessonsList[index] = updateFn(lessonsList[index]);

  int sectionsNum = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
