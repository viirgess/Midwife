import '/components/app_bar/app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'free_ebook_page_widget.dart' show FreeEbookPageWidget;
import 'package:flutter/material.dart';

class FreeEbookPageModel extends FlutterFlowModel<FreeEbookPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    drawerDataModel = createModel(context, () => DrawerDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    drawerDataModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
