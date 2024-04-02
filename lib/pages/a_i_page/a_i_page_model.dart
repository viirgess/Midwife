import '/backend/api_requests/api_calls.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/back_app_bar/back_app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_page_widget.dart' show AIPageWidget;
import 'package:flutter/material.dart';

class AIPageModel extends FlutterFlowModel<AIPageWidget> {
  ///  Local state fields for this page.

  int messages = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (chatGPTService)] action in Button widget.
  ApiCallResponse? apiResultofu;
  // Stores action output result for [Cloud Function - updateFieldMonthly] action in Button widget.
  UpdateFieldMonthlyCloudFunctionCallResponse? cloudFunctionvv4;
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;
  // Model for BackAppBar component.
  late BackAppBarModel backAppBarModel;

  @override
  void initState(BuildContext context) {
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    drawerDataModel = createModel(context, () => DrawerDataModel());
    backAppBarModel = createModel(context, () => BackAppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    drawerDataModel.dispose();
    backAppBarModel.dispose();
  }
}
