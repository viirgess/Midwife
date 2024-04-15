import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blog_page_widget.dart' show BlogPageWidget;
import 'package:flutter/material.dart';

class BlogPageModel extends FlutterFlowModel<BlogPageWidget> {
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
