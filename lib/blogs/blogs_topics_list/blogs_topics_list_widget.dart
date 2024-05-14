import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'blogs_topics_list_model.dart';
export 'blogs_topics_list_model.dart';

class BlogsTopicsListWidget extends StatefulWidget {
  const BlogsTopicsListWidget({
    super.key,
    required this.sectionReference,
    required this.title,
    required this.description,
  });

  final DocumentReference? sectionReference;
  final String? title;
  final String? description;

  @override
  State<BlogsTopicsListWidget> createState() => _BlogsTopicsListWidgetState();
}

class _BlogsTopicsListWidgetState extends State<BlogsTopicsListWidget> {
  late BlogsTopicsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogsTopicsListModel());

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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF0F0F0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 6.0, 10.0),
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
                        context.goNamed(
                          'BlogPage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.chevron_left_outlined,
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 32.0,
                      ),
                    ),
                    Icon(
                      Icons.notifications_none,
                      color: FlutterFlowTheme.of(context).accent3,
                      size: 32.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.title != null && widget.title != '')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.title,
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 30.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                Container(
                                  width: 300.0,
                                  decoration: const BoxDecoration(),
                                  child: Visibility(
                                    visible: widget.description != null &&
                                        widget.description != '',
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.description,
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<TopicsRecord>>(
                        stream: queryTopicsRecord(
                          parent: widget.sectionReference,
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
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<TopicsRecord> columnTopicsRecordList =
                              snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                                columnTopicsRecordList.length, (columnIndex) {
                              final columnTopicsRecord =
                                  columnTopicsRecordList[columnIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 18.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0F0F0),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 18.0, 18.0, 18.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (columnTopicsRecord.image != '')
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  columnTopicsRecord.image,
                                                  fit: BoxFit.contain,
                                                  alignment:
                                                      const Alignment(0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (columnTopicsRecord.date != null)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              dateTimeFormat('yMMMd',
                                                  columnTopicsRecord.date!),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        if (widget.title != null &&
                                            widget.title != '')
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              columnTopicsRecord.title,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        if (columnTopicsRecord
                                                    .shortDescription !=
                                                '')
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              columnTopicsRecord
                                                  .shortDescription,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.goNamed(
                                              'TopicDescription',
                                              queryParameters: {
                                                'title': serializeParam(
                                                  columnTopicsRecord.title,
                                                  ParamType.String,
                                                ),
                                                'date': serializeParam(
                                                  columnTopicsRecord.date,
                                                  ParamType.DateTime,
                                                ),
                                                'image': serializeParam(
                                                  columnTopicsRecord.image,
                                                  ParamType.String,
                                                ),
                                                'topicOne': serializeParam(
                                                  columnTopicsRecord.topicOne,
                                                  ParamType.String,
                                                ),
                                                'oneDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .oneDescription,
                                                  ParamType.String,
                                                ),
                                                'topicTwo': serializeParam(
                                                  columnTopicsRecord.topicTwo,
                                                  ParamType.String,
                                                ),
                                                'twoDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .twoDescription,
                                                  ParamType.String,
                                                ),
                                                'topicThree': serializeParam(
                                                  columnTopicsRecord.topicThree,
                                                  ParamType.String,
                                                ),
                                                'threeDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .threeDescription,
                                                  ParamType.String,
                                                ),
                                                'topicFour': serializeParam(
                                                  columnTopicsRecord.topicFour,
                                                  ParamType.String,
                                                ),
                                                'fourDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .fourDescription,
                                                  ParamType.String,
                                                ),
                                                'topicFive': serializeParam(
                                                  columnTopicsRecord.topicFive,
                                                  ParamType.String,
                                                ),
                                                'fiveDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .fiveDescription,
                                                  ParamType.String,
                                                ),
                                                'topicSix': serializeParam(
                                                  columnTopicsRecord.topicSix,
                                                  ParamType.String,
                                                ),
                                                'sixDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .sixDescription,
                                                  ParamType.String,
                                                ),
                                                'chapterTitle': serializeParam(
                                                  columnTopicsRecord
                                                      .chapterTitle,
                                                  ParamType.String,
                                                ),
                                                'chapterOne': serializeParam(
                                                  columnTopicsRecord.chapterOne,
                                                  ParamType.String,
                                                ),
                                                'chapterTwo': serializeParam(
                                                  columnTopicsRecord.chapterTwo,
                                                  ParamType.String,
                                                ),
                                                'chapterThree': serializeParam(
                                                  columnTopicsRecord
                                                      .chapterThree,
                                                  ParamType.String,
                                                ),
                                                'referenceSection':
                                                    serializeParam(
                                                  columnTopicsRecord.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'partOne': serializeParam(
                                                  columnTopicsRecord.partOne,
                                                  ParamType.String,
                                                ),
                                                'partOneDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partOneDescription,
                                                  ParamType.String,
                                                ),
                                                'partTwo': serializeParam(
                                                  columnTopicsRecord.partTwo,
                                                  ParamType.String,
                                                ),
                                                'partTwoDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partTwoDescription,
                                                  ParamType.String,
                                                ),
                                                'partThree': serializeParam(
                                                  columnTopicsRecord.partThree,
                                                  ParamType.String,
                                                ),
                                                'partThreeDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partThreeDescription,
                                                  ParamType.String,
                                                ),
                                                'partFour': serializeParam(
                                                  columnTopicsRecord.partFour,
                                                  ParamType.String,
                                                ),
                                                'partFourDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partFourDescription,
                                                  ParamType.String,
                                                ),
                                                'partFive': serializeParam(
                                                  columnTopicsRecord.partFive,
                                                  ParamType.String,
                                                ),
                                                'partFiveDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partFiveDescription,
                                                  ParamType.String,
                                                ),
                                                'partSix': serializeParam(
                                                  columnTopicsRecord.partSix,
                                                  ParamType.String,
                                                ),
                                                'partSixDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partSixDescription,
                                                  ParamType.String,
                                                ),
                                                'partSeven': serializeParam(
                                                  columnTopicsRecord.partSeven,
                                                  ParamType.String,
                                                ),
                                                'partSevenDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partSevenDescription,
                                                  ParamType.String,
                                                ),
                                                'partEight': serializeParam(
                                                  columnTopicsRecord.partEight,
                                                  ParamType.String,
                                                ),
                                                'partEightDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partEightDescription,
                                                  ParamType.String,
                                                ),
                                                'partNine': serializeParam(
                                                  columnTopicsRecord.partNine,
                                                  ParamType.String,
                                                ),
                                                'partNineDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partNineDescription,
                                                  ParamType.String,
                                                ),
                                                'partTen': serializeParam(
                                                  columnTopicsRecord.partTen,
                                                  ParamType.String,
                                                ),
                                                'partTenDescription':
                                                    serializeParam(
                                                  columnTopicsRecord
                                                      .partTenDescription,
                                                  ParamType.String,
                                                ),
                                                'chapterFour': serializeParam(
                                                  columnTopicsRecord
                                                      .chapterFour,
                                                  ParamType.String,
                                                ),
                                                'chapterFive': serializeParam(
                                                  columnTopicsRecord
                                                      .chapterFive,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              border: Border.all(
                                                color: const Color(0xFF1B1B1B),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 10.0, 5.0),
                                              child: Text(
                                                'Lees blog',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
