import '/backend/backend.dart';
import '/components/back_app_bar/back_app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_page_widget.dart' show CommunityPageWidget;
import 'package:flutter/material.dart';

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
  // Model for BackAppBar component.
  late BackAppBarModel backAppBarModel;

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
    backAppBarModel = createModel(context, () => BackAppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
    backAppBarModel.dispose();
  }
}
