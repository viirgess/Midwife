import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_group_widget.dart' show SelectGroupWidget;
import 'package:flutter/material.dart';

class SelectGroupModel extends FlutterFlowModel<SelectGroupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<GroupsRecord>? algoliaSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
