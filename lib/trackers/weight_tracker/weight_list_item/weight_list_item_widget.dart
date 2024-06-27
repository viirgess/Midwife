import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'weight_list_item_model.dart';
export 'weight_list_item_model.dart';

class WeightListItemWidget extends StatefulWidget {
  const WeightListItemWidget({
    super.key,
    required this.date,
    this.weight,
    this.difference,
    this.week,
    required this.isBaby,
    required this.isHeight,
  });

  final String? date;
  final double? weight;
  final double? difference;
  final DateTime? week;
  final bool? isBaby;
  final bool? isHeight;

  @override
  State<WeightListItemWidget> createState() => _WeightListItemWidgetState();
}

class _WeightListItemWidgetState extends State<WeightListItemWidget> {
  late WeightListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeightListItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x39B5A4CB),
            offset: Offset(
              0.0,
              2.0,
            ),
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
            Expanded(
              child: Text(
                widget.date!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Figtree',
                      color: FlutterFlowTheme.of(context).alternate,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  '${widget.weight?.toString()}${widget.isHeight! ? ' cm' : ' kg'}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.difference! > 0.0)
                    Text(
                      '+',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            color: () {
                              if (widget.difference! > 0.0) {
                                return FlutterFlowTheme.of(context).secondary;
                              } else if (widget.difference! < 0.0) {
                                return const Color(0xFFFF4466);
                              } else {
                                return FlutterFlowTheme.of(context).alternate;
                              }
                            }(),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  Text(
                    '${widget.difference?.toString()}${widget.isHeight! ? ' cm' : ' kg'}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Figtree',
                          color: () {
                            if (widget.difference! > 0.0) {
                              return FlutterFlowTheme.of(context).secondary;
                            } else if (widget.difference! < 0.0) {
                              return const Color(0xFFFF4466);
                            } else {
                              return FlutterFlowTheme.of(context).alternate;
                            }
                          }(),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (functions.calculateWeek(
                            currentUserDocument!.calculatedDate!, widget.week) >
                        0) {
                      return Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Text(
                          '${widget.isBaby! ? functions.calculateBabyWeek(currentUserDocument!.calculatedDate!, widget.week!).toString() : functions.calculateWeek(currentUserDocument!.calculatedDate!, widget.week).toString()}w',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Figtree',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      );
                    } else {
                      return Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Text(
                          '02',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
