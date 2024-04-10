import '/backend/backend.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/components/ebook_card/ebook_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'free_ebook_page_widget.dart' show FreeEbookPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FreeEbookPageModel extends FlutterFlowModel<FreeEbookPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
    appBarModel.dispose();
  }
}
