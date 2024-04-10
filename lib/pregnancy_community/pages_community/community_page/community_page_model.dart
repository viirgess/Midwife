import '/backend/backend.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notifications/notification_modal_sheet/notification_modal_sheet_widget.dart';
import '/pregnancy_community/components_pregnancy_community/community_forum_post/community_forum_post_widget.dart';
import '/pregnancy_community/components_pregnancy_community/create_post/create_post_widget.dart';
import 'community_page_widget.dart' show CommunityPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CommunityPageModel extends FlutterFlowModel<CommunityPageWidget> {
  ///  Local state fields for this page.

  bool? likedClicked = false;

  bool? addToFriendClicked = false;

  List<PregnancyCommunityForumRecord> listOfPosts = [];
  void addToListOfPosts(PregnancyCommunityForumRecord item) =>
      listOfPosts.add(item);
  void removeFromListOfPosts(PregnancyCommunityForumRecord item) =>
      listOfPosts.remove(item);
  void removeAtIndexFromListOfPosts(int index) => listOfPosts.removeAt(index);
  void insertAtIndexInListOfPosts(
          int index, PregnancyCommunityForumRecord item) =>
      listOfPosts.insert(index, item);
  void updateListOfPostsAtIndex(
          int index, Function(PregnancyCommunityForumRecord) updateFn) =>
      listOfPosts[index] = updateFn(listOfPosts[index]);

  bool isPregnant = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
  }
}
