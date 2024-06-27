import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'weight_tracker_chart_widget.dart' show WeightTrackerChartWidget;
import 'package:flutter/material.dart';

class WeightTrackerChartModel
    extends FlutterFlowModel<WeightTrackerChartWidget> {
  ///  Local state fields for this page.

  List<WeightStruct> listOfWeights = [];
  void addToListOfWeights(WeightStruct item) => listOfWeights.add(item);
  void removeFromListOfWeights(WeightStruct item) => listOfWeights.remove(item);
  void removeAtIndexFromListOfWeights(int index) =>
      listOfWeights.removeAt(index);
  void insertAtIndexInListOfWeights(int index, WeightStruct item) =>
      listOfWeights.insert(index, item);
  void updateListOfWeightsAtIndex(int index, Function(WeightStruct) updateFn) =>
      listOfWeights[index] = updateFn(listOfWeights[index]);

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
