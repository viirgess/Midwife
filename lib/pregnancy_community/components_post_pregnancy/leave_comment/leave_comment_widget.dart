import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'leave_comment_model.dart';
export 'leave_comment_model.dart';

class LeaveCommentWidget extends StatefulWidget {
  const LeaveCommentWidget({
    super.key,
    required this.postRef,
  });

  final DocumentReference? postRef;

  @override
  State<LeaveCommentWidget> createState() => _LeaveCommentWidgetState();
}

class _LeaveCommentWidgetState extends State<LeaveCommentWidget> {
  late LeaveCommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaveCommentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostPregnancyCommunityForumRecord>(
      stream: PostPregnancyCommunityForumRecord.getDocument(widget.postRef!),
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
        final columnPostPregnancyCommunityForumRecord = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    offset: const Offset(0.0, 2.0),
                  )
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                      ),
                                  hintText: 'Leave your comment..',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                    ),
                                maxLines: 5,
                                minLines: 1,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).secondary,
                              borderRadius: 100.0,
                              borderWidth: 1.0,
                              buttonSize: 55.0,
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                Icons.send_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                await PostPregnancyCommentsForumRecord
                                        .createDoc(widget.postRef!)
                                    .set(
                                        createPostPregnancyCommentsForumRecordData(
                                  createdBy:
                                      columnPostPregnancyCommunityForumRecord
                                          .authorRef,
                                  createdTime: getCurrentTimestamp,
                                  likes: 0,
                                  text: _model.textController.text,
                                ));
                                if (columnPostPregnancyCommunityForumRecord
                                        .authorRef !=
                                    currentUserReference) {
                                  await NotificationsRecord.createDoc(
                                          columnPostPregnancyCommunityForumRecord
                                              .authorRef!)
                                      .set(createNotificationsRecordData(
                                    someoneHasCommented: true,
                                    title: 'New comment!',
                                    userDisplayName:
                                        '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                    userPhotoUrl: currentUserPhoto,
                                  ));
                                  triggerPushNotification(
                                    notificationTitle: 'New comment!',
                                    notificationText:
                                        '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')} has commented on your post!',
                                    notificationSound: 'default',
                                    userRefs: [
                                      columnPostPregnancyCommunityForumRecord
                                          .authorRef!
                                    ],
                                    initialPageName: 'MainPage',
                                    parameterData: {},
                                  );
                                }
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
