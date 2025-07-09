import 'dart:async';

import 'serialization_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


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

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).alternate,
          child: Image.asset(
            'assets/images/Logo_ESCAPE_White.png',
            fit: BoxFit.contain,
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
  'registrationSuccess': ParameterData.none(),
  'MeditationTutorial': ParameterData.none(),
  'ClassesPage': ParameterData.none(),
  'EventsPage': ParameterData.none(),
  'notificationsScreen': ParameterData.none(),
  'subscription': ParameterData.none(),
  'HomeVersion4': ParameterData.none(),
  'loginPage': ParameterData.none(),
  'InterestsPage': ParameterData.none(),
  'ProfileDetails': ParameterData.none(),
  'DisplayNameFINAL': ParameterData.none(),
  'SelfCareGoals': ParameterData.none(),
  'EnableNotifications': ParameterData.none(),
  'AISoundscapes': (data) async => ParameterData(
        allParams: {
          'meditationaudio': getParameter<String>(data, 'meditationaudio'),
        },
      ),
  'AnalyzingMoodStatusPage': ParameterData.none(),
  'profileFINAL': ParameterData.none(),
  'SelfCarePlanPage': ParameterData.none(),
  'RecommendationsPage': ParameterData.none(),
  'JournalPage': ParameterData.none(),
  'MeditationChoicePage': ParameterData.none(),
  'BreathingChoicePage': ParameterData.none(),
  'BasicBreathingGoalPage': ParameterData.none(),
  'CalmBreathing': ParameterData.none(),
  'MicrcosmicMeditationGoalPage': ParameterData.none(),
  'DailyMoodFaceCheckInPage': ParameterData.none(),
  'LucilleHome': ParameterData.none(),
  'BoxBreathingMeditationPage': ParameterData.none(),
  'NatureMediationChoice': ParameterData.none(),
  'BinauralBeatsChoice': ParameterData.none(),
  'SleepMeditationsChoice': ParameterData.none(),
  'TherapistDirectory': ParameterData.none(),
  'CommunityHomeCopy': ParameterData.none(),
  'CommunityHomeVersion5': ParameterData.none(),
  'MeditationPageFINAL': ParameterData.none(),
  'SleepVideosFINAL': ParameterData.none(),
  'DepressionVideosFINAL': ParameterData.none(),
  'FocusVideosFINAL': ParameterData.none(),
  'BoxBreathingGoalPage': ParameterData.none(),
  'FireSoundsAndBreathingGoal': ParameterData.none(),
  'ThunderstromsAndTransformationGoal': ParameterData.none(),
  'EscapingWithNatureSoundsGoal': ParameterData.none(),
  'DeepBreathing': ParameterData.none(),
  'DeepSleepGoal': ParameterData.none(),
  'InsomniaGoal': ParameterData.none(),
  'SmallNapGoal': ParameterData.none(),
  'ADHDAndOverthinkingGoal': ParameterData.none(),
  'AnxietyReliefGoal': ParameterData.none(),
  'IncreaseFocusGoal': ParameterData.none(),
  'splashScreenVersion4': ParameterData.none(),
  'ShortBreathingGoal': ParameterData.none(),
  'LongBreathingGoal': ParameterData.none(),
  'CommunityHomeFINAL': (data) async => ParameterData(
        allParams: {
          'forYouIndex': getParameter<int>(data, 'forYouIndex'),
          'breathingIndex': getParameter<int>(data, 'breathingIndex'),
          'bodyIndex': getParameter<int>(data, 'bodyIndex'),
        },
      ),
  'FacialMoodAnalyzerChoiceLogin': ParameterData.none(),
  'FacialMoodAnalyzerPage': ParameterData.none(),
  'MoodAnalyzerSuccess': ParameterData.none(),
  'blankSample': ParameterData.none(),
  'reels': ParameterData.none(),
  'ChatWithLucille': ParameterData.none(),
  'ChatWithLucilleCopy': ParameterData.none(),
  'FacialMoodAnalyzerChoiceLucilleCopy': ParameterData.none(),
  'BottomSheets': ParameterData.none(),
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
