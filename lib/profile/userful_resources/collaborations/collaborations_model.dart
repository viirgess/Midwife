import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'collaborations_widget.dart' show CollaborationsWidget;
import 'package:flutter/material.dart';

class CollaborationsModel extends FlutterFlowModel<CollaborationsWidget> {
  ///  Local state fields for this page.

  CollaborationType? type = CollaborationType.Products;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Query cache managers for this widget.

  final _collaborationsManager =
      FutureRequestManager<List<CollaborationsRecord>>();
  Future<List<CollaborationsRecord>> collaborations({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CollaborationsRecord>> Function() requestFn,
  }) =>
      _collaborationsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCollaborationsCache() => _collaborationsManager.clear();
  void clearCollaborationsCacheKey(String? uniqueKey) =>
      _collaborationsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearCollaborationsCache();
  }
}
