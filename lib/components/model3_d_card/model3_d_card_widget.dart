import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'model3_d_card_model.dart';
export 'model3_d_card_model.dart';

class Model3DCardWidget extends StatefulWidget {
  const Model3DCardWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<Model3DCardWidget> createState() => _Model3DCardWidgetState();
}

class _Model3DCardWidgetState extends State<Model3DCardWidget> {
  late Model3DCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Model3DCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 18.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(18.0, 18.0, 18.0, 18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: FlutterFlowWebView(
                  content: widget.parameter1!,
                  height: 300.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                  html: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
