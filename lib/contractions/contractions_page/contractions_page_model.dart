import '/components/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contractions_page_widget.dart' show ContractionsPageWidget;
import 'package:flutter/material.dart';

class ContractionsPageModel extends FlutterFlowModel<ContractionsPageWidget> {
  ///  Local state fields for this page.

  bool isContractionOngoing = false;

  bool isFirstContraction = false;

  String qtyPerHour = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
  }
}
