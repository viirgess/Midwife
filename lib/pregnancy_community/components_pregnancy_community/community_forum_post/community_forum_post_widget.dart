import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pregnancy_community/components_pregnancy_community/comment/comment_widget.dart';
import '/pregnancy_community/components_pregnancy_community/community_post/community_post_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_forum_post_model.dart';
export 'community_forum_post_model.dart';

class CommunityForumPostWidget extends StatefulWidget {
  const CommunityForumPostWidget({
    super.key,
    required this.forumPost,
  });

  final DocumentReference? forumPost;

  @override
  State<CommunityForumPostWidget> createState() =>
      _CommunityForumPostWidgetState();
}

class _CommunityForumPostWidgetState extends State<CommunityForumPostWidget> {
  late CommunityForumPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityForumPostModel());

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
      shape: RoundedRectangleBorder(
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
          borderRadius: BorderRadius.only(
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
                  model: _model.communityPostModel,
                  updateCallback: () => setState(() {}),
                  child: CommunityPostWidget(
                    forumPost: widget.forumPost!,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (columnCount.toString() != '0')
                        Divider(
                          thickness: 0.5,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      FutureBuilder<int>(
                        future: queryPregnancyCommentsForumRecordCount(
                          parent: widget.forumPost,
                          queryBuilder: (pregnancyCommentsForumRecord) =>
                              pregnancyCommentsForumRecord
                                  .orderBy('created_time'),
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
                          int rowCount = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (rowCount != 0)
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.showComments =
                                              !_model.showComments;
                                        });
                                      },
                                      child: Text(
                                        _model.showComments
                                            ? 'Hide Comments'
                                            : 'Show Comments',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                if (_model.showComments)
                  StreamBuilder<List<PregnancyCommentsForumRecord>>(
                    stream: queryPregnancyCommentsForumRecord(
                      parent: widget.forumPost,
                      queryBuilder: (pregnancyCommentsForumRecord) =>
                          pregnancyCommentsForumRecord.orderBy('created_time'),
                      limit: 3,
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
                          columnPregnancyCommentsForumRecordList =
                          snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            columnPregnancyCommentsForumRecordList.length,
                            (columnIndex) {
                          final columnPregnancyCommentsForumRecord =
                              columnPregnancyCommentsForumRecordList[
                                  columnIndex];
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: CommentWidget(
                              key: Key(
                                  'Key1qc_${columnIndex}_of_${columnPregnancyCommentsForumRecordList.length}'),
                              comment:
                                  columnPregnancyCommentsForumRecord.reference,
                            ),
                          );
                        }),
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
