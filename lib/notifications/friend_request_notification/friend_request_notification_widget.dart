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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget.userPhoto!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.userName,
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'Wants to be your friend!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget.notificationRef!.delete();
                          Navigator.pop(context);
                        },
                        text: 'Decline',
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
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
                            friendRequest: false,
                            friendRequestAccepted: true,
                            newBlogIsPosted: false,
                            receivedMessage: false,
                            someoneHasCommented: false,
                            someoneLikedPost: false,
                            creditInfo: false,
                            title: 'Has accepted your friendship!',
                            userSentFriendRequest: widget.userFriendRef,
                            userDisplayName:
                                '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                            userPhotoUrl: currentUserPhoto,
                            userAcceptedFriendship: currentUserReference,
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
                        text: 'Accept',
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
