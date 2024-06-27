import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_friends_widget.dart' show MyFriendsWidget;
import 'package:flutter/material.dart';

class MyFriendsModel extends FlutterFlowModel<MyFriendsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in FriendItem widget.
  ChatsRecord? chatWithUserExists;
  // Stores action output result for [Firestore Query - Query a collection] action in FriendItem widget.
  ChatsRecord? chatWithUserExists2;
  // Stores action output result for [Backend Call - Create Document] action in FriendItem widget.
  ChatsRecord? newChatWithUser;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomNavBarModel.dispose();
  }
}
