import '/flutter_flow/flutter_flow_util.dart';
import 'ask_additional_feedback_widget.dart' show AskAdditionalFeedbackWidget;
import 'package:flutter/material.dart';

class AskAdditionalFeedbackModel
    extends FlutterFlowModel<AskAdditionalFeedbackWidget> {
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
