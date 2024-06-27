import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'weight_tracker_widget.dart' show WeightTrackerWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightTrackerModel extends FlutterFlowModel<WeightTrackerWidget> {
  ///  Local state fields for this page.

  double? initialWeight;

  double? currentWeight;

  DateTime? initialDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - weightPicker] action in Container widget.
  double? outputWeight;
  DateTime? datePicked;
  // Stores action output result for [Custom Action - weightPicker] action in Container widget.
  double? outputCurrentWeight;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TrackersRecord? trackerDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
