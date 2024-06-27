import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'avatar_image_model.dart';
export 'avatar_image_model.dart';

class AvatarImageWidget extends StatefulWidget {
  const AvatarImageWidget({
    super.key,
    required this.firstName,
    required this.lastname,
  });

  final String? firstName;
  final String? lastname;

  @override
  State<AvatarImageWidget> createState() => _AvatarImageWidgetState();
}

class _AvatarImageWidgetState extends State<AvatarImageWidget> {
  late AvatarImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          color: const Color(0xFFFCEEFF),
          shape: BoxShape.circle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).tertiary,
            width: 1.0,
          ),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Text(
            '${String.fromCharCode((widget.firstName!).runes.first)}${String.fromCharCode((widget.lastname!).runes.first)}',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Figtree',
                  fontSize: 18.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
