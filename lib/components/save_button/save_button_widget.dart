import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'save_button_model.dart';
export 'save_button_model.dart';

class SaveButtonWidget extends StatefulWidget {
  const SaveButtonWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<SaveButtonWidget> createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  late SaveButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        Navigator.pop(context);
      },
      text: widget.text!,
      options: FFButtonOptions(
        width: double.infinity,
        height: 48.0,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 14.0, 24.0, 14.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).secondary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Figtree',
              color: Colors.white,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
            ),
        elevation: 0.0,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
