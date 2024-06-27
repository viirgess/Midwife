import '/flutter_flow/flutter_flow_util.dart';
import 'check_list_item_widget.dart' show CheckListItemWidget;
import 'package:flutter/material.dart';

class CheckListItemModel extends FlutterFlowModel<CheckListItemWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
