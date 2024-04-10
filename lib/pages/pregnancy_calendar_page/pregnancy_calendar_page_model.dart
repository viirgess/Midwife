import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/calendar_card/calendar_card_widget.dart';
import '/components/drawer_data/drawer_data_widget.dart';
import '/components/model3_d_card/model3_d_card_widget.dart';
import '/components/week_description_card/week_description_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notifications/notification_modal_sheet/notification_modal_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pregnancy_calendar_page_widget.dart' show PregnancyCalendarPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PregnancyCalendarPageModel
    extends FlutterFlowModel<PregnancyCalendarPageWidget> {
  ///  Local state fields for this page.

  int? week;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CalendarCard component.
  late CalendarCardModel calendarCardModel;
  // Model for Model3DCard component.
  late Model3DCardModel model3DCardModel;
  // Model for WeekDescriptionCard component.
  late WeekDescriptionCardModel weekDescriptionCardModel;
  // Model for drawerData component.
  late DrawerDataModel drawerDataModel;

  @override
  void initState(BuildContext context) {
    calendarCardModel = createModel(context, () => CalendarCardModel());
    model3DCardModel = createModel(context, () => Model3DCardModel());
    weekDescriptionCardModel =
        createModel(context, () => WeekDescriptionCardModel());
    drawerDataModel = createModel(context, () => DrawerDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    calendarCardModel.dispose();
    model3DCardModel.dispose();
    weekDescriptionCardModel.dispose();
    drawerDataModel.dispose();
  }
}
