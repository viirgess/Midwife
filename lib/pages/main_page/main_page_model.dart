import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_page_widget.dart' show MainPageWidget;
import 'package:flutter/material.dart';

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  ///  Local state fields for this page.

  bool closeClicked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
  }
}
