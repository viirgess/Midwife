import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'suggested_item_model.dart';
export 'suggested_item_model.dart';

class SuggestedItemWidget extends StatefulWidget {
  const SuggestedItemWidget({
    super.key,
    required this.groupImage,
    required this.groupName,
    required this.numberOfMembers,
    required this.numberOfPosts,
    required this.isUserJoined,
    required this.groupRef,
  });

  final String? groupImage;
  final String? groupName;
  final int? numberOfMembers;
  final int? numberOfPosts;
  final bool? isUserJoined;
  final DocumentReference? groupRef;

  @override
  State<SuggestedItemWidget> createState() => _SuggestedItemWidgetState();
}

class _SuggestedItemWidgetState extends State<SuggestedItemWidget> {
  late SuggestedItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuggestedItemModel());

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
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
            child: Container(
              width: 56.0,
              height: 56.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).tertiary,
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  widget.groupImage!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.groupName,
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Figtree',
                          color: FlutterFlowTheme.of(context).textColor,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: Text(
                      '${widget.numberOfMembers?.toString()} members • ${widget.numberOfPosts?.toString()} posts',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, 0.0),
            child: Builder(
              builder: (context) {
                if (!widget.isUserJoined!) {
                  return FFButtonWidget(
                    onPressed: () async {
                      await widget.groupRef!.update({
                        ...mapToFirestore(
                          {
                            'members':
                                FieldValue.arrayUnion([currentUserReference]),
                          },
                        ),
                      });
                    },
                    text: 'Join',
                    options: FFButtonOptions(
                      height: 48.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 14.0, 24.0, 14.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Figtree',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                } else {
                  return FFButtonWidget(
                    onPressed: () async {
                      await widget.groupRef!.update({
                        ...mapToFirestore(
                          {
                            'members':
                                FieldValue.arrayRemove([currentUserReference]),
                          },
                        ),
                      });
                    },
                    text: 'Joined',
                    options: FFButtonOptions(
                      height: 48.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 14.0, 24.0, 14.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Figtree',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
