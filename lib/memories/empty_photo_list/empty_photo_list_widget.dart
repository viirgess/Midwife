import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_photo_list_model.dart';
export 'empty_photo_list_model.dart';

class EmptyPhotoListWidget extends StatefulWidget {
  const EmptyPhotoListWidget({super.key});

  @override
  State<EmptyPhotoListWidget> createState() => _EmptyPhotoListWidgetState();
}

class _EmptyPhotoListWidgetState extends State<EmptyPhotoListWidget> {
  late EmptyPhotoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPhotoListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/camera_icon.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.contain,
                  alignment: const Alignment(0.0, 0.0),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
            child: Text(
              'No photos saved yet',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Figtree',
                    color: FlutterFlowTheme.of(context).alternate,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
