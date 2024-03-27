import '/flutter_flow/flutter_flow_util.dart';
import '/pregnancy_community/components_pregnancy_community/community_post_pregnancy/community_post_pregnancy_widget.dart';
import 'community_forum_post_pregnancy_widget.dart'
    show CommunityForumPostPregnancyWidget;
import 'package:flutter/material.dart';

class CommunityForumPostPregnancyModel
    extends FlutterFlowModel<CommunityForumPostPregnancyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CommunityPostPregnancy component.
  late CommunityPostPregnancyModel communityPostPregnancyModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    communityPostPregnancyModel =
        createModel(context, () => CommunityPostPregnancyModel());
  }

  @override
  void dispose() {
    communityPostPregnancyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
