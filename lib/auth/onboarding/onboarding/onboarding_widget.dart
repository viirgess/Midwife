import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({
    super.key,
    this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());

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
        backgroundColor: _model.currentBg,
        body: Visibility(
          visible: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: CarouselSlider(
                        items: [
                          Align(
                            alignment: const AlignmentDirectional(1.0, -0.4),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/onboard_1.png',
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.6,
                                  fit: BoxFit.cover,
                                  alignment: const Alignment(-1.0, 0.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, -0.3),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/onboard_2.png',
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.7,
                                  fit: BoxFit.contain,
                                  alignment: const Alignment(-1.0, -1.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, -0.2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/onboard_3.png',
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                fit: BoxFit.contain,
                                alignment: const Alignment(0.0, 0.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, -0.4),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/onboard_4.png',
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.7,
                                  fit: BoxFit.contain,
                                  alignment: const Alignment(0.0, -1.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                        carouselController: _model.carouselController ??=
                            CarouselController(),
                        options: CarouselOptions(
                          initialPage: 0,
                          viewportFraction: 1.0,
                          disableCenter: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.25,
                          enableInfiniteScroll: false,
                          scrollDirection: Axis.horizontal,
                          autoPlay: false,
                          onPageChanged: (index, _) async {
                            _model.carouselCurrentIndex = index;
                            _model.currentTitle = () {
                              if (_model.carouselCurrentIndex == 0) {
                                return 'Track your baby’s growth week by week';
                              } else if (_model.carouselCurrentIndex == 1) {
                                return 'Join a community of like-minded peopleh';
                              } else if (_model.carouselCurrentIndex == 2) {
                                return 'Get online support from Mama Mentor midwife';
                              } else {
                                return 'Use a variety of tools, articles and courses';
                              }
                            }();
                            _model.currentDescription = () {
                              if (_model.carouselCurrentIndex == 0) {
                                return 'Weekly progress of the baby in 3D and useful tips for each week of your pregnancy';
                              } else if (_model.carouselCurrentIndex == 1) {
                                return 'Participate in discussions, share news, and communicate with friends in private chats';
                              } else if (_model.carouselCurrentIndex == 2) {
                                return 'Have questions about pregnancy? Chat with a certified midwife, or book an online meeting';
                              } else {
                                return 'Mama Mentor AI, Contraction Timer, Baby Names, Blog and many more tools in one place';
                              }
                            }();
                            _model.currentBg = () {
                              if (_model.carouselCurrentIndex == 0) {
                                return FlutterFlowTheme.of(context)
                                    .customColor1;
                              } else if (_model.carouselCurrentIndex == 1) {
                                return const Color(0xFFEBE4FF);
                              } else if (_model.carouselCurrentIndex == 2) {
                                return const Color(0xFFFFE4FF);
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .customColor1;
                              }
                            }();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 50.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Text(
                            _model.currentTitle,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).textColor,
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Text(
                          _model.currentDescription,
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 28.0, 0.0, 28.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  color: _model.carouselCurrentIndex == 0
                                      ? FlutterFlowTheme.of(context).secondary
                                      : const Color(0x1AA07EFF),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  color: _model.carouselCurrentIndex == 1
                                      ? FlutterFlowTheme.of(context).secondary
                                      : const Color(0x1AA07EFF),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  color: _model.carouselCurrentIndex == 2
                                      ? FlutterFlowTheme.of(context).secondary
                                      : const Color(0x1AA07EFF),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  color: _model.carouselCurrentIndex == 3
                                      ? FlutterFlowTheme.of(context).secondary
                                      : const Color(0x1AA07EFF),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    'Login',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                text: 'Sign in',
                                options: FFButtonOptions(
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 14.0, 24.0, 14.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).accent1,
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
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    'Signup',
                                    queryParameters: {
                                      'userRef': serializeParam(
                                        FFAppState().userRef,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                text: 'Get started',
                                options: FFButtonOptions(
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 14.0, 24.0, 14.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
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
                            ),
                          ].divide(const SizedBox(width: 12.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
