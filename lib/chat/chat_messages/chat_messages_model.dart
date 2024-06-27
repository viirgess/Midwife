import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_messages_widget.dart' show ChatMessagesWidget;
import 'package:flutter/material.dart';

class ChatMessagesModel extends FlutterFlowModel<ChatMessagesWidget> {
  ///  Local state fields for this page.

  bool showSend = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChatListView widget.
  ScrollController? chatListView;
  List<ChatMessagesRecord>? chatListViewPreviousSnapshot;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for MessageTextField widget.
  FocusNode? messageTextFieldFocusNode;
  TextEditingController? messageTextFieldTextController;
  String? Function(BuildContext, String?)?
      messageTextFieldTextControllerValidator;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? userBDoc;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? userADoc;

  @override
  void initState(BuildContext context) {
    chatListView = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    chatListView?.dispose();
    messageTextFieldFocusNode?.dispose();
    messageTextFieldTextController?.dispose();
  }
}
