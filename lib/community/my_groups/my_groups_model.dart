import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'my_groups_widget.dart' show MyGroupsWidget;
import 'package:flutter/material.dart';

class MyGroupsModel extends FlutterFlowModel<MyGroupsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<GroupsRecord>? algoliaSearchResults = [];
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Query cache managers for this widget.

  final _groupsManager = FutureRequestManager<List<GroupsRecord>>();
  Future<List<GroupsRecord>> groups({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<GroupsRecord>> Function() requestFn,
  }) =>
      _groupsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGroupsCache() => _groupsManager.clear();
  void clearGroupsCacheKey(String? uniqueKey) =>
      _groupsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearGroupsCache();
  }
}
