import '/components/app_bar/app_bar_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pregnancy_calendar_weeks/baby_development_card/baby_development_card_widget.dart';
import '/pregnancy_calendar_weeks/model3_d_card/model3_d_card_widget.dart';
import '/pregnancy_calendar_weeks/physical_changes_of_the_mother_card/physical_changes_of_the_mother_card_widget.dart';
import '/pregnancy_calendar_weeks/week_description_card/week_description_card_widget.dart';
import 'pregnancy_calendar_page_widget.dart' show PregnancyCalendarPageWidget;
import 'package:flutter/material.dart';

class PregnancyCalendarPageModel
    extends FlutterFlowModel<PregnancyCalendarPageWidget> {
  ///  Local state fields for this page.

  int? week;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for Model3DCard component.
  late Model3DCardModel model3DCardModel;
  // Model for babyDevelopmentCard component.
  late BabyDevelopmentCardModel babyDevelopmentCardModel;
  // Model for physicalChangesOfTheMotherCard component.
  late PhysicalChangesOfTheMotherCardModel physicalChangesOfTheMotherCardModel;
  // Model for WeekDescriptionCard component.
  late WeekDescriptionCardModel weekDescriptionCardModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    drawerDataModel = createModel(context, () => DrawerDataModel());
    appBarModel = createModel(context, () => AppBarModel());
    model3DCardModel = createModel(context, () => Model3DCardModel());
    babyDevelopmentCardModel =
        createModel(context, () => BabyDevelopmentCardModel());
    physicalChangesOfTheMotherCardModel =
        createModel(context, () => PhysicalChangesOfTheMotherCardModel());
    weekDescriptionCardModel =
        createModel(context, () => WeekDescriptionCardModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerDataModel.dispose();
    appBarModel.dispose();
    model3DCardModel.dispose();
    babyDevelopmentCardModel.dispose();
    physicalChangesOfTheMotherCardModel.dispose();
    weekDescriptionCardModel.dispose();
    bottomNavBarModel.dispose();
  }
}
