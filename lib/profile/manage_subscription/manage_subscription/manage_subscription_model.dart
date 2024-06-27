import '/flutter_flow/flutter_flow_util.dart';
import 'manage_subscription_widget.dart' show ManageSubscriptionWidget;
import 'package:flutter/material.dart';

class ManageSubscriptionModel
    extends FlutterFlowModel<ManageSubscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
