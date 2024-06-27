import '/flutter_flow/flutter_flow_util.dart';
import 'baby_growth_chart_widget.dart' show BabyGrowthChartWidget;
import 'package:flutter/material.dart';

class BabyGrowthChartModel extends FlutterFlowModel<BabyGrowthChartWidget> {
  ///  Local state fields for this page.

  int selectedIndex = 0;

  bool sexSelected = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
