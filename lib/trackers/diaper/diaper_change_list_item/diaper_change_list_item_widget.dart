import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'diaper_change_list_item_model.dart';
export 'diaper_change_list_item_model.dart';

class DiaperChangeListItemWidget extends StatefulWidget {
  const DiaperChangeListItemWidget({
    super.key,
    required this.diaperChange,
  });

  final DiaperTrackerStruct? diaperChange;

  @override
  State<DiaperChangeListItemWidget> createState() =>
      _DiaperChangeListItemWidgetState();
}

class _DiaperChangeListItemWidgetState
    extends State<DiaperChangeListItemWidget> {
  late DiaperChangeListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiaperChangeListItemModel());

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
              flex: 4,
              child: Text(
                dateTimeFormat(
                          'yMd',
                          widget.diaperChange?.date,
                          locale: FFLocalizations.of(context).languageCode,
                        ) ==
                        dateTimeFormat(
                          'yMd',
                          getCurrentTimestamp,
                          locale: FFLocalizations.of(context).languageCode,
                        )
                    ? 'today, ${dateTimeFormat(
                        'H:mm',
                        widget.diaperChange?.date,
                        locale: FFLocalizations.of(context).languageCode,
                      )}'
                    : dateTimeFormat(
                        'dd.MM.yy, H:mm',
                        widget.diaperChange!.date!,
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
              flex: 2,
              child: Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.diaperChange?.type?.name,
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
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if ((widget.diaperChange?.type == Diaper.Dirty) ||
                      (widget.diaperChange?.type == Diaper.Mixed))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      child: Container(
                        width: 16.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                          color: widget.diaperChange?.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  if ((widget.diaperChange?.type == Diaper.Wet) ||
                      (widget.diaperChange?.type == Diaper.Mixed))
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.diaperChange!.wetnessLevel > 0)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.asset(
                              'assets/images/drop_filled.svg',
                              width: 18.0,
                              height: 18.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (widget.diaperChange!.wetnessLevel > 1)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.asset(
                              'assets/images/drop_filled.svg',
                              width: 18.0,
                              height: 18.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (widget.diaperChange!.wetnessLevel > 2)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.asset(
                              'assets/images/drop_filled.svg',
                              width: 18.0,
                              height: 18.0,
                              fit: BoxFit.cover,
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
