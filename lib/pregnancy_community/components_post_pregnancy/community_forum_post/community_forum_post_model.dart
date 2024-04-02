import '/flutter_flow/flutter_flow_util.dart';
import '/pregnancy_community/components_post_pregnancy/community_post/community_post_widget.dart';
import 'community_forum_post_widget.dart' show CommunityForumPostWidget;
import 'package:flutter/material.dart';

class CommunityForumPostModel
    extends FlutterFlowModel<CommunityForumPostWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CommunityPost component.
  late CommunityPostModel communityPostModel;

  @override
  void initState(BuildContext context) {
    communityPostModel = createModel(context, () => CommunityPostModel());
  }

  @override
  void dispose() {
    communityPostModel.dispose();
  }
}
