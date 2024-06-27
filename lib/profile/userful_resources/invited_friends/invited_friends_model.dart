import '/flutter_flow/flutter_flow_util.dart';
import 'invited_friends_widget.dart' show InvitedFriendsWidget;
import 'package:flutter/material.dart';

class InvitedFriendsModel extends FlutterFlowModel<InvitedFriendsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
