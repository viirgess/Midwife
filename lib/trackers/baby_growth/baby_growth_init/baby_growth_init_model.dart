import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'baby_growth_init_widget.dart' show BabyGrowthInitWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BabyGrowthInitModel extends FlutterFlowModel<BabyGrowthInitWidget> {
  ///  Local state fields for this page.

  DateTime? dateOfBirth;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TrackersRecord? trackerDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
