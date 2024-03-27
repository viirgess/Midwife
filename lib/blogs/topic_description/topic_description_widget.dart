import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'topic_description_model.dart';
export 'topic_description_model.dart';

class TopicDescriptionWidget extends StatefulWidget {
  const TopicDescriptionWidget({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.topicOne,
    required this.oneDescription,
    required this.topicTwo,
    required this.twoDescription,
    required this.topicThree,
    required this.threeDescription,
    required this.topicFour,
    required this.fourDescription,
    required this.topicFive,
    required this.fiveDescription,
    required this.topicSix,
    required this.sixDescription,
    required this.chapterTitle,
    required this.chapterOne,
    required this.chapterTwo,
    required this.chapterThree,
    required this.referenceSection,
    required this.partOne,
    required this.partOneDescription,
    required this.partTwo,
    required this.partTwoDescription,
    required this.partThree,
    required this.partThreeDescription,
    required this.partFour,
    required this.partFourDescription,
    required this.partFive,
    required this.partFiveDescription,
    required this.partSix,
    required this.partSixDescription,
    required this.partSeven,
    required this.partSevenDescription,
    required this.partEight,
    required this.partEightDescription,
    required this.partNine,
    required this.partNineDescription,
    required this.partTen,
    required this.partTenDescription,
    required this.chapterFour,
    required this.chapterFive,
  });

  final String? title;
  final DateTime? date;
  final String? image;
  final String? topicOne;
  final String? oneDescription;
  final String? topicTwo;
  final String? twoDescription;
  final String? topicThree;
  final String? threeDescription;
  final String? topicFour;
  final String? fourDescription;
  final String? topicFive;
  final String? fiveDescription;
  final String? topicSix;
  final String? sixDescription;
  final String? chapterTitle;
  final String? chapterOne;
  final String? chapterTwo;
  final String? chapterThree;
  final DocumentReference? referenceSection;
  final String? partOne;
  final String? partOneDescription;
  final String? partTwo;
  final String? partTwoDescription;
  final String? partThree;
  final String? partThreeDescription;
  final String? partFour;
  final String? partFourDescription;
  final String? partFive;
  final String? partFiveDescription;
  final String? partSix;
  final String? partSixDescription;
  final String? partSeven;
  final String? partSevenDescription;
  final String? partEight;
  final String? partEightDescription;
  final String? partNine;
  final String? partNineDescription;
  final String? partTen;
  final String? partTenDescription;
  final String? chapterFour;
  final String? chapterFive;

  @override
  State<TopicDescriptionWidget> createState() => _TopicDescriptionWidgetState();
}

class _TopicDescriptionWidgetState extends State<TopicDescriptionWidget> {
  late TopicDescriptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopicDescriptionModel());

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
                        context.safePop();
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.title,
                                '0',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Text(
                            dateTimeFormat('yMMMd', widget.date),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).accent2,
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                widget.image!,
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 3.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.topicOne,
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.oneDescription,
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        if (widget.topicTwo != null && widget.topicTwo != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.topicTwo,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.twoDescription != null &&
                            widget.twoDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.twoDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.topicThree != null &&
                            widget.topicThree != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.topicThree,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.threeDescription != null &&
                            widget.threeDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.threeDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.topicFour != null && widget.topicFour != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.topicFour,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.fourDescription != null &&
                            widget.fourDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.fourDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.topicFive != null && widget.topicFive != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.topicFive,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.fiveDescription != null &&
                            widget.fiveDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.fiveDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.chapterTitle != null &&
                            widget.chapterTitle != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.chapterTitle,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 5.0,
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              if (widget.chapterOne != null &&
                                  widget.chapterOne != '')
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.chapterOne,
                                      '0',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 5.0,
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              if (widget.chapterTwo != null &&
                                  widget.chapterTwo != '')
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.chapterTwo,
                                      '0',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 5.0,
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              if (widget.chapterThree != null &&
                                  widget.chapterThree != '')
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.chapterThree,
                                      '0',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 5.0,
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              if (widget.chapterFour != null &&
                                  widget.chapterFour != '')
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.chapterFour,
                                      '0',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 5.0,
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              if (widget.chapterFive != null &&
                                  widget.chapterFive != '')
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.chapterFive,
                                      '0',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (widget.partOne != null && widget.partOne != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partOne,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.partOneDescription != null &&
                            widget.partOneDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partOneDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partTwo != null && widget.partTwo != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partTwo,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.chapterThree != null &&
                            widget.chapterThree != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partTwoDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partThree != null && widget.partThree != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partThree,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.partThreeDescription != null &&
                            widget.partThreeDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partThreeDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partFour != null && widget.partFour != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partFour,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.chapterThree != null &&
                            widget.chapterThree != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partFourDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partFive != null && widget.partFive != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partFive,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.partFiveDescription != null &&
                            widget.partFiveDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partFiveDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partSix != null && widget.partSix != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partSix,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.partSixDescription != null &&
                            widget.partSixDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partSixDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partSeven != null && widget.partSeven != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partSeven,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.partSevenDescription != null &&
                            widget.partSevenDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partSevenDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partEight != null && widget.partEight != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partEight,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.partEightDescription != null &&
                            widget.partEightDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partEightDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partNine != null && widget.partNine != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partNine,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.partNineDescription != null &&
                            widget.partNineDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partNineDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        if (widget.partTen != null && widget.partTen != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partTen,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        if (widget.partTenDescription != null &&
                            widget.partTenDescription != '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.partTenDescription,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 3.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.topicSix,
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.sixDescription,
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Disclaimer: De informatie in deze blog is bedoeld voor algemene informatiedoeleinden en mag niet worden beschouwd als medisch advies. Hoewel de inhoud met zorg is samengesteld, kunnen wij niet garanderen dat deze volledig, actueel of van toepassing is op uw persoonlijke situatie. Wij adviseren lezers altijd om voor medische vragen en adviezen contact op te nemen met een gekwalificeerde zorgverlener. De auteurs en uitgevers van deze blog zijn niet verantwoordelijk voor eventuele onjuistheden of het gebruik van de informatie.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 10.0,
                                ),
                          ),
                        ),
                      ],
                    ),
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
