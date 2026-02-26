import 'dart:async';

import 'serialization_util.dart';
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
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Welcome_to_Escape.gif',
            fit: BoxFit.cover,
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
  'ClassesPage': ParameterData.none(),
  'notificationsScreen': ParameterData.none(),
  'subscription': ParameterData.none(),
  'InterestsPage': ParameterData.none(),
  'ProfileDetails': ParameterData.none(),
  'DisplayNameFINAL': ParameterData.none(),
  'SelfCareGoals': ParameterData.none(),
  'EnableNotifications': ParameterData.none(),
  'profileFINAL': ParameterData.none(),
  'MeditationChoicePage': ParameterData.none(),
  'BreathingChoicePage': ParameterData.none(),
  'BasicBreathingGoalPage': ParameterData.none(),
  'CalmBreathing': ParameterData.none(),
  'MicrcosmicMeditationGoalPage': ParameterData.none(),
  'BoxBreathingMeditationPage': ParameterData.none(),
  'NatureMediationChoice': ParameterData.none(),
  'BinauralBeatsChoice': ParameterData.none(),
  'SleepMeditationsChoice': ParameterData.none(),
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
  'ShortBreathingGoal': ParameterData.none(),
  'LongBreathingGoal': ParameterData.none(),
  'FacialMoodAnalyzerChoiceLogin': ParameterData.none(),
  'FacialMoodAnalyzerPage': ParameterData.none(),
  'MoodAnalyzerSuccess': ParameterData.none(),
  'reels': ParameterData.none(),
  'FacialMoodAnalyzerChoiceLucilleCard': ParameterData.none(),
  'Settings': ParameterData.none(),
  'MeditationReorder': (data) async => ParameterData(
        allParams: {
          'tabIndex': getParameter<int>(data, 'tabIndex'),
        },
      ),
  'BodyReorder': (data) async => ParameterData(
        allParams: {
          'tabIndex': getParameter<int>(data, 'tabIndex'),
        },
      ),
  'SleepReorder': (data) async => ParameterData(
        allParams: {
          'tabIndex': getParameter<int>(data, 'tabIndex'),
        },
      ),
  'DepressionReorder': (data) async => ParameterData(
        allParams: {
          'tabIndex': getParameter<int>(data, 'tabIndex'),
        },
      ),
  'MusicPlayer': (data) async => ParameterData(
        allParams: {
          'initialSong': getParameter<String>(data, 'initialSong'),
          'tracks': getParameter<String>(data, 'tracks'),
          'trackAlbumArt': getParameter<String>(data, 'trackAlbumArt'),
          'trackTime': getParameter<int>(data, 'trackTime'),
          'songTitle': getParameter<String>(data, 'songTitle'),
          'songGenre': getParameter<String>(data, 'songGenre'),
        },
      ),
  'AISoundscapesCopyCopy': (data) async => ParameterData(
        allParams: {
          'meditationaudio': getParameter<String>(data, 'meditationaudio'),
        },
      ),
  'splashScreenVersion5': ParameterData.none(),
  'chat_ai_Screen': ParameterData.none(),
  'ChatWithLucilleVersion5': ParameterData.none(),
  'NewSignInVersion5': (data) async => ParameterData(
        allParams: {
          'tabIndexLogin': getParameter<int>(data, 'tabIndexLogin'),
        },
      ),
  'DestinationsUnrealEngine': ParameterData.none(),
  'DestinationDetailsUnrealEngineVersion5': ParameterData.none(),
  'chat_ai_Screen_1': ParameterData.none(),
  'AdvancedMoodTracker': ParameterData.none(),
  'Soundscapes': ParameterData.none(),
  'tabbar': ParameterData.none(),
  'HomeVersion5': ParameterData.none(),
  'ResetPage': ParameterData.none(),
  'MindPage': ParameterData.none(),
  'ExplorePage': ParameterData.none(),
  'BodyPageVersion5': ParameterData.none(),
  'DeepWorkModesVersion5Page': ParameterData.none(),
  'JournalPageVersion5': ParameterData.none(),
  'FocusModesPage': ParameterData.none(),
  'EscapeInnerVerse': ParameterData.none(),
  'HabitsPageVersion5': ParameterData.none(),
  'ChooseYourRealmVersion5Page': ParameterData.none(),
  'ChooseRealmsPage': ParameterData.none(),
  'StartingRealm': ParameterData.none(),
  'RitualSparkJournalPageVersion5': ParameterData.none(),
  'QuestsPage': ParameterData.none(),
  'ConnectionCommunityStartPageVersion5': ParameterData.none(),
  'test_page1': ParameterData.none(),
  'EnergyScanVersion5': ParameterData.none(),
  'sampleBlank': ParameterData.none(),
  'sampple': ParameterData.none(),
  'ProfileVersion5': ParameterData.none(),
  'MindRootChakraVersion5': ParameterData.none(),
  'MindSacralChakraVersion5': ParameterData.none(),
  'MindSolarPlexusChakraVersion5': ParameterData.none(),
  'MindHeartChakraVersion5': ParameterData.none(),
  'MindThroatChakraVersion5': ParameterData.none(),
  'MindThirdEyeChakraVersion5': ParameterData.none(),
  'MindCrownChakraVersion5': ParameterData.none(),
  'SoundscapeSample': ParameterData.none(),
  'MusicPlayerCopy': (data) async => ParameterData(
        allParams: {
          'initialSong': getParameter<String>(data, 'initialSong'),
          'trackAlbumArt': getParameter<String>(data, 'trackAlbumArt'),
          'trackTime': getParameter<int>(data, 'trackTime'),
          'songTitle': getParameter<String>(data, 'songTitle'),
          'songGenre': getParameter<String>(data, 'songGenre'),
          'songMood': getParameter<String>(data, 'songMood'),
        },
      ),
  'EnergyScanVersion5Copy': ParameterData.none(),
  'ExplorePageVersion5': ParameterData.none(),
  'AISoundscapesCopyCopyCopy': (data) async => ParameterData(
        allParams: {
          'meditationaudio': getParameter<String>(data, 'meditationaudio'),
        },
      ),
  'ResetPageCopy': ParameterData.none(),
  'CreateAccountOnboardingFlow': ParameterData.none(),
  'OnboardingPageView': ParameterData.none(),
  'MoodScanVersion5': ParameterData.none(),
  'TodaysHelpVersion5': ParameterData.none(),
  'YoureAllSetPageVersion5': ParameterData.none(),
  'CommunityGuidelines': ParameterData.none(),
  'CommunityGuidelinesCopy': ParameterData.none(),
  'EnergyCentersGuidance': ParameterData.none(),
  'MeditationHelp': ParameterData.none(),
  'ContactUsVersion5': ParameterData.none(),
  'SelfCareGoalsVersion5': ParameterData.none(),
  'ConfettiRewardBasic': ParameterData.none(),
  'SplashHomeScreen': ParameterData.none(),
  'ComingSoonBody': ParameterData.none(),
  'ComingSoonMarketplace': ParameterData.none(),
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
