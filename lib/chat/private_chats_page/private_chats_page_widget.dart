import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/delete_chat/delete_chat_widget.dart';
import '/chat/empty_inbox/empty_inbox_widget.dart';
import '/chat/list_of_friends/list_of_friends_widget.dart';
import '/chat/list_of_members/list_of_members_widget.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedindex = 3;
      setState(() {});
      _model.chatWithMidwife = await queryChatsRecordOnce(
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
      if (_model.chatWithMidwife?.reference != null) {
        _model.chatWithRenske = true;
        setState(() {});
      } else {
        _model.chatWithRenske = false;
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
          title: wrapWithModel(
            model: _model.appBarModel,
            updateCallback: () => setState(() {}),
            child: const AppBarWidget(
              text: 'Private chats',
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child: const ListOfFriendsWidget(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: 'Select a friend',
                                    icon: const Icon(
                                      Icons.chevron_right,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
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
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child: const ListOfMembersWidget(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: 'Find a member',
                                    icon: const Icon(
                                      Icons.person_search_rounded,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
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
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                          if (false)
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
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
                                          fontFamily: 'Figtree',
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
                          Builder(
                            builder: (context) {
                              if (!_model.chatWithRenske) {
                                return Visibility(
                                  visible: currentUserReference !=
                                      FFAppState().midwifeRef,
                                  child: FFButtonWidget(
                                    onPressed: () async {
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
                                                      FFAppState().midwifeRef,
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
                                            'userRef': serializeParam(
                                              FFAppState().midwifeRef,
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
                                          userB: FFAppState().midwifeRef,
                                          image:
                                              'https://static.vecteezy.com/system/resources/thumbnails/006/895/899/small/illustration-for-midwife-day-nurse-or-midwife-with-mask-holding-a-newborn-by-hands-vector.jpg',
                                        ));
                                        _model.newChat =
                                            ChatsRecord.getDocumentFromData(
                                                createChatsRecordData(
                                                  user: currentUserReference,
                                                  userA: currentUserReference,
                                                  userB:
                                                      FFAppState().midwifeRef,
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
                                            'userRef': serializeParam(
                                              FFAppState().midwifeRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        _model.chatWithRenske = true;
                                        setState(() {});
                                      }

                                      setState(() {});
                                    },
                                    text: 'Start a chat with midwife',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 14.0, 24.0, 14.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
                                );
                              } else {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.chatExists2 =
                                        await queryChatsRecordOnce(
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
                                    if (_model.chatExists2?.reference != null) {
                                      context.pushNamed(
                                        'chatMessages',
                                        queryParameters: {
                                          'chatUser': serializeParam(
                                            _model.chatExists2?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'userRef': serializeParam(
                                            FFAppState().midwifeRef,
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
                                        userB: FFAppState().midwifeRef,
                                        image:
                                            'https://static.vecteezy.com/system/resources/thumbnails/006/895/899/small/illustration-for-midwife-day-nurse-or-midwife-with-mask-holding-a-newborn-by-hands-vector.jpg',
                                      ));
                                      _model.newChatCopy =
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
                                            _model.chatExists2?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'userRef': serializeParam(
                                            FFAppState().midwifeRef,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFE4FF),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        1000.0),
                                                child: Image.asset(
                                                  'assets/images/midwife_icon.png',
                                                  width: 56.0,
                                                  height: 56.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Midwife Renske',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Figtree',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textColor,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xFF52A7FB),
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      'Have questions about pregnancy? \nAsk a certified midwife.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Figtree',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textColor,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          if (false)
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
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
                                          fontFamily: 'Figtree',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (_model.showChats) {
                                        return StreamBuilder<List<ChatsRecord>>(
                                          stream: queryChatsRecord(
                                            queryBuilder: (chatsRecord) =>
                                                chatsRecord
                                                    .where(Filter.or(
                                                      Filter(
                                                        'user_a',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      ),
                                                      Filter(
                                                        'user_b',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      ),
                                                    ))
                                                    .orderBy(
                                                        'last_message_time',
                                                        descending: true),
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
                                                          .secondary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ChatsRecord>
                                                listViewChatsRecordList =
                                                snapshot.data!;
                                            if (listViewChatsRecordList
                                                .isEmpty) {
                                              return const EmptyInboxWidget();
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listViewChatsRecordList
                                                  .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewChatsRecord =
                                                    listViewChatsRecordList[
                                                        listViewIndex];
                                                return SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 82.0,
                                                  child: custom_widgets
                                                      .SlidableWidget(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 82.0,
                                                    timeStamp: dateTimeFormat(
                                                      'Hm',
                                                      listViewChatsRecord
                                                          .lastMessageTime!,
                                                      locale: FFLocalizations
                                                                  .of(context)
                                                              .languageShortCode ??
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    isSeen: listViewChatsRecord
                                                        .isSeen,
                                                    lastMessage:
                                                        listViewChatsRecord
                                                            .lastMessage,
                                                    user: listViewChatsRecord
                                                        .user!,
                                                    userA: listViewChatsRecord
                                                        .userA!,
                                                    userB: listViewChatsRecord
                                                        .userB!,
                                                    chatDocument:
                                                        listViewChatsRecord
                                                            .reference,
                                                    deleteAction: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    DeleteChatWidget(
                                                                  deleteChat:
                                                                      () async {
                                                                    await listViewChatsRecord
                                                                        .reference
                                                                        .delete();
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      } else {
                                        return wrapWithModel(
                                          model: _model.emptyInboxModel,
                                          updateCallback: () => setState(() {}),
                                          child: const EmptyInboxWidget(),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].addToEnd(const SizedBox(height: 80.0)),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.bottomNavBarModel,
                updateCallback: () => setState(() {}),
                child: const BottomNavBarWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
