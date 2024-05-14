import '/ai/empty_ai_chat/empty_ai_chat_widget.dart';
import '/ai/progress_bar_a_i_component/progress_bar_a_i_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_page_widget.dart' show AIPageWidget;
import 'package:flutter/material.dart';

class AIPageModel extends FlutterFlowModel<AIPageWidget> {
  ///  Local state fields for this page.

  int messages = 0;

  bool showSend = false;

  bool? showTextField;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for progressBarAIComponent component.
  late ProgressBarAIComponentModel progressBarAIComponentModel;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for ListViewMessages widget.
  ScrollController? listViewMessages;
  // Model for EmptyAiChat component.
  late EmptyAiChatModel emptyAiChatModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for MessageTextField widget.
  FocusNode? messageTextFieldFocusNode;
  TextEditingController? messageTextFieldTextController;
  String? Function(BuildContext, String?)?
      messageTextFieldTextControllerValidator;
  String? _messageTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'min 6 characters';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (chatGPTService)] action in Container widget.
  ApiCallResponse? apiResultofu;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    progressBarAIComponentModel =
        createModel(context, () => ProgressBarAIComponentModel());
    listViewController = ScrollController();
    listViewMessages = ScrollController();
    emptyAiChatModel = createModel(context, () => EmptyAiChatModel());
    messageTextFieldTextControllerValidator =
        _messageTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    progressBarAIComponentModel.dispose();
    listViewController?.dispose();
    listViewMessages?.dispose();
    emptyAiChatModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    messageTextFieldFocusNode?.dispose();
    messageTextFieldTextController?.dispose();
  }
}
