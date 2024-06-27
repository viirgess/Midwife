import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'upload_photo_page_widget.dart' show UploadPhotoPageWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadPhotoPageModel extends FlutterFlowModel<UploadPhotoPageWidget> {
  ///  Local state fields for this page.

  bool pregnancy = true;

  DateTime? pickedDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - cupertinoWeekPicker] action in Container widget.
  int? week;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  MemoriesRecord? memortyByWeek;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  MemoriesRecord? memortyByDate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
