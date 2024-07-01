import '/backend/backend.dart';
import '/chat/image_view/image_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'user_sent_message_model.dart';
export 'user_sent_message_model.dart';

class UserSentMessageWidget extends StatefulWidget {
  const UserSentMessageWidget({
    super.key,
    required this.images,
  });

  final ChatMessagesRecord? images;

  @override
  State<UserSentMessageWidget> createState() => _UserSentMessageWidgetState();
}

class _UserSentMessageWidgetState extends State<UserSentMessageWidget> {
  late UserSentMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserSentMessageModel());

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
      alignment: const AlignmentDirectional(-1.0, -1.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
        ),
        alignment: const AlignmentDirectional(-1.0, 0.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final imaged = widget.images?.images.toList() ?? [];
                      return Wrap(
                        spacing: 3.0,
                        runSpacing: 3.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(imaged.length, (imagedIndex) {
                          final imagedItem = imaged[imagedIndex];
                          return Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ImageViewWidget(
                                          image: imagedItem,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  imagedItem,
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
