import '/flutter_flow/flutter_flow_util.dart';
import 'due_date_widget.dart' show DueDateWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DueDateModel extends FlutterFlowModel<DueDateWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
