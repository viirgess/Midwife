import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'selected_blogs_widget.dart' show SelectedBlogsWidget;
import 'package:flutter/material.dart';

class SelectedBlogsModel extends FlutterFlowModel<SelectedBlogsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  AdditionalSectionRecord? additionalSection;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
