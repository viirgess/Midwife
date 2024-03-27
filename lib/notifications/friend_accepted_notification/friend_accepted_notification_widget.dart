import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'friend_accepted_notification_model.dart';
export 'friend_accepted_notification_model.dart';

class FriendAcceptedNotificationWidget extends StatefulWidget {
  const FriendAcceptedNotificationWidget({
    super.key,
    required this.userName,
    required this.userPhoto,
    required this.userAcceptedFriendShipRef,
    required this.notificationRef,
  });

  final String? userName;
  final String? userPhoto;
  final DocumentReference? userAcceptedFriendShipRef;
  final DocumentReference? notificationRef;

  @override
  State<FriendAcceptedNotificationWidget> createState() =>
      _FriendAcceptedNotificationWidgetState();
}

class _FriendAcceptedNotificationWidgetState
    extends State<FriendAcceptedNotificationWidget> {
  late FriendAcceptedNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendAcceptedNotificationModel());

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
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.notificationRef!.delete();
                },
                child: Icon(
                  Icons.close_outlined,
                  color: FlutterFlowTheme.of(context).accent2,
                  size: 24.0,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget.userPhoto!,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.userName,
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          'Accepted your Friendship request!',
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
