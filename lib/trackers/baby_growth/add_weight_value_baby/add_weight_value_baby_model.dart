import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_weight_value_baby_widget.dart' show AddWeightValueBabyWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddWeightValueBabyModel
    extends FlutterFlowModel<AddWeightValueBabyWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - babyWeightPicker] action in Container widget.
  double? outputCurrentWeight;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TrackersRecord? trackerDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
