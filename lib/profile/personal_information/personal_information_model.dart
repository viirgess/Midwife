import '/flutter_flow/flutter_flow_util.dart';
import 'personal_information_widget.dart' show PersonalInformationWidget;
import 'package:flutter/material.dart';

class PersonalInformationModel
    extends FlutterFlowModel<PersonalInformationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
