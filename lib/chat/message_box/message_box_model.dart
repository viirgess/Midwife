import '/components/avatar_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'message_box_widget.dart' show MessageBoxWidget;
import 'package:flutter/material.dart';

class MessageBoxModel extends FlutterFlowModel<MessageBoxWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AvatarImage component.
  late AvatarImageModel avatarImageModel;

  @override
  void initState(BuildContext context) {
    avatarImageModel = createModel(context, () => AvatarImageModel());
  }

  @override
  void dispose() {
    avatarImageModel.dispose();
  }
}
