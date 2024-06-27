import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
                    child: Container(
                      width: 70.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent4,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            const Duration(milliseconds: 2000),
                            () async {
                              if (_model.textController.text != '') {
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
                                          .toList(),
                                    )
                                    .onError((_, __) =>
                                        _model.simpleSearchResults = [])
                                    .whenComplete(() => setState(() {}));

                                _model.isShowFullList = false;
                                setState(() {});
                              } else {
                                _model.isShowFullList = true;
                                setState(() {});
                              }
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Search for a friend..',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent4,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent4,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                            suffixIcon: _model.textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController?.clear();
                                      if (_model.textController.text != '') {
                                        await queryUsersRecordOnce()
                                            .then(
                                              (records) =>
                                                  _model.simpleSearchResults =
                                                      TextSearch(
                                                records
                                                    .map(
                                                      (record) => TextSearchItem
                                                          .fromTerms(record, [
                                                        record.displayName
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                          .search(_model
                                                              .textController
                                                              .text)
                                                          .map((r) => r.object)
                                                          .toList(),
                                            )
                                            .onError((_, __) =>
                                                _model.simpleSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));

                                        _model.isShowFullList = false;
                                        setState(() {});
                                      } else {
                                        _model.isShowFullList = true;
                                        setState(() {});
                                      }

                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 20.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 14.0, 0.0, 32.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Builder(
                            builder: (context) {
                              final freindsList = _model.isShowFullList
                                  ? (currentUserDocument?.userFriends
                                          .toList() ??
                                      [])
                                  : _model.simpleSearchResults
                                      .map((e) => e.reference)
                                      .toList()
                                      .where((e) =>
                                          (currentUserDocument?.userFriends
                                                      .toList() ??
                                                  [])
                                              .contains(e) ==
                                          true)
                                      .toList()
                                      .map((e) => e)
                                      .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: freindsList.length,
                                itemBuilder: (context, freindsListIndex) {
                                  final freindsListItem =
                                      freindsList[freindsListIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          freindsListItem),
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
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final containerUsersRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 0.0,
                                            ),
                                          ),
                                          child: Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
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
                                                    _model.chatExists =
                                                        await queryChatsRecordOnce(
                                                      queryBuilder:
                                                          (chatsRecord) =>
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
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    if (_model.chatExists
                                                            ?.reference !=
                                                        null) {
                                                      context.pushNamed(
                                                        'chatMessages',
                                                        queryParameters: {
                                                          'chatUser':
                                                              serializeParam(
                                                            _model.chatExists
                                                                ?.reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'userRef':
                                                              serializeParam(
                                                            containerUsersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      _model.chatExists2 =
                                                          await queryChatsRecordOnce(
                                                        queryBuilder:
                                                            (chatsRecord) =>
                                                                chatsRecord
                                                                    .where(
                                                                      'user_a',
                                                                      isEqualTo:
                                                                          containerUsersRecord
                                                                              .reference,
                                                                    )
                                                                    .where(
                                                                      'user_b',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if (_model.chatExists2
                                                              ?.reference !=
                                                          null) {
                                                        context.pushNamed(
                                                          'chatMessages',
                                                          queryParameters: {
                                                            'chatUser':
                                                                serializeParam(
                                                              _model.chatExists2
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'userRef':
                                                                serializeParam(
                                                              currentUserReference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        var chatsRecordReference =
                                                            ChatsRecord
                                                                .collection
                                                                .doc();
                                                        await chatsRecordReference
                                                            .set(
                                                                createChatsRecordData(
                                                          user:
                                                              currentUserReference,
                                                          userA:
                                                              currentUserReference,
                                                          userB:
                                                              containerUsersRecord
                                                                  .reference,
                                                          image:
                                                              containerUsersRecord
                                                                  .photoUrl,
                                                        ));
                                                        _model.newChat = ChatsRecord
                                                            .getDocumentFromData(
                                                                createChatsRecordData(
                                                                  user:
                                                                      currentUserReference,
                                                                  userA:
                                                                      currentUserReference,
                                                                  userB: containerUsersRecord
                                                                      .reference,
                                                                  image: containerUsersRecord
                                                                      .photoUrl,
                                                                ),
                                                                chatsRecordReference);

                                                        context.pushNamed(
                                                          'chatMessages',
                                                          queryParameters: {
                                                            'chatUser':
                                                                serializeParam(
                                                              _model.newChat
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'userRef':
                                                                serializeParam(
                                                              containerUsersRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    }

                                                    Navigator.pop(context);

                                                    setState(() {});
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (containerUsersRecord
                                                                      .photoUrl !=
                                                                  '') {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  containerUsersRecord
                                                                      .photoUrl,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xFFFCEEFF),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${String.fromCharCode(containerUsersRecord.firstName.runes.first)}${String.fromCharCode(containerUsersRecord.lastName.runes.first)}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Figtree',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              1.2,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Flexible(
                                                        child: Wrap(
                                                          spacing: 0.0,
                                                          runSpacing: 0.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Wrap(
                                                                  spacing: 0.0,
                                                                  runSpacing:
                                                                      0.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: [
                                                                    Text(
                                                                      '${containerUsersRecord.firstName} ${containerUsersRecord.lastName}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Figtree',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    if (containerUsersRecord
                                                                        .isAdmin)
                                                                      const Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .verified,
                                                                          color:
                                                                              Color(0xFF52A7FB),
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if ((containerUsersRecord.location !=
                                                                                null) &&
                                                                            (currentUserDocument?.location !=
                                                                                null))
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/location_fill.png',
                                                                                width: 20.0,
                                                                                height: 20.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if ((containerUsersRecord.location !=
                                                                                null) &&
                                                                            (currentUserDocument?.location !=
                                                                                null))
                                                                          Text(
                                                                            '${valueOrDefault<String>(
                                                                              functions.calculateDistanceBetweenUsers(currentUserDocument!.location!, containerUsersRecord.location!),
                                                                              '0',
                                                                            )} from you',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Figtree',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (containerUsersRecord
                                                                            .locationName !=
                                                                        '')
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      containerUsersRecord.locationName,
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
                                                                  ),
                                                              ].divide(const SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
