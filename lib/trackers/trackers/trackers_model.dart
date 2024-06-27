import '/backend/backend.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trackers_widget.dart' show TrackersWidget;
import 'package:flutter/material.dart';

class TrackersModel extends FlutterFlowModel<TrackersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Trackers widget.
  TrackersRecord? trackerRef;
  // Stores action output result for [Backend Call - Create Document] action in Trackers widget.
  TrackersRecord? newTrackerRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  TrackersRecord? readDoc1;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  TrackersRecord? readDoc2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  TrackersRecord? readDoc3;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  TrackersRecord? readDoc4;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomNavBarModel.dispose();
    appBarModel.dispose();
  }
}
