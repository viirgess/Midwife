import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'community_widget.dart' show CommunityWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommunityModel extends FlutterFlowModel<CommunityWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PostsListView widget.

  PagingController<DocumentSnapshot?, PostsRecord>?
      postsListViewPagingController;
  Query? postsListViewPagingQuery;
  List<StreamSubscription?> postsListViewStreamSubscriptions = [];

  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Query cache managers for this widget.

  final _provincesManager = StreamRequestManager<List<GroupsRecord>>();
  Stream<List<GroupsRecord>> provinces({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<GroupsRecord>> Function() requestFn,
  }) =>
      _provincesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProvincesCache() => _provincesManager.clear();
  void clearProvincesCacheKey(String? uniqueKey) =>
      _provincesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in postsListViewStreamSubscriptions) {
      s?.cancel();
    }
    postsListViewPagingController?.dispose();

    bottomNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearProvincesCache();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, PostsRecord> setPostsListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    postsListViewPagingController ??=
        _createPostsListViewController(query, parent);
    if (postsListViewPagingQuery != query) {
      postsListViewPagingQuery = query;
      postsListViewPagingController?.refresh();
    }
    return postsListViewPagingController!;
  }

  PagingController<DocumentSnapshot?, PostsRecord>
      _createPostsListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PostsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPostsRecordPage(
          queryBuilder: (_) => postsListViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: postsListViewStreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
