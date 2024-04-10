import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_friends_model.dart';
export 'list_of_friends_model.dart';

class ListOfFriendsWidget extends StatefulWidget {
  const ListOfFriendsWidget({super.key});

  @override
  State<ListOfFriendsWidget> createState() => _ListOfFriendsWidgetState();
}

class _ListOfFriendsWidgetState extends State<ListOfFriendsWidget> {
  late ListOfFriendsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfFriendsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Friends',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Builder(
                    builder: (context) {
                      final freindsList =
                          (currentUserDocument?.userFriends?.toList() ?? [])
                              .map((e) => e)
                              .toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: freindsList.length,
                        itemBuilder: (context, freindsListIndex) {
                          final freindsListItem = freindsList[freindsListIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(freindsListItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final containerUsersRecord = snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 8.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.chatExists =
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
                                                    isEqualTo:
                                                        containerUsersRecord
                                                            .reference,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.chatExists?.reference !=
                                            null) {
                                          context.pushNamed(
                                            'chatMessages',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                _model.chatExists?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'userName': serializeParam(
                                                '${containerUsersRecord.firstName} ${containerUsersRecord.lastName}',
                                                ParamType.String,
                                              ),
                                              'userRef': serializeParam(
                                                containerUsersRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'userimage': serializeParam(
                                                containerUsersRecord.photoUrl,
                                                ParamType.String,
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
                                            userB:
                                                containerUsersRecord.reference,
                                            image:
                                                containerUsersRecord.photoUrl,
                                          ));
                                          _model.newChat =
                                              ChatsRecord.getDocumentFromData(
                                                  createChatsRecordData(
                                                    user: currentUserReference,
                                                    userA: currentUserReference,
                                                    userB: containerUsersRecord
                                                        .reference,
                                                    image: containerUsersRecord
                                                        .photoUrl,
                                                  ),
                                                  chatsRecordReference);

                                          context.pushNamed(
                                            'chatMessages',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                _model.newChat?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'userName': serializeParam(
                                                '${containerUsersRecord.firstName} ${containerUsersRecord.lastName}',
                                                ParamType.String,
                                              ),
                                              'userRef': serializeParam(
                                                containerUsersRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'userimage': serializeParam(
                                                containerUsersRecord.photoUrl,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }

                                        Navigator.pop(context);

                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                containerUsersRecord.photoUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '${containerUsersRecord.firstName} ${containerUsersRecord.lastName}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              if (containerUsersRecord.isAdmin)
                                                Icon(
                                                  Icons.verified,
                                                  color: Color(0xFF52A7FB),
                                                  size: 18.0,
                                                ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Icon(
                                                Icons.chevron_right_rounded,
                                                color: Color(0xFF7C8791),
                                                size: 30.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
