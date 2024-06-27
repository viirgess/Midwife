import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'courses_widget.dart' show CoursesWidget;
import 'package:flutter/material.dart';

class CoursesModel extends FlutterFlowModel<CoursesWidget> {
  ///  Local state fields for this page.

  bool isPregnant = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;

  /// Query cache managers for this widget.

  final _coursesManager = StreamRequestManager<List<CoursesRecord>>();
  Stream<List<CoursesRecord>> courses({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CoursesRecord>> Function() requestFn,
  }) =>
      _coursesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCoursesCache() => _coursesManager.clear();
  void clearCoursesCacheKey(String? uniqueKey) =>
      _coursesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    drawerDataModel = createModel(context, () => DrawerDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomNavBarModel.dispose();
    drawerDataModel.dispose();

    /// Dispose query cache managers for this widget.

    clearCoursesCache();
  }
}
