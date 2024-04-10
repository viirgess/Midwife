import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/pregnancy_community/components_pregnancy_community/leave_reply/leave_reply_widget.dart';
import 'comment_widget.dart' show CommentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CommentModel extends FlutterFlowModel<CommentWidget> {
  ///  Local state fields for this component.

  bool showReplies = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
