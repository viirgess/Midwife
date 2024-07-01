import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
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
            'Privacy Policy',
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bleijerveld',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Juridish advies',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Oremusplein 1\n6815 DN Arnhem\n\nT: 088 400 4800\nE: info@bleijerveldjuridischadvies.nl\nW: www.bleijerveldjuridischadvies.nl\n\nKvK: 62289187\nBtw: NL002279888B73\nIBAN: NL91 INGB 0006 7093 27',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Mama Mentor B.V.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Verwerkersovereenkomst, ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Text(
                              'Jurist: mr. S. Ates\nDatum: 18 juni 2024',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 10.0)),
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
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Text(
                                'Partijen',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Text(
                                'Toepasselijkheid',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'Vertoning, wijziging en gebruik van de applicatie',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Text(
                                'Limited Licence to the App',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Text(
                                'Aansprakelijkheid',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Text(
                                'Registratie voor een Account',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Text(
                                'Opheffen Account',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Text(
                                'Privacy',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'Forum-, rechtskeuze en overdracht van rechten',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              'Algemene (gebruiks)voorwaarden Mama Mentor B.V',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '1. Partijen',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. Mama Mentor: Mama Mentor B.V., geregistreerd bij de Kamer van Koophandel onder nummer 93918542, gevestigd te Nijverdal aan de Johan Frisostraat 12-04 (7442 MB),\n2. Verdere gegevens van Mama Mentor:\nApplicatie: www.mama-mentor.nl\nEmail: info@mama-mentor.nl\nTelefoonnummer: +31 (0)6 11 70 88 10\nBtw-identificatienummer: NL866572892B01\n3. Gebruiker: een natuurlijk persoon die al dan niet handelt in de uitoefening van een bedrijf of beroep, een bezoeker van de applicatie van Mama Mentor;\n4. Account: een door Gebruiker bij Mama Mentor aangevraagde, en door Mama Mentor verleende, mogelijkheid om in te loggen op de applicatie van Mama Mentor.',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '2. Toepasselijkheid',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. Mama Mentor verklaart deze algemene voorwaarden van toepassing op het gebruik van de applicatie en elk aanbod van Mama Mentor en, al dan niet daaruit voortvloeiende, overeenkomsten die Mama Mentor en Gebruiker met elkaar zijn aangegaan. Voor zover de\ninhoud hiervan niet is gewijzigd of er geen specifiekere voorwaarden tussen partijen gelden, zullen deze algemene voorwaarden tevens voor toekomstige verbintenisrechtelijke\nverhoudingen tussen partijen gelden.\n2. Afwijkingen van deze voorwaarden gelden uitsluitend voor zover deze door partijen uitdrukkelijk schriftelijk zijn overeengekomen.\n3. Algemene (inkoop)voorwaarden van Gebruiker worden uitdrukkelijk van de \nhand gewezen.\n4. Derden die door Mama Mentor worden betrokken kunnen zich eveneens op deze algemene voorwaarden beroepen.\n5. Indien een of meer (gedeelte(n)) van de bepalingen van deze algemene voorwaarden nietig zijn, dan wel worden vernietigd, blijven de overige bepalingen van deze algemene\nvoorwaarden van toepassing. Partijen zullen alsdan in overleg treden om ter vervanging van de nietige c.q. vernietigde bepalingen nieuwe regels overeen te komen, waarin zoveel mogelijk doel en strekking van de nietige c.q. vernietigde bepalingen tot uiting zullen komen.\n6. De door deze voorwaarden gereguleerde rechtsverhouding komt tot stand op het moment dat Gebruiker de applicatie van Mama Mentor bezoekt en/of een Account heeft aangemaakt op de applicatie van Mama Mentor, waarbij Gebruiker deze voorwaarden heeft geaccepteerd.\n7. Mama Mentor is geen partij bij de overeenkomst die tussen Gebruiker en derden tot stand komt, tenzij uitdrukkelijk anders vermeld. Geschillen die uit een dergelijke overeenkomst voortvloeien dienen partijen zelf op te lossen. Mama Mentor speelt hierbij geen enkele rol.',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '3. Vertoning, wijziging en gebruik van de applicatie',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. Mama Mentor behoudt zich het recht voor de indeling van de applicatie (incl. zoekopties et cetera) te allen tijde en naar eigen inzicht te wijzigen zonder dat Gebruiker recht heeft op schadevergoeding.\n2. Mama Mentor spant zich ervoor in haar applicatie storingsvrij online te publiceren. Mama Mentor garandeert echter niet dat haar applicatie, storingvrij en/of foutloos wordt gepubliceerd dan wel dat de uitgave te allen tijde toegankelijk is. Mama Mentor is gerechtigd, zonder voorafgaande bekendmaking, de applicatie buiten gebruik te stellen en/of het gebruik ervan te beperken indien zulks naar haar redelijke oordeel noodzakelijk is, \n bijvoorbeeld in het kader van het benodigde onderhoud van de applicatie. Eventueel onderhoud wordt zoveel mogelijk in de nachtelijke uren van 00.00 – 06.00 uitgevoerd.\n3. Indien naar het oordeel van Mama Mentor een gevaar ontstaat voor het functioneren van de computersystemen of het netwerk van Mama Mentor of derden en/of de leveringen van Mama Mentor worden ge- of verhinderd door, maar niet beperkt tot, storingen of uitvallen\nvan internet, de telecommunicatie-infrastructuur, synflood, netwerkaanval, DoS- of DDoSaanvallen, stroomstoringen, binnenlandse onlusten, mobilisatie, oorlog, stremming in het vervoer, staking, uitsluiting, bedrijfsstoornissen, stagnatie in toelevering, brand, overstroming, in- en uitvoerbelemmeringen, worden alle verplichtingen van Mama Mentor opgeschort en is Mama Mentor gerechtigd alle maatregelen te nemen die zij redelijkerwijs nodig acht om dit gevaar/ deze verhindering af te wenden dan wel te voorkomen, zonder dat de Gebruiker enig recht op schadevergoeding heeft. Indien nakoming door overmacht langer dan één maand onmogelijk is of er andere omstandigheden zijn waardoor het voor Mama Mentor onevenredig bezwarend is om aan haar verplichtingen te voldoen, is Mama Mentor bevoegd de overeenkomst door een mededeling aan de Gebruiker en zonder gerechtelijke tussenkomst geheel of gedeeltelijk te ontbinden, zonder dat er in dat geval een verplichting tot schadevergoeding bestaat.',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '4. Aansprakelijkheid',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. Mama Mentor staat niet in voor de juistheid van de op de applicatie weergegeven informatie. Gebruiker erkent dat Mama Mentor niet op de hoogte is van de omstandigheden van de desbetreffende Gebruiker zodat de eventuele adviezen van Mama Mentor enkel kunnen worden gezien als algemene richtlijnen. De informatie op de applicatie van Mama Mentor is alleen beperkt tot zwangerschaps- en postpartuminformatie en dus geen rekening houdt met (andere) medische aspecten. Mama Mentor adviseert Gebruiker met klem om naast haar applicatie ook andere naslagwerken en/of specialistische informatie te raadplegen en deskundigen in te schakelen om de situatie te beoordelen en daaromtrent te adviseren. Mama Mentor raadt de Gebruiker derhalve sterk aan om zich te allen tijde medisch te laten adviseren, althans een specialist c.q. expert op het relevante gebied te raadplegen, tevens strekkende tot de concrete toepassing/gebruik van de informatie van Mama Mentor in de praktijk. Mama Mentor is niet aansprakelijk voor schade als gevolg van (specifieke) omstandigheden en/of het onoordeelkundig gebruik van eventueel door Mama Mentor verstrekte adviezen en/of informatie.\n2. Mama Mentor staat niet in voor de kwaliteit en de kwantiteit van de weergave de informatie en/of teksten op de applicatie.\n3. Mama Mentor is op geen enkele wijze aansprakelijk voor de inhoud van teksten en/of informatie inclusief foto- en/of ander beeldmateriaal en modellen.\n4. Mama Mentor is op geen enkele wijze aansprakelijk voor enige schade die voortvloeit uit het (tijdelijk) niet beschikbaar zijn van de applicatie en/of informatie inclusief foto- en/of ander beeldmateriaal en modellen.\n5. Mama Mentor is op geen enkele wijze aansprakelijk voor enige schade als gevolg van malware of andere virussen.\n6. Mama Mentor is bij eventuele tekortkomingen in de nakoming van de overeenkomst aan haar zijde uitsluitend slechts verplicht de teksten aan te passen, zonder daarbij gehouden te zijn tot het voldoen van een schadevergoeding aan Gebruiker.\n7. Mocht Mama Mentor jegens Gebruiker aansprakelijk zijn, dan is deze aansprakelijkheid te allen tijde beperkt tot het bedrag waarop de door Mama Mentor gesloten beroeps- of bedrijfsaansprakelijkheidsverzekering aanspraak geeft, maar te allen tijde (ook als er geen verzekering is waarop een aanspraak kan worden gemaakt) tot een maximum van EUR. 5.000,- per voorval. Indien voorvallen gelijktijdig plaatsvinden, elkaar veroorzaken of anderszins met elkaar verbandhouden wordt dit beschouwd als één voorval.\n8. Aansprakelijkheid van Mama Mentor reikt te allen tijde niet tot gevolgschade en behoudens opzet of grove schuld eveneens niet tot zaakschade, immateriële schade of gederfde winst.\n9. Mama Mentor staat niet in voor uitlatingen, handelingen of prestaties van Gebruikers en/of derden, al dan niet middels haar applicatie. Mama Mentor biedt derhalve geen garanties voor de kwantiteit of kwaliteit van de leveringen (producten of diensten) van derden. Alle aanspraken en andere geschillen dienen zij onderling op te lossen.\n10. De applicatie van Mama Mentor kan eventuele urls/links bevatten naar applicaties van derden. Deze doorverwijzingsmogelijkheden worden geboden als faciliteit en hebben niet de kwalificatie van aanbeveling door Mama Mentor. Mama Mentor is op geen enkele wijze aansprakelijk voor de content van de gelinkte applicaties of voor het handelen en nalaten van deze derden. ',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '5. Registratie voor een Account',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. De Gebruiker kan een Account aanvragen door het online registratieformulier volledig in te vullen en te versturen naar Mama Mentor of door de applicatie in de betreffende (app)store te downloaden.\n2. Het is Gebruiker niet toegestaan een Account aan te maken en gebruik te maken van de diensten van Mama Mentor zolang hij of zij minderjarig is en daarvoor geen toestemming heeft gekregen van zijn of haar ouders of wettelijke vertegenwoordigers.\n3. Het is Gebruiker alleen toegestaan om zelf een persoonlijke Account aan te maken of door een derde met autorisatie van Gebruiker.\n4. Bij het aanmaken van een Account is het niet toegestaan om een naam te kiezen die een [url] of een gedeelte van een [url] bevat.\n5. Elke Account dient de identiteit van Gebruiker te beschrijven. Gevraagde gegevens dienen naar waarheid te worden ingevuld. Gebruiker mag derhalve geen fictieve personage creëren of een andere identiteit vertegenwoordigen.\n6. Het is niet toegestaan om inloggegevens aan derden te verstrekken. Het is niet toegestaan om inloggegevens van derden te gebruiken voor het afnemen van aangeboden goederen en diensten. Gebruiker is verantwoordelijk voor elk gebruik/handelen dat, al dan niet met toestemming van Gebruiker, via het Account van Gebruiker wordt gebezigd. Gebruiker is verplicht om al het onbevoegde gebruik van het Account van Gebruiker zo spoedig mogelijk aan Mama Mentor te melden.\n7. Het Account komt tot stand nadat Mama Mentor een wachtwoord en een activatiecode heeft toegestuurd naar het door de Gebruiker opgegeven e-mailadres waarmee de Gebruiker zijn Account kan activeren.\n8. Mama Mentor behoudt zich het recht voor een aanvraag voor een Account te weigeren of het Account na registratie weer op te heffen, bijvoorbeeld bij schending van de huisregels van Mama Mentor door Gebruiker.\n9. De inloggegevens zijn strikt persoonlijk en mogen niet aan derden ter beschikking worden gesteld. De Gebruiker staat in voor het gebruik dat van zijn inloggegevens wordt gemaakt, ook al gebeurt dat zonder zijn medeweten.\n10. De Gebruiker zal Mama Mentor onmiddellijk waarschuwen als hij vermoedt dat zijn inloggegevens bij een derde bekend zijn of zich anderszins onregelmatigheden voordoen.\n11. Het is de Gebruiker niet toegestaan meer dan één (1) Account aan te vragen of te beheren. Het is de Gebruiker verder niet toegestaan (opnieuw) een Account aan te vragen of te beheren nadat Mama Mentor de aanvraag van een Gebruiker voor een A',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '6. Opheffen Account',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. De Gebruiker kan zijn Account laten opheffen indien hij niet langer van de diensten van Mama Mentor gebruik wenst te maken. De Gebruiker dient dit per e-mail aan Mama Mentor kenbaar te maken onder opgave van zijn inloggegevens.\n2. Mama Mentor heeft het recht het Account van de Gebruiker op te heffen indien de Gebruiker gedurende twaalf (12) maanden geen gebruik heeft gemaakt van zijn inloggegevens. Daarnaast heeft Mama Mentor het recht om de Account en/of de overeenkomst met Gebruiker met onmiddellijke ingang voor de toekomst door middel van een schriftelijke kennisgeving zonder (nadere) voorafgaande ingebrekestelling en zonder enig recht op schadevergoeding, te ontbinden indien:\na) Aan Gebruiker (al of niet voorlopig) surseance van betaling wordt verleend of Gebruiker in staat van faillissement wordt verklaard, Gebruiker een verzoek tot toepassing van een schuldsaneringsregeling indient of Gebruiker onder curatele of bewind wordt gesteld.\nb) Op enig moment blijkt dat Gebruiker onjuiste informatie heeft verstrekt of Mama Mentor op enig andere wijze heeft misleid, zoals bijvoorbeeld ten aanzien van de identiteit en persoonlijke eigenschappen van Gebruiker.\nc) Gebruiker deze of andere van toepassing zijnde voorwaarden schendt.\n3. Mama Mentor is niet gehouden tot vergoeding van kosten of schade van de Gebruiker in verband met het opheffen van een Account op welke reden dan ook.',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '7. Intellectueel eigendom',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. Alle intellectuele eigendomsaanspraken op de content van de applicatie, zoals afbeeldingen, video’s, teksten, informatie, software, komen toe aan Mama Mentor. Derden mogen zonder de voorafgaande toestemming van de houder van die intellectueel eigendommen deze niet commercieel gebruiken of anderzijds vermenigvuldigen.\n2. Het is Gebruiker niet toegestaan om software in te zetten om gegevens van de applicatie van Mama Mentor te verzamelen en te verwerken.\n3. Het is Gebruiker niet toegestaan om aan Mama Mentor en/of derden ongevraagde post of e-mails, of andere spam, te versturen, ongevraagd telefonisch te benaderen of op enig andere wijze te contacteren met als doel om producten en/of diensten van hemzelf of derden aan te prijzen of te verkopen.\n4. Gebruiker garandeert dat zij de applicatie en alle daarmee samenhangende producten, diensten en bescheiden/documentatie, gebruikt in overeenstemming met alle van toepassing zijnde wet en regelgeving op het gebied van intellectueel eigendom en privacybescherming.\n5. Indien Gebruiker in strijd met dit artikel handelt, verbeurt Mama Mentor een direct en volledig opeisbare boete van EUR. 5.000,- per overtreding en EUR. 500, voor iedere dag of gedeelte daarvan dat deze overtreding voortduurt. De hiervoor genoemde boete laat onverlet de gehoudenheid van Gebruiker tot betaling van een volledige schadevergoeding aan Mama Mentor indien de schade meer mocht belopen dan gemeld boetebedrag.',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '8. Privacy',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. Mama Mentor verwerkt de persoonsgegevens van Gebruiker die nodig zijn voor het in stand houden van de applicatie en het verlenen van diensten aan Gebruiker. Mama Mentor heeft haar privacybeleid nader uitgewerkt in haar verwerkersovereenkomst. De Gebruiker geeft door registratie voor een Account toestemming voor de verwerking van zijn persoonsgegevens zoals beschreven in het verwerkersovereenkomst.\n2. Gebruiker wordt uitdrukkelijk verzocht haar persoonlijke gegevens zoveel mogelijk te beschermen. Mama Mentor verzoekt Gebruiker niet zondermeer iedere persoonlijke informatie, zoals wachtwoorden, kopie van identiteitsbewijzen of IBAN-nummers, aan derden te verstrekken. Gebruiker is zelf verantwoordelijk voor de gevolgen doordat zij gegevens aan derden verstrekt.\n3. Bij het aanmaken van het Account dient Gebruiker akkoord te gaan met de verwerkersovereenkomst. Gebruiker kan op ieder gewenst moment bezwaar maken tegen de verwerking van persoonsgegevens die niet noodzakelijk zijn voor de nakoming van de overeenkomst. Het maken van bezwaar en het daardoor zullen staken van de verwerking door Mama Mentor, geeft Mama Mentor het recht de overeenkomst te ontbinden.\n4. Persoonsgegevens worden nimmer zonder toestemming van Gebruiker aan derden verstrekt. Het is wel mogelijk dat gegevens aan derden worden verstrekt indien en voor zover dit noodzakelijk is voor de uitvoering van deze overeenkomst. Deze gegevens worden door de hier bedoelde derden nooit voor een ander doel gebruikt en na uitvoering van de overeenkomst verwijderd.\n5. Alle gegevens kunnen, nadat zij geanonimiseerd zijn, door Mama Mentor worden gebruikt voor promotie-, trainings- en adviesdoeleinden. Alle gegevens worden na verwijdering, om welke reden dan ook, geanonimiseerd bewaard en als zodanig mogelijk gebruikt. ',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '9. Forum-, rechtskeuze en overdracht van rechten',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '1. Mama Mentor is bevoegd haar rechten en verplichtingen onder deze overeenkomst aan een derde partij over te dragen. Gebruiker is slechts bevoegd haar rechten en plichten aan een derde over te dragen met schriftelijke toestemming van Mama Mentor.\n2. Op deze - en andere tussen partijen gesloten - overeenkomst(en) is uitsluitend Nederlands recht van toepassing, met uitdrukkelijke uitzondering van het Weens Koopverdrag. Mocht in de toekomst tussen partijen een verbintenis ontstaan, anders dan voortvloeiend uit een overeenkomst, dan is op die verbintenis tevens Nederlands recht van toepassing.\n3. In het geval dat uit de overeenkomst tussen partijen een geschil voortvloeit, is de exclusief absoluut bevoegde rechter de rechter in het arrondissement van de gemeente waarin het hoofdkantoor van Mama Mentor gevestigd is. In het geval dat tussen partijen een geschil ontstaan omtrent niet-contractuele verbintenissen is tevens de exclusief absoluut bevoegde rechter de rechter in het arrondissement van de gemeente waarin het hoofdkantoor van Mama Mentor gevestigd is.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 18.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '@ Deze algemene voorwaarden zijn opgesteld door Bleijerveld Juridisch advies',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                  TextSpan(
                                    text:
                                        '   https://bleijerveldjuridischadvies.nl/',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    mouseCursor: SystemMouseCursors.click,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        await launchURL(
                                            'https://bleijerveldjuridischadvies.nl/');
                                      },
                                  )
                                ],
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
                      ],
                    ),
                  ),
                ].addToEnd(const SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
