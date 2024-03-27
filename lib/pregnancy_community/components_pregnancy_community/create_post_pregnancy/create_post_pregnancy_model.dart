import '/flutter_flow/flutter_flow_util.dart';
import 'create_post_pregnancy_widget.dart' show CreatePostPregnancyWidget;
import 'package:flutter/material.dart';

class CreatePostPregnancyModel
    extends FlutterFlowModel<CreatePostPregnancyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
