import '/flutter_flow/flutter_flow_util.dart';
import 'calculate_due_date_widget.dart' show CalculateDueDateWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculateDueDateModel extends FlutterFlowModel<CalculateDueDateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // Stores action output result for [Custom Action - cupertinoDaysPickerCopy] action in Container widget.
  int? days;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
