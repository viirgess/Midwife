import '/flutter_flow/flutter_flow_util.dart';
import 'leave_comment_pregnancy_widget.dart' show LeaveCommentPregnancyWidget;
import 'package:flutter/material.dart';

class LeaveCommentPregnancyModel
    extends FlutterFlowModel<LeaveCommentPregnancyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
