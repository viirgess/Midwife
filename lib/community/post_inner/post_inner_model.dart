import '/backend/backend.dart';
import '/community/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_inner_widget.dart' show PostInnerWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostInnerModel extends FlutterFlowModel<PostInnerWidget> {
  ///  Local state fields for this page.

  bool isReply = false;

  DocumentReference? commentReplyTo;

  int commentsCount = 0;

  String replyToName = 'null';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PostInner widget.
  int? numberOfComments;
  // Stores action output result for [Firestore Query - Query a collection] action in PostInner widget.
  int? numberOfReplies;
  // Model for Post component.
  late PostModel postModel;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, CommentsRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // Stores action output result for [Backend Call - Read Document] action in Comment widget.
  UsersRecord? userDoc;
  // Stores action output result for [Backend Call - Read Document] action in Reply widget.
  UsersRecord? userDoc2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in TextField widget.
  CommentsRecord? replyDoc;
  // Stores action output result for [Backend Call - Read Document] action in TextField widget.
  UsersRecord? userReply;

  @override
  void initState(BuildContext context) {
    postModel = createModel(context, () => PostModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    postModel.dispose();
    for (var s in listViewStreamSubscriptions2) {
      s?.cancel();
    }
    listViewPagingController2?.dispose();

    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CommentsRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, CommentsRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CommentsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCommentsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
