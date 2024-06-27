import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'article_page_model.dart';
export 'article_page_model.dart';

class ArticlePageWidget extends StatefulWidget {
  const ArticlePageWidget({
    super.key,
    required this.blog,
    required this.additionalSection,
  });

  final BlogsRecord? blog;
  final AdditionalSectionRecord? additionalSection;

  @override
  State<ArticlePageWidget> createState() => _ArticlePageWidgetState();
}

class _ArticlePageWidgetState extends State<ArticlePageWidget> {
  late ArticlePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticlePageModel());

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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
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
                      'Artikel',
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Figtree',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Share.share(
                                '',
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/options.svg',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/options.svg',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
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
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                'https://picsum.photos/seed/302/600',
                                width: double.infinity,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.mainTitle,
                                  'title',
                                ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${dateTimeFormat(
                                      'yMMMd',
                                      widget.blog?.date,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}  •  ${widget.blog?.timeOfReading} min read',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 27.0,
                                    color: Color(0x39B5A4CB),
                                    offset: Offset(
                                      0.0,
                                      4.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 6.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'In this article',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              color: const Color(0xFF300A61),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    if ((widget.blog?.titleOne == null ||
                                            widget.blog?.titleOne == '') &&
                                        (widget.blog?.titleTwo != null &&
                                            widget.blog?.titleTwo != '') &&
                                        (widget.blog?.titleThree != null &&
                                            widget.blog?.titleThree != '') &&
                                        (widget.blog?.titleFour != null &&
                                            widget.blog?.titleFour != ''))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Ellipse_26.svg',
                                                  width: 6.0,
                                                  height: 6.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.blog?.mainTitle,
                                                'main',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFFA07EFF),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (widget.blog?.titleOne != null &&
                                        widget.blog?.titleOne != '')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Ellipse_26.svg',
                                                  width: 6.0,
                                                  height: 6.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.blog?.titleOne,
                                                'title_one',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFFA07EFF),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (widget.blog?.titleTwo != null &&
                                        widget.blog?.titleTwo != '')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Ellipse_26.svg',
                                                  width: 6.0,
                                                  height: 6.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.blog?.titleTwo,
                                                'title_two',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFFA07EFF),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (widget.blog?.titleThree != null &&
                                        widget.blog?.titleThree != '')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Ellipse_26.svg',
                                                  width: 6.0,
                                                  height: 6.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.blog?.titleThree,
                                                'title_three',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFFA07EFF),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (widget.blog?.titleFour != null &&
                                        widget.blog?.titleFour != '')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Ellipse_26.svg',
                                                  width: 6.0,
                                                  height: 6.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.blog?.titleFour,
                                                'title_four',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFFA07EFF),
                                                        letterSpacing: 0.0,
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
                          if (widget.blog?.chapterOne != null &&
                              widget.blog?.chapterOne != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.chapterOne,
                                  'chapter one',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF9183A2),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          if (widget.blog?.chapterTwo != null &&
                              widget.blog?.chapterTwo != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.chapterTwo,
                                'chapter two',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleOne != null &&
                              widget.blog?.titleOne != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleOne,
                                  'title_one',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.chapterThree != null &&
                              widget.blog?.chapterThree != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.chapterThree,
                                  'three',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          if (widget.blog?.chapterFour != null &&
                              widget.blog?.chapterFour != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.chapterFour,
                                'two',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.additionalSection?.title != null &&
                              widget.additionalSection?.title != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.additionalSection?.title,
                                  'title',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.additionalSection?.chapter != null &&
                              widget.additionalSection?.chapter != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.chapter,
                                        'ond',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.one != null &&
                              widget.additionalSection?.one != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.one,
                                        'ond',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.two != null &&
                              widget.additionalSection?.two != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.two,
                                        '2',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.three != null &&
                              widget.additionalSection?.three != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.three,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.four != null &&
                              widget.additionalSection?.four != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.four,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.five != null &&
                              widget.additionalSection?.five != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.five,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.six != null &&
                              widget.additionalSection?.six != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.six,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.seven != null &&
                              widget.additionalSection?.seven != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.seven,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.eight != null &&
                              widget.additionalSection?.eight != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.eight,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.nine != null &&
                              widget.additionalSection?.nine != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.nine,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.ten != null &&
                              widget.additionalSection?.ten != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.ten,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.eleven != null &&
                              widget.additionalSection?.eleven != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.eleven,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.twelve != null &&
                              widget.additionalSection?.twelve != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.twelve,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.twelve != null &&
                              widget.additionalSection?.twelve != '')
                            Text(
                              valueOrDefault<String>(
                                widget.additionalSection?.conclusion,
                                '3',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleTwo != null &&
                              widget.blog?.titleTwo != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleTwo,
                                  'title two',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.chapterFive != null &&
                              widget.blog?.chapterFive != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.chapterFive,
                                  'five',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          if (widget.blog?.chapterSix != null &&
                              widget.blog?.chapterSix != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.chapterSix,
                                'four',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleThree != null &&
                              widget.blog?.titleThree != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleThree,
                                  'title three',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.chapterSeven != null &&
                              widget.blog?.chapterSeven != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.chapterSeven,
                                'five',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleFour != null &&
                              widget.blog?.titleFour != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleFour,
                                  'title four',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.chapterEight != null &&
                              widget.blog?.chapterEight != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.chapterEight,
                                'seven',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleFive != null &&
                              widget.blog?.titleFive != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleFive,
                                  'title four',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.fiveA != null &&
                              widget.blog?.fiveA != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.fiveA,
                                'seven',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleSix != null &&
                              widget.blog?.titleSix != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleSix,
                                  'title four',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.sixA != null &&
                              widget.blog?.sixA != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.sixA,
                                'seven',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleSeven != null &&
                              widget.blog?.titleSeven != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleSeven,
                                  'title four',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.sevenA != null &&
                              widget.blog?.sevenA != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.sevenA,
                                'seven',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleEight != null &&
                              widget.blog?.titleEight != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleEight,
                                  'title four',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.eightA != null &&
                              widget.blog?.eightA != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.eightA,
                                'seven',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleNine != null &&
                              widget.blog?.titleNine != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleNine,
                                  'title four',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.nineA != null &&
                              widget.blog?.nineA != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.nineA,
                                'seven',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.blog?.titleTen != null &&
                              widget.blog?.titleTen != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.titleTen,
                                  'title four',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.blog?.tenA != null &&
                              widget.blog?.tenA != '')
                            Text(
                              valueOrDefault<String>(
                                widget.blog?.tenA,
                                'seven',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (widget.additionalSection?.secondTitle != null &&
                              widget.additionalSection?.secondTitle != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.additionalSection?.secondTitle,
                                  'title',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: const Color(0xFF300A61),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          if (widget.additionalSection?.sOne != null &&
                              widget.additionalSection?.sOne != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.sOne,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.sTwo != null &&
                              widget.additionalSection?.sTwo != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.sTwo,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.sThree != null &&
                              widget.additionalSection?.sThree != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.sThree,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.sFour != null &&
                              widget.additionalSection?.sFour != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.sFour,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.sFive != null &&
                              widget.additionalSection?.sFive != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.sFive,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.sSix != null &&
                              widget.additionalSection?.sSix != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.sSix,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.additionalSection?.sSeven != null &&
                              widget.additionalSection?.sSeven != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Ellipse_26.png',
                                        width: 6.0,
                                        height: 6.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.additionalSection?.sSeven,
                                        '3',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.blog?.conclusion != null &&
                              widget.blog?.conclusion != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blog?.conclusion,
                                  'conclusion',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Text(
                              'Misschien iets voor jou',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: const Color(0xFF242224),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          StreamBuilder<List<BlogsRecord>>(
                            stream: queryBlogsRecord(
                              queryBuilder: (blogsRecord) => blogsRecord.where(
                                'trimester',
                                isEqualTo: widget.blog?.trimester,
                              ),
                              limit: 4,
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
                              List<BlogsRecord> rowBlogsRecordList =
                                  snapshot.data!;
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                      rowBlogsRecordList.length, (rowIndex) {
                                    final rowBlogsRecord =
                                        rowBlogsRecordList[rowIndex];
                                    return Flexible(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 12.0, 16.0),
                                        child: Container(
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
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/785/600',
                                                      width: 303.0,
                                                      height: 212.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'Tips voor de bevalling',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color:
                                                              const Color(0xFF242224),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          '${dateTimeFormat(
                                                            'yMd',
                                                            rowBlogsRecord.date,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}  •  ${rowBlogsRecord.timeOfReading} min read',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Figtree',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if ((currentUserDocument
                                                                        ?.blogs
                                                                        .toList() ??
                                                                    [])
                                                                .contains(
                                                                    rowBlogsRecord
                                                                        .reference) ==
                                                            true)
                                                          AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'blogs':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        rowBlogsRecord
                                                                            .reference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/bookmark-bold.svg',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if ((currentUserDocument
                                                                        ?.blogs
                                                                        .toList() ??
                                                                    [])
                                                                .contains(
                                                                    rowBlogsRecord
                                                                        .reference) ==
                                                            false)
                                                          AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'blogs':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        rowBlogsRecord
                                                                            .reference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/bookmark-stroke.svg',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
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
