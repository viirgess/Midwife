import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/calendar_card/calendar_card_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/components/model3_d_card/model3_d_card_widget.dart';
import '/components/week_description_card/week_description_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/notifications/notification_modal_sheet/notification_modal_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pregnancy_calendar_page_model.dart';
export 'pregnancy_calendar_page_model.dart';

class PregnancyCalendarPageWidget extends StatefulWidget {
  const PregnancyCalendarPageWidget({super.key});

  @override
  State<PregnancyCalendarPageWidget> createState() =>
      _PregnancyCalendarPageWidgetState();
}

class _PregnancyCalendarPageWidgetState
    extends State<PregnancyCalendarPageWidget> {
  late PregnancyCalendarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PregnancyCalendarPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.week =
            functions.calculateWeek(currentUserDocument?.calculatedDate);
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
    return StreamBuilder<List<WeeksRecord>>(
      stream: queryWeeksRecord(
        queryBuilder: (weeksRecord) => weeksRecord.where(
          'id',
          isEqualTo: _model.week,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<WeeksRecord> pregnancyCalendarPageWeeksRecordList = snapshot.data!;
        final pregnancyCalendarPageWeeksRecord =
            pregnancyCalendarPageWeeksRecordList.isNotEmpty
                ? pregnancyCalendarPageWeeksRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: wrapWithModel(
                  model: _model.drawerDataModel,
                  updateCallback: () => setState(() {}),
                  child: const DrawerDataWidget(),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('MainPage');
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            barrierColor: const Color(0x19C67AF5),
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const NotificationModalSheetWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Icon(
                          Icons.notifications_none,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'Zwangerschapskalender',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: 300.0,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            'Volg je zwangerschap in 3D en ontvang wekelijkse inzichten',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                wrapWithModel(
                                  model: _model.calendarCardModel,
                                  updateCallback: () => setState(() {}),
                                  child: const CalendarCardWidget(),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    'Your baby looks like:\n\nYou can zoom it',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.model3DCardModel,
                                  updateCallback: () => setState(() {}),
                                  child: Model3DCardWidget(
                                    parameter1:
                                        pregnancyCalendarPageWeeksRecord?.model,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (_model.week! >= 2)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.week =
                                                      _model.week! + -1;
                                                });
                                              },
                                              child: Icon(
                                                Icons.arrow_back,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 24.0,
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                pregnancyCalendarPageWeeksRecord
                                                    ?.title,
                                                'title',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          if (_model.week! <= 41)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.week =
                                                      _model.week! + 1;
                                                });
                                              },
                                              child: Icon(
                                                Icons.east,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 24.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                      wrapWithModel(
                                        model: _model.weekDescriptionCardModel,
                                        updateCallback: () => setState(() {}),
                                        child: WeekDescriptionCardWidget(
                                          parameter1: valueOrDefault<String>(
                                            pregnancyCalendarPageWeeksRecord
                                                ?.firstChapter,
                                            'first',
                                          ),
                                          parameter2: valueOrDefault<String>(
                                            pregnancyCalendarPageWeeksRecord
                                                ?.secondChapter,
                                            'second',
                                          ),
                                          parameter3: valueOrDefault<String>(
                                            pregnancyCalendarPageWeeksRecord
                                                ?.thirdChapter,
                                            'third',
                                          ),
                                          parameter4: valueOrDefault<String>(
                                            pregnancyCalendarPageWeeksRecord
                                                ?.fourthChapter,
                                            'fourth',
                                          ),
                                          parameter5: valueOrDefault<String>(
                                            pregnancyCalendarPageWeeksRecord
                                                ?.fifthChapter,
                                            '0',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
