import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'diaper_tracker_widget.dart' show DiaperTrackerWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaperTrackerModel extends FlutterFlowModel<DiaperTrackerWidget> {
  ///  Local state fields for this page.

  Diaper? selectedType = Diaper.Wet;

  int wetnessLevel = 1;

  String dirtyType = 'Sticky';

  int? color = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
