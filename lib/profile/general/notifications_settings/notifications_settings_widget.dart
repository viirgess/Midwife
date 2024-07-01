import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/general/select_days/select_days_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notifications_settings_model.dart';
export 'notifications_settings_model.dart';

class NotificationsSettingsWidget extends StatefulWidget {
  const NotificationsSettingsWidget({super.key});

  @override
  State<NotificationsSettingsWidget> createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> {
  late NotificationsSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsSettingsModel());

    _model.switchValue1 =
        currentUserDocument!.notificationSettings.offersFromPartners;
    _model.switchValue2 =
        currentUserDocument!.notificationSettings.tipsAndUpdates;
    _model.switchValue3 =
        currentUserDocument!.notificationSettings.mentionsAndReplies;
    _model.switchValue4 = currentUserDocument!.notificationSettings.comments;
    _model.switchValue5 =
        currentUserDocument!.notificationSettings.friendRequests;
    _model.switchValue6 = currentUserDocument!.notificationSettings.messaging;
    _model.switchValue7 =
        valueOrDefault<bool>(currentUserDocument?.hasWeightReminder, false);
    _model.switchValue8 =
        valueOrDefault<bool>(currentUserDocument?.hasBabyReminder, false);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_outlined,
              color: FlutterFlowTheme.of(context).alternate,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Notifications',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Figtree',
                  color: FlutterFlowTheme.of(context).alternate,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'General notifications',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Figtree',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x38B5A4CB),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Offers from partners',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 28.0,
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue1!,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchValue1 =
                                                newValue);
                                            if (newValue) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  offersFromPartners: true,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            } else {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  offersFromPartners: false,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x38B5A4CB),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tips, new materials, updates',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 28.0,
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue2!,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchValue2 =
                                                newValue);
                                            if (newValue) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  tipsAndUpdates: true,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            } else {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  tipsAndUpdates: false,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Community notifications',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Figtree',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x38B5A4CB),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mentions and replies',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 28.0,
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue3!,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchValue3 =
                                                newValue);
                                            if (newValue) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  mentionsAndReplies: true,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            } else {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  mentionsAndReplies: false,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x38B5A4CB),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Comments',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 28.0,
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue4!,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchValue4 =
                                                newValue);
                                            if (newValue) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  comments: true,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            } else {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  comments: false,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x38B5A4CB),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Friend requests',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 28.0,
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue5!,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchValue5 =
                                                newValue);
                                            if (newValue) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  friendRequests: true,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            } else {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  friendRequests: false,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x38B5A4CB),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Messaging',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 28.0,
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue6!,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchValue6 =
                                                newValue);
                                            if (newValue) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  messaging: true,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            } else {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                notificationSettings:
                                                    createNotificationSettingsStruct(
                                                  messaging: false,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Reminders',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Figtree',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x38B5A4CB),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tracking your pregnancy weight',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Container(
                                          height: 28.0,
                                          decoration: const BoxDecoration(),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                Switch.adaptive(
                                              value: _model.switchValue7!,
                                              onChanged: (newValue) async {
                                                setState(() => _model
                                                    .switchValue7 = newValue);
                                                if (newValue) {
                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    hasWeightReminder: true,
                                                  ));
                                                } else {
                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    hasWeightReminder: false,
                                                  ));
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.hasWeightReminder,
                                  false))
                                AuthUserStreamWidget(
                                  builder: (context) => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: const SelectDaysWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Days',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if ((currentUserDocument
                                                              ?.reminderDaysOfWeek
                                                              .toList() ??
                                                          [])
                                                      .isNotEmpty)
                                                    Text(
                                                      (currentUserDocument
                                                                  ?.reminderDaysOfWeek
                                                                  .toList() ??
                                                              [])
                                                          .length
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 20.0,
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet<bool>(
                                                context: context,
                                                builder: (context) {
                                                  final datePickedCupertinoTheme =
                                                      CupertinoTheme.of(
                                                          context);
                                                  return ScrollConfiguration(
                                                    behavior:
                                                        const MaterialScrollBehavior()
                                                            .copyWith(
                                                      dragDevices: {
                                                        PointerDeviceKind.mouse,
                                                        PointerDeviceKind.touch,
                                                        PointerDeviceKind
                                                            .stylus,
                                                        PointerDeviceKind
                                                            .unknown
                                                      },
                                                    ),
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              3,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      child: CupertinoTheme(
                                                        data:
                                                            datePickedCupertinoTheme
                                                                .copyWith(
                                                          textTheme:
                                                              datePickedCupertinoTheme
                                                                  .textTheme
                                                                  .copyWith(
                                                            dateTimePickerTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Figtree',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .textColor,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                          ),
                                                        ),
                                                        child:
                                                            CupertinoDatePicker(
                                                          mode:
                                                              CupertinoDatePickerMode
                                                                  .time,
                                                          minimumDate:
                                                              DateTime(1900),
                                                          initialDateTime:
                                                              getCurrentTimestamp,
                                                          maximumDate:
                                                              DateTime(2050),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          use24hFormat: false,
                                                          onDateTimeChanged:
                                                              (newDateTime) =>
                                                                  safeSetState(
                                                                      () {
                                                            _model.datePicked =
                                                                newDateTime;
                                                          }),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                            if (_model.datePicked != null) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                reminderTimeOfDay:
                                                    dateTimeFormat(
                                                  'Hm',
                                                  _model.datePicked,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                              ));
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Time',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.reminderTimeOfDay,
                                                              '') !=
                                                          '')
                                                    Text(
                                                      valueOrDefault<String>(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.reminderTimeOfDay,
                                                            ''),
                                                        '18:00',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 20.0,
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x38B5A4CB),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tracking baby\'s growth',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 28.0,
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Switch.adaptive(
                                          value: _model.switchValue8!,
                                          onChanged: (newValue) async {
                                            setState(() => _model.switchValue8 =
                                                newValue);
                                            if (newValue) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                hasBabyReminder: true,
                                              ));
                                            } else {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                hasBabyReminder: false,
                                              ));
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].addToEnd(const SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}
