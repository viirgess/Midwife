import '/flutter_flow/flutter_flow_util.dart';
import 'leave_reply_pregnancy_widget.dart' show LeaveReplyPregnancyWidget;
import 'package:flutter/material.dart';

class LeaveReplyPregnancyModel
    extends FlutterFlowModel<LeaveReplyPregnancyWidget> {
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
