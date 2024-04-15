import '/backend/backend.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/components/f_a_q_card/f_a_q_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/notifications/notification_modal_sheet/notification_modal_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'f_a_q_page_model.dart';
export 'f_a_q_page_model.dart';

class FAQPageWidget extends StatefulWidget {
  const FAQPageWidget({super.key});

  @override
  State<FAQPageWidget> createState() => _FAQPageWidgetState();
}

class _FAQPageWidgetState extends State<FAQPageWidget> {
  late FAQPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FAQPageModel());

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
        drawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.65,
          child: Drawer(
            child: WebViewAware(
              child: wrapWithModel(
                model: _model.drawerDataModel,
                updateCallback: () => setState(() {}),
                child: const DrawerDataWidget(),
              ),
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
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        barrierColor: const Color(0x19C67AF5),
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
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
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 58.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'Veelgestelde vragen',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 30.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 300.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'Antwoorden op een rij: vind snel informatie in onze veelgestelde vragen',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                        StreamBuilder<List<FaqRecord>>(
                          stream: queryFaqRecord(),
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
                            List<FaqRecord> columnFaqRecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                  columnFaqRecordList.length, (columnIndex) {
                                final columnFaqRecord =
                                    columnFaqRecordList[columnIndex];
                                return FAQCardWidget(
                                  key: Key(
                                      'Keyq4x_${columnIndex}_of_${columnFaqRecordList.length}'),
                                  title: columnFaqRecord.title,
                                  subtitle: columnFaqRecord.subtitle,
                                  description: columnFaqRecord.description,
                                  footer: columnFaqRecord.footer,
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
      ),
    );
  }
}
