import '/flutter_flow/flutter_flow_util.dart';
import 'course_editor_page_widget.dart' show CourseEditorPageWidget;
import 'package:flutter/material.dart';

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

  /// Initialization and disposal methods.

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

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
