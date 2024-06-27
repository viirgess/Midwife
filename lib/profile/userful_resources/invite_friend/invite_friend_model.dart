import '/flutter_flow/flutter_flow_util.dart';
import 'invite_friend_widget.dart' show InviteFriendWidget;
import 'package:flutter/material.dart';

class InviteFriendModel extends FlutterFlowModel<InviteFriendWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
