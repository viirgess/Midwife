import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'course_card_widget.dart' show CourseCardWidget;
import 'package:flutter/material.dart';

class CourseCardModel extends FlutterFlowModel<CourseCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - calculateCourseLength] action in CourseCard widget.
  int? courseLength;

  /// Query cache managers for this widget.

  final _progressManager = FutureRequestManager<int>();
  Future<int> progress({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _progressManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProgressCache() => _progressManager.clear();
  void clearProgressCacheKey(String? uniqueKey) =>
      _progressManager.clearRequest(uniqueKey);

  final _progress2Manager = FutureRequestManager<int>();
  Future<int> progress2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _progress2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProgress2Cache() => _progress2Manager.clear();
  void clearProgress2CacheKey(String? uniqueKey) =>
      _progress2Manager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearProgressCache();

    clearProgress2Cache();
  }
}
