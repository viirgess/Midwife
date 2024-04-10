import '/backend/backend.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/components/ebook_card/ebook_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'free_ebook_page_model.dart';
export 'free_ebook_page_model.dart';

class FreeEbookPageWidget extends StatefulWidget {
  const FreeEbookPageWidget({super.key});

  @override
  State<FreeEbookPageWidget> createState() => _FreeEbookPageWidgetState();
}

class _FreeEbookPageWidgetState extends State<FreeEbookPageWidget> {
  late FreeEbookPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreeEbookPageModel());

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
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.65,
          child: Drawer(
            child: WebViewAware(
              child: wrapWithModel(
                model: _model.drawerDataModel,
                updateCallback: () => setState(() {}),
                child: DrawerDataWidget(),
              ),
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.appBarModel,
                    updateCallback: () => setState(() {}),
                    child: AppBarWidget(),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: Column(
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
                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Gratis e-Books',
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
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Text(
                                      'Ontdek en lees: jouw bibliotheek van gratis zwangerschapsebooks',
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                      StreamBuilder<List<EBookRecord>>(
                        stream: queryEBookRecord(),
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
                          List<EBookRecord> columnEBookRecordList =
                              snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                                columnEBookRecordList.length, (columnIndex) {
                              final columnEBookRecord =
                                  columnEBookRecordList[columnIndex];
                              return EbookCardWidget(
                                key: Key(
                                    'Keyv1h_${columnIndex}_of_${columnEBookRecordList.length}'),
                                parameter1: columnEBookRecord.image,
                                parameter2: columnEBookRecord.title,
                                parameter3: columnEBookRecord.shortDescription,
                                parameter4: columnEBookRecord.description,
                                parameter5: columnEBookRecord.link,
                              );
                            }),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 18.0, 18.0, 32.0),
                        child: Text(
                          'De ebooks aangeboden door Midwife Mentor zijn bedoeld als algemene informatieve bronnen over verschillende aspecten van de zwangerschap. Deze publicaties vervangen niet het professioneel medisch advies, de diagnose of behandeling van een gekwalificeerde gezondheidswerker. Raadpleeg altijd uw arts of verloskundige voor persoonlijke adviezen en behandelingen met betrekking tot uw zwangerschap. Het gebruik van de ebooks van Midwife Mentor impliceert uw begrip en acceptatie dat er geen arts-patiënt relatie wordt gevormd door het gebruik van deze materialen.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
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
