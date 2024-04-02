import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pregnancy_community/components_pregnancy_community/comment_pregnancy/comment_pregnancy_widget.dart';
import '/pregnancy_community/components_pregnancy_community/community_post_pregnancy/community_post_pregnancy_widget.dart';
import 'package:flutter/material.dart';
import 'community_forum_post_pregnancy_model.dart';
export 'community_forum_post_pregnancy_model.dart';

class CommunityForumPostPregnancyWidget extends StatefulWidget {
  const CommunityForumPostPregnancyWidget({
    super.key,
    required this.forumPost,
  });

  final DocumentReference? forumPost;

  @override
  State<CommunityForumPostPregnancyWidget> createState() =>
      _CommunityForumPostPregnancyWidgetState();
}

class _CommunityForumPostPregnancyWidgetState
    extends State<CommunityForumPostPregnancyWidget> {
  late CommunityForumPostPregnancyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityForumPostPregnancyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 3.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: FutureBuilder<int>(
          future: queryPregnancyCommentsForumRecordCount(
            parent: widget.forumPost,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            int columnCount = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.communityPostPregnancyModel,
                  updateCallback: () => setState(() {}),
                  child: CommunityPostPregnancyWidget(
                    forumPost: widget.forumPost!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (columnCount.toString() != '0')
                        Divider(
                          thickness: 0.5,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    ],
                  ),
                ),
                StreamBuilder<List<PregnancyCommentsForumRecord>>(
                  stream: queryPregnancyCommentsForumRecord(
                    parent: widget.forumPost,
                    queryBuilder: (pregnancyCommentsForumRecord) =>
                        pregnancyCommentsForumRecord.orderBy('created_time'),
                    limit: 4,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<PregnancyCommentsForumRecord>
                        listViewPregnancyCommentsForumRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:
                          listViewPregnancyCommentsForumRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPregnancyCommentsForumRecord =
                            listViewPregnancyCommentsForumRecordList[
                                listViewIndex];
                        return CommentPregnancyWidget(
                          key: Key(
                              'Key1qc_${listViewIndex}_of_${listViewPregnancyCommentsForumRecordList.length}'),
                          comment:
                              listViewPregnancyCommentsForumRecord.reference,
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
