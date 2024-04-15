import '/components/back_app_bar/back_app_bar_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'name_list_page_widget.dart' show NameListPageWidget;
import 'package:flutter/material.dart';

class NameListPageModel extends FlutterFlowModel<NameListPageWidget> {
  ///  Local state fields for this page.

  int loopGirl = 0;

  bool? girlChosen;

  int loopBoy = 0;

  int loopCommon = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BackAppBar component.
  late BackAppBarModel backAppBarModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    backAppBarModel = createModel(context, () => BackAppBarModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backAppBarModel.dispose();
    navBarModel.dispose();
  }
}
