import '/components/back_app_bar/back_app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'online_coaching_page_widget.dart' show OnlineCoachingPageWidget;
import 'package:flutter/material.dart';

class OnlineCoachingPageModel
    extends FlutterFlowModel<OnlineCoachingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;
  // Model for BackAppBar component.
  late BackAppBarModel backAppBarModel;

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
    backAppBarModel = createModel(context, () => BackAppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
    backAppBarModel.dispose();
  }
}
