import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_breast_feeding_widget.dart' show EditBreastFeedingWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditBreastFeedingModel extends FlutterFlowModel<EditBreastFeedingWidget> {
  ///  Local state fields for this component.

  bool? firstBreast;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in EditBreastFeeding widget.
  TrackersRecord? trackerRef;
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
