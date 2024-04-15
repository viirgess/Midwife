import '/backend/backend.dart';
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

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
  }
}
