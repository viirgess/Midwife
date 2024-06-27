import '/flutter_flow/flutter_flow_util.dart';
import 'add_breast_feeding_widget.dart' show AddBreastFeedingWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddBreastFeedingModel extends FlutterFlowModel<AddBreastFeedingWidget> {
  ///  Local state fields for this component.

  bool? firstBreast;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
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
