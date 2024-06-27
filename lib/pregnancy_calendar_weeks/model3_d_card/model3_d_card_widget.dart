import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.viewClicked = false;
      setState(() {});
    });

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
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Align(
        alignment: const AlignmentDirectional(-1.0, 1.0),
        child: Stack(
          alignment: const AlignmentDirectional(-1.0, 1.0),
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.viewClicked = true;
                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: 532.0,
                  decoration: const BoxDecoration(
                    color: Color(0x87FFFFFF),
                  ),
                  child: Visibility(
                    visible: _model.viewClicked == false,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.viewClicked = true;
                          setState(() {});
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Frame_1374.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlutterFlowWebView(
                  content: widget.parameter1!,
                  height: 500.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                  html: true,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/360_icon.png',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
