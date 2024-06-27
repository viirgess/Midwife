import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'baby_gender_widget.dart' show BabyGenderWidget;
import 'package:flutter/material.dart';

class BabyGenderModel extends FlutterFlowModel<BabyGenderWidget> {
  ///  Local state fields for this page.

  Gender? selectedBabyGender;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
