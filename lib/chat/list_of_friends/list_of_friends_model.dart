import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_friends_widget.dart' show ListOfFriendsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
