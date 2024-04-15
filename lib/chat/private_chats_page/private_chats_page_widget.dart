import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/list_of_friends/list_of_friends_widget.dart';
import '/chat/list_of_users/list_of_users_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notifications/notification_modal_sheet/notification_modal_sheet_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'private_chats_page_model.dart';
export 'private_chats_page_model.dart';

class PrivateChatsPageWidget extends StatefulWidget {
  const PrivateChatsPageWidget({super.key});

  @override
  State<PrivateChatsPageWidget> createState() => _PrivateChatsPageWidgetState();
}

class _PrivateChatsPageWidgetState extends State<PrivateChatsPageWidget> {
  late PrivateChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivateChatsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              context.pushNamed('MainPage');
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        barrierColor: const Color(0x19C67AF5),
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const NotificationModalSheetWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Icon(
                      Icons.notifications_none,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 58.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Privé chats',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Privégesprekken met vriendinnen uit de community',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Inbox',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      if (currentUserReference != FFAppState().midwifeRef)
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.chatExists = await queryChatsRecordOnce(
                                  queryBuilder: (chatsRecord) => chatsRecord
                                      .where(
                                        'user_a',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'user_b',
                                        isEqualTo: FFAppState().midwifeRef,
                                      ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.chatExists?.reference != null) {
                                  context.pushNamed(
                                    'chatMessages',
                                    queryParameters: {
                                      'chatUser': serializeParam(
                                        _model.chatExists?.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'userName': serializeParam(
                                        'Renske Midwife',
                                        ParamType.String,
                                      ),
                                      'userRef': serializeParam(
                                        FFAppState().midwifeRef,
                                        ParamType.DocumentReference,
                                      ),
                                      'userimage': serializeParam(
                                        'https://static.vecteezy.com/system/resources/thumbnails/006/895/899/small/illustration-for-midwife-day-nurse-or-midwife-with-mask-holding-a-newborn-by-hands-vector.jpg',
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
                                    userB: FFAppState().midwifeRef,
                                    image:
                                        'https://static.vecteezy.com/system/resources/thumbnails/006/895/899/small/illustration-for-midwife-day-nurse-or-midwife-with-mask-holding-a-newborn-by-hands-vector.jpg',
                                  ));
                                  _model.newChat =
                                      ChatsRecord.getDocumentFromData(
                                          createChatsRecordData(
                                            user: currentUserReference,
                                            userA: currentUserReference,
                                            userB: FFAppState().midwifeRef,
                                            image:
                                                'https://static.vecteezy.com/system/resources/thumbnails/006/895/899/small/illustration-for-midwife-day-nurse-or-midwife-with-mask-holding-a-newborn-by-hands-vector.jpg',
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
                                        'Renske Midwife',
                                        ParamType.String,
                                      ),
                                      'userRef': serializeParam(
                                        FFAppState().midwifeRef,
                                        ParamType.DocumentReference,
                                      ),
                                      'userimage': serializeParam(
                                        'https://static.vecteezy.com/system/resources/thumbnails/006/895/899/small/illustration-for-midwife-day-nurse-or-midwife-with-mask-holding-a-newborn-by-hands-vector.jpg',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }

                                setState(() {});
                              },
                              text: 'Chat met een verloskundige',
                              options: FFButtonOptions(
                                height: 35.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 14.0,
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
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: const SizedBox(
                                          height: 500.0,
                                          child: ListOfFriendsWidget(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            text: 'Chat met vrienden',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).accent2,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: const SizedBox(
                                          height: 500.0,
                                          child: ListOfUsersWidget(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            text: 'Zoek vrienden ',
                            icon: const Icon(
                              Icons.search_sharp,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).accent2,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
                      Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                queryBuilder: (chatsRecord) => chatsRecord
                                    .where(Filter.or(
                                      Filter(
                                        'user_a',
                                        isEqualTo: currentUserReference,
                                      ),
                                      Filter(
                                        'user_b',
                                        isEqualTo: currentUserReference,
                                      ),
                                    ))
                                    .orderBy('last_message_time',
                                        descending: true),
                              ),
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
                                List<ChatsRecord> listViewChatsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewChatsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewChatsRecord =
                                        listViewChatsRecordList[listViewIndex];
                                    return StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          listViewChatsRecord.userB!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final containerUsersRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Visibility(
                                            visible: (currentUserReference ==
                                                    listViewChatsRecord
                                                        .userA) ||
                                                (currentUserReference ==
                                                    listViewChatsRecord.userB),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'chatMessages',
                                                  queryParameters: {
                                                    'chatUser': serializeParam(
                                                      listViewChatsRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'userName': serializeParam(
                                                      '${containerUsersRecord.firstName} ${containerUsersRecord.lastName}',
                                                      ParamType.String,
                                                    ),
                                                    'userRef': serializeParam(
                                                      currentUserReference ==
                                                              FFAppState()
                                                                  .midwifeRef
                                                          ? listViewChatsRecord
                                                              .userA
                                                          : containerUsersRecord
                                                              .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'userimage': serializeParam(
                                                      containerUsersRecord
                                                          .photoUrl,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (currentUserReference !=
                                                          listViewChatsRecord
                                                              .user)
                                                        StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  listViewChatsRecord
                                                                      .userA!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final circleImageUsersRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                circleImageUsersRecord
                                                                    .photoUrl,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      if (currentUserReference ==
                                                          listViewChatsRecord
                                                              .user)
                                                        StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  listViewChatsRecord
                                                                      .userB!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final circleImageUsersRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                circleImageUsersRecord
                                                                    .photoUrl,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (currentUserReference !=
                                                                    listViewChatsRecord
                                                                        .user)
                                                                  StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(
                                                                        listViewChatsRecord
                                                                            .userA!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final textUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Text(
                                                                        textUsersRecord
                                                                            .displayName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                if (currentUserReference ==
                                                                    listViewChatsRecord
                                                                        .user)
                                                                  StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(
                                                                        listViewChatsRecord
                                                                            .userB!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final textUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Text(
                                                                        textUsersRecord
                                                                            .displayName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.isAdmin,
                                                                    false))
                                                                  AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            const Icon(
                                                                      Icons
                                                                          .verified,
                                                                      color: Color(
                                                                          0xFF52A7FB),
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    listViewChatsRecord
                                                                        .lastMessage,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                      'relative',
                                                                      listViewChatsRecord
                                                                          .lastMessageTime!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        letterSpacing:
                                                                            0.0,
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
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
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
        ),
      ),
    );
  }
}
