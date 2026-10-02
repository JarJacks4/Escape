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

    await _handlePushNotificationData(message.data);
  }

  Future _handlePushNotificationData(Map<String, dynamic> messageData) async {
    safeSetState(() => _loading = true);
    try {
      final initialPageName = messageData['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(messageData);
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
  'notificationsScreen': ParameterData.none(),
  'subscription': ParameterData.none(),
  'EnableNotifications': ParameterData.none(),
  'MeditationChoicePage': ParameterData.none(),
  'BreathingChoicePage': ParameterData.none(),
  'BasicBreathingGoalPage': ParameterData.none(),
  'CalmBreathing': ParameterData.none(),
  'MicrcosmicMeditationGoalPage': ParameterData.none(),
  'BoxBreathingMeditationPage': ParameterData.none(),
  'NatureMediationChoice': ParameterData.none(),
  'BinauralBeatsChoice': ParameterData.none(),
  'SleepMeditationsChoice': ParameterData.none(),
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
  'reels': ParameterData.none(),
  'Settings': ParameterData.none(),
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
  'HomeVersion5': ParameterData.none(),
  'ResetPage': ParameterData.none(),
  'MindPage': ParameterData.none(),
  'BodyPageVersion5': ParameterData.none(),
  'DeepWorkModesVersion5Page': ParameterData.none(),
  'JournalPageVersion5': ParameterData.none(),
  'FocusModesPage': ParameterData.none(),
  'EscapeInnerVerse': ParameterData.none(),
  'HabitsPageVersion5': ParameterData.none(),
  'ChooseYourRealmVersion5Page': ParameterData.none(),
  'ChooseRealmsPage': ParameterData.none(),
  'StartingRealm': ParameterData.none(),
  'QuestsPage': ParameterData.none(),
  'ConnectionCommunityStartPageVersion5': ParameterData.none(),
  'EnergyScanVersion5': ParameterData.none(),
  'ProfileVersion5': ParameterData.none(),
  'MindRootChakraVersion5': ParameterData.none(),
  'MindSacralChakraVersion5': ParameterData.none(),
  'MindSolarPlexusChakraVersion5': ParameterData.none(),
  'MindHeartChakraVersion5': ParameterData.none(),
  'MindThroatChakraVersion5': ParameterData.none(),
  'MindThirdEyeChakraVersion5': ParameterData.none(),
  'MindCrownChakraVersion5': ParameterData.none(),
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
  'LucilleSuggestions': ParameterData.none(),
  'LucilleSuggestionSplashPage': ParameterData.none(),
  'RewardsSplashPage': ParameterData.none(),
  'GeneralTransitonSpalshPage': ParameterData.none(),
  'LucilleSuggestionPage': (data) async => ParameterData(
        allParams: {
          'exerciseTitle': getParameter<String>(data, 'exerciseTitle'),
          'exerciseDescription':
              getParameter<String>(data, 'exerciseDescription'),
          'exerciseDuration': getParameter<double>(data, 'exerciseDuration'),
          'exersiseSoundscape':
              getParameter<String>(data, 'exersiseSoundscape'),
        },
      ),
  'MoodScanHelp': ParameterData.none(),
  'BeginSessionPage': (data) async => ParameterData(
        allParams: {
          'currentIndex': getParameter<int>(data, 'currentIndex'),
        },
      ),
  'RespirationPage': ParameterData.none(),
  'MoodResultPage': (data) async => ParameterData(
        allParams: {
          'moodResult': getParameter<String>(data, 'moodResult'),
          'energyLevel': getParameter<String>(data, 'energyLevel'),
          'stressLevel': getParameter<double>(data, 'stressLevel'),
          'moodPhoto': getParameter<String>(data, 'moodPhoto'),
        },
      ),
  'Planet': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'MoodScanResultVersion5': (data) async => ParameterData(
        allParams: {
          'moodResult': getParameter<String>(data, 'moodResult'),
        },
      ),
  'MoodResultTransition': (data) async => ParameterData(
        allParams: {
          'moodResult': getParameter<String>(data, 'moodResult'),
          'stressLevel': getParameter<double>(data, 'stressLevel'),
          'energyLevel': getParameter<String>(data, 'energyLevel'),
          'moodPhoto': getParameter<String>(data, 'moodPhoto'),
        },
      ),
  'SoundscapesSeeAllPage': (data) async => ParameterData(
        allParams: {
          'songUrl': getParameter<String>(data, 'songUrl'),
          'albumArt': getParameter<String>(data, 'albumArt'),
          'songTitle': getParameter<String>(data, 'songTitle'),
          'songNumber': getParameter<int>(data, 'songNumber'),
        },
      ),
  'forgotPassword': ParameterData.none(),
  'forgotPasswordCopy': ParameterData.none(),
  'ComingSoonBod': ParameterData.none(),
  'ExplorePageVersion5FINAL': ParameterData.none(),
  'MarketplaceVersion5': ParameterData.none(),
  'LucilleHome': ParameterData.none(),
  'VoiceChatLucille': ParameterData.none(),
  'BodyWarriorPoseTouchDesigner': ParameterData.none(),
  'MindfulTrackerVersion7Page': ParameterData.none(),
  'FreudScorePage': ParameterData.none(),
  'SleepTracking': ParameterData.none(),
  'StressHub': ParameterData.none(),
  'HealthJournal': ParameterData.none(),
  'AIChat': ParameterData.none(),
  'ExpressionRecorder': ParameterData.none(),
  'MoodStatistics': ParameterData.none(),
  'JournalHistory': ParameterData.none(),
  'DetailedSleepAnalytics': ParameterData.none(),
  'NewJournalPicker': ParameterData.none(),
  'StressFactorSelection': ParameterData.none(),
  'StressLevelScale': ParameterData.none(),
  'ActiveVoiceJournaling': ParameterData.none(),
  'DetailedMoodBreakdown': ParameterData.none(),
  'MindfulResourcesHub': ParameterData.none(),
  'JournalEntryDetail': ParameterData.none(),
  'DashboardPage': ParameterData.none(),
  'SleepTrackingQualityPage': ParameterData.none(),
  'LucilleVoiceChatWebView': ParameterData.none(),
  'StressManagementHub': ParameterData.none(),
  'ExpressionRecorder2': ParameterData.none(),
  'MoodStatistics2': ParameterData.none(),
  'SoundscapesMeditation': ParameterData.none(),
  'AITherapyChatbot': ParameterData.none(),
  'JournalHistory2': ParameterData.none(),
  'SeeAllPage': ParameterData.none(),
  'VoiceTextJournalingCopy': ParameterData.none(),
  'VoiceJournalResultCopy': (data) async => ParameterData(
        allParams: {
          'transcribedWords': getParameter<String>(data, 'transcribedWords'),
          'detectedMood': getParameter<String>(data, 'detectedMood'),
          'journalTitle': getParameter<String>(data, 'journalTitle'),
          'journalVoiceNote': getParameter<String>(data, 'journalVoiceNote'),
        },
      ),
  'TextJournalVersion5': (data) async => ParameterData(
        allParams: {
          'transcribedText': getParameter<String>(data, 'transcribedText'),
        },
      ),
  'HealthJournalCopy': ParameterData.none(),
  'SoundscapesSeeAllPageMusicMeditations': (data) async => ParameterData(
        allParams: {
          'songUrl': getParameter<String>(data, 'songUrl'),
          'albumArt': getParameter<String>(data, 'albumArt'),
          'songTitle': getParameter<String>(data, 'songTitle'),
          'songNumber': getParameter<int>(data, 'songNumber'),
        },
      ),
  'SoundscapesSeeAllPageNature': (data) async => ParameterData(
        allParams: {
          'songUrl': getParameter<String>(data, 'songUrl'),
          'albumArt': getParameter<String>(data, 'albumArt'),
          'songTitle': getParameter<String>(data, 'songTitle'),
          'songNumber': getParameter<int>(data, 'songNumber'),
        },
      ),
  'SoundscapesSeeAllPageSleep': (data) async => ParameterData(
        allParams: {
          'songUrl': getParameter<String>(data, 'songUrl'),
          'albumArt': getParameter<String>(data, 'albumArt'),
          'songTitle': getParameter<String>(data, 'songTitle'),
          'songNumber': getParameter<int>(data, 'songNumber'),
        },
      ),
  'SoundscapesSeeAllPageFocus': (data) async => ParameterData(
        allParams: {
          'songUrl': getParameter<String>(data, 'songUrl'),
          'albumArt': getParameter<String>(data, 'albumArt'),
          'songTitle': getParameter<String>(data, 'songTitle'),
          'songNumber': getParameter<int>(data, 'songNumber'),
        },
      ),
  'AISoundscapesCopyCopyCopyCopy': (data) async => ParameterData(
        allParams: {
          'meditationaudio': getParameter<String>(data, 'meditationaudio'),
        },
      ),
  'RelaxSoundscapeDetails': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
          'songNumber': getParameter<int>(data, 'songNumber'),
        },
      ),
  'AISoundscapesFINAL': (data) async => ParameterData(
        allParams: {
          'meditationaudio': getParameter<String>(data, 'meditationaudio'),
        },
      ),
  'SoundscapesDetails': ParameterData.none(),
  'SoundscapesPlaylists': ParameterData.none(),
  'CouldIGetPage': ParameterData.none(),
  'ComingSoonChakraJourney': ParameterData.none(),
  'BodyVersion5MovementsPage': ParameterData.none(),
  'TodaySMovesOverview': ParameterData.none(),
  'MovementPreviewModal5': ParameterData.none(),
  'BodySessionCompleteBackToHome': ParameterData.none(),
  'MovementPreviewModal5New': ParameterData.none(),
  'MovementPreviewModal2New': (data) async => ParameterData(
        allParams: {
          'moveName': getParameter<String>(data, 'moveName'),
          'cueText': getParameter<String>(data, 'cueText'),
          'modelUrl': getParameter<String>(data, 'modelUrl'),
          'accentColor': getParameter<Color>(data, 'accentColor'),
        },
      ),
  'ActiveSessionTimer2': (data) async => ParameterData(
        allParams: {
          'currentIndex': getParameter<int>(data, 'currentIndex'),
          'sessionStartTime': getParameter<DateTime>(data, 'sessionStartTime'),
        },
      ),
  'ActiveSessionReps1': (data) async => ParameterData(
        allParams: {
          'currentIndex': getParameter<int>(data, 'currentIndex'),
          'sessionStartTime': getParameter<DateTime>(data, 'sessionStartTime'),
        },
      ),
  'BodyMovementSessionCompletion': (data) async => ParameterData(
        allParams: {
          'movesCompleted': getParameter<int>(data, 'movesCompleted'),
          'elapsedMinutes': getParameter<int>(data, 'elapsedMinutes'),
          'sessionLabel': getParameter<String>(data, 'sessionLabel'),
        },
      ),
  'Screen4': ParameterData.none(),
  'BodyMovement3': (data) async => ParameterData(
        allParams: {
          'currentIndex': getParameter<int>(data, 'currentIndex'),
          'sessionStartTime': getParameter<DateTime>(data, 'sessionStartTime'),
        },
      ),
  'ExploreHelp': ParameterData.none(),
  'MindHelp': ParameterData.none(),
  'BodyHelp': ParameterData.none(),
  'JournalHelp': ParameterData.none(),
  'TaiChiMovesChoice': ParameterData.none(),
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
