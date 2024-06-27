import '/flutter_flow/flutter_flow_util.dart';
import 'pregnancy_information_widget.dart' show PregnancyInformationWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PregnancyInformationModel
    extends FlutterFlowModel<PregnancyInformationWidget> {
  ///  Local state fields for this page.

  bool isPregnant = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for isPregnantSwitch widget.
  bool? isPregnantSwitchValue;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
