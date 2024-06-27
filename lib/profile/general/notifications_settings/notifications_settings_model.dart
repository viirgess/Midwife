import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_settings_widget.dart' show NotificationsSettingsWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsSettingsModel
    extends FlutterFlowModel<NotificationsSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // State field(s) for Switch widget.
  bool? switchValue6;
  // State field(s) for Switch widget.
  bool? switchValue7;
  DateTime? datePicked;
  // State field(s) for Switch widget.
  bool? switchValue8;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
