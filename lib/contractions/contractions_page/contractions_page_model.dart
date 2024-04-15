import '/components/back_app_bar/back_app_bar_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contractions_page_widget.dart' show ContractionsPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ContractionsPageModel extends FlutterFlowModel<ContractionsPageWidget> {
  ///  Local state fields for this page.

  bool contractionStarted = false;

  bool secondContraction = true;

  bool thirdContraction = false;

  bool forthContraction = false;

  int loop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BackAppBar component.
  late BackAppBarModel backAppBarModel;
  // State field(s) for Timer6 widget.
  int timer6Milliseconds = 0;
  String timer6Value = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer6Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for Timer7 widget.
  int timer7Milliseconds = 60000;
  String timer7Value = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer7Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Timer444444 widget.
  int timer444444Milliseconds = 0;
  String timer444444Value = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer444444Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for Timer5 widget.
  int timer5Milliseconds = 60000;
  String timer5Value = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer5Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Timer3 widget.
  int timer3Milliseconds = 0;
  String timer3Value = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer3Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for Timer4 widget.
  int timer4Milliseconds = 60000;
  String timer4Value = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer4Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Timer1 widget.
  int timer1Milliseconds = 0;
  String timer1Value = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer1Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for Timer2 widget.
  int timer2Milliseconds = 60000;
  String timer2Value = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer2Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    backAppBarModel = createModel(context, () => BackAppBarModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backAppBarModel.dispose();
    timer6Controller.dispose();
    timer7Controller.dispose();
    timer444444Controller.dispose();
    timer5Controller.dispose();
    timer3Controller.dispose();
    timer4Controller.dispose();
    timer1Controller.dispose();
    timer2Controller.dispose();
    navBarModel.dispose();
  }
}
