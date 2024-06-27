import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/notifications/congratulations_notification/congratulations_notification_widget.dart';
import '/notifications/default_notification/default_notification_widget.dart';
import '/notifications/empty_notifications/empty_notifications_widget.dart';
import '/notifications/friend_accepted_notification_c/friend_accepted_notification_c_widget.dart';
import '/notifications/friend_request_notification/friend_request_notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (getCurrentTimestamp > currentUserDocument!.calculatedDate!) {
        _model.showCongratulations = true;
        setState(() {});
      }
    });

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_outlined,
              color: FlutterFlowTheme.of(context).alternate,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Notifications',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Figtree',
                  color: FlutterFlowTheme.of(context).alternate,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.showCongratulations &&
                    valueOrDefault<bool>(
                        currentUserDocument?.isPregnant, false))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => wrapWithModel(
                        model: _model.congratulationsNotificationModel,
                        updateCallback: () => setState(() {}),
                        child: CongratulationsNotificationWidget(
                          confirmAction: () async {
                            _model.showCongratulations = false;
                            setState(() {});
                          },
                          editDueDate: () async {},
                        ),
                      ),
                    ),
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
                                FlutterFlowTheme.of(context).secondary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<NotificationsRecord>
                          listViewNotificationsRecordList = snapshot.data!;
                      if (listViewNotificationsRecordList.isEmpty) {
                        return const Center(
                          child: EmptyNotificationsWidget(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
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
                                Builder(
                                  builder: (context) {
                                    if ((listViewNotificationsRecord
                                                .friendRequest ==
                                            true) ||
                                        listViewNotificationsRecord
                                            .friendRequestAccepted) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (listViewNotificationsRecord
                                                  .friendRequest ==
                                              true)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 12.0),
                                              child:
                                                  FriendRequestNotificationWidget(
                                                key: Key(
                                                    'Keyxf2_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                                userName:
                                                    listViewNotificationsRecord
                                                        .userDisplayName,
                                                userPhoto:
                                                    listViewNotificationsRecord
                                                        .userPhotoUrl,
                                                userFriendRef:
                                                    listViewNotificationsRecord
                                                        .userSentFriendRequest!,
                                                notificationRef:
                                                    listViewNotificationsRecord
                                                        .reference,
                                              ),
                                            ),
                                          if (listViewNotificationsRecord
                                                  .friendRequestAccepted ==
                                              true)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 12.0),
                                              child:
                                                  FriendAcceptedNotificationCWidget(
                                                key: Key(
                                                    'Keyw9d_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                                userName:
                                                    listViewNotificationsRecord
                                                        .userDisplayName,
                                                userPhoto:
                                                    listViewNotificationsRecord
                                                        .userPhotoUrl,
                                                userFriendRef:
                                                    listViewNotificationsRecord
                                                        .userAcceptedFriendship!,
                                                notificationRef:
                                                    listViewNotificationsRecord
                                                        .reference,
                                              ),
                                            ),
                                        ],
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 12.0),
                                        child: DefaultNotificationWidget(
                                          key: Key(
                                              'Keyidj_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                          userRef: listViewNotificationsRecord
                                              .userRef!,
                                          notificationRef:
                                              listViewNotificationsRecord
                                                  .reference,
                                        ),
                                      );
                                    }
                                  },
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
