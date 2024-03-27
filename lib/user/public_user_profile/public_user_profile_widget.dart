import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'public_user_profile_model.dart';
export 'public_user_profile_model.dart';

class PublicUserProfileWidget extends StatefulWidget {
  const PublicUserProfileWidget({
    super.key,
    this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<PublicUserProfileWidget> createState() =>
      _PublicUserProfileWidgetState();
}

class _PublicUserProfileWidgetState extends State<PublicUserProfileWidget> {
  late PublicUserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicUserProfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final publicUserProfileUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.66,
              child: Drawer(
                child: WebViewAware(
                  child: wrapWithModel(
                    model: _model.drawerDataModel,
                    updateCallback: () => setState(() {}),
                    child: const DrawerDataWidget(),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Profiel',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 26.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(18.0, 18.0, 18.0, 18.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 18.0, 0.0),
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  publicUserProfileUsersRecord.photoUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${publicUserProfileUsersRecord.firstName} ${publicUserProfileUsersRecord.lastName}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                if (publicUserProfileUsersRecord
                                        .calculatedDate !=
                                    null)
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        '${valueOrDefault<String>(
                                          functions
                                              .calculateWeek(
                                                  publicUserProfileUsersRecord
                                                      .calculatedDate)
                                              .toString(),
                                          '0',
                                        )}th Week of Pregnancy',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (currentUserReference !=
                    publicUserProfileUsersRecord.reference)
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'Stuur bericht',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Builder(
                                    builder: (context) {
                                      if ((currentUserDocument
                                                  ?.friendRequestsPending
                                                  .toList() ??
                                              [])
                                          .contains(publicUserProfileUsersRecord
                                              .reference)) {
                                        return Visibility(
                                          visible: (currentUserDocument
                                                          ?.friendRequestsPending
                                                          .toList() ??
                                                      [])
                                                  .contains(
                                                      publicUserProfileUsersRecord
                                                          .reference) ==
                                              true,
                                          child: StreamBuilder<
                                              List<NotificationsRecord>>(
                                            stream: queryNotificationsRecord(
                                              parent:
                                                  publicUserProfileUsersRecord
                                                      .reference,
                                              queryBuilder:
                                                  (notificationsRecord) =>
                                                      notificationsRecord.where(
                                                'user_sent_friend_request',
                                                isEqualTo: currentUserReference,
                                              ),
                                              singleRecord: true,
                                            ),
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
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<NotificationsRecord>
                                                  containerNotificationsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final containerNotificationsRecord =
                                                  containerNotificationsRecordList
                                                          .isNotEmpty
                                                      ? containerNotificationsRecordList
                                                          .first
                                                      : null;
                                              return Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await containerNotificationsRecord!
                                                        .reference
                                                        .delete();

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'friend_requests_pending':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            publicUserProfileUsersRecord
                                                                .reference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.timer_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                      Text(
                                                        'Request pending',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 18.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return Visibility(
                                          visible: () {
                                            if ((currentUserDocument
                                                            ?.userFriends
                                                            .toList() ??
                                                        [])
                                                    .contains(
                                                        publicUserProfileUsersRecord
                                                            .reference) ==
                                                true) {
                                              return false;
                                            } else if ((currentUserDocument
                                                            ?.friendRequestsPending
                                                            .toList() ??
                                                        [])
                                                    .contains(
                                                        publicUserProfileUsersRecord
                                                            .reference) ==
                                                true) {
                                              return false;
                                            } else {
                                              return true;
                                            }
                                          }(),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                await NotificationsRecord.createDoc(
                                                        publicUserProfileUsersRecord
                                                            .reference)
                                                    .set(
                                                        createNotificationsRecordData(
                                                  userSentFriendRequest:
                                                      currentUserReference,
                                                  friendRequest: true,
                                                  userDisplayName:
                                                      '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                  userPhotoUrl:
                                                      currentUserPhoto,
                                                ));
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'New Friend Request',
                                                  notificationText:
                                                      'Hey! ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')} wants to be friends with you!',
                                                  notificationSound: 'default',
                                                  userRefs: [widget.userRef!],
                                                  initialPageName: 'MainPage',
                                                  parameterData: {},
                                                );

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'friend_requests_pending':
                                                          FieldValue
                                                              .arrayUnion([
                                                        publicUserProfileUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              },
                                              text:
                                                  'Vriendschapsverzoek sturen',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
