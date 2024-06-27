import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/community/components/comment/comment_widget.dart';
import '/community/components/post/post_widget.dart';
import '/community/components/reply/reply_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'post_inner_model.dart';
export 'post_inner_model.dart';

class PostInnerWidget extends StatefulWidget {
  const PostInnerWidget({
    super.key,
    required this.postRef,
  });

  final DocumentReference? postRef;

  @override
  State<PostInnerWidget> createState() => _PostInnerWidgetState();
}

class _PostInnerWidgetState extends State<PostInnerWidget> {
  late PostInnerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostInnerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.numberOfComments = await queryCommentsRecordCount(
        parent: widget.postRef,
      );
      _model.numberOfReplies = await queryRepliesRecordCount(
        parent: widget.postRef,
      );
      _model.commentsCount = _model.numberOfComments!;
      setState(() {});
      _model.commentsCount = _model.commentsCount + _model.numberOfReplies!;
      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: StreamBuilder<PostsRecord>(
                        stream: PostsRecord.getDocument(widget.postRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final columnPostsRecord = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.postModel,
                                updateCallback: () => setState(() {}),
                                child: PostWidget(
                                  showGroup: false,
                                  authorRef: columnPostsRecord.autherRef!,
                                  groupRef: columnPostsRecord.groupRef!,
                                  postRef: widget.postRef!,
                                  isInner: true,
                                  refreshPosts: () async {},
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 0.0, 16.0),
                                      child: Text(
                                        'Comments (${_model.commentsCount.toString()})',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (_model.commentsCount != 0)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          CommentsRecord>.separated(
                                        pagingController:
                                            _model.setListViewController2(
                                                CommentsRecord.collection(
                                                        widget.postRef)
                                                    .orderBy('created_time',
                                                        descending: true),
                                                parent: widget.postRef),
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 16.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                CommentsRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                          ),

                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewCommentsRecord =
                                                _model
                                                    .listViewPagingController2!
                                                    .itemList![listViewIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                CommentWidget(
                                                  key: Key(
                                                      'Keypkm_${listViewIndex}_of_${_model.listViewPagingController2!.itemList!.length}'),
                                                  commentRef:
                                                      listViewCommentsRecord
                                                          .reference,
                                                  callback: () async {
                                                    _model.userDoc =
                                                        await UsersRecord
                                                            .getDocumentOnce(
                                                                listViewCommentsRecord
                                                                    .createdBy!);
                                                    _model.isReply = true;
                                                    _model.replyToName = _model
                                                        .userDoc!.displayName;
                                                    setState(() {});
                                                    _model.commentReplyTo =
                                                        listViewCommentsRecord
                                                            .reference;
                                                    setState(() {});

                                                    setState(() {});
                                                  },
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          48.0, 16.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<RepliesRecord>>(
                                                    stream: queryRepliesRecord(
                                                      parent: widget.postRef,
                                                      queryBuilder:
                                                          (repliesRecord) =>
                                                              repliesRecord
                                                                  .where(
                                                                    'comment_ref',
                                                                    isEqualTo:
                                                                        listViewCommentsRecord
                                                                            .reference,
                                                                  )
                                                                  .orderBy(
                                                                      'created_by',
                                                                      descending:
                                                                          true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<RepliesRecord>
                                                          listViewRepliesRecordList =
                                                          snapshot.data!;
                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewRepliesRecordList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewRepliesRecord =
                                                              listViewRepliesRecordList[
                                                                  listViewIndex];
                                                          return ReplyWidget(
                                                            key: Key(
                                                                'Keya4b_${listViewIndex}_of_${listViewRepliesRecordList.length}'),
                                                            replyRef:
                                                                listViewRepliesRecord
                                                                    .reference,
                                                            repltyTo: () async {
                                                              _model.userDoc2 =
                                                                  await UsersRecord
                                                                      .getDocumentOnce(
                                                                          listViewRepliesRecord
                                                                              .createdBy!);
                                                              _model.isReply =
                                                                  true;
                                                              _model.replyToName =
                                                                  _model
                                                                      .userDoc2!
                                                                      .displayName;
                                                              setState(() {});
                                                              _model.commentReplyTo =
                                                                  listViewCommentsRecord
                                                                      .reference;
                                                              setState(() {});

                                                              setState(() {});
                                                            },
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ].addToEnd(const SizedBox(height: 125.0)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: StreamBuilder<PostsRecord>(
                  stream: PostsRecord.getDocument(widget.postRef!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).secondary,
                            ),
                          ),
                        ),
                      );
                    }
                    final containerPostsRecord = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      height: _model.isReply ? 120.0 : 110.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).customColor1,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                      ),
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 20.0, 20.0),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              containerPostsRecord.autherRef!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).secondary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final columnUsersRecord = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.isReply)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: StreamBuilder<CommentsRecord>(
                                      stream: CommentsRecord.getDocument(
                                          _model.commentReplyTo!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final rowCommentsRecord =
                                            snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  rowCommentsRecord.createdBy!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final richTextUsersRecord =
                                                    snapshot.data!;
                                                return RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Replying to ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            _model.replyToName,
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.isReply = false;
                                                _model.commentReplyTo = null;
                                                setState(() {});
                                              },
                                              child: Text(
                                                'cancel',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          if (_model.isReply) {
                                            await RepliesRecord.createDoc(
                                                    widget.postRef!)
                                                .set(createRepliesRecordData(
                                              createdBy: currentUserReference,
                                              commentRef: _model.commentReplyTo,
                                              createdTime: getCurrentTimestamp,
                                              text: _model.textController.text,
                                            ));
                                            _model.replyDoc =
                                                await CommentsRecord
                                                    .getDocumentOnce(
                                                        _model.commentReplyTo!);
                                            _model.userReply = await UsersRecord
                                                .getDocumentOnce(_model
                                                    .replyDoc!.createdBy!);
                                            if (_model.replyDoc?.createdBy !=
                                                currentUserReference) {
                                              await NotificationsRecord
                                                      .createDoc(
                                                          columnUsersRecord
                                                              .reference)
                                                  .set(
                                                      createNotificationsRecordData(
                                                notificationType: 'Community',
                                                content:
                                                    ' replied to your comment',
                                                isCommunity: true,
                                                createdAt: getCurrentTimestamp,
                                                userRef: currentUserReference,
                                                boldContent:
                                                    currentUserDisplayName,
                                              ));
                                            }
                                            if (_model
                                                .userReply!
                                                .notificationSettings
                                                .mentionsAndReplies) {
                                              triggerPushNotification(
                                                notificationTitle:
                                                    'New reply on your comment!',
                                                notificationText:
                                                    '${'${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}'} has just replied!',
                                                userRefs: [
                                                  _model.userReply!.reference
                                                ],
                                                initialPageName: 'PostInner',
                                                parameterData: {
                                                  'postRef': widget.postRef,
                                                },
                                              );
                                            }
                                          } else {
                                            await CommentsRecord.createDoc(
                                                    widget.postRef!)
                                                .set(createCommentsRecordData(
                                              createdBy: currentUserReference,
                                              createdTime: getCurrentTimestamp,
                                              text: _model.textController.text,
                                            ));
                                            if (containerPostsRecord
                                                    .autherRef !=
                                                currentUserReference) {
                                              await NotificationsRecord
                                                      .createDoc(
                                                          columnUsersRecord
                                                              .reference)
                                                  .set(
                                                      createNotificationsRecordData(
                                                notificationType: 'Community',
                                                content:
                                                    ' commented on your post',
                                                isCommunity: true,
                                                createdAt: getCurrentTimestamp,
                                                userRef: currentUserReference,
                                                boldContent:
                                                    currentUserDisplayName,
                                              ));
                                            }
                                            if (columnUsersRecord
                                                .notificationSettings
                                                .comments) {
                                              triggerPushNotification(
                                                notificationTitle:
                                                    'New comment!',
                                                notificationText:
                                                    '${'${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}'} has just commented on your post!',
                                                userRefs: [
                                                  columnUsersRecord.reference
                                                ],
                                                initialPageName: 'PostInner',
                                                parameterData: {
                                                  'postRef': widget.postRef,
                                                },
                                              );
                                            }
                                          }

                                          setState(() {
                                            _model.textController?.clear();
                                          });
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'PostInner',
                                            queryParameters: {
                                              'postRef': serializeParam(
                                                widget.postRef,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );

                                          setState(() {});
                                        },
                                        autofocus: false,
                                        textInputAction: TextInputAction.send,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Figtree',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: _model.isReply
                                              ? 'Write a reply here..'
                                              : 'Write a comment here..',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFDFDEEC),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
