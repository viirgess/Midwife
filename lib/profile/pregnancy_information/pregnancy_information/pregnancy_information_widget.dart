import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/pregnancy_information/ask_baby_born/ask_baby_born_widget.dart';
import '/profile/pregnancy_information/ask_back_to_pregnancy/ask_back_to_pregnancy_widget.dart';
import '/profile/pregnancy_information/ask_stop_tracking/ask_stop_tracking_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pregnancy_information_model.dart';
export 'pregnancy_information_model.dart';

class PregnancyInformationWidget extends StatefulWidget {
  const PregnancyInformationWidget({
    super.key,
    required this.isPregnant,
  });

  final bool? isPregnant;

  @override
  State<PregnancyInformationWidget> createState() =>
      _PregnancyInformationWidgetState();
}

class _PregnancyInformationWidgetState
    extends State<PregnancyInformationWidget> {
  late PregnancyInformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PregnancyInformationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isPregnant = widget.isPregnant!;
      setState(() {});
      if (currentUserDocument?.babyGender == null) {
        await currentUserReference!.update(createUsersRecordData(
          babyGender: Gender.DK,
        ));
      }
    });

    _model.switchValue1 =
        valueOrDefault<bool>(currentUserDocument?.babyWasBorn, false);
    _model.switchValue2 = false;
    _model.isPregnantSwitchValue = widget.isPregnant!;
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
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
            'Pregnancy information',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (_model.isPregnant)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          'Pregnancy settings',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'DueDate',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Due date',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        dateTimeFormat(
                                          'MMMM d, yyyy',
                                          currentUserDocument!.calculatedDate!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'BabyGender',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
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
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Baby’s gender',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            () {
                                              if (currentUserDocument
                                                      ?.babyGender ==
                                                  Gender.Girl) {
                                                return 'Baby girl';
                                              } else if (currentUserDocument
                                                      ?.babyGender ==
                                                  Gender.Boy) {
                                                return 'Baby boy';
                                              } else if (currentUserDocument
                                                      ?.babyGender ==
                                                  Gender.Twins) {
                                                return 'I am having twins';
                                              } else {
                                                return 'I don’t know yet';
                                              }
                                            }(),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 24.0,
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
            if (_model.isPregnant)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          'Stop tracking pregnancy',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Figtree',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
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
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'The baby was born!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  height: 28.0,
                                  decoration: const BoxDecoration(),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Switch.adaptive(
                                      value: _model.switchValue1!,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchValue1 = newValue);
                                        if (newValue) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: AskBabyBornWidget(
                                                      switchAction:
                                                          (isBorn) async {
                                                        setState(() {
                                                          _model.switchValue1 =
                                                              isBorn;
                                                        });
                                                      },
                                                      swtch2Action:
                                                          (isPregnant) async {
                                                        setState(() {
                                                          _model.isPregnantSwitchValue =
                                                              isPregnant;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        } else {
                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            babyWasBorn: false,
                                          ));
                                        }
                                      },
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'I\'m not pregnant anymore',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: const Color(0xFFFF4466),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Container(
                                    height: 28.0,
                                    decoration: const BoxDecoration(),
                                    child: Switch.adaptive(
                                      value: _model.switchValue2!,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchValue2 = newValue);
                                        if (newValue) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        AskStopTrackingWidget(
                                                      action: () async {
                                                        await currentUserReference!
                                                            .update(
                                                                createUsersRecordData(
                                                          isPregnant: false,
                                                        ));
                                                        _model.isPregnant =
                                                            false;
                                                        setState(() {});
                                                        setState(() {
                                                          _model.isPregnantSwitchValue =
                                                              false;
                                                        });
                                                      },
                                                      cancelAction: () async {
                                                        setState(() {
                                                          _model.switchValue2 =
                                                              false;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      },
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (!_model.isPregnant)
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
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
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'I’m pregnant',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  height: 28.0,
                                  decoration: const BoxDecoration(),
                                  child: Switch.adaptive(
                                    value: _model.isPregnantSwitchValue!,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .isPregnantSwitchValue = newValue);
                                      if (newValue) {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      AskBackToPregnancyWidget(
                                                    action: () async {
                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        isPregnant: true,
                                                      ));
                                                      _model.isPregnant = true;
                                                      setState(() {});
                                                      setState(() {
                                                        _model.switchValue2 =
                                                            false;
                                                      });
                                                    },
                                                    cancelAction: () async {
                                                      setState(() {
                                                        _model.isPregnantSwitchValue =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Baby\'s date of birth',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet<bool>(
                            context: context,
                            builder: (context) {
                              final datePickedCupertinoTheme =
                                  CupertinoTheme.of(context);
                              return ScrollConfiguration(
                                behavior:
                                    const MaterialScrollBehavior().copyWith(
                                  dragDevices: {
                                    PointerDeviceKind.mouse,
                                    PointerDeviceKind.touch,
                                    PointerDeviceKind.stylus,
                                    PointerDeviceKind.unknown
                                  },
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: CupertinoTheme(
                                    data: datePickedCupertinoTheme.copyWith(
                                      textTheme: datePickedCupertinoTheme
                                          .textTheme
                                          .copyWith(
                                        dateTimePickerTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textColor,
                                                  letterSpacing: 0.0,
                                                ),
                                      ),
                                    ),
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      minimumDate: DateTime(1900),
                                      initialDateTime:
                                          (FFAppState().babyBirthDate ??
                                              DateTime.now()),
                                      maximumDate: DateTime(2050),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      use24hFormat: false,
                                      onDateTimeChanged: (newDateTime) =>
                                          safeSetState(() {
                                        _model.datePicked = newDateTime;
                                      }),
                                    ),
                                  ),
                                ),
                              );
                            });
                        if (_model.datePicked != null) {
                          FFAppState().babyBirthDate = _model.datePicked;
                          setState(() {});

                          await currentUserReference!
                              .update(createUsersRecordData(
                            calculatedDate: _model.datePicked,
                          ));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color(0xFFDFDEEC),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  FFAppState().babyBirthDate != null
                                      ? dateTimeFormat(
                                          'dd.MM.yyyy',
                                          FFAppState().babyBirthDate,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )
                                      : dateTimeFormat(
                                          'dd.MM.yyyy',
                                          currentUserDocument!.calculatedDate!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/calendar_outline.png',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
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
    );
  }
}
