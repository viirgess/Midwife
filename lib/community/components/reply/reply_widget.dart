import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'reply_model.dart';
export 'reply_model.dart';

class ReplyWidget extends StatefulWidget {
  const ReplyWidget({
    super.key,
    required this.replyRef,
    required this.repltyTo,
  });

  final DocumentReference? replyRef;
  final Future Function()? repltyTo;

  @override
  State<ReplyWidget> createState() => _ReplyWidgetState();
}

class _ReplyWidgetState extends State<ReplyWidget> {
  late ReplyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReplyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RepliesRecord>(
      stream: RepliesRecord.getDocument(widget.replyRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).secondary,
                ),
              ),
            ),
          );
        }
        final containerRepliesRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(containerRepliesRecord.createdBy!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                  ),
                );
              }
              final rowUsersRecord = snapshot.data!;
              return Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).tertiary,
                        width: 1.0,
                      ),
                    ),
                    child: Builder(
                      builder: (context) {
                        if (rowUsersRecord.photoUrl != '') {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              rowUsersRecord.photoUrl,
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFCEEFF),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).tertiary,
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                '${String.fromCharCode(rowUsersRecord.firstName.runes.first)}${String.fromCharCode(rowUsersRecord.lastName.runes.first)}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      fontSize: 14.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F8FF),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rowUsersRecord.displayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Text(
                                        containerRepliesRecord.text,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                dateTimeFormat(
                                  'relative',
                                  containerRepliesRecord.createdTime!,
                                  locale: FFLocalizations.of(context)
                                          .languageShortCode ??
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (containerRepliesRecord.likes
                                      .contains(currentUserReference)) {
                                    await widget.replyRef!.update({
                                      ...mapToFirestore(
                                        {
                                          'likes': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                  } else {
                                    await widget.replyRef!.update({
                                      ...mapToFirestore(
                                        {
                                          'likes': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                  }
                                },
                                child: Text(
                                  'Like',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: containerRepliesRecord.likes
                                                .contains(currentUserReference)
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                  await widget.repltyTo?.call();
                                },
                                child: Text(
                                  'Reply',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              if (containerRepliesRecord.likes.isNotEmpty)
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: Text(
                                            containerRepliesRecord.likes.length
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/like_fill.png',
                                                  width: 14.0,
                                                  height: 14.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ]
                                .divide(const SizedBox(width: 20.0))
                                .addToStart(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              );
            },
          ),
        );
      },
    );
  }
}
