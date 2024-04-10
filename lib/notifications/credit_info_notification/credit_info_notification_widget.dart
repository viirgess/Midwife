import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'credit_info_notification_model.dart';
export 'credit_info_notification_model.dart';

class CreditInfoNotificationWidget extends StatefulWidget {
  const CreditInfoNotificationWidget({
    super.key,
    required this.notificationRef,
  });

  final DocumentReference? notificationRef;

  @override
  State<CreditInfoNotificationWidget> createState() =>
      _CreditInfoNotificationWidgetState();
}

class _CreditInfoNotificationWidgetState
    extends State<CreditInfoNotificationWidget> {
  late CreditInfoNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreditInfoNotificationModel());

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
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.notificationRef!.delete();
                },
                child: Icon(
                  Icons.close_outlined,
                  color: FlutterFlowTheme.of(context).accent2,
                  size: 24.0,
                ),
              ),
            ),
            Text(
              'Please update your credit info!',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
