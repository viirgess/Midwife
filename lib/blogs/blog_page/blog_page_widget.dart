import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/blogs/blogs_component/bookmark_container/bookmark_container_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'blog_page_model.dart';
export 'blog_page_model.dart';

class BlogPageWidget extends StatefulWidget {
  const BlogPageWidget({super.key});

  @override
  State<BlogPageWidget> createState() => _BlogPageWidgetState();
}

class _BlogPageWidgetState extends State<BlogPageWidget> {
  late BlogPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogPageModel());

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
          title: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.chevron_left_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Blogs',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Figtree',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'selectedBlogs',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.bookmarkContainerModel,
                      updateCallback: () => setState(() {}),
                      child: const BookmarkContainerWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.allClicked = !_model.allClicked;
                          _model.trimesterOne = false;
                          _model.trimesterTwo = false;
                          _model.trimesterThree = false;
                          _model.trimesterFour = false;
                          setState(() {});
                        },
                        text: 'All',
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 10.0, 16.0, 10.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            () {
                              if (_model.allClicked == false) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else if (_model.allClicked == true) {
                                return const Color(0xFFF6F1FF);
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Figtree',
                                    color: valueOrDefault<Color>(
                                      () {
                                        if (_model.allClicked == false) {
                                          return const Color(0xFF9183A2);
                                        } else if (_model.allClicked == true) {
                                          return const Color(0xFFA07EFF);
                                        } else {
                                          return const Color(0xFF9183A2);
                                        }
                                      }(),
                                      const Color(0xFF9183A2),
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              () {
                                if (_model.allClicked == false) {
                                  return FlutterFlowTheme.of(context)
                                      .primaryBackground;
                                } else if (_model.allClicked == true) {
                                  return const Color(0xFFF6F1FF);
                                } else {
                                  return const Color(0xFF9183A2);
                                }
                              }(),
                              const Color(0xFF9183A2),
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.trimesterOne = true;
                          _model.allClicked = false;
                          _model.trimesterTwo = false;
                          _model.trimesterThree = false;
                          _model.trimesterFour = false;
                          setState(() {});
                        },
                        text: 'Trimester 1',
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 10.0, 16.0, 10.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            () {
                              if (_model.trimesterOne == false) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else if (_model.trimesterOne == true) {
                                return const Color(0xFFF6F1FF);
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Figtree',
                                color: valueOrDefault<Color>(
                                  () {
                                    if (_model.trimesterOne == false) {
                                      return const Color(0xFF9183A2);
                                    } else if (_model.trimesterOne == true) {
                                      return const Color(0xFFA07EFF);
                                    } else {
                                      return const Color(0xFF9183A2);
                                    }
                                  }(),
                                  const Color(0xFF9183A2),
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              () {
                                if (_model.trimesterOne == false) {
                                  return FlutterFlowTheme.of(context)
                                      .primaryBackground;
                                } else if (_model.trimesterOne == true) {
                                  return const Color(0xFFF6F1FF);
                                } else {
                                  return const Color(0xFF9183A2);
                                }
                              }(),
                              const Color(0xFF9183A2),
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.trimesterTwo = true;
                          _model.allClicked = false;
                          _model.trimesterOne = false;
                          _model.trimesterThree = false;
                          _model.trimesterFour = false;
                          setState(() {});
                        },
                        text: 'Trimester 2',
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 10.0, 16.0, 10.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            () {
                              if (_model.trimesterTwo == false) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else if (_model.trimesterTwo == true) {
                                return const Color(0xFFF6F1FF);
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Figtree',
                                color: valueOrDefault<Color>(
                                  () {
                                    if (_model.trimesterTwo == false) {
                                      return const Color(0xFF9183A2);
                                    } else if (_model.trimesterTwo == true) {
                                      return const Color(0xFFA07EFF);
                                    } else {
                                      return const Color(0xFF9183A2);
                                    }
                                  }(),
                                  const Color(0xFF9183A2),
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              () {
                                if (_model.trimesterTwo == false) {
                                  return FlutterFlowTheme.of(context)
                                      .primaryBackground;
                                } else if (_model.trimesterTwo == true) {
                                  return const Color(0xFFF6F1FF);
                                } else {
                                  return const Color(0xFF9183A2);
                                }
                              }(),
                              const Color(0xFF9183A2),
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.trimesterThree = true;
                          _model.allClicked = false;
                          _model.trimesterOne = false;
                          _model.trimesterTwo = false;
                          _model.trimesterFour = false;
                          setState(() {});
                        },
                        text: 'Trimester 3',
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 10.0, 16.0, 10.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            () {
                              if (_model.trimesterThree == false) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else if (_model.trimesterThree == true) {
                                return const Color(0xFFF6F1FF);
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Figtree',
                                color: valueOrDefault<Color>(
                                  () {
                                    if (_model.trimesterThree == false) {
                                      return const Color(0xFF9183A2);
                                    } else if (_model.trimesterThree == true) {
                                      return const Color(0xFFA07EFF);
                                    } else {
                                      return const Color(0xFF9183A2);
                                    }
                                  }(),
                                  const Color(0xFF9183A2),
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              () {
                                if (_model.trimesterThree == false) {
                                  return FlutterFlowTheme.of(context)
                                      .primaryBackground;
                                } else if (_model.trimesterThree == true) {
                                  return const Color(0xFFF6F1FF);
                                } else {
                                  return const Color(0xFF9183A2);
                                }
                              }(),
                              const Color(0xFF9183A2),
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.trimesterFour = true;
                          _model.allClicked = false;
                          _model.trimesterOne = false;
                          _model.trimesterTwo = false;
                          _model.trimesterThree = false;
                          setState(() {});
                        },
                        text: 'Trimester 4',
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 10.0, 16.0, 10.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            () {
                              if (_model.trimesterFour == false) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else if (_model.trimesterFour == true) {
                                return const Color(0xFFF6F1FF);
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Figtree',
                                color: valueOrDefault<Color>(
                                  () {
                                    if (_model.trimesterFour == false) {
                                      return const Color(0xFF9183A2);
                                    } else if (_model.trimesterFour == true) {
                                      return const Color(0xFFA07EFF);
                                    } else {
                                      return const Color(0xFF9183A2);
                                    }
                                  }(),
                                  const Color(0xFF9183A2),
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              () {
                                if (_model.trimesterFour == false) {
                                  return FlutterFlowTheme.of(context)
                                      .primaryBackground;
                                } else if (_model.trimesterFour == true) {
                                  return const Color(0xFFF6F1FF);
                                } else {
                                  return const Color(0xFF9183A2);
                                }
                              }(),
                              const Color(0xFF9183A2),
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                child: StreamBuilder<List<BlogsRecord>>(
                  stream: queryBlogsRecord(
                    queryBuilder: (blogsRecord) => blogsRecord.where(
                      'trimester',
                      isEqualTo: () {
                        if (_model.trimesterOne == true) {
                          return 1;
                        } else if (_model.trimesterTwo == true) {
                          return 2;
                        } else if (_model.trimesterThree == true) {
                          return 3;
                        } else if (_model.trimesterFour == true) {
                          return 4;
                        } else {
                          return null;
                        }
                      }(),
                    ).orderBy('date'),
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
                    List<BlogsRecord> listViewBlogsRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewBlogsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewBlogsRecord =
                            listViewBlogsRecordList[listViewIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.additionalSection =
                                  await queryAdditionalSectionRecordOnce(
                                parent: listViewBlogsRecord.reference,
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              context.goNamed(
                                'articlePage',
                                queryParameters: {
                                  'blog': serializeParam(
                                    listViewBlogsRecord,
                                    ParamType.Document,
                                  ),
                                  'additionalSection': serializeParam(
                                    _model.additionalSection,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'blog': listViewBlogsRecord,
                                  'additionalSection': _model.additionalSection,
                                },
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 27.0,
                                    color: Color(0x38B5A4CB),
                                    offset: Offset(
                                      0.0,
                                      4.0,
                                    ),
                                    spreadRadius: 0.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/302/600',
                                          width: double.infinity,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          listViewBlogsRecord.mainTitle,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                color: const Color(0xFF242224),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '${dateTimeFormat(
                                                'yMd',
                                                listViewBlogsRecord.date,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}  •  ${listViewBlogsRecord.timeOfReading} min read',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        if ((currentUserDocument?.blogs
                                                        .toList() ??
                                                    [])
                                                .contains(listViewBlogsRecord
                                                    .reference) ==
                                            true)
                                          AuthUserStreamWidget(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'blogs': FieldValue
                                                          .arrayRemove([
                                                        listViewBlogsRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/bookmark-bold.svg',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((currentUserDocument?.blogs
                                                        .toList() ??
                                                    [])
                                                .contains(listViewBlogsRecord
                                                    .reference) ==
                                            false)
                                          AuthUserStreamWidget(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'blogs': FieldValue
                                                          .arrayUnion([
                                                        listViewBlogsRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/bookmark-stroke.svg',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.fill,
                                                ),
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
                        );
                      },
                    );
                  },
                ),
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
