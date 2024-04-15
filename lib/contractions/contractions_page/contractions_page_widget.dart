import '/components/back_app_bar/back_app_bar_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'contractions_page_model.dart';
export 'contractions_page_model.dart';

class ContractionsPageWidget extends StatefulWidget {
  const ContractionsPageWidget({super.key});

  @override
  State<ContractionsPageWidget> createState() => _ContractionsPageWidgetState();
}

class _ContractionsPageWidgetState extends State<ContractionsPageWidget> {
  late ContractionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContractionsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.contractionStarted = false;
      });
    });

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
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          'Contractions',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(0.0),
                              ),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Q-ty per hour',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '5',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Avg duration',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '00:52',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(12.0),
                              ),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Avg frequency',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '6:30',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Duration',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Frequency',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((_model.contractionStarted == true) &&
                              (_model.secondContraction == true) &&
                              (_model.thirdContraction == true) &&
                              (_model.forthContraction == true))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dateTimeFormat('Hm', getCurrentTimestamp),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timer6Milliseconds,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timer6Controller,
                                  updateStateInterval:
                                      const Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timer6Milliseconds = value;
                                    _model.timer6Value = displayTime;
                                    if (shouldUpdate) setState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: const CircleBorder(),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '4',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) => setState(
                                          () => _model.ratingBarValue1 =
                                              newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: _model.ratingBarValue1 ??=
                                          3.0,
                                      unratedColor:
                                          FlutterFlowTheme.of(context).accent3,
                                      itemCount: 4,
                                      itemSize: 25.0,
                                      glowColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                    FlutterFlowTimer(
                                      initialTime: _model.timer7Milliseconds,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timer7Controller,
                                      updateStateInterval:
                                          const Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timer7Milliseconds = value;
                                        _model.timer7Value = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if ((_model.contractionStarted == true) &&
                              (_model.secondContraction == true) &&
                              (_model.thirdContraction == true))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dateTimeFormat('Hm', getCurrentTimestamp),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timer444444Milliseconds,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timer444444Controller,
                                  updateStateInterval:
                                      const Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timer444444Milliseconds = value;
                                    _model.timer444444Value = displayTime;
                                    if (shouldUpdate) setState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        '3',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) => setState(
                                          () => _model.ratingBarValue2 =
                                              newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: _model.ratingBarValue2 ??=
                                          3.0,
                                      unratedColor:
                                          FlutterFlowTheme.of(context).accent3,
                                      itemCount: 4,
                                      itemSize: 25.0,
                                      glowColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                    FlutterFlowTimer(
                                      initialTime: _model.timer5Milliseconds,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timer5Controller,
                                      updateStateInterval:
                                          const Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timer5Milliseconds = value;
                                        _model.timer5Value = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if ((_model.contractionStarted == true) &&
                              (_model.secondContraction == true))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dateTimeFormat('Hm', getCurrentTimestamp),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timer3Milliseconds,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timer3Controller,
                                  updateStateInterval:
                                      const Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timer3Milliseconds = value;
                                    _model.timer3Value = displayTime;
                                    if (shouldUpdate) setState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: const CircleBorder(),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) => setState(
                                          () => _model.ratingBarValue3 =
                                              newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: _model.ratingBarValue3 ??=
                                          3.0,
                                      unratedColor:
                                          FlutterFlowTheme.of(context).accent3,
                                      itemCount: 4,
                                      itemSize: 25.0,
                                      glowColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                    FlutterFlowTimer(
                                      initialTime: _model.timer4Milliseconds,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timer4Controller,
                                      updateStateInterval:
                                          const Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timer4Milliseconds = value;
                                        _model.timer4Value = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if (_model.contractionStarted == true)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dateTimeFormat(
                                      'Hm',
                                      DateTime.fromMillisecondsSinceEpoch(
                                          getCurrentTimestamp
                                              .millisecondsSinceEpoch)),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timer1Milliseconds,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timer1Controller,
                                  updateStateInterval:
                                      const Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timer1Milliseconds = value;
                                    _model.timer1Value = displayTime;
                                    if (shouldUpdate) setState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        '1',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) => setState(
                                          () => _model.ratingBarValue4 =
                                              newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: _model.ratingBarValue4 ??=
                                          3.0,
                                      unratedColor:
                                          FlutterFlowTheme.of(context).accent3,
                                      itemCount: 4,
                                      itemSize: 25.0,
                                      glowColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                    FlutterFlowTimer(
                                      initialTime: _model.timer2Milliseconds,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timer2Controller,
                                      updateStateInterval:
                                          const Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timer2Milliseconds = value;
                                        _model.timer2Value = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.filter_1,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              setState(() {
                                _model.contractionStarted = true;
                              });
                              _model.timer1Controller.onStartTimer();
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.filter_2,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.timer1Controller.onStopTimer();
                              setState(() {
                                _model.secondContraction = true;
                              });
                              _model.timer3Controller.onStartTimer();
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.filter_3,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.timer3Controller.onStopTimer();
                              setState(() {
                                _model.thirdContraction = true;
                              });
                              _model.timer444444Controller.onStartTimer();
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.filter_4_sharp,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.timer444444Controller.onStopTimer();
                              setState(() {
                                _model.forthContraction = true;
                              });
                              _model.timer6Controller.onStartTimer();
                            },
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              _model.contractionStarted = true;
                            });
                            _model.timer6Controller.onStartTimer();
                          },
                          text: () {
                            if (_model.contractionStarted == false) {
                              return 'Start Contraction';
                            } else if (_model.contractionStarted == true) {
                              return 'Pause Contraction';
                            } else {
                              return 'null';
                            }
                          }(),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: () {
                              if (_model.contractionStarted == false) {
                                return FlutterFlowTheme.of(context).secondary;
                              } else if (_model.contractionStarted == true) {
                                return const Color(0xFF2C70C0);
                              } else {
                                return FlutterFlowTheme.of(context).success;
                              }
                            }(),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
