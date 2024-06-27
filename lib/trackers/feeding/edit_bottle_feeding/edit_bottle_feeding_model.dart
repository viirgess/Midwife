import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_bottle_feeding_widget.dart' show EditBottleFeedingWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditBottleFeedingModel extends FlutterFlowModel<EditBottleFeedingWidget> {
  ///  Local state fields for this component.

  String? selectedType;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in EditBottleFeeding widget.
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
