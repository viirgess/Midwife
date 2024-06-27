import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bottle_feeding_list_item_model.dart';
export 'bottle_feeding_list_item_model.dart';

class BottleFeedingListItemWidget extends StatefulWidget {
  const BottleFeedingListItemWidget({
    super.key,
    required this.bottleFeeding,
  });

  final BottleFeedingStruct? bottleFeeding;

  @override
  State<BottleFeedingListItemWidget> createState() =>
      _BottleFeedingListItemWidgetState();
}

class _BottleFeedingListItemWidgetState
    extends State<BottleFeedingListItemWidget> {
  late BottleFeedingListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottleFeedingListItemModel());

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
                dateTimeFormat(
                          'yMd',
                          widget.bottleFeeding?.date,
                          locale: FFLocalizations.of(context).languageCode,
                        ) ==
                        dateTimeFormat(
                          'yMd',
                          getCurrentTimestamp,
                          locale: FFLocalizations.of(context).languageCode,
                        )
                    ? 'today, ${dateTimeFormat(
                        'H:mm',
                        widget.bottleFeeding?.date,
                        locale: FFLocalizations.of(context).languageCode,
                      )}'
                    : dateTimeFormat(
                        'dd.MM.yy, H:mm',
                        widget.bottleFeeding!.date!,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
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
                alignment: const AlignmentDirectional(-0.5, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.bottleFeeding?.type,
                    '-',
                  ),
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
            Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: Text(
                '${widget.bottleFeeding?.bottleAmount.toString()} ml',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Figtree',
                      color: FlutterFlowTheme.of(context).alternate,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
