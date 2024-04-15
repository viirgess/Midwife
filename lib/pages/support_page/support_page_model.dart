import '/backend/api_requests/api_calls.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'support_page_widget.dart' show SupportPageWidget;
import 'package:flutter/material.dart';

class SupportPageModel extends FlutterFlowModel<SupportPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Message should contain at least 5 characters';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (SendEmail)] action in Container widget.
  ApiCallResponse? apiResultlv1;
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    drawerDataModel = createModel(context, () => DrawerDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    drawerDataModel.dispose();
  }
}
