import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'friend_request_notification_model.dart';
export 'friend_request_notification_model.dart';

class FriendRequestNotificationWidget extends StatefulWidget {
  const FriendRequestNotificationWidget({
    super.key,
    required this.userName,
    required this.userPhoto,
    required this.userFriendRef,
    required this.notificationRef,
  });

  final String? userName;
  final String? userPhoto;
  final DocumentReference? userFriendRef;
  final DocumentReference? notificationRef;

  @override
  State<FriendRequestNotificationWidget> createState() =>
      _FriendRequestNotificationWidgetState();
}

class _FriendRequestNotificationWidgetState
    extends State<FriendRequestNotificationWidget> {
  late FriendRequestNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendRequestNotificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NotificationsRecord>(
      stream: NotificationsRecord.getDocument(widget.notificationRef!),
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
        final containerNotificationsRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 27.0,
                color: Color(0x38B5A4CB),
                offset: Offset(
                  0.0,
                  4.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<UsersRecord>(
              future: UsersRecord.getDocumentOnce(widget.userFriendRef!),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            if (widget.userPhoto != null &&
                                widget.userPhoto != '') {
                              return Container(
                                width: 40.0,
                                height: 40.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  widget.userPhoto!,
                                  fit: BoxFit.cover,
                                ),
                              );
                            } else {
                              return Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFCEEFF),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      '${String.fromCharCode(columnUsersRecord.firstName.runes.first)}${String.fromCharCode(columnUsersRecord.lastName.runes.first)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 14.0,
                                            letterSpacing: 1.2,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      containerNotificationsRecord
                                          .notificationType,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      dateTimeFormat(
                                        'relative',
                                        containerNotificationsRecord.createdAt!,
                                        locale: FFLocalizations.of(context)
                                                .languageShortCode ??
                                            FFLocalizations.of(context)
                                                .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            widget.userName,
                                            'User',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text: ' sent you a friend request',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(52.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'user_friends': FieldValue.arrayUnion(
                                          [widget.userFriendRef]),
                                      'friend_requests_pending':
                                          FieldValue.arrayRemove(
                                              [widget.userFriendRef]),
                                    },
                                  ),
                                });

                                await widget.userFriendRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'user_friends': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                      'friend_requests_pending':
                                          FieldValue.arrayRemove(
                                              [currentUserReference]),
                                    },
                                  ),
                                });

                                await NotificationsRecord.createDoc(
                                        widget.userFriendRef!)
                                    .set(createNotificationsRecordData(
                                  notificationType: 'Community',
                                  boldContent: currentUserDisplayName,
                                  content: ' has accepted your friend request',
                                  isCommunity: true,
                                  createdAt: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                ));
                                await widget.notificationRef!.delete();
                                triggerPushNotification(
                                  notificationTitle: 'Wow!',
                                  notificationText:
                                      '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')} has accepted your friend request!',
                                  notificationSound: 'default',
                                  userRefs: [widget.userFriendRef!],
                                  initialPageName: 'MainPage',
                                  parameterData: {},
                                );
                                Navigator.pop(context);
                              },
                              text: 'Confirm',
                              options: FFButtonOptions(
                                height: 48.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 14.0, 24.0, 14.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await widget.notificationRef!.delete();
                                Navigator.pop(context);
                              },
                              text: 'Delete',
                              options: FFButtonOptions(
                                height: 48.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 14.0, 24.0, 14.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).accent1,
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
