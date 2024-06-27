import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/community/components/friend_item/friend_item_widget.dart';
import '/community/components/user_sheet/user_sheet_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'my_friends_model.dart';
export 'my_friends_model.dart';

class MyFriendsWidget extends StatefulWidget {
  const MyFriendsWidget({super.key});

  @override
  State<MyFriendsWidget> createState() => _MyFriendsWidgetState();
}

class _MyFriendsWidgetState extends State<MyFriendsWidget> {
  late MyFriendsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyFriendsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            'My friends',
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
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 25.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              const Duration(milliseconds: 2000),
                              () async {
                                await queryUsersRecordOnce()
                                    .then(
                                      (records) => _model
                                          .simpleSearchResults = TextSearch(
                                        records
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record,
                                                      [record.displayName]),
                                            )
                                            .toList(),
                                      )
                                          .search(_model.textController.text)
                                          .map((r) => r.object)
                                          .take(5)
                                          .toList(),
                                    )
                                    .onError((_, __) =>
                                        _model.simpleSearchResults = [])
                                    .whenComplete(() => setState(() {}));
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.search,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Search a friend..',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDFDEEC),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.0,
                                ),
                            cursorColor: FlutterFlowTheme.of(context).secondary,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        FutureBuilder<int>(
                          future: queryNotificationsRecordCount(
                            parent: currentUserReference,
                            queryBuilder: (notificationsRecord) =>
                                notificationsRecord.where(
                              'friend_request',
                              isEqualTo: true,
                            ),
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
                            int containerCount = snapshot.data!;
                            return Container(
                              decoration: const BoxDecoration(),
                              child: Visibility(
                                visible: (containerCount != null) &&
                                    (containerCount != 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 22.0),
                                        child: Text(
                                          'New requests',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: StreamBuilder<
                                          List<NotificationsRecord>>(
                                        stream: queryNotificationsRecord(
                                          parent: currentUserReference,
                                          queryBuilder: (notificationsRecord) =>
                                              notificationsRecord.where(
                                            'friend_request',
                                            isEqualTo: true,
                                          ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<NotificationsRecord>
                                              listViewNotificationsRecordList =
                                              snapshot.data!;
                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewNotificationsRecordList
                                                    .length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 16.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewNotificationsRecord =
                                                  listViewNotificationsRecordList[
                                                      listViewIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream: UsersRecord.getDocument(
                                                      listViewNotificationsRecord
                                                          .userSentFriendRequest!),
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
                                                    final columnUsersRecord =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child:
                                                              FriendItemWidget(
                                                            key: Key(
                                                                'Keyfly_${listViewIndex}_of_${listViewNotificationsRecordList.length}'),
                                                            userRef:
                                                                listViewNotificationsRecord
                                                                    .userSentFriendRequest!,
                                                            isRequest: true,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      52.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await currentUserReference!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'user_friends':
                                                                            FieldValue.arrayUnion([
                                                                          listViewNotificationsRecord
                                                                              .userSentFriendRequest
                                                                        ]),
                                                                        'friend_requests_pending':
                                                                            FieldValue.arrayRemove([
                                                                          listViewNotificationsRecord
                                                                              .userSentFriendRequest
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });

                                                                  await listViewNotificationsRecord
                                                                      .userSentFriendRequest!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'user_friends':
                                                                            FieldValue.arrayUnion([
                                                                          currentUserReference
                                                                        ]),
                                                                        'friend_requests_pending':
                                                                            FieldValue.arrayRemove([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });

                                                                  await NotificationsRecord.createDoc(
                                                                          columnUsersRecord
                                                                              .reference)
                                                                      .set(
                                                                          createNotificationsRecordData(
                                                                    notificationType:
                                                                        'Community',
                                                                    boldContent:
                                                                        currentUserDisplayName,
                                                                    content:
                                                                        ' has accepted your friend request',
                                                                    isCommunity:
                                                                        true,
                                                                    createdAt:
                                                                        getCurrentTimestamp,
                                                                    userRef:
                                                                        currentUserReference,
                                                                  ));
                                                                  await listViewNotificationsRecord
                                                                      .reference
                                                                      .delete();
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        'Wow!',
                                                                    notificationText:
                                                                        currentUserDisplayName,
                                                                    notificationSound:
                                                                        'default',
                                                                    userRefs: [
                                                                      listViewNotificationsRecord
                                                                          .userSentFriendRequest!
                                                                    ],
                                                                    initialPageName:
                                                                        'MainPage',
                                                                    parameterData: {},
                                                                  );
                                                                },
                                                                text: 'Confirm',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 48.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          14.0,
                                                                          24.0,
                                                                          14.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 0.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await listViewNotificationsRecord
                                                                      .reference
                                                                      .delete();
                                                                },
                                                                text: 'Delete',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 48.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          14.0,
                                                                          24.0,
                                                                          14.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
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
                            );
                          },
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 22.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                '${(currentUserDocument?.userFriends.toList() ?? []).length.toString()} friends',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if ((_model.textController.text != '') &&
                                (_model.simpleSearchResults.isNotEmpty)) {
                              return Builder(
                                builder: (context) {
                                  final searchedFriends = _model
                                      .simpleSearchResults
                                      .map((e) => e)
                                      .toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: searchedFriends.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 13.0),
                                    itemBuilder:
                                        (context, searchedFriendsIndex) {
                                      final searchedFriendsItem =
                                          searchedFriends[searchedFriendsIndex];
                                      return Visibility(
                                        visible: (currentUserDocument
                                                    ?.userFriends
                                                    .toList() ??
                                                [])
                                            .contains(
                                                searchedFriendsItem.reference),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  searchedFriendsItem
                                                      .reference),
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
                                                final columnUsersRecord =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
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
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
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
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        UserSheetWidget(
                                                                      userRef:
                                                                          searchedFriendsItem
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: FriendItemWidget(
                                                          key: Key(
                                                              'Key9l6_${searchedFriendsIndex}_of_${searchedFriends.length}'),
                                                          userRef:
                                                              columnUsersRecord
                                                                  .reference,
                                                          isRequest: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              return AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final friends = (currentUserDocument
                                                ?.userFriends
                                                .toList() ??
                                            [])
                                        .toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: friends.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 32.0),
                                      itemBuilder: (context, friendsIndex) {
                                        final friendsItem =
                                            friends[friendsIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                friendsItem),
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
                                              final columnUsersRecord =
                                                  snapshot.data!;
                                              return Column(
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
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
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
                                                                    UserSheetWidget(
                                                                  userRef:
                                                                      friendsItem,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: FriendItemWidget(
                                                      key: Key(
                                                          'Key5s6_${friendsIndex}_of_${friends.length}'),
                                                      userRef: columnUsersRecord
                                                          .reference,
                                                      isRequest: false,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ].addToEnd(const SizedBox(height: 90.0)),
                    ),
                  ],
                ),
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
      ),
    );
  }
}
