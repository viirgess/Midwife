import '/backend/backend.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pregnancy_community_page_widget.dart' show PregnancyCommunityPageWidget;
import 'package:flutter/material.dart';

class PregnancyCommunityPageModel
    extends FlutterFlowModel<PregnancyCommunityPageWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
    appBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
