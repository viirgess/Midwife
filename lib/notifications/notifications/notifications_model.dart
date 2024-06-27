import '/flutter_flow/flutter_flow_util.dart';
import '/notifications/congratulations_notification/congratulations_notification_widget.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this page.

  bool showCongratulations = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for congratulationsNotification component.
  late CongratulationsNotificationModel congratulationsNotificationModel;

  @override
  void initState(BuildContext context) {
    congratulationsNotificationModel =
        createModel(context, () => CongratulationsNotificationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    congratulationsNotificationModel.dispose();
  }
}
