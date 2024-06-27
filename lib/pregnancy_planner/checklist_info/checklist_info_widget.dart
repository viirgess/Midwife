import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'checklist_info_model.dart';
export 'checklist_info_model.dart';

class ChecklistInfoWidget extends StatefulWidget {
  const ChecklistInfoWidget({super.key});

  @override
  State<ChecklistInfoWidget> createState() => _ChecklistInfoWidgetState();
}

class _ChecklistInfoWidgetState extends State<ChecklistInfoWidget> {
  late ChecklistInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChecklistInfoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              mainAxisSize: MainAxisSize.min,
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
                Container(
                  width: 92.0,
                  height: 92.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customColor1,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).tertiary,
                      width: 1.0,
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: SvgPicture.asset(
                        'assets/images/list_icon.svg',
                        width: 36.0,
                        height: 36.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Welkom bij de Zwangerschap Checklisten van de Mama Mentor!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Figtree',
                          color: FlutterFlowTheme.of(context).textColor,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Gefeliciteerd met je zwangerschap! Deze tijd kan overweldigend zijn, en om je te helpen je voor te bereiden op de komst van jullie kleine hebben we deze handige checklisten samengesteld.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.4,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Het doel van deze checklisten is om jou te voorzien van een overzicht met essentiële items en taken die je tijdig kunt regelen tijdens je zwangerschap.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.4,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Elke checklist is zorgvuldig samengesteld om de belangrijkste aspecten van je zwangerschap te omvatten, van praktische benodigdheden tot belangrijke afspraken en voorbereidingen voor de bevalling. Door de checklisten te volgen, kun je ervoor zorgen dat je alles op tijd thuis hebt en goed voorbereid bent op de komst van je baby.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.4,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'We hopen dat deze checklisten je helpen om je zwangerschap soepeler te laten verlopen, zodat je vol vertrouwen kunt genieten van deze bijzondere tijd. Mocht je nog vragen hebben of meer advies nodig hebben, aarzel dan niet om contact op te nemen met onze Mama Mentor community.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.4,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Veel plezier met het voorbereiden op de komst van jullie nieuwe gezinslid!',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.4,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 50.0),
                    child: Text(
                      'Met warme groeten, \nHet Mama Mentor Team',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            color: FlutterFlowTheme.of(context).textColor,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.4,
                          ),
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
