import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feeding_widget.dart' show FeedingWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedingModel extends FlutterFlowModel<FeedingWidget> {
  ///  Local state fields for this page.

  int? selectedIndex = 0;

  int timerSelected = 2;

  DateTime? startDate;

  bool? firstBreast;

  String bottleSelected = 'Breast milk';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TotalTimer widget.
  final totalTimerInitialTimeMs = 0;
  int totalTimerMilliseconds = 0;
  String totalTimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController totalTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for LeftTimer widget.
  final leftTimerInitialTimeMs = 0;
  int leftTimerMilliseconds = 0;
  String leftTimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController leftTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for RightTimer widget.
  final rightTimerInitialTimeMs = 0;
  int rightTimerMilliseconds = 0;
  String rightTimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController rightTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for BreastTextField widget.
  FocusNode? breastTextFieldFocusNode;
  TextEditingController? breastTextFieldTextController;
  String? Function(BuildContext, String?)?
      breastTextFieldTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for PumpTextField widget.
  FocusNode? pumpTextFieldFocusNode;
  TextEditingController? pumpTextFieldTextController;
  String? Function(BuildContext, String?)? pumpTextFieldTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for BottleTextField widget.
  FocusNode? bottleTextFieldFocusNode;
  TextEditingController? bottleTextFieldTextController;
  String? Function(BuildContext, String?)?
      bottleTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    totalTimerController.dispose();
    leftTimerController.dispose();
    rightTimerController.dispose();
    breastTextFieldFocusNode?.dispose();
    breastTextFieldTextController?.dispose();

    pumpTextFieldFocusNode?.dispose();
    pumpTextFieldTextController?.dispose();

    bottleTextFieldFocusNode?.dispose();
    bottleTextFieldTextController?.dispose();
  }
}
