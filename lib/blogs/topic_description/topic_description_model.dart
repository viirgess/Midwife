import '/flutter_flow/flutter_flow_util.dart';
import 'topic_description_widget.dart' show TopicDescriptionWidget;
import 'package:flutter/material.dart';

class TopicDescriptionModel extends FlutterFlowModel<TopicDescriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
