import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/notifications/comment_on_post_in_community/comment_on_post_in_community_widget.dart';
import '/notifications/credit_info_notification/credit_info_notification_widget.dart';
import '/notifications/empty_notifications/empty_notifications_widget.dart';
import '/notifications/friend_accepted_notification/friend_accepted_notification_widget.dart';
import '/notifications/friend_request_notification/friend_request_notification_widget.dart';
import '/notifications/liked_post_notification/liked_post_notification_widget.dart';
import '/notifications/new_blog_is_posted_notification/new_blog_is_posted_notification_widget.dart';
import '/notifications/new_message_received/new_message_received_widget.dart';
import 'package:flutter/material.dart';
import 'notification_modal_sheet_model.dart';
export 'notification_modal_sheet_model.dart';

class NotificationModalSheetWidget extends StatefulWidget {
  const NotificationModalSheetWidget({super.key});

  @override
  State<NotificationModalSheetWidget> createState() =>
      _NotificationModalSheetWidgetState();
}

class _NotificationModalSheetWidgetState
    extends State<NotificationModalSheetWidget> {
  late NotificationModalSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModalSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeIn,
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Notification',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).accent3,
                        size: 32.0,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Flexible(
                  child: StreamBuilder<List<NotificationsRecord>>(
                    stream: queryNotificationsRecord(
                      parent: currentUserReference,
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
                      List<NotificationsRecord>
                          listViewNotificationsRecordList = snapshot.data!;
                      if (listViewNotificationsRecordList.isEmpty) {
                        return const EmptyNotificationsWidget();
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewNotificationsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewNotificationsRecord =
                              listViewNotificationsRecordList[listViewIndex];
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (listViewNotificationsRecord.friendRequest ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: FriendRequestNotificationWidget(
                                      key: Key(
                                          'Keyf83_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                      userName: listViewNotificationsRecord
                                          .userDisplayName,
                                      userPhoto: listViewNotificationsRecord
                                          .userPhotoUrl,
                                      userFriendRef: listViewNotificationsRecord
                                          .userSentFriendRequest!,
                                      notificationRef:
                                          listViewNotificationsRecord.reference,
                                    ),
                                  ),
                                if (listViewNotificationsRecord
                                        .friendRequestAccepted ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: FriendAcceptedNotificationWidget(
                                      key: Key(
                                          'Keydmd_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                      userName: listViewNotificationsRecord
                                          .userDisplayName,
                                      userPhoto: listViewNotificationsRecord
                                          .userPhotoUrl,
                                      userAcceptedFriendShipRef:
                                          listViewNotificationsRecord
                                              .userAcceptedFriendship!,
                                      notificationRef:
                                          listViewNotificationsRecord.reference,
                                    ),
                                  ),
                                if (listViewNotificationsRecord
                                        .newBlogIsPosted ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: NewBlogIsPostedNotificationWidget(
                                      key: Key(
                                          'Keyysy_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                      blogTitle:
                                          listViewNotificationsRecord.blogTitle,
                                      notificationRef:
                                          listViewNotificationsRecord.reference,
                                    ),
                                  ),
                                if (listViewNotificationsRecord
                                        .receivedMessage ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: NewMessageReceivedWidget(
                                      key: Key(
                                          'Keyf50_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                      notificationRef:
                                          listViewNotificationsRecord.reference,
                                    ),
                                  ),
                                if (listViewNotificationsRecord
                                        .someoneHasCommented ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: CommentOnPostInCommunityWidget(
                                      key: Key(
                                          'Key19j_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                      notificationRef:
                                          listViewNotificationsRecord.reference,
                                    ),
                                  ),
                                if (listViewNotificationsRecord
                                        .someoneLikedPost ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: LikedPostNotificationWidget(
                                      key: Key(
                                          'Keygxq_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                      userPhoto: listViewNotificationsRecord
                                          .userPhotoUrl,
                                      userName: listViewNotificationsRecord
                                          .userDisplayName,
                                      notificationRef:
                                          listViewNotificationsRecord.reference,
                                    ),
                                  ),
                                if (listViewNotificationsRecord.creditInfo ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: CreditInfoNotificationWidget(
                                      key: Key(
                                          'Keyb69_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                      notificationRef:
                                          listViewNotificationsRecord.reference,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
