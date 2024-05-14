import '/backend/backend.dart';
import '/chat/empty_inbox/empty_inbox_widget.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'private_chats_page_widget.dart' show PrivateChatsPageWidget;
import 'package:flutter/material.dart';

class PrivateChatsPageModel extends FlutterFlowModel<PrivateChatsPageWidget> {
  ///  Local state fields for this page.

  bool showChats = true;

  bool chatWithRenske = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PrivateChatsPage widget.
  ChatsRecord? chatWithMidwife;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? chatExists;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChat;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? chatExists2;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChatCopy;
  // Model for EmptyInbox component.
  late EmptyInboxModel emptyInboxModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    emptyInboxModel = createModel(context, () => EmptyInboxModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    drawerDataModel = createModel(context, () => DrawerDataModel());
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emptyInboxModel.dispose();
    bottomNavBarModel.dispose();
    drawerDataModel.dispose();
    appBarModel.dispose();
  }
}
