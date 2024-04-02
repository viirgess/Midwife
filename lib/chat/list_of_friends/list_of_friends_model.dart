import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_friends_widget.dart' show ListOfFriendsWidget;
import 'package:flutter/material.dart';

class ListOfFriendsModel extends FlutterFlowModel<ListOfFriendsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ChatsRecord? chatExists;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  ChatsRecord? newChat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
