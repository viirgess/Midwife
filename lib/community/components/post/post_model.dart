import '/community/components/reactions_dialog/reactions_dialog_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_widget.dart' show PostWidget;
import 'package:flutter/material.dart';

class PostModel extends FlutterFlowModel<PostWidget> {
  ///  Local state fields for this component.

  int commentsCount = 0;

  bool postActionIsOpen = false;

  bool showReactions = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Post widget.
  int? numberOfComments;
  // Stores action output result for [Firestore Query - Query a collection] action in Post widget.
  int? numberOfReplies;
  String currentPageLink = '';
  // Model for ReactionsDialog component.
  late ReactionsDialogModel reactionsDialogModel;

  @override
  void initState(BuildContext context) {
    reactionsDialogModel = createModel(context, () => ReactionsDialogModel());
  }

  @override
  void dispose() {
    reactionsDialogModel.dispose();
  }
}
