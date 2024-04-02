import '/flutter_flow/flutter_flow_util.dart';
import 'blogs_topics_list_widget.dart' show BlogsTopicsListWidget;
import 'package:flutter/material.dart';

class BlogsTopicsListModel extends FlutterFlowModel<BlogsTopicsListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
