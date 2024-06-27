import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_sheet_widget.dart' show UserSheetWidget;
import 'package:flutter/material.dart';

class UserSheetModel extends FlutterFlowModel<UserSheetWidget> {
  ///  Local state fields for this component.

  bool hasSentRequest = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationsRecord? notificationRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? chatWithUserExists;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? chatWithUserExists2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatWithUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
