import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_sending_photo_widget.dart' show ConfirmSendingPhotoWidget;
import 'package:flutter/material.dart';

class ConfirmSendingPhotoModel
    extends FlutterFlowModel<ConfirmSendingPhotoWidget> {
  ///  Local state fields for this component.

  String? selectedImage;

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
