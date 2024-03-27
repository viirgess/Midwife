import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_choose_page_widget.dart' show SubscriptionChoosePageWidget;
import 'package:flutter/material.dart';

class SubscriptionChoosePageModel
    extends FlutterFlowModel<SubscriptionChoosePageWidget> {
  ///  Local state fields for this page.

  bool monthlyChosen = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
