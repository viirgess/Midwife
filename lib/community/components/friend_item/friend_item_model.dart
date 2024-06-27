import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friend_item_widget.dart' show FriendItemWidget;
import 'package:flutter/material.dart';

class FriendItemModel extends FlutterFlowModel<FriendItemWidget> {
  ///  Local state fields for this component.

  String location = 'null';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in FriendItem widget.
  UsersRecord? userDoc;
  // Stores action output result for [Custom Action - getLocationName] action in FriendItem widget.
  String? locationName;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? chatWithUserExists;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? chatWithUserExists2;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChatWithUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
