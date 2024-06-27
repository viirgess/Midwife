import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/chat/actions_with_user/actions_with_user_widget.dart';
import '/chat/confirm_sending_photo/confirm_sending_photo_widget.dart';
import '/chat/user_sent_message/user_sent_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_messages_model.dart';
export 'chat_messages_model.dart';

class ChatMessagesWidget extends StatefulWidget {
  const ChatMessagesWidget({
    super.key,
    this.chatUser,
    required this.userRef,
  });

  final DocumentReference? chatUser;
  final DocumentReference? userRef;

  @override
  State<ChatMessagesWidget> createState() => _ChatMessagesWidgetState();
}

class _ChatMessagesWidgetState extends State<ChatMessagesWidget> {
  late ChatMessagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMessagesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.chatListView?.animateTo(
        _model.chatListView!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });

    _model.messageTextFieldTextController ??= TextEditingController();
    _model.messageTextFieldFocusNode ??= FocusNode();
    _model.messageTextFieldFocusNode!.addListener(() => setState(() {}));
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
        body: SafeArea(
          top: true,
          child: StreamBuilder<UsersRecord>(
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
              final columnUsersRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/inner_chat-empty.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: StreamBuilder<ChatsRecord>(
                                stream:
                                    ChatsRecord.getDocument(widget.chatUser!),
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
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final columnChatsRecord = snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.safePop();
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .chevron_left_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (columnChatsRecord
                                                              .userA ==
                                                          currentUserReference) {
                                                        return StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  columnChatsRecord
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
                                                                          .secondary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final rowUsersRecord =
                                                                snapshot.data!;
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (rowUsersRecord.photoUrl !=
                                                                            '') {
                                                                      return Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            rowUsersRecord.photoUrl,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              6.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: const Color(0xFFFCEEFF),
                                                                              shape: BoxShape.circle,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                '${String.fromCharCode(rowUsersRecord.firstName.runes.first)}${String.fromCharCode(rowUsersRecord.lastName.runes.first)}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Figtree',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 1.2,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                                Text(
                                                                  rowUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                if (columnUsersRecord
                                                                    .isAdmin)
                                                                  const Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .verified,
                                                                      color: Color(
                                                                          0xFF52A7FB),
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  columnChatsRecord
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
                                                                          .secondary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final rowUsersRecord =
                                                                snapshot.data!;
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (rowUsersRecord.photoUrl !=
                                                                            '') {
                                                                      return Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            rowUsersRecord.photoUrl,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              56.0,
                                                                          height:
                                                                              56.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                const Color(0xFFFCEEFF),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              '${String.fromCharCode(rowUsersRecord.firstName.runes.first)}${String.fromCharCode(rowUsersRecord.lastName.runes.first)}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                Text(
                                                                  rowUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                if (rowUsersRecord
                                                                    .isAdmin)
                                                                  const Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .verified,
                                                                      color: Color(
                                                                          0xFF52A7FB),
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
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
                                                                ActionsWithUserWidget(
                                                              chatRef:
                                                                  columnChatsRecord
                                                                      .reference,
                                                              userRef: widget
                                                                  .userRef!,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.more_vert,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (columnChatsRecord
                                                    .lastMessageTime !=
                                                null)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFF0DEFE),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          17.0, 2.0, 17.0, 2.0),
                                                  child: Text(
                                                    functions.generateTimeStamp(
                                                        columnChatsRecord
                                                            .lastMessageTime!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color:
                                                              const Color(0xFF9183A2),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              decoration: const BoxDecoration(),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: StreamBuilder<
                                                    List<ChatMessagesRecord>>(
                                                  stream:
                                                      queryChatMessagesRecord(
                                                    queryBuilder:
                                                        (chatMessagesRecord) =>
                                                            chatMessagesRecord
                                                                .where(
                                                                  'chat_user',
                                                                  isEqualTo: widget
                                                                      .chatUser,
                                                                )
                                                                .orderBy(
                                                                    'time_stamp'),
                                                  )..listen((snapshot) {
                                                          List<ChatMessagesRecord>
                                                              chatListViewChatMessagesRecordList =
                                                              snapshot;
                                                          if (_model.chatListViewPreviousSnapshot !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      ChatMessagesRecordDocumentEquality())
                                                                  .equals(
                                                                      chatListViewChatMessagesRecordList,
                                                                      _model
                                                                          .chatListViewPreviousSnapshot)) {
                                                            () async {
                                                              await _model
                                                                  .chatListView
                                                                  ?.animateTo(
                                                                _model
                                                                    .chatListView!
                                                                    .position
                                                                    .maxScrollExtent,
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        200),
                                                                curve:
                                                                    Curves.ease,
                                                              );

                                                              setState(() {});
                                                            }();
                                                          }
                                                          _model.chatListViewPreviousSnapshot =
                                                              snapshot;
                                                        }),
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
                                                    List<ChatMessagesRecord>
                                                        chatListViewChatMessagesRecordList =
                                                        snapshot.data!;
                                                    return ListView.builder(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                        0,
                                                        0,
                                                        0,
                                                        12.0,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          chatListViewChatMessagesRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          chatListViewIndex) {
                                                        final chatListViewChatMessagesRecord =
                                                            chatListViewChatMessagesRecordList[
                                                                chatListViewIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      8.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if ((chatListViewChatMessagesRecord
                                                                          .user !=
                                                                      currentUserReference) &&
                                                                  ((chatListViewChatMessagesRecord.text !=
                                                                              '') ||
                                                                      (chatListViewChatMessagesRecord.image !=
                                                                              '')))
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            46.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        if ((chatListViewChatMessagesRecord.user !=
                                                                                currentUserReference) &&
                                                                            ((chatListViewChatMessagesRecord.text != '') ||
                                                                                (chatListViewChatMessagesRecord.image != '')))
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                              child: SafeArea(
                                                                                child: Container(
                                                                                  constraints: const BoxConstraints(
                                                                                    maxHeight: double.infinity,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 12.0, 4.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                          child: Container(
                                                                                            constraints: const BoxConstraints(
                                                                                              maxWidth: 230.0,
                                                                                            ),
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Visibility(
                                                                                              visible: chatListViewChatMessagesRecord.text != '',
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 10.0),
                                                                                                child: Text(
                                                                                                  chatListViewChatMessagesRecord.text,
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Figtree',
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 5.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat(
                                                                                                      'Hm',
                                                                                                      chatListViewChatMessagesRecord.timeStamp!,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Figtree',
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              if ((chatListViewChatMessagesRecord
                                                                          .user ==
                                                                      currentUserReference) &&
                                                                  ((chatListViewChatMessagesRecord.text !=
                                                                              '') ||
                                                                      (chatListViewChatMessagesRecord.image !=
                                                                              '')) &&
                                                                  (chatListViewChatMessagesRecord
                                                                          .imagesIsSet ==
                                                                      false))
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          60.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if ((chatListViewChatMessagesRecord.user ==
                                                                              currentUserReference) &&
                                                                          ((chatListViewChatMessagesRecord.text != '') ||
                                                                              (chatListViewChatMessagesRecord.image != '')))
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                2.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                            child:
                                                                                SafeArea(
                                                                              child: Container(
                                                                                constraints: const BoxConstraints(
                                                                                  maxHeight: double.infinity,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 12.0, 4.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Container(
                                                                                        constraints: const BoxConstraints(
                                                                                          maxWidth: 230.0,
                                                                                        ),
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Visibility(
                                                                                          visible: chatListViewChatMessagesRecord.text != '',
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 10.0),
                                                                                            child: Text(
                                                                                              chatListViewChatMessagesRecord.text,
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Figtree',
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 5.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat(
                                                                                                    'Hm',
                                                                                                    chatListViewChatMessagesRecord.timeStamp!,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Figtree',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if ((chatListViewChatMessagesRecord
                                                                          .user ==
                                                                      currentUserReference) &&
                                                                  ((chatListViewChatMessagesRecord.text !=
                                                                              '') ||
                                                                      (chatListViewChatMessagesRecord
                                                                              .images
                                                                              .length !=
                                                                          null)))
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    if ((chatListViewChatMessagesRecord.user ==
                                                                            currentUserReference) &&
                                                                        ((chatListViewChatMessagesRecord.text != '') ||
                                                                            (chatListViewChatMessagesRecord.image !=
                                                                                    '')) &&
                                                                        (chatListViewChatMessagesRecord.imagesIsSet ==
                                                                            true))
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              2.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                          child:
                                                                              SafeArea(
                                                                            child:
                                                                                Container(
                                                                              constraints: const BoxConstraints(
                                                                                maxHeight: double.infinity,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 12.0, 4.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Container(
                                                                                      constraints: const BoxConstraints(
                                                                                        maxWidth: 230.0,
                                                                                      ),
                                                                                      decoration: const BoxDecoration(),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                      child: UserSentMessageWidget(
                                                                                        key: Key('Keyj98_${chatListViewIndex}_of_${chatListViewChatMessagesRecordList.length}'),
                                                                                        images: chatListViewChatMessagesRecord,
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 5.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat(
                                                                                                    'Hm',
                                                                                                    chatListViewChatMessagesRecord.timeStamp!,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Figtree',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        fontSize: 12.0,
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
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      controller:
                                                          _model.chatListView,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SafeArea(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF6F6F6),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final selectedMedia =
                                                                await selectMedia(
                                                              mediaSource:
                                                                  MediaSource
                                                                      .photoGallery,
                                                              multiImage: false,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading1 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                _model.isDataUploading1 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile1 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl1 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                setState(() {});
                                                                return;
                                                              }
                                                            }
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/attach.png',
                                                              width: 28.0,
                                                              height: 28.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .messageTextFieldTextController,
                                                            focusNode: _model
                                                                .messageTextFieldFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.messageTextFieldTextController',
                                                              const Duration(
                                                                  milliseconds:
                                                                      1000),
                                                              () async {
                                                                if (_model
                                                                        .messageTextFieldTextController
                                                                        .text !=
                                                                    '') {
                                                                  _model.showSend =
                                                                      true;
                                                                  setState(
                                                                      () {});
                                                                } else {
                                                                  _model.showSend =
                                                                      false;
                                                                  setState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .send,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            maxLines: 5,
                                                            minLines: 1,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            validator: _model
                                                                .messageTextFieldTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                      if (_model.messageTextFieldTextController
                                                                  .text ==
                                                              '')
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final selectedMedia =
                                                                await selectMedia(
                                                              mediaSource:
                                                                  MediaSource
                                                                      .photoGallery,
                                                              multiImage: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading2 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                _model.isDataUploading2 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFiles2 =
                                                                      selectedUploadedFiles;
                                                                  _model.uploadedFileUrls2 =
                                                                      downloadUrls;
                                                                });
                                                              } else {
                                                                setState(() {});
                                                                return;
                                                              }
                                                            }

                                                            FFAppState()
                                                                    .uploadedImages =
                                                                _model
                                                                    .uploadedFileUrls2
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            setState(() {});
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          ConfirmSendingPhotoWidget(
                                                                        personName:
                                                                            columnUsersRecord.displayName,
                                                                        images:
                                                                            FFAppState().uploadedImages,
                                                                        user:
                                                                            currentUserReference!,
                                                                        chatUser:
                                                                            columnChatsRecord.reference,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/camera_icon.png',
                                                              width: 28.0,
                                                              height: 28.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      if (_model.messageTextFieldTextController
                                                                  .text !=
                                                              '')
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await ChatMessagesRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    createChatMessagesRecordData(
                                                                  user:
                                                                      currentUserReference,
                                                                  chatUser: widget
                                                                      .chatUser,
                                                                  text: _model.messageTextFieldTextController.text !=
                                                                              ''
                                                                      ? _model
                                                                          .messageTextFieldTextController
                                                                          .text
                                                                      : '',
                                                                  image: _model
                                                                      .uploadedFileUrl1,
                                                                  timeStamp:
                                                                      getCurrentTimestamp,
                                                                ));

                                                            await widget
                                                                .chatUser!
                                                                .update(
                                                                    createChatsRecordData(
                                                              lastMessage: _model
                                                                  .messageTextFieldTextController
                                                                  .text,
                                                              lastMessageTime:
                                                                  getCurrentTimestamp,
                                                              isSeen: false,
                                                              isSeenByUser:
                                                                  false,
                                                            ));
                                                            if (columnChatsRecord
                                                                    .userA ==
                                                                currentUserReference) {
                                                              _model.userBDoc =
                                                                  await UsersRecord
                                                                      .getDocumentOnce(
                                                                          columnChatsRecord
                                                                              .userB!);
                                                              if (_model
                                                                  .userBDoc!
                                                                  .notificationSettings
                                                                  .messaging) {
                                                                triggerPushNotification(
                                                                  notificationTitle:
                                                                      'New message!',
                                                                  notificationText:
                                                                      '${'${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}'} Has sent you a new message!',
                                                                  userRefs: [
                                                                    _model
                                                                        .userADoc!
                                                                        .reference
                                                                  ],
                                                                  initialPageName:
                                                                      'chatMessages',
                                                                  parameterData: {
                                                                    'chatUser':
                                                                        widget
                                                                            .chatUser,
                                                                    'userRef':
                                                                        currentUserReference,
                                                                  },
                                                                );
                                                              }
                                                            } else {
                                                              _model.userADoc =
                                                                  await UsersRecord
                                                                      .getDocumentOnce(
                                                                          columnChatsRecord
                                                                              .userA!);
                                                              if (_model
                                                                  .userADoc!
                                                                  .notificationSettings
                                                                  .messaging) {
                                                                triggerPushNotification(
                                                                  notificationTitle:
                                                                      'New message!',
                                                                  notificationText:
                                                                      '${'${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}'} Has sent you a new message!',
                                                                  userRefs: [
                                                                    _model
                                                                        .userADoc!
                                                                        .reference
                                                                  ],
                                                                  initialPageName:
                                                                      'chatMessages',
                                                                  parameterData: {
                                                                    'chatUser':
                                                                        widget
                                                                            .chatUser,
                                                                    'userRef':
                                                                        currentUserReference,
                                                                  },
                                                                );
                                                              }
                                                            }

                                                            setState(() {
                                                              _model
                                                                  .messageTextFieldTextController
                                                                  ?.clear();
                                                            });
                                                            setState(() {
                                                              _model.isDataUploading1 =
                                                                  false;
                                                              _model.uploadedLocalFile1 =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []));
                                                              _model.uploadedFileUrl1 =
                                                                  '';
                                                            });

                                                            setState(() {
                                                              _model.isDataUploading2 =
                                                                  false;
                                                              _model.uploadedLocalFiles2 =
                                                                  [];
                                                              _model.uploadedFileUrls2 =
                                                                  [];
                                                            });

                                                            await _model
                                                                .chatListView
                                                                ?.animateTo(
                                                              _model
                                                                  .chatListView!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      200),
                                                              curve:
                                                                  Curves.ease,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/send_icon.png',
                                                                width: 16.0,
                                                                height: 16.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                alignment:
                                                                    const Alignment(
                                                                        0.0,
                                                                        0.0),
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
                                    ],
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
              );
            },
          ),
        ),
      ),
    );
  }
}
