import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'course_widget.dart' show CourseWidget;
import 'package:flutter/material.dart';

class CourseModel extends FlutterFlowModel<CourseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomNavBarModel.dispose();
  }
}
