import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'ask_baby_born_date_model.dart';
export 'ask_baby_born_date_model.dart';

class AskBabyBornDateWidget extends StatefulWidget {
  const AskBabyBornDateWidget({super.key});

  @override
  State<AskBabyBornDateWidget> createState() => _AskBabyBornDateWidgetState();
}

class _AskBabyBornDateWidgetState extends State<AskBabyBornDateWidget> {
  late AskBabyBornDateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AskBabyBornDateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.babyBornDate = currentUserDocument?.calculatedDate;
      setState(() {});
      FFAppState().babyBirthDate = _model.babyBornDate;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
                  child: Container(
                    width: 70.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent4,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                Text(
                  'Enter the baby\'s date of birth',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                              behavior: const MaterialScrollBehavior().copyWith(
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.stylus,
                                  PointerDeviceKind.unknown
                                },
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                letterSpacing: 0.0,
                                              ),
                                    ),
                                  ),
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    minimumDate: DateTime(1900),
                                    initialDateTime:
                                        (_model.babyBornDate ?? DateTime.now()),
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
                        _model.babyBornDate = _model.datePicked;
                        setState(() {});
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
                            Text(
                              dateTimeFormat(
                                'dd.MM.yyyy',
                                _model.babyBornDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    letterSpacing: 0.0,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.datePicked != null) {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          calculatedDate: _model.datePicked,
                        ));
                        _model.babyBornDate =
                            currentUserDocument?.calculatedDate;
                        setState(() {});
                        FFAppState().babyBirthDate = _model.babyBornDate;
                        setState(() {});
                      }
                      Navigator.pop(context);
                    },
                    text: 'Save',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 14.0, 24.0, 14.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Skip',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 14.0, 24.0, 14.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Figtree',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
