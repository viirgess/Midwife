import '/components/app_bar/app_bar_widget.dart';
import '/components/calendar_card/calendar_card_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/components/model3_d_card/model3_d_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/week_description_card/week_description_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pregnancy_calendar_page_widget.dart' show PregnancyCalendarPageWidget;
import 'package:flutter/material.dart';

class PregnancyCalendarPageModel
    extends FlutterFlowModel<PregnancyCalendarPageWidget> {
  ///  Local state fields for this page.

  int? week = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for CalendarCard component.
  late CalendarCardModel calendarCardModel;
  // Model for Model3DCard component.
  late Model3DCardModel model3DCardModel;
  // Model for WeekDescriptionCard component.
  late WeekDescriptionCardModel weekDescriptionCardModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    calendarCardModel = createModel(context, () => CalendarCardModel());
    model3DCardModel = createModel(context, () => Model3DCardModel());
    weekDescriptionCardModel =
        createModel(context, () => WeekDescriptionCardModel());
    navBarModel = createModel(context, () => NavBarModel());
    drawerDataModel = createModel(context, () => DrawerDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    calendarCardModel.dispose();
    model3DCardModel.dispose();
    weekDescriptionCardModel.dispose();
    navBarModel.dispose();
    drawerDataModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
