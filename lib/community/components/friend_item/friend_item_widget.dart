import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'friend_item_model.dart';
export 'friend_item_model.dart';

class FriendItemWidget extends StatefulWidget {
  const FriendItemWidget({
    super.key,
    required this.userRef,
    required this.isRequest,
  });

  final DocumentReference? userRef;
  final bool? isRequest;

  @override
  State<FriendItemWidget> createState() => _FriendItemWidgetState();
}

class _FriendItemWidgetState extends State<FriendItemWidget> {
  late FriendItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userDoc = await UsersRecord.getDocumentOnce(widget.userRef!);
      _model.locationName = await actions.getLocationName(
        _model.userDoc!.location!,
        isAndroid,
        isiOS,
        isWeb,
      );
      _model.location = _model.locationName!;
      setState(() {});
    });

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
        final containerUsersRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  if (containerUsersRecord.photoUrl != '') {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          containerUsersRecord.photoUrl,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCEEFF),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '${String.fromCharCode(containerUsersRecord.firstName.runes.first)}${String.fromCharCode(containerUsersRecord.lastName.runes.first)}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  fontSize: 18.0,
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
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Text(
                                containerUsersRecord.displayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            if (functions.countMutualFriends(
                                    (currentUserDocument?.userFriends
                                                .toList() ??
                                            [])
                                        .toList(),
                                    containerUsersRecord.userFriends
                                        .toList()) !=
                                0)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 4.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    '(${functions.countMutualFriends((currentUserDocument?.userFriends.toList() ?? []).toList(), containerUsersRecord.userFriends.toList()).toString()} mutual friends)',
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
                    if ((containerUsersRecord.location != null) &&
                        (currentUserDocument?.location != null))
                      AuthUserStreamWidget(
                        builder: (context) => Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 3.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/location_fill.png',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '${valueOrDefault<String>(
                                          functions
                                              .calculateDistanceBetweenUsers(
                                                  currentUserDocument!
                                                      .location!,
                                                  containerUsersRecord
                                                      .location!),
                                          '0',
                                        )} from you',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      if (containerUsersRecord.locationName !=
                                              '')
                                        Text(
                                          '  •  ${containerUsersRecord.locationName}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
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
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Visibility(
                    visible: !widget.isRequest!,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.chatWithUserExists = await queryChatsRecordOnce(
                          queryBuilder: (chatsRecord) => chatsRecord
                              .where(
                                'user_a',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'user_b',
                                isEqualTo: containerUsersRecord.reference,
                              ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.chatWithUserExists?.reference != null) {
                          context.pushNamed(
                            'chatMessages',
                            queryParameters: {
                              'chatUser': serializeParam(
                                _model.chatWithUserExists?.reference,
                                ParamType.DocumentReference,
                              ),
                              'userRef': serializeParam(
                                containerUsersRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          _model.chatWithUserExists2 =
                              await queryChatsRecordOnce(
                            queryBuilder: (chatsRecord) => chatsRecord
                                .where(
                                  'user_a',
                                  isEqualTo: containerUsersRecord.reference,
                                )
                                .where(
                                  'user_b',
                                  isEqualTo: currentUserReference,
                                ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          if (_model.chatWithUserExists2?.reference != null) {
                            context.pushNamed(
                              'chatMessages',
                              queryParameters: {
                                'chatUser': serializeParam(
                                  _model.chatWithUserExists2?.reference,
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
                              userB: containerUsersRecord.reference,
                              image: containerUsersRecord.photoUrl,
                            ));
                            _model.newChatWithUser =
                                ChatsRecord.getDocumentFromData(
                                    createChatsRecordData(
                                      user: currentUserReference,
                                      userA: currentUserReference,
                                      userB: containerUsersRecord.reference,
                                      image: containerUsersRecord.photoUrl,
                                    ),
                                    chatsRecordReference);

                            context.pushNamed(
                              'chatMessages',
                              queryParameters: {
                                'chatUser': serializeParam(
                                  _model.newChatWithUser?.reference,
                                  ParamType.DocumentReference,
                                ),
                                'userRef': serializeParam(
                                  containerUsersRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          }
                        }

                        setState(() {});
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customColor1,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/message_outline.png',
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.cover,
                              alignment: const Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
