import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_app_bar/back_app_bar_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/name_list/liked_names/liked_names_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'name_list_page_model.dart';
export 'name_list_page_model.dart';

class NameListPageWidget extends StatefulWidget {
  const NameListPageWidget({super.key});

  @override
  State<NameListPageWidget> createState() => _NameListPageWidgetState();
}

class _NameListPageWidgetState extends State<NameListPageWidget> {
  late NameListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NameListPageModel());

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              wrapWithModel(
                model: _model.backAppBarModel,
                updateCallback: () => setState(() {}),
                child: const BackAppBarWidget(),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.girlChosen = false;
                        });
                      },
                      child: Text(
                        'boys',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.girlChosen = true;
                        });
                      },
                      child: Text(
                        'girls ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
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
                                  child: const LikedNamesWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<NameListRecord>>(
                stream: queryNameListRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<NameListRecord> stackNameListRecordList = snapshot.data!;
                  return Stack(
                    children: List.generate(stackNameListRecordList.length,
                        (stackIndex) {
                      final stackNameListRecord =
                          stackNameListRecordList[stackIndex];
                      return Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: () {
                            if (_model.girlChosen == true) {
                              return FlutterFlowTheme.of(context).error;
                            } else if (_model.girlChosen == false) {
                              return const Color(0xFF2C70C0);
                            } else {
                              return (stackNameListRecord.hasGirls()
                                  ? FlutterFlowTheme.of(context).error
                                  : const Color(0xFF2C70C0));
                            }
                          }(),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              () {
                                if (_model.girlChosen == true) {
                                  return stackNameListRecord
                                      .girls[_model.loopGirl];
                                } else if (_model.girlChosen == false) {
                                  return stackNameListRecord
                                      .boys[_model.loopBoy];
                                } else {
                                  return (functions.mixTwoLists(
                                      stackNameListRecord.girls.toList(),
                                      stackNameListRecord.boys
                                          .toList())?[_model.loopCommon]);
                                }
                              }(),
                              'name',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StreamBuilder<List<NameListRecord>>(
                    stream: queryNameListRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<NameListRecord> iconButtonNameListRecordList =
                          snapshot.data!;
                      return FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.favorite,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'liked_names': FieldValue.arrayUnion([
                                  () {
                                    if (_model.girlChosen == true) {
                                      return iconButtonNameListRecordList[0]
                                          .girls[_model.loopGirl];
                                    } else if (_model.girlChosen == false) {
                                      return iconButtonNameListRecordList[0]
                                          .boys[_model.loopBoy];
                                    } else {
                                      return iconButtonNameListRecordList[0]
                                          .boys[_model.loopGirl];
                                    }
                                  }()
                                ]),
                              },
                            ),
                          });
                          if (_model.girlChosen == true) {
                            setState(() {
                              _model.loopGirl = _model.loopGirl + 1;
                            });
                          } else if (_model.girlChosen == false) {
                            setState(() {
                              _model.loopBoy = _model.loopBoy + 1;
                            });
                          } else {
                            setState(() {
                              _model.loopCommon = _model.loopCommon + 1;
                            });
                          }
                        },
                      );
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.redo_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (_model.girlChosen == true) {
                        setState(() {
                          _model.loopGirl = _model.loopGirl + -1;
                        });
                      } else if (_model.girlChosen == false) {
                        setState(() {
                          _model.loopBoy = _model.loopBoy + -1;
                        });
                      } else {
                        setState(() {
                          _model.loopCommon = _model.loopCommon + -1;
                        });
                      }
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.close_outlined,
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (_model.girlChosen == true) {
                        setState(() {
                          _model.loopGirl = _model.loopGirl + 1;
                        });
                      } else if (_model.girlChosen == false) {
                        setState(() {
                          _model.loopBoy = _model.loopBoy + 1;
                        });
                      } else {
                        setState(() {
                          _model.loopCommon = _model.loopCommon + 1;
                        });
                      }
                    },
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: const NavBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
