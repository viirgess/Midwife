import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_diaper_change_widget.dart' show EditDiaperChangeWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditDiaperChangeModel extends FlutterFlowModel<EditDiaperChangeWidget> {
  ///  Local state fields for this component.

  Diaper? type = Diaper.Wet;

  int wetnessLevel = 1;

  int? color;

  String? dirtyType;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in EditDiaperChange widget.
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
