import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/community/components/report_user/report_user_widget.dart';
import '/community/components/unfriend_user/unfriend_user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'user_sheet_model.dart';
export 'user_sheet_model.dart';

class UserSheetWidget extends StatefulWidget {
  const UserSheetWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<UserSheetWidget> createState() => _UserSheetWidgetState();
}

class _UserSheetWidgetState extends State<UserSheetWidget> {
  late UserSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRef!),
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
        final optionsUsersRecord = snapshot.data!;
        return Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
                    child: Container(
                      width: 70.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent4,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 40.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (optionsUsersRecord.photoUrl != '') {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          child: Image.network(
                                            optionsUsersRecord.photoUrl,
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                            alignment: const Alignment(0.0, 0.0),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFCEEFF),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                '${String.fromCharCode(optionsUsersRecord.firstName.runes.first)}${String.fromCharCode(optionsUsersRecord.lastName.runes.first)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          fontSize: 26.0,
                                                          letterSpacing: 1.2,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      optionsUsersRecord.displayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/baby_icon.png',
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.babyWasBorn,
                                                  false)
                                              ? '${functions.calculateWeek(optionsUsersRecord.calculatedDate!, getCurrentTimestamp).toString()} weeks of pregnancy'
                                              : 'Moeder',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 33.0, 0.0, 12.0),
                                  child: Builder(
                                    builder: (context) {
                                      if ((currentUserDocument
                                                      ?.friendRequestsPending
                                                      .toList() ??
                                                  [])
                                              .contains(optionsUsersRecord
                                                  .reference) ||
                                          _model.hasSentRequest) {
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            await _model
                                                .notificationRef!.reference
                                                .delete();

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'friend_requests_pending':
                                                      FieldValue.arrayRemove([
                                                    optionsUsersRecord.reference
                                                  ]),
                                                },
                                              ),
                                            });
                                          },
                                          text: 'Cancel request',
                                          icon: const Icon(
                                            Icons.person_remove_outlined,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 48.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 14.0, 24.0, 14.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        );
                                      } else if ((currentUserDocument
                                                  ?.userFriends
                                                  .toList() ??
                                              [])
                                          .contains(
                                              optionsUsersRecord.reference)) {
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: UnfriendUserWidget(
                                                      userRef: widget.userRef!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          text: 'Your are friends',
                                          icon: const Icon(
                                            Icons.people_alt_outlined,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 48.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 14.0, 24.0, 14.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        );
                                      } else {
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            var notificationsRecordReference =
                                                NotificationsRecord.createDoc(
                                                    optionsUsersRecord
                                                        .reference);
                                            await notificationsRecordReference
                                                .set(
                                                    createNotificationsRecordData(
                                              userSentFriendRequest:
                                                  currentUserReference,
                                              friendRequest: true,
                                              userDisplayName:
                                                  '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                              userPhotoUrl: currentUserPhoto,
                                              notificationType: 'Community',
                                              createdAt: getCurrentTimestamp,
                                              userRef: currentUserReference,
                                            ));
                                            _model.notificationRef =
                                                NotificationsRecord.getDocumentFromData(
                                                    createNotificationsRecordData(
                                                      userSentFriendRequest:
                                                          currentUserReference,
                                                      friendRequest: true,
                                                      userDisplayName:
                                                          '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                      userPhotoUrl:
                                                          currentUserPhoto,
                                                      notificationType:
                                                          'Community',
                                                      createdAt:
                                                          getCurrentTimestamp,
                                                      userRef:
                                                          currentUserReference,
                                                    ),
                                                    notificationsRecordReference);
                                            _model.hasSentRequest = true;
                                            setState(() {});
                                            if (optionsUsersRecord
                                                .notificationSettings
                                                .friendRequests) {
                                              triggerPushNotification(
                                                notificationTitle:
                                                    'New Friend Request',
                                                notificationText:
                                                    'Hey! ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')} wants to be friends with you!',
                                                notificationSound: 'default',
                                                userRefs: [
                                                  optionsUsersRecord.reference
                                                ],
                                                initialPageName: 'MyFriends',
                                                parameterData: {},
                                              );
                                            }

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'friend_requests_pending':
                                                      FieldValue.arrayUnion([
                                                    optionsUsersRecord.reference
                                                  ]),
                                                },
                                              ),
                                            });

                                            setState(() {});
                                          },
                                          text: 'Add to friends',
                                          icon: const Icon(
                                            Icons.person_add_alt,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 48.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 14.0, 24.0, 14.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.chatWithUserExists =
                                          await queryChatsRecordOnce(
                                        queryBuilder: (chatsRecord) =>
                                            chatsRecord
                                                .where(
                                                  'user_a',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'user_b',
                                                  isEqualTo: widget.userRef,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model
                                              .chatWithUserExists?.reference !=
                                          null) {
                                        context.pushNamed(
                                          'chatMessages',
                                          queryParameters: {
                                            'chatUser': serializeParam(
                                              _model.chatWithUserExists
                                                  ?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                            'userRef': serializeParam(
                                              optionsUsersRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        _model.chatWithUserExists2 =
                                            await queryChatsRecordOnce(
                                          queryBuilder: (chatsRecord) =>
                                              chatsRecord
                                                  .where(
                                                    'user_a',
                                                    isEqualTo: widget.userRef,
                                                  )
                                                  .where(
                                                    'user_b',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.chatWithUserExists2
                                                ?.reference !=
                                            null) {
                                          context.pushNamed(
                                            'chatMessages',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                _model.chatWithUserExists2
                                                    ?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'userRef': serializeParam(
                                                currentUserReference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          var chatsRecordReference =
                                              ChatsRecord.collection.doc();
                                          await chatsRecordReference
                                              .set(createChatsRecordData(
                                            user: currentUserReference,
                                            userA: currentUserReference,
                                            userB: widget.userRef,
                                            image: optionsUsersRecord.photoUrl,
                                          ));
                                          _model.newChatWithUser =
                                              ChatsRecord.getDocumentFromData(
                                                  createChatsRecordData(
                                                    user: currentUserReference,
                                                    userA: currentUserReference,
                                                    userB: widget.userRef,
                                                    image: optionsUsersRecord
                                                        .photoUrl,
                                                  ),
                                                  chatsRecordReference);

                                          context.pushNamed(
                                            'chatMessages',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                _model
                                                    .newChatWithUser?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'userRef': serializeParam(
                                                optionsUsersRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      }

                                      Navigator.pop(context);

                                      setState(() {});
                                    },
                                    text: 'Send message',
                                    options: FFButtonOptions(
                                      height: 48.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 14.0, 24.0, 14.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ReportUserWidget(
                                            userRef: widget.userRef!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/options.png',
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                    alignment: const Alignment(1.0, -1.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
