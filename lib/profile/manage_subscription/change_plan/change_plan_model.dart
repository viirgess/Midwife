import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_plan_widget.dart' show ChangePlanWidget;
import 'package:flutter/material.dart';

class ChangePlanModel extends FlutterFlowModel<ChangePlanWidget> {
  ///  Local state fields for this page.

  SubscriptionStruct? selectedPlan;
  void updateSelectedPlanStruct(Function(SubscriptionStruct) updateFn) {
    updateFn(selectedPlan ??= SubscriptionStruct());
  }

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
