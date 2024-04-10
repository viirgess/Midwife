import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LoginPage': ParameterData.none(),
  'MainPage': ParameterData.none(),
  'RegisterPage': ParameterData.none(),
  'ResetPassword': ParameterData.none(),
  'AIPage': ParameterData.none(),
  'PregnancyCalendarPage': ParameterData.none(),
  'CommunityPage': ParameterData.none(),
  'PrivateChatsPage': ParameterData.none(),
  'BlogPage': ParameterData.none(),
  'FreeEbookPage': ParameterData.none(),
  'OnlineCoachingPage': ParameterData.none(),
  'PregnancyCoursePage': ParameterData.none(),
  'SupportPage': ParameterData.none(),
  'FAQPage': ParameterData.none(),
  'CollaborationPage': ParameterData.none(),
  'BlogsTopicsList': (data) async => ParameterData(
        allParams: {
          'sectionReference':
              getParameter<DocumentReference>(data, 'sectionReference'),
          'title': getParameter<String>(data, 'title'),
          'description': getParameter<String>(data, 'description'),
        },
      ),
  'TopicDescription': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'date': getParameter<DateTime>(data, 'date'),
          'image': getParameter<String>(data, 'image'),
          'topicOne': getParameter<String>(data, 'topicOne'),
          'oneDescription': getParameter<String>(data, 'oneDescription'),
          'topicTwo': getParameter<String>(data, 'topicTwo'),
          'twoDescription': getParameter<String>(data, 'twoDescription'),
          'topicThree': getParameter<String>(data, 'topicThree'),
          'threeDescription': getParameter<String>(data, 'threeDescription'),
          'topicFour': getParameter<String>(data, 'topicFour'),
          'fourDescription': getParameter<String>(data, 'fourDescription'),
          'topicFive': getParameter<String>(data, 'topicFive'),
          'fiveDescription': getParameter<String>(data, 'fiveDescription'),
          'topicSix': getParameter<String>(data, 'topicSix'),
          'sixDescription': getParameter<String>(data, 'sixDescription'),
          'chapterTitle': getParameter<String>(data, 'chapterTitle'),
          'chapterOne': getParameter<String>(data, 'chapterOne'),
          'chapterTwo': getParameter<String>(data, 'chapterTwo'),
          'chapterThree': getParameter<String>(data, 'chapterThree'),
          'referenceSection':
              getParameter<DocumentReference>(data, 'referenceSection'),
          'partOne': getParameter<String>(data, 'partOne'),
          'partOneDescription':
              getParameter<String>(data, 'partOneDescription'),
          'partTwo': getParameter<String>(data, 'partTwo'),
          'partTwoDescription':
              getParameter<String>(data, 'partTwoDescription'),
          'partThree': getParameter<String>(data, 'partThree'),
          'partThreeDescription':
              getParameter<String>(data, 'partThreeDescription'),
          'partFour': getParameter<String>(data, 'partFour'),
          'partFourDescription':
              getParameter<String>(data, 'partFourDescription'),
          'partFive': getParameter<String>(data, 'partFive'),
          'partFiveDescription':
              getParameter<String>(data, 'partFiveDescription'),
          'partSix': getParameter<String>(data, 'partSix'),
          'partSixDescription':
              getParameter<String>(data, 'partSixDescription'),
          'partSeven': getParameter<String>(data, 'partSeven'),
          'partSevenDescription':
              getParameter<String>(data, 'partSevenDescription'),
          'partEight': getParameter<String>(data, 'partEight'),
          'partEightDescription':
              getParameter<String>(data, 'partEightDescription'),
          'partNine': getParameter<String>(data, 'partNine'),
          'partNineDescription':
              getParameter<String>(data, 'partNineDescription'),
          'partTen': getParameter<String>(data, 'partTen'),
          'partTenDescription':
              getParameter<String>(data, 'partTenDescription'),
          'chapterFour': getParameter<String>(data, 'chapterFour'),
          'chapterFive': getParameter<String>(data, 'chapterFive'),
        },
      ),
  'userProfile': ParameterData.none(),
  'PublicUserProfile': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'chatMessages': (data) async => ParameterData(
        allParams: {
          'chatUser': getParameter<DocumentReference>(data, 'chatUser'),
          'userName': getParameter<String>(data, 'userName'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'userimage': getParameter<String>(data, 'userimage'),
        },
      ),
  'testPage': ParameterData.none(),
  'payment': ParameterData.none(),
  'CoursePage': (data) async => ParameterData(
        allParams: {
          'courseRef': getParameter<DocumentReference>(data, 'courseRef'),
        },
      ),
  'CourseEditorPage': (data) async => ParameterData(
        allParams: {
          'newCourseRef': getParameter<DocumentReference>(data, 'newCourseRef'),
        },
      ),
  'SubscriptionChoosePage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
