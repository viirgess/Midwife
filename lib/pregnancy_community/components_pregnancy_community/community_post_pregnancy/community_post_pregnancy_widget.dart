import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pregnancy_community/components_pregnancy_community/leave_comment_pregnancy/leave_comment_pregnancy_widget.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'community_post_pregnancy_model.dart';
export 'community_post_pregnancy_model.dart';

class CommunityPostPregnancyWidget extends StatefulWidget {
  const CommunityPostPregnancyWidget({
    super.key,
    required this.forumPost,
  });

  final DocumentReference? forumPost;

  @override
  State<CommunityPostPregnancyWidget> createState() =>
      _CommunityPostPregnancyWidgetState();
}

class _CommunityPostPregnancyWidgetState
    extends State<CommunityPostPregnancyWidget> {
  late CommunityPostPregnancyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityPostPregnancyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PregnancyCommunityForumRecord>(
      stream: PregnancyCommunityForumRecord.getDocument(widget.forumPost!),
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
        final containerPregnancyCommunityForumRecord = snapshot.data!;
        return Container(
          decoration: const BoxDecoration(),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(
                containerPregnancyCommunityForumRecord.authorRef!),
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
              final columnUsersRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'PublicUserProfile',
                                queryParameters: {
                                  'userRef': serializeParam(
                                    columnUsersRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 55.0,
                                  height: 55.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      columnUsersRecord.photoUrl,
                                      'https://picsum.photos/seed/782/600',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${columnUsersRecord.firstName} ${columnUsersRecord.lastName}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            dateTimeFormat(
                                                'relative',
                                                containerPregnancyCommunityForumRecord
                                                    .createdTime!),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if ((currentUserDocument?.userFriends.toList() ?? [])
                                  .contains(columnUsersRecord.reference) ==
                              true)
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: 100.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Vrienden',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 16.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                containerPregnancyCommunityForumRecord.text,
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: ToggleIcon(
                                    onPressed: () async {
                                      final postLikesElement =
                                          currentUserReference;
                                      final postLikesUpdate =
                                          containerPregnancyCommunityForumRecord
                                                  .postLikes
                                                  .contains(postLikesElement)
                                              ? FieldValue.arrayRemove(
                                                  [postLikesElement])
                                              : FieldValue.arrayUnion(
                                                  [postLikesElement]);
                                      await containerPregnancyCommunityForumRecord
                                          .reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'postLikes': postLikesUpdate,
                                          },
                                        ),
                                      });
                                      if (containerPregnancyCommunityForumRecord
                                              .postLikes
                                              .contains(currentUserReference) ==
                                          false) {
                                        await widget.forumPost!.update({
                                          ...mapToFirestore(
                                            {
                                              'postLikes':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                        if (containerPregnancyCommunityForumRecord
                                                .authorRef !=
                                            currentUserReference) {
                                          await NotificationsRecord.createDoc(
                                                  containerPregnancyCommunityForumRecord
                                                      .authorRef!)
                                              .set(
                                                  createNotificationsRecordData(
                                            someoneLikedPost: true,
                                            title: 'Someone liked your post!',
                                            userDisplayName:
                                                '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                            userPhotoUrl: currentUserPhoto,
                                          ));
                                          triggerPushNotification(
                                            notificationTitle:
                                                '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                            notificationText:
                                                'Liked your post!',
                                            notificationSound: 'default',
                                            userRefs: [
                                              containerPregnancyCommunityForumRecord
                                                  .authorRef!
                                            ],
                                            initialPageName: 'MainPage',
                                            parameterData: {},
                                          );
                                        }
                                      } else {
                                        await widget.forumPost!.update({
                                          ...mapToFirestore(
                                            {
                                              'postLikes':
                                                  FieldValue.arrayRemove(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }
                                    },
                                    value:
                                        containerPregnancyCommunityForumRecord
                                            .postLikes
                                            .contains(currentUserReference),
                                    onIcon: Icon(
                                      Icons.favorite_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 30.0,
                                    ),
                                    offIcon: Icon(
                                      Icons.favorite_border,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 7.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 100.0,
                                    borderWidth: 1.0,
                                    buttonSize: 46.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      Icons.comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  LeaveCommentPregnancyWidget(
                                                postRef: widget.forumPost!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 6.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      containerPregnancyCommunityForumRecord
                                          .postLikes.length
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Text(
                                  'Vind-ik-leuks',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
