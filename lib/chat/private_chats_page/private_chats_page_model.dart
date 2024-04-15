import '/backend/backend.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'private_chats_page_widget.dart' show PrivateChatsPageWidget;
import 'package:flutter/material.dart';

class PrivateChatsPageModel extends FlutterFlowModel<PrivateChatsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? chatExists;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChat;
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
