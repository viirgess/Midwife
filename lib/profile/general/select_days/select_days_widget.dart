import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'select_days_model.dart';
export 'select_days_model.dart';

class SelectDaysWidget extends StatefulWidget {
  const SelectDaysWidget({super.key});

  @override
  State<SelectDaysWidget> createState() => _SelectDaysWidgetState();
}

class _SelectDaysWidgetState extends State<SelectDaysWidget> {
  late SelectDaysModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDaysModel());

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
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 8.0),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Text(
                    'Select days',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Figtree',
                          color: FlutterFlowTheme.of(context).alternate,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Monday',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 24.0,
                            height: 22.0,
                            decoration: const BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: const Color(0xFFDFDEEC),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue1 ??=
                                      (currentUserDocument?.reminderDaysOfWeek
                                                  .toList() ??
                                              [])
                                          .contains('monday'),
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue1 = newValue!);
                                    if (newValue!) {
                                      FFAppState()
                                          .addToReminderDaysOfWeek('monday');
                                      setState(() {});
                                    } else {
                                      FFAppState().removeFromReminderDaysOfWeek(
                                          'monday');
                                      setState(() {});
                                    }
                                  },
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFDFDEEC),
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  checkColor: FlutterFlowTheme.of(context)
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tuesday',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 24.0,
                            height: 22.0,
                            decoration: const BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: const Color(0xFFDFDEEC),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue2 ??=
                                      (currentUserDocument?.reminderDaysOfWeek
                                                  .toList() ??
                                              [])
                                          .contains('tuesday'),
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue2 = newValue!);
                                    if (newValue!) {
                                      FFAppState()
                                          .addToReminderDaysOfWeek('tuesday');
                                      setState(() {});
                                    } else {
                                      FFAppState().removeFromReminderDaysOfWeek(
                                          'tuesday');
                                      setState(() {});
                                    }
                                  },
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFDFDEEC),
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  checkColor: FlutterFlowTheme.of(context)
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wednesday',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 24.0,
                            height: 22.0,
                            decoration: const BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: const Color(0xFFDFDEEC),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue3 ??=
                                      (currentUserDocument?.reminderDaysOfWeek
                                                  .toList() ??
                                              [])
                                          .contains('wednesday'),
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue3 = newValue!);
                                    if (newValue!) {
                                      FFAppState()
                                          .addToReminderDaysOfWeek('wednesday');
                                      setState(() {});
                                    } else {
                                      FFAppState().removeFromReminderDaysOfWeek(
                                          'wednesday');
                                      setState(() {});
                                    }
                                  },
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFDFDEEC),
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  checkColor: FlutterFlowTheme.of(context)
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Thursday',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 24.0,
                            height: 22.0,
                            decoration: const BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: const Color(0xFFDFDEEC),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue4 ??=
                                      (currentUserDocument?.reminderDaysOfWeek
                                                  .toList() ??
                                              [])
                                          .contains('thursday'),
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue4 = newValue!);
                                    if (newValue!) {
                                      FFAppState()
                                          .addToReminderDaysOfWeek('thursday');
                                      setState(() {});
                                    } else {
                                      FFAppState().removeFromReminderDaysOfWeek(
                                          'thursday');
                                      setState(() {});
                                    }
                                  },
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFDFDEEC),
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  checkColor: FlutterFlowTheme.of(context)
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Friday',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 24.0,
                            height: 22.0,
                            decoration: const BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: const Color(0xFFDFDEEC),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue5 ??=
                                      (currentUserDocument?.reminderDaysOfWeek
                                                  .toList() ??
                                              [])
                                          .contains('friday'),
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue5 = newValue!);
                                    if (newValue!) {
                                      FFAppState()
                                          .addToReminderDaysOfWeek('friday');
                                      setState(() {});
                                    } else {
                                      FFAppState().removeFromReminderDaysOfWeek(
                                          'friday');
                                      setState(() {});
                                    }
                                  },
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFDFDEEC),
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  checkColor: FlutterFlowTheme.of(context)
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Saturday',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 24.0,
                            height: 22.0,
                            decoration: const BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: const Color(0xFFDFDEEC),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue6 ??=
                                      (currentUserDocument?.reminderDaysOfWeek
                                                  .toList() ??
                                              [])
                                          .contains('saturday'),
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue6 = newValue!);
                                    if (newValue!) {
                                      FFAppState()
                                          .addToReminderDaysOfWeek('saturday');
                                      setState(() {});
                                    } else {
                                      FFAppState().removeFromReminderDaysOfWeek(
                                          'saturday');
                                      setState(() {});
                                    }
                                  },
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFDFDEEC),
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  checkColor: FlutterFlowTheme.of(context)
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sunday',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 24.0,
                            height: 22.0,
                            decoration: const BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: const Color(0xFFDFDEEC),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue7 ??=
                                      (currentUserDocument?.reminderDaysOfWeek
                                                  .toList() ??
                                              [])
                                          .contains('sunday'),
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue7 = newValue!);
                                    if (newValue!) {
                                      FFAppState()
                                          .addToReminderDaysOfWeek('sunday');
                                      setState(() {});
                                    } else {
                                      FFAppState().removeFromReminderDaysOfWeek(
                                          'sunday');
                                      setState(() {});
                                    }
                                  },
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFDFDEEC),
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  checkColor: FlutterFlowTheme.of(context)
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'reminderDaysOfWeek':
                                FFAppState().reminderDaysOfWeek,
                          },
                        ),
                      });
                      Navigator.pop(context);
                    },
                    text: 'Apply',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
