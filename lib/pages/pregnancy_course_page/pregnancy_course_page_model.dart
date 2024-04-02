import '/backend/backend.dart';
import '/components/back_app_bar/back_app_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pregnancy_course_page_widget.dart' show PregnancyCoursePageWidget;
import 'package:flutter/material.dart';

class PregnancyCoursePageModel
    extends FlutterFlowModel<PregnancyCoursePageWidget> {
  ///  Local state fields for this page.

  bool isPregnant = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CoursesRecord? newCourse;
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;
  // Model for BackAppBar component.
  late BackAppBarModel backAppBarModel;

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
    backAppBarModel = createModel(context, () => BackAppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
    backAppBarModel.dispose();
  }
}
