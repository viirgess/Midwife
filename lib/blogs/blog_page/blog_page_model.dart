import '/backend/backend.dart';
import '/blogs/blogs_component/bookmark_container/bookmark_container_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blog_page_widget.dart' show BlogPageWidget;
import 'package:flutter/material.dart';

class BlogPageModel extends FlutterFlowModel<BlogPageWidget> {
  ///  Local state fields for this page.

  bool allClicked = false;

  bool trimesterOne = false;

  bool trimesterTwo = false;

  bool trimesterThree = false;

  bool trimesterFour = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  AdditionalSectionRecord? additionalSection;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for bookmarkContainer component.
  late BookmarkContainerModel bookmarkContainerModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    bookmarkContainerModel =
        createModel(context, () => BookmarkContainerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomNavBarModel.dispose();
    bookmarkContainerModel.dispose();
  }
}
