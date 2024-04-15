import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'liked_names_model.dart';
export 'liked_names_model.dart';

class LikedNamesWidget extends StatefulWidget {
  const LikedNamesWidget({super.key});

  @override
  State<LikedNamesWidget> createState() => _LikedNamesWidgetState();
}

class _LikedNamesWidgetState extends State<LikedNamesWidget> {
  late LikedNamesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikedNamesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: Container(
                width: 220.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: AuthUserStreamWidget(
                  builder: (context) => Builder(
                    builder: (context) {
                      final likedNames =
                          (currentUserDocument?.likedNames.toList() ?? [])
                              .toList();
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(likedNames.length, (likedNamesIndex) {
                          final likedNamesItem = likedNames[likedNamesIndex];
                          return Text(
                            likedNamesItem,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
