import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'reactions_dialog_model.dart';
export 'reactions_dialog_model.dart';

class ReactionsDialogWidget extends StatefulWidget {
  const ReactionsDialogWidget({
    super.key,
    required this.addReaction,
    required this.userRef,
  });

  final Future Function(ReactionStruct reaction)? addReaction;
  final DocumentReference? userRef;

  @override
  State<ReactionsDialogWidget> createState() => _ReactionsDialogWidgetState();
}

class _ReactionsDialogWidgetState extends State<ReactionsDialogWidget> {
  late ReactionsDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReactionsDialogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 27.0,
              color: Color(0x39B5A4CB),
              offset: Offset(
                0.0,
                4.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).customColor1,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.addReaction?.call(
                    ReactionStruct(
                      userRef: currentUserReference,
                      type: Reaction.Like,
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: SvgPicture.asset(
                    'assets/images/like.svg',
                    width: 36.0,
                    height: 36.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.addReaction?.call(
                    ReactionStruct(
                      userRef: currentUserReference,
                      type: Reaction.Heart,
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: SvgPicture.asset(
                    'assets/images/heart.svg',
                    width: 36.0,
                    height: 36.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.addReaction?.call(
                    ReactionStruct(
                      userRef: currentUserReference,
                      type: Reaction.LovelyEyes,
                    ),
                  );
                },
                child: Text(
                  '😍',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        fontSize: 34.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.addReaction?.call(
                    ReactionStruct(
                      userRef: currentUserReference,
                      type: Reaction.Shock,
                    ),
                  );
                },
                child: Text(
                  '😮',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        fontSize: 34.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.addReaction?.call(
                    ReactionStruct(
                      userRef: currentUserReference,
                      type: Reaction.Laugh,
                    ),
                  );
                },
                child: Text(
                  '😂',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        fontSize: 34.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.addReaction?.call(
                    ReactionStruct(
                      userRef: currentUserReference,
                      type: Reaction.Sad,
                    ),
                  );
                },
                child: Text(
                  '😢',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        fontSize: 34.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.addReaction?.call(
                    ReactionStruct(
                      userRef: currentUserReference,
                      type: Reaction.Angry,
                    ),
                  );
                },
                child: Text(
                  '😡',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        fontSize: 34.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ]
                .divide(const SizedBox(width: 4.0))
                .addToStart(const SizedBox(width: 8.0))
                .addToEnd(const SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}
