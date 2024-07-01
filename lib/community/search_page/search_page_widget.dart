import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/community/components/suggested_item/suggested_item_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({
    super.key,
    required this.searchType,
  });

  final String? searchType;

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

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
            widget.searchType == 'topics' ? 'topics' : 'provinces',
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
        body: Stack(
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
                              safeSetState(
                                  () => _model.algoliaSearchResults = null);
                              await GroupsRecord.search(
                                term: _model.textController.text,
                                maxResults: 5,
                              )
                                  .then((r) => _model.algoliaSearchResults = r)
                                  .onError((_, __) =>
                                      _model.algoliaSearchResults = [])
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
                            hintText: widget.searchType == 'topics'
                                ? 'Search a topic..'
                                : 'Search a province..',
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
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if ((_model.textController.text != '') &&
                              (_model.algoliaSearchResults?.length != 0)) {
                            return StreamBuilder<List<GroupsRecord>>(
                              stream: queryGroupsRecord(
                                queryBuilder: (groupsRecord) =>
                                    groupsRecord.where(
                                  'isProvince',
                                  isEqualTo: widget.searchType == 'provinces',
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<GroupsRecord> listView1GroupsRecordList =
                                    snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listView1GroupsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 13.0),
                                  itemBuilder: (context, listView1Index) {
                                    final listView1GroupsRecord =
                                        listView1GroupsRecordList[
                                            listView1Index];
                                    return Visibility(
                                      visible: _model.algoliaSearchResults
                                                  ?.where((e) =>
                                                      e.reference ==
                                                      listView1GroupsRecord
                                                          .reference)
                                                  .toList() !=
                                              null &&
                                          (_model.algoliaSearchResults
                                                  ?.where((e) =>
                                                      e.reference ==
                                                      listView1GroupsRecord
                                                          .reference)
                                                  .toList())!
                                              .isNotEmpty,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<int>(
                                              future: queryPostsRecordCount(
                                                queryBuilder: (postsRecord) =>
                                                    postsRecord.where(
                                                  'group_ref',
                                                  isEqualTo:
                                                      listView1GroupsRecord
                                                          .reference,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int containerCount =
                                                    snapshot.data!;
                                                return Container(
                                                  decoration: const BoxDecoration(),
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
                                                      context.pushNamed(
                                                        'GroupInner',
                                                        queryParameters: {
                                                          'groupRef':
                                                              serializeParam(
                                                            listView1GroupsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: SuggestedItemWidget(
                                                      key: Key(
                                                          'Keyi0e_${listView1Index}_of_${listView1GroupsRecordList.length}'),
                                                      groupImage:
                                                          listView1GroupsRecord
                                                              .imagePreview,
                                                      groupName:
                                                          listView1GroupsRecord
                                                              .name,
                                                      numberOfMembers:
                                                          listView1GroupsRecord
                                                              .members.length,
                                                      numberOfPosts:
                                                          containerCount,
                                                      isUserJoined:
                                                          listView1GroupsRecord
                                                              .members
                                                              .contains(
                                                                  currentUserReference),
                                                      groupRef:
                                                          listView1GroupsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          } else {
                            return AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<GroupsRecord>>(
                                stream: queryGroupsRecord(
                                  queryBuilder: (groupsRecord) => groupsRecord
                                      .where(
                                        'isProvince',
                                        isEqualTo:
                                            widget.searchType == 'provinces',
                                      )
                                      .where(
                                        'sex',
                                        isEqualTo: valueOrDefault<bool>(
                                            currentUserDocument?.sex, false),
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<GroupsRecord> listViewGroupsRecordList =
                                      snapshot.data!;
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewGroupsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 13.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewGroupsRecord =
                                          listViewGroupsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<int>(
                                              future: queryPostsRecordCount(
                                                queryBuilder: (postsRecord) =>
                                                    postsRecord.where(
                                                  'group_ref',
                                                  isEqualTo:
                                                      listViewGroupsRecord
                                                          .reference,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int containerCount =
                                                    snapshot.data!;
                                                return Container(
                                                  decoration: const BoxDecoration(),
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
                                                      context.pushNamed(
                                                        'GroupInner',
                                                        queryParameters: {
                                                          'groupRef':
                                                              serializeParam(
                                                            listViewGroupsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: SuggestedItemWidget(
                                                      key: Key(
                                                          'Keyg6n_${listViewIndex}_of_${listViewGroupsRecordList.length}'),
                                                      groupImage:
                                                          listViewGroupsRecord
                                                              .imagePreview,
                                                      groupName:
                                                          listViewGroupsRecord
                                                              .name,
                                                      numberOfMembers:
                                                          listViewGroupsRecord
                                                              .members.length,
                                                      numberOfPosts:
                                                          containerCount,
                                                      isUserJoined:
                                                          listViewGroupsRecord
                                                              .members
                                                              .contains(
                                                                  currentUserReference),
                                                      groupRef:
                                                          listViewGroupsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
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
                    ].addToEnd(const SizedBox(height: 100.0)),
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
    );
  }
}
