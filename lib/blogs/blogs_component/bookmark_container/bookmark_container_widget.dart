import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bookmark_container_model.dart';
export 'bookmark_container_model.dart';

class BookmarkContainerWidget extends StatefulWidget {
  const BookmarkContainerWidget({super.key});

  @override
  State<BookmarkContainerWidget> createState() =>
      _BookmarkContainerWidgetState();
}

class _BookmarkContainerWidgetState extends State<BookmarkContainerWidget> {
  late BookmarkContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookmarkContainerModel());

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
      decoration: BoxDecoration(
        color: const Color(0xFFF6F1FF),
        borderRadius: BorderRadius.circular(100.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 9.0, 0.0),
              child: Text(
                'Bladwijzers',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Figtree',
                      color: const Color(0xFFA07EFF),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/bookmark-stroke.png',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
