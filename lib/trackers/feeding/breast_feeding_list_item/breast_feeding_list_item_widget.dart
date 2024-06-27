import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'breast_feeding_list_item_model.dart';
export 'breast_feeding_list_item_model.dart';

class BreastFeedingListItemWidget extends StatefulWidget {
  const BreastFeedingListItemWidget({
    super.key,
    required this.breastFeeding,
  });

  final BreastFeedingStruct? breastFeeding;

  @override
  State<BreastFeedingListItemWidget> createState() =>
      _BreastFeedingListItemWidgetState();
}

class _BreastFeedingListItemWidgetState
    extends State<BreastFeedingListItemWidget> {
  late BreastFeedingListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreastFeedingListItemModel());

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
                          widget.breastFeeding?.startDate,
                          locale: FFLocalizations.of(context).languageCode,
                        ) ==
                        dateTimeFormat(
                          'yMd',
                          getCurrentTimestamp,
                          locale: FFLocalizations.of(context).languageCode,
                        )
                    ? 'today, ${dateTimeFormat(
                        'H:mm',
                        widget.breastFeeding?.startDate,
                        locale: FFLocalizations.of(context).languageCode,
                      )}'
                    : dateTimeFormat(
                        'dd.MM.yy, H:mm',
                        widget.breastFeeding!.startDate!,
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
                  widget.breastFeeding!.firstBreast ? 'R / L' : 'L / R',
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
                functions.convertMs(valueOrDefault<int>(
                  widget.breastFeeding?.totalDuration,
                  0,
                )),
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
