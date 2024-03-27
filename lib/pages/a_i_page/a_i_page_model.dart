import '/backend/api_requests/api_calls.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_page_widget.dart' show AIPageWidget;
import 'package:flutter/material.dart';

class AIPageModel extends FlutterFlowModel<AIPageWidget> {
  ///  Local state fields for this page.

  int messages = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (chatGPTService)] action in Button widget.
  ApiCallResponse? apiResultofu;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    drawerDataModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
