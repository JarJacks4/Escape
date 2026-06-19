import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:cupertino_time_picker_hiuzb7/index.dart'
    as $cupertino_time_picker_hiuzb7;
import 'package:tiktokfeed_wz8en7/index.dart' as $tiktokfeed_wz8en7;
import 'package:confetti_modualo_library_b75kfy/index.dart'
    as $confetti_modualo_library_b75kfy;
import 'package:utility_functions_library_8g4bud/index.dart'
    as $utility_functions_library_8g4bud;
import 'package:that_audio_player_oo85ab/index.dart'
    as $that_audio_player_oo85ab;
import 'package:that_slideable_list_item_mrpo3s/index.dart'
    as $that_slideable_list_item_mrpo3s;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $cupertino_time_picker_hiuzb7.initializeRoutes(
    homePageWidgetName: 'cupertino_time_picker_hiuzb7.HomePage',
    homePageWidgetPath: 'homePage2',
  );

  $tiktokfeed_wz8en7.initializeRoutes(
    homePageWidgetName: 'tiktokfeed_wz8en7.HomePage',
    homePageWidgetPath: 'homePage1',
    page2WidgetName: 'tiktokfeed_wz8en7.page2',
    page2WidgetPath: 'page2',
    reelsWidgetName: 'tiktokfeed_wz8en7.Reels',
    reelsWidgetPath: 'Reels',
  );

  $confetti_modualo_library_b75kfy.initializeRoutes(
    homePageWidgetName: 'confetti_modualo_library_b75kfy.HomePage',
    homePageWidgetPath: 'homePage1215',
  );

  $utility_functions_library_8g4bud.initializeRoutes(
    testPageWidgetName: 'utility_functions_library_8g4bud.TestPage',
    testPageWidgetPath: 'testUtilityPage',
  );

  $that_audio_player_oo85ab.initializeRoutes(
    homePageWidgetName: 'that_audio_player_oo85ab.HomePage',
    homePageWidgetPath: 'homePage_that-audio-player-oo85ab',
    playerPageFocusWidgetName: 'that_audio_player_oo85ab.PlayerPageFocus',
    playerPageFocusWidgetPath: 'playerPageFocus',
    playerPageSleepWidgetName: 'that_audio_player_oo85ab.PlayerPageSleep',
    playerPageSleepWidgetPath: 'playerPageSleep',
    playerPageNatureWidgetName: 'that_audio_player_oo85ab.PlayerPageNature',
    playerPageNatureWidgetPath: 'playerPageNature',
    playerPageMusicMediationsWidgetName:
        'that_audio_player_oo85ab.PlayerPageMusicMediations',
    playerPageMusicMediationsWidgetPath: 'playerPageMusicMediations',
    playerPageFINALAllTabWidgetName:
        'that_audio_player_oo85ab.PlayerPageFINALAllTab',
    playerPageFINALAllTabWidgetPath: 'playerPageFINALAllTab',
    sampleWidgetName: 'that_audio_player_oo85ab.sample',
    sampleWidgetPath: 'sample',
    playerPageLucilleWidgetName: 'that_audio_player_oo85ab.PlayerPageLucille',
    playerPageLucilleWidgetPath: 'playerPageLucille',
  );

  $that_slideable_list_item_mrpo3s.initializeRoutes(
    homePageWidgetName: 'that_slideable_list_item_mrpo3s.HomePage',
    homePageWidgetPath: 'homePage4',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) =>
        appStateNotifier.loggedIn ? NavBarPage() : SplashScreenVersion5Widget(),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) => appStateNotifier.loggedIn
            ? NavBarPage()
            : SplashScreenVersion5Widget(),
        routes: [
          FFRoute(
            name: RegistrationSuccessWidget.routeName,
            path: RegistrationSuccessWidget.routePath,
            builder: (context, params) => RegistrationSuccessWidget(),
          ),
          FFRoute(
            name: ClassesPageWidget.routeName,
            path: ClassesPageWidget.routePath,
            builder: (context, params) => ClassesPageWidget(),
          ),
          FFRoute(
            name: NotificationsScreenWidget.routeName,
            path: NotificationsScreenWidget.routePath,
            builder: (context, params) => NotificationsScreenWidget(),
          ),
          FFRoute(
            name: SubscriptionWidget.routeName,
            path: SubscriptionWidget.routePath,
            builder: (context, params) => SubscriptionWidget(),
          ),
          FFRoute(
            name: InterestsPageWidget.routeName,
            path: InterestsPageWidget.routePath,
            builder: (context, params) => InterestsPageWidget(),
          ),
          FFRoute(
            name: ProfileDetailsWidget.routeName,
            path: ProfileDetailsWidget.routePath,
            builder: (context, params) => ProfileDetailsWidget(),
          ),
          FFRoute(
            name: DisplayNameFINALWidget.routeName,
            path: DisplayNameFINALWidget.routePath,
            builder: (context, params) => DisplayNameFINALWidget(),
          ),
          FFRoute(
            name: SelfCareGoalsWidget.routeName,
            path: SelfCareGoalsWidget.routePath,
            builder: (context, params) => SelfCareGoalsWidget(),
          ),
          FFRoute(
            name: EnableNotificationsWidget.routeName,
            path: EnableNotificationsWidget.routePath,
            builder: (context, params) => EnableNotificationsWidget(),
          ),
          FFRoute(
            name: ProfileFINALWidget.routeName,
            path: ProfileFINALWidget.routePath,
            builder: (context, params) => ProfileFINALWidget(),
          ),
          FFRoute(
            name: MeditationChoicePageWidget.routeName,
            path: MeditationChoicePageWidget.routePath,
            builder: (context, params) => MeditationChoicePageWidget(),
          ),
          FFRoute(
            name: BreathingChoicePageWidget.routeName,
            path: BreathingChoicePageWidget.routePath,
            builder: (context, params) => BreathingChoicePageWidget(),
          ),
          FFRoute(
            name: BasicBreathingGoalPageWidget.routeName,
            path: BasicBreathingGoalPageWidget.routePath,
            builder: (context, params) => BasicBreathingGoalPageWidget(),
          ),
          FFRoute(
            name: CalmBreathingWidget.routeName,
            path: CalmBreathingWidget.routePath,
            builder: (context, params) => CalmBreathingWidget(),
          ),
          FFRoute(
            name: MicrcosmicMeditationGoalPageWidget.routeName,
            path: MicrcosmicMeditationGoalPageWidget.routePath,
            builder: (context, params) => MicrcosmicMeditationGoalPageWidget(),
          ),
          FFRoute(
            name: BoxBreathingMeditationPageWidget.routeName,
            path: BoxBreathingMeditationPageWidget.routePath,
            builder: (context, params) => BoxBreathingMeditationPageWidget(),
          ),
          FFRoute(
            name: NatureMediationChoiceWidget.routeName,
            path: NatureMediationChoiceWidget.routePath,
            builder: (context, params) => NatureMediationChoiceWidget(),
          ),
          FFRoute(
            name: BinauralBeatsChoiceWidget.routeName,
            path: BinauralBeatsChoiceWidget.routePath,
            builder: (context, params) => BinauralBeatsChoiceWidget(),
          ),
          FFRoute(
            name: SleepMeditationsChoiceWidget.routeName,
            path: SleepMeditationsChoiceWidget.routePath,
            builder: (context, params) => SleepMeditationsChoiceWidget(),
          ),
          FFRoute(
            name: MeditationPageFINALWidget.routeName,
            path: MeditationPageFINALWidget.routePath,
            builder: (context, params) => MeditationPageFINALWidget(),
          ),
          FFRoute(
            name: SleepVideosFINALWidget.routeName,
            path: SleepVideosFINALWidget.routePath,
            builder: (context, params) => SleepVideosFINALWidget(),
          ),
          FFRoute(
            name: DepressionVideosFINALWidget.routeName,
            path: DepressionVideosFINALWidget.routePath,
            builder: (context, params) => DepressionVideosFINALWidget(),
          ),
          FFRoute(
            name: FocusVideosFINALWidget.routeName,
            path: FocusVideosFINALWidget.routePath,
            builder: (context, params) => FocusVideosFINALWidget(),
          ),
          FFRoute(
            name: BoxBreathingGoalPageWidget.routeName,
            path: BoxBreathingGoalPageWidget.routePath,
            builder: (context, params) => BoxBreathingGoalPageWidget(),
          ),
          FFRoute(
            name: FireSoundsAndBreathingGoalWidget.routeName,
            path: FireSoundsAndBreathingGoalWidget.routePath,
            builder: (context, params) => FireSoundsAndBreathingGoalWidget(),
          ),
          FFRoute(
            name: ThunderstromsAndTransformationGoalWidget.routeName,
            path: ThunderstromsAndTransformationGoalWidget.routePath,
            builder: (context, params) =>
                ThunderstromsAndTransformationGoalWidget(),
          ),
          FFRoute(
            name: EscapingWithNatureSoundsGoalWidget.routeName,
            path: EscapingWithNatureSoundsGoalWidget.routePath,
            builder: (context, params) => EscapingWithNatureSoundsGoalWidget(),
          ),
          FFRoute(
            name: DeepBreathingWidget.routeName,
            path: DeepBreathingWidget.routePath,
            builder: (context, params) => DeepBreathingWidget(),
          ),
          FFRoute(
            name: DeepSleepGoalWidget.routeName,
            path: DeepSleepGoalWidget.routePath,
            builder: (context, params) => DeepSleepGoalWidget(),
          ),
          FFRoute(
            name: InsomniaGoalWidget.routeName,
            path: InsomniaGoalWidget.routePath,
            builder: (context, params) => InsomniaGoalWidget(),
          ),
          FFRoute(
            name: SmallNapGoalWidget.routeName,
            path: SmallNapGoalWidget.routePath,
            builder: (context, params) => SmallNapGoalWidget(),
          ),
          FFRoute(
            name: ADHDAndOverthinkingGoalWidget.routeName,
            path: ADHDAndOverthinkingGoalWidget.routePath,
            builder: (context, params) => ADHDAndOverthinkingGoalWidget(),
          ),
          FFRoute(
            name: AnxietyReliefGoalWidget.routeName,
            path: AnxietyReliefGoalWidget.routePath,
            builder: (context, params) => AnxietyReliefGoalWidget(),
          ),
          FFRoute(
            name: IncreaseFocusGoalWidget.routeName,
            path: IncreaseFocusGoalWidget.routePath,
            builder: (context, params) => IncreaseFocusGoalWidget(),
          ),
          FFRoute(
            name: ShortBreathingGoalWidget.routeName,
            path: ShortBreathingGoalWidget.routePath,
            builder: (context, params) => ShortBreathingGoalWidget(),
          ),
          FFRoute(
            name: LongBreathingGoalWidget.routeName,
            path: LongBreathingGoalWidget.routePath,
            builder: (context, params) => LongBreathingGoalWidget(),
          ),
          FFRoute(
            name: FacialMoodAnalyzerChoiceLoginWidget.routeName,
            path: FacialMoodAnalyzerChoiceLoginWidget.routePath,
            builder: (context, params) => FacialMoodAnalyzerChoiceLoginWidget(),
          ),
          FFRoute(
            name: FacialMoodAnalyzerPageWidget.routeName,
            path: FacialMoodAnalyzerPageWidget.routePath,
            builder: (context, params) => FacialMoodAnalyzerPageWidget(),
          ),
          FFRoute(
            name: MoodAnalyzerSuccessWidget.routeName,
            path: MoodAnalyzerSuccessWidget.routePath,
            builder: (context, params) => MoodAnalyzerSuccessWidget(),
          ),
          FFRoute(
            name: ReelsWidget.routeName,
            path: ReelsWidget.routePath,
            builder: (context, params) => ReelsWidget(),
          ),
          FFRoute(
            name: FacialMoodAnalyzerChoiceLucilleCardWidget.routeName,
            path: FacialMoodAnalyzerChoiceLucilleCardWidget.routePath,
            builder: (context, params) =>
                FacialMoodAnalyzerChoiceLucilleCardWidget(),
          ),
          FFRoute(
            name: SettingsWidget.routeName,
            path: SettingsWidget.routePath,
            builder: (context, params) => SettingsWidget(),
          ),
          FFRoute(
            name: BodyReorderWidget.routeName,
            path: BodyReorderWidget.routePath,
            builder: (context, params) => BodyReorderWidget(
              tabIndex: params.getParam(
                'tabIndex',
                ParamType.int,
              ),
            ),
          ),
          FFRoute(
            name: SleepReorderWidget.routeName,
            path: SleepReorderWidget.routePath,
            builder: (context, params) => SleepReorderWidget(
              tabIndex: params.getParam(
                'tabIndex',
                ParamType.int,
              ),
            ),
          ),
          FFRoute(
            name: DepressionReorderWidget.routeName,
            path: DepressionReorderWidget.routePath,
            builder: (context, params) => DepressionReorderWidget(
              tabIndex: params.getParam(
                'tabIndex',
                ParamType.int,
              ),
            ),
          ),
          FFRoute(
            name: MusicPlayerWidget.routeName,
            path: MusicPlayerWidget.routePath,
            builder: (context, params) => MusicPlayerWidget(
              initialSong: params.getParam(
                'initialSong',
                ParamType.String,
              ),
              tracks: params.getParam(
                'tracks',
                ParamType.String,
              ),
              trackAlbumArt: params.getParam(
                'trackAlbumArt',
                ParamType.String,
              ),
              trackTime: params.getParam(
                'trackTime',
                ParamType.int,
              ),
              songTitle: params.getParam(
                'songTitle',
                ParamType.String,
              ),
              songGenre: params.getParam(
                'songGenre',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: AISoundscapesCopyCopyWidget.routeName,
            path: AISoundscapesCopyCopyWidget.routePath,
            builder: (context, params) => AISoundscapesCopyCopyWidget(
              meditationaudio: params.getParam(
                'meditationaudio',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: SplashScreenVersion5Widget.routeName,
            path: SplashScreenVersion5Widget.routePath,
            builder: (context, params) => SplashScreenVersion5Widget(),
          ),
          FFRoute(
            name: ChatAiScreenWidget.routeName,
            path: ChatAiScreenWidget.routePath,
            builder: (context, params) => ChatAiScreenWidget(),
          ),
          FFRoute(
            name: ChatWithLucilleVersion5Widget.routeName,
            path: ChatWithLucilleVersion5Widget.routePath,
            builder: (context, params) => ChatWithLucilleVersion5Widget(),
          ),
          FFRoute(
            name: LucilleVoiceChatWebViewWidget.routeName,
            path: LucilleVoiceChatWebViewWidget.routePath,
            builder: (context, params) => LucilleVoiceChatWebViewWidget(),
          ),
          FFRoute(
            name: LucilleVoiceChatWebViewWidget.routeName,
            path: LucilleVoiceChatWebViewWidget.routePath,
            builder: (context, params) => LucilleVoiceChatWebViewWidget(),
          ),
          FFRoute(
            name: HealthJournalWidget.routeName,
            path: HealthJournalWidget.routePath,
            builder: (context, params) => HealthJournalWidget(),
          ),
          FFRoute(
            name: JournalHistoryWidget.routeName,
            path: JournalHistoryWidget.routePath,
            builder: (context, params) => JournalHistoryWidget(),
          ),
          FFRoute(
            name: NewJournalPickerWidget.routeName,
            path: NewJournalPickerWidget.routePath,
            builder: (context, params) => NewJournalPickerWidget(),
          ),
          FFRoute(
            name: VoiceJournalResultWidget.routeName,
            path: VoiceJournalResultWidget.routePath,
            builder: (context, params) => VoiceJournalResultWidget(),
          ),
          FFRoute(
            name: JournalEntryDetailWidget.routeName,
            path: JournalEntryDetailWidget.routePath,
            builder: (context, params) => JournalEntryDetailWidget(),
          ),
          FFRoute(
            name: HealthJournalCalendarWidget.routeName,
            path: HealthJournalCalendarWidget.routePath,
            builder: (context, params) => HealthJournalCalendarWidget(),
          ),
          FFRoute(
            name: VoiceTextJournalingWidget.routeName,
            path: VoiceTextJournalingWidget.routePath,
            builder: (context, params) => VoiceTextJournalingWidget(),
          ),
          FFRoute(
            name: JournalHistory2Widget.routeName,
            path: JournalHistory2Widget.routePath,
            builder: (context, params) => JournalHistory2Widget(),
          ),
          FFRoute(
            name: MindfulTrackerVersion7PageWidget.routeName,
            path: MindfulTrackerVersion7PageWidget.routePath,
            builder: (context, params) => MindfulTrackerVersion7PageWidget(),
          ),
          FFRoute(
            name: FilterFreudScoreWidget.routeName,
            path: FilterFreudScoreWidget.routePath,
            builder: (context, params) => FilterFreudScoreWidget(),
          ),
          FFRoute(
            name: FreudScorePageWidget.routeName,
            path: FreudScorePageWidget.routePath,
            builder: (context, params) => FreudScorePageWidget(),
          ),
          FFRoute(
            name: SleepTrackingWidget.routeName,
            path: SleepTrackingWidget.routePath,
            builder: (context, params) => SleepTrackingWidget(),
          ),
          FFRoute(
            name: StressHubWidget.routeName,
            path: StressHubWidget.routePath,
            builder: (context, params) => StressHubWidget(),
          ),
          FFRoute(
            name: AIChatWidget.routeName,
            path: AIChatWidget.routePath,
            builder: (context, params) => AIChatWidget(),
          ),
          FFRoute(
            name: MoodStatisticsWidget.routeName,
            path: MoodStatisticsWidget.routePath,
            builder: (context, params) => MoodStatisticsWidget(),
          ),
          FFRoute(
            name: DetailedSleepAnalyticsWidget.routeName,
            path: DetailedSleepAnalyticsWidget.routePath,
            builder: (context, params) => DetailedSleepAnalyticsWidget(),
          ),
          FFRoute(
            name: StressFactorSelectionWidget.routeName,
            path: StressFactorSelectionWidget.routePath,
            builder: (context, params) => StressFactorSelectionWidget(),
          ),
          FFRoute(
            name: StressLevelScaleWidget.routeName,
            path: StressLevelScaleWidget.routePath,
            builder: (context, params) => StressLevelScaleWidget(),
          ),
          FFRoute(
            name: DetailedMoodBreakdownWidget.routeName,
            path: DetailedMoodBreakdownWidget.routePath,
            builder: (context, params) => DetailedMoodBreakdownWidget(),
          ),
          FFRoute(
            name: MindfulResourcesHubWidget.routeName,
            path: MindfulResourcesHubWidget.routePath,
            builder: (context, params) => MindfulResourcesHubWidget(),
          ),
          FFRoute(
            name: DashboardVersion5Widget.routeName,
            path: DashboardVersion5Widget.routePath,
            builder: (context, params) => DashboardVersion5Widget(),
          ),
          FFRoute(
            name: DashboardPageWidget.routeName,
            path: DashboardPageWidget.routePath,
            builder: (context, params) => DashboardPageWidget(),
          ),
          FFRoute(
            name: SleepTrackingQualityPageWidget.routeName,
            path: SleepTrackingQualityPageWidget.routePath,
            builder: (context, params) => SleepTrackingQualityPageWidget(),
          ),
          FFRoute(
            name: StressManagementHubWidget.routeName,
            path: StressManagementHubWidget.routePath,
            builder: (context, params) => StressManagementHubWidget(),
          ),
          FFRoute(
            name: MoodStatistics2Widget.routeName,
            path: MoodStatistics2Widget.routePath,
            builder: (context, params) => MoodStatistics2Widget(),
          ),
          FFRoute(
            name: SoundscapesMeditationWidget.routeName,
            path: SoundscapesMeditationWidget.routePath,
            builder: (context, params) => SoundscapesMeditationWidget(),
          ),
          FFRoute(
            name: AITherapyChatbotWidget.routeName,
            path: AITherapyChatbotWidget.routePath,
            builder: (context, params) => AITherapyChatbotWidget(),
          ),
          FFRoute(
            name: SeeAllPageWidget.routeName,
            path: SeeAllPageWidget.routePath,
            builder: (context, params) => SeeAllPageWidget(),
          ),
          FFRoute(
            name: NewSignInVersion5Widget.routeName,
            path: NewSignInVersion5Widget.routePath,
            builder: (context, params) => NewSignInVersion5Widget(
              tabIndexLogin: params.getParam(
                'tabIndexLogin',
                ParamType.int,
              ),
            ),
          ),
          FFRoute(
            name: DestinationsUnrealEngineWidget.routeName,
            path: DestinationsUnrealEngineWidget.routePath,
            builder: (context, params) => DestinationsUnrealEngineWidget(),
          ),
          FFRoute(
            name: DestinationDetailsUnrealEngineVersion5Widget.routeName,
            path: DestinationDetailsUnrealEngineVersion5Widget.routePath,
            builder: (context, params) =>
                DestinationDetailsUnrealEngineVersion5Widget(),
          ),
          FFRoute(
            name: ChatAiScreen1Widget.routeName,
            path: ChatAiScreen1Widget.routePath,
            builder: (context, params) => ChatAiScreen1Widget(),
          ),
          FFRoute(
            name: AdvancedMoodTrackerWidget.routeName,
            path: AdvancedMoodTrackerWidget.routePath,
            builder: (context, params) => AdvancedMoodTrackerWidget(),
          ),
          FFRoute(
            name: SoundscapesWidget.routeName,
            path: SoundscapesWidget.routePath,
            builder: (context, params) => SoundscapesWidget(),
          ),
          FFRoute(
            name: TabbarWidget.routeName,
            path: TabbarWidget.routePath,
            builder: (context, params) => TabbarWidget(),
          ),
          FFRoute(
              name: HomeVersion5Widget.routeName,
              path: HomeVersion5Widget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomeVersion5')
                  : NavBarPage(
                      initialPage: 'HomeVersion5',
                      page: HomeVersion5Widget(),
                    )),
          FFRoute(
            name: ResetPageWidget.routeName,
            path: ResetPageWidget.routePath,
            builder: (context, params) => ResetPageWidget(),
          ),
          FFRoute(
            name: MindPageWidget.routeName,
            path: MindPageWidget.routePath,
            builder: (context, params) => MindPageWidget(),
          ),
          FFRoute(
            name: ExplorePageWidget.routeName,
            path: ExplorePageWidget.routePath,
            builder: (context, params) => ExplorePageWidget(),
          ),
          FFRoute(
            name: BodyPageVersion5Widget.routeName,
            path: BodyPageVersion5Widget.routePath,
            builder: (context, params) => BodyPageVersion5Widget(),
          ),
          FFRoute(
            name: DeepWorkModesVersion5PageWidget.routeName,
            path: DeepWorkModesVersion5PageWidget.routePath,
            builder: (context, params) => DeepWorkModesVersion5PageWidget(),
          ),
          FFRoute(
            name: JournalPageVersion5Widget.routeName,
            path: JournalPageVersion5Widget.routePath,
            builder: (context, params) => JournalPageVersion5Widget(),
          ),
          FFRoute(
            name: FocusModesPageWidget.routeName,
            path: FocusModesPageWidget.routePath,
            builder: (context, params) => FocusModesPageWidget(),
          ),
          FFRoute(
            name: EscapeInnerVerseWidget.routeName,
            path: EscapeInnerVerseWidget.routePath,
            builder: (context, params) => EscapeInnerVerseWidget(),
          ),
          FFRoute(
            name: HabitsPageVersion5Widget.routeName,
            path: HabitsPageVersion5Widget.routePath,
            builder: (context, params) => HabitsPageVersion5Widget(),
          ),
          FFRoute(
            name: ChooseYourRealmVersion5PageWidget.routeName,
            path: ChooseYourRealmVersion5PageWidget.routePath,
            builder: (context, params) => ChooseYourRealmVersion5PageWidget(),
          ),
          FFRoute(
            name: ChooseRealmsPageWidget.routeName,
            path: ChooseRealmsPageWidget.routePath,
            builder: (context, params) => ChooseRealmsPageWidget(),
          ),
          FFRoute(
            name: StartingRealmWidget.routeName,
            path: StartingRealmWidget.routePath,
            builder: (context, params) => StartingRealmWidget(),
          ),
          FFRoute(
            name: RitualSparkJournalPageVersion5Widget.routeName,
            path: RitualSparkJournalPageVersion5Widget.routePath,
            builder: (context, params) =>
                RitualSparkJournalPageVersion5Widget(),
          ),
          FFRoute(
            name: QuestsPageWidget.routeName,
            path: QuestsPageWidget.routePath,
            builder: (context, params) => QuestsPageWidget(),
          ),
          FFRoute(
              name: ConnectionCommunityStartPageVersion5Widget.routeName,
              path: ConnectionCommunityStartPageVersion5Widget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(
                      initialPage: 'ConnectionCommunityStartPageVersion5')
                  : NavBarPage(
                      initialPage: 'ConnectionCommunityStartPageVersion5',
                      page: ConnectionCommunityStartPageVersion5Widget(),
                    )),
          FFRoute(
            name: EnergyScanVersion5Widget.routeName,
            path: EnergyScanVersion5Widget.routePath,
            builder: (context, params) => EnergyScanVersion5Widget(),
          ),
          FFRoute(
            name: ProfileVersion5Widget.routeName,
            path: ProfileVersion5Widget.routePath,
            builder: (context, params) => ProfileVersion5Widget(),
          ),
          FFRoute(
            name: MindRootChakraVersion5Widget.routeName,
            path: MindRootChakraVersion5Widget.routePath,
            builder: (context, params) => MindRootChakraVersion5Widget(),
          ),
          FFRoute(
            name: MindSacralChakraVersion5Widget.routeName,
            path: MindSacralChakraVersion5Widget.routePath,
            builder: (context, params) => MindSacralChakraVersion5Widget(),
          ),
          FFRoute(
            name: MindSolarPlexusChakraVersion5Widget.routeName,
            path: MindSolarPlexusChakraVersion5Widget.routePath,
            builder: (context, params) => MindSolarPlexusChakraVersion5Widget(),
          ),
          FFRoute(
            name: MindHeartChakraVersion5Widget.routeName,
            path: MindHeartChakraVersion5Widget.routePath,
            builder: (context, params) => MindHeartChakraVersion5Widget(),
          ),
          FFRoute(
            name: MindThroatChakraVersion5Widget.routeName,
            path: MindThroatChakraVersion5Widget.routePath,
            builder: (context, params) => MindThroatChakraVersion5Widget(),
          ),
          FFRoute(
            name: MindThirdEyeChakraVersion5Widget.routeName,
            path: MindThirdEyeChakraVersion5Widget.routePath,
            builder: (context, params) => MindThirdEyeChakraVersion5Widget(),
          ),
          FFRoute(
            name: MindCrownChakraVersion5Widget.routeName,
            path: MindCrownChakraVersion5Widget.routePath,
            builder: (context, params) => MindCrownChakraVersion5Widget(),
          ),
          FFRoute(
            name: MusicPlayerCopyWidget.routeName,
            path: MusicPlayerCopyWidget.routePath,
            builder: (context, params) => MusicPlayerCopyWidget(
              initialSong: params.getParam(
                'initialSong',
                ParamType.String,
              ),
              tracks: params.getParam<SoundscapesStruct>(
                'tracks',
                ParamType.DataStruct,
                isList: true,
                structBuilder: SoundscapesStruct.fromSerializableMap,
              ),
              trackAlbumArt: params.getParam(
                'trackAlbumArt',
                ParamType.String,
              ),
              trackTime: params.getParam(
                'trackTime',
                ParamType.int,
              ),
              songTitle: params.getParam(
                'songTitle',
                ParamType.String,
              ),
              songGenre: params.getParam(
                'songGenre',
                ParamType.String,
              ),
              songMood: params.getParam(
                'songMood',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: EnergyScanVersion5CopyWidget.routeName,
            path: EnergyScanVersion5CopyWidget.routePath,
            builder: (context, params) => EnergyScanVersion5CopyWidget(),
          ),
          FFRoute(
            name: ExplorePageVersion5Widget.routeName,
            path: ExplorePageVersion5Widget.routePath,
            builder: (context, params) => ExplorePageVersion5Widget(),
          ),
          FFRoute(
              name: AISoundscapesCopyCopyCopyWidget.routeName,
              path: AISoundscapesCopyCopyCopyWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'AISoundscapesCopyCopyCopy')
                  : NavBarPage(
                      initialPage: 'AISoundscapesCopyCopyCopy',
                      page: AISoundscapesCopyCopyCopyWidget(
                        meditationaudio: params.getParam(
                          'meditationaudio',
                          ParamType.String,
                        ),
                      ),
                    )),
          FFRoute(
            name: ResetPageCopyWidget.routeName,
            path: ResetPageCopyWidget.routePath,
            builder: (context, params) => ResetPageCopyWidget(),
          ),
          FFRoute(
            name: CreateAccountOnboardingFlowWidget.routeName,
            path: CreateAccountOnboardingFlowWidget.routePath,
            builder: (context, params) => CreateAccountOnboardingFlowWidget(),
          ),
          FFRoute(
            name: OnboardingPageViewWidget.routeName,
            path: OnboardingPageViewWidget.routePath,
            builder: (context, params) => OnboardingPageViewWidget(),
          ),
          FFRoute(
            name: MoodScanVersion5Widget.routeName,
            path: MoodScanVersion5Widget.routePath,
            builder: (context, params) => MoodScanVersion5Widget(),
          ),
          FFRoute(
            name: TodaysHelpVersion5Widget.routeName,
            path: TodaysHelpVersion5Widget.routePath,
            builder: (context, params) => TodaysHelpVersion5Widget(),
          ),
          FFRoute(
            name: YoureAllSetPageVersion5Widget.routeName,
            path: YoureAllSetPageVersion5Widget.routePath,
            builder: (context, params) => YoureAllSetPageVersion5Widget(),
          ),
          FFRoute(
            name: CommunityGuidelinesWidget.routeName,
            path: CommunityGuidelinesWidget.routePath,
            builder: (context, params) => CommunityGuidelinesWidget(),
          ),
          FFRoute(
            name: CommunityGuidelinesCopyWidget.routeName,
            path: CommunityGuidelinesCopyWidget.routePath,
            builder: (context, params) => CommunityGuidelinesCopyWidget(),
          ),
          FFRoute(
            name: EnergyCentersGuidanceWidget.routeName,
            path: EnergyCentersGuidanceWidget.routePath,
            builder: (context, params) => EnergyCentersGuidanceWidget(),
          ),
          FFRoute(
            name: MeditationHelpWidget.routeName,
            path: MeditationHelpWidget.routePath,
            builder: (context, params) => MeditationHelpWidget(),
          ),
          FFRoute(
            name: ContactUsVersion5Widget.routeName,
            path: ContactUsVersion5Widget.routePath,
            builder: (context, params) => ContactUsVersion5Widget(),
          ),
          FFRoute(
            name: SelfCareGoalsVersion5Widget.routeName,
            path: SelfCareGoalsVersion5Widget.routePath,
            builder: (context, params) => SelfCareGoalsVersion5Widget(),
          ),
          FFRoute(
            name: ConfettiRewardBasicWidget.routeName,
            path: ConfettiRewardBasicWidget.routePath,
            builder: (context, params) => ConfettiRewardBasicWidget(),
          ),
          FFRoute(
            name: SplashHomeScreenWidget.routeName,
            path: SplashHomeScreenWidget.routePath,
            builder: (context, params) => SplashHomeScreenWidget(),
          ),
          FFRoute(
            name: ComingSoonBodyWidget.routeName,
            path: ComingSoonBodyWidget.routePath,
            builder: (context, params) => ComingSoonBodyWidget(),
          ),
          FFRoute(
            name: ComingSoonMarketplaceWidget.routeName,
            path: ComingSoonMarketplaceWidget.routePath,
            builder: (context, params) => ComingSoonMarketplaceWidget(),
          ),
          FFRoute(
            name: LucilleSuggestionsWidget.routeName,
            path: LucilleSuggestionsWidget.routePath,
            builder: (context, params) => LucilleSuggestionsWidget(),
          ),
          FFRoute(
            name: LucilleSuggestionSplashPageWidget.routeName,
            path: LucilleSuggestionSplashPageWidget.routePath,
            builder: (context, params) => LucilleSuggestionSplashPageWidget(),
          ),
          FFRoute(
            name: RewardsSplashPageWidget.routeName,
            path: RewardsSplashPageWidget.routePath,
            builder: (context, params) => RewardsSplashPageWidget(),
          ),
          FFRoute(
            name: GeneralTransitonSpalshPageWidget.routeName,
            path: GeneralTransitonSpalshPageWidget.routePath,
            builder: (context, params) => GeneralTransitonSpalshPageWidget(),
          ),
          FFRoute(
            name: LucilleSuggestionPageWidget.routeName,
            path: LucilleSuggestionPageWidget.routePath,
            builder: (context, params) => LucilleSuggestionPageWidget(
              exerciseTitle: params.getParam(
                'exerciseTitle',
                ParamType.String,
              ),
              exerciseDescription: params.getParam(
                'exerciseDescription',
                ParamType.String,
              ),
              exerciseDuration: params.getParam(
                'exerciseDuration',
                ParamType.double,
              ),
              exersiseSoundscape: params.getParam(
                'exersiseSoundscape',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: MoodSaverWidget.routeName,
            path: MoodSaverWidget.routePath,
            builder: (context, params) => MoodSaverWidget(),
          ),
          FFRoute(
            name: MoodScanHelpWidget.routeName,
            path: MoodScanHelpWidget.routePath,
            builder: (context, params) => MoodScanHelpWidget(),
          ),
          FFRoute(
            name: BeginSessionPageWidget.routeName,
            path: BeginSessionPageWidget.routePath,
            builder: (context, params) => BeginSessionPageWidget(),
          ),
          FFRoute(
            name: RespirationPageWidget.routeName,
            path: RespirationPageWidget.routePath,
            builder: (context, params) => RespirationPageWidget(),
          ),
          FFRoute(
            name: LucilleBody1PageWidget.routeName,
            path: LucilleBody1PageWidget.routePath,
            builder: (context, params) => LucilleBody1PageWidget(),
          ),
          FFRoute(
            name: CoachingSessionPageWidget.routeName,
            path: CoachingSessionPageWidget.routePath,
            builder: (context, params) => CoachingSessionPageWidget(),
          ),
          FFRoute(
            name: MoodSaverPageWidget.routeName,
            path: MoodSaverPageWidget.routePath,
            builder: (context, params) => MoodSaverPageWidget(),
          ),
          FFRoute(
            name: MoodScannerPageWidget.routeName,
            path: MoodScannerPageWidget.routePath,
            builder: (context, params) => MoodScannerPageWidget(),
          ),
          FFRoute(
            name: ScanMoodLaodingPageWidget.routeName,
            path: ScanMoodLaodingPageWidget.routePath,
            builder: (context, params) => ScanMoodLaodingPageWidget(),
          ),
          FFRoute(
            name: MoodResultPageWidget.routeName,
            path: MoodResultPageWidget.routePath,
            builder: (context, params) => MoodResultPageWidget(
              moodResult: params.getParam(
                'moodResult',
                ParamType.String,
              ),
              energyLevel: params.getParam(
                'energyLevel',
                ParamType.String,
              ),
              stressLevel: params.getParam(
                'stressLevel',
                ParamType.double,
              ),
              moodPhoto: params.getParam(
                'moodPhoto',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: WebViewSampleWidget.routeName,
            path: WebViewSampleWidget.routePath,
            builder: (context, params) => WebViewSampleWidget(),
          ),
          FFRoute(
            name: Sample2Widget.routeName,
            path: Sample2Widget.routePath,
            builder: (context, params) => Sample2Widget(),
          ),
          FFRoute(
            name: PlanetWidget.routeName,
            path: PlanetWidget.routePath,
            builder: (context, params) => PlanetWidget(),
          ),
          FFRoute(
            name: HomePageWidget.routeName,
            path: HomePageWidget.routePath,
            builder: (context, params) => HomePageWidget(),
          ),
          FFRoute(
            name: MoodScanResultVersion5Widget.routeName,
            path: MoodScanResultVersion5Widget.routePath,
            builder: (context, params) => MoodScanResultVersion5Widget(
              moodResult: params.getParam(
                'moodResult',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: MoodResultTransitionWidget.routeName,
            path: MoodResultTransitionWidget.routePath,
            builder: (context, params) => MoodResultTransitionWidget(
              moodResult: params.getParam(
                'moodResult',
                ParamType.String,
              ),
              stressLevel: params.getParam(
                'stressLevel',
                ParamType.double,
              ),
              energyLevel: params.getParam(
                'energyLevel',
                ParamType.String,
              ),
              moodPhoto: params.getParam(
                'moodPhoto',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: SoundscapesSeeAllPageWidget.routeName,
            path: SoundscapesSeeAllPageWidget.routePath,
            builder: (context, params) => SoundscapesSeeAllPageWidget(),
          ),
          FFRoute(
            name: ForgotPasswordWidget.routeName,
            path: ForgotPasswordWidget.routePath,
            builder: (context, params) => ForgotPasswordWidget(),
          ),
          FFRoute(
            name: ForgotPasswordCopyWidget.routeName,
            path: ForgotPasswordCopyWidget.routePath,
            builder: (context, params) => ForgotPasswordCopyWidget(),
          ),
          FFRoute(
            name: ComingSoonBodWidget.routeName,
            path: ComingSoonBodWidget.routePath,
            builder: (context, params) => ComingSoonBodWidget(),
          ),
          FFRoute(
              name: ExplorePageVersion5FINALWidget.routeName,
              path: ExplorePageVersion5FINALWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ExplorePageVersion5FINAL')
                  : NavBarPage(
                      initialPage: 'ExplorePageVersion5FINAL',
                      page: ExplorePageVersion5FINALWidget(),
                    )),
          FFRoute(
            name: MarketplaceVersion5Widget.routeName,
            path: MarketplaceVersion5Widget.routePath,
            builder: (context, params) => MarketplaceVersion5Widget(),
          ),
          FFRoute(
              name: LucilleHomeWidget.routeName,
              path: LucilleHomeWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'LucilleHome')
                  : NavBarPage(
                      initialPage: 'LucilleHome',
                      page: LucilleHomeWidget(),
                    )),
          FFRoute(
            name: $cupertino_time_picker_hiuzb7.HomePageWidget.routeName,
            path: $cupertino_time_picker_hiuzb7.HomePageWidget.routePath,
            builder: (context, params) =>
                $cupertino_time_picker_hiuzb7.HomePageWidget(),
          ),
          FFRoute(
            name: $tiktokfeed_wz8en7.HomePageWidget.routeName,
            path: $tiktokfeed_wz8en7.HomePageWidget.routePath,
            builder: (context, params) => $tiktokfeed_wz8en7.HomePageWidget(
              oldIndex: params.getParam(
                'oldIndex',
                ParamType.int,
              ),
              newIndex: params.getParam(
                'newIndex',
                ParamType.int,
              ),
            ),
          ),
          FFRoute(
            name: $tiktokfeed_wz8en7.Page2Widget.routeName,
            path: $tiktokfeed_wz8en7.Page2Widget.routePath,
            builder: (context, params) => $tiktokfeed_wz8en7.Page2Widget(),
          ),
          FFRoute(
            name: $tiktokfeed_wz8en7.ReelsWidget.routeName,
            path: $tiktokfeed_wz8en7.ReelsWidget.routePath,
            builder: (context, params) => $tiktokfeed_wz8en7.ReelsWidget(),
          ),
          FFRoute(
            name: $confetti_modualo_library_b75kfy.HomePageWidget.routeName,
            path: $confetti_modualo_library_b75kfy.HomePageWidget.routePath,
            builder: (context, params) =>
                $confetti_modualo_library_b75kfy.HomePageWidget(),
          ),
          FFRoute(
            name: $utility_functions_library_8g4bud.TestPageWidget.routeName,
            path: $utility_functions_library_8g4bud.TestPageWidget.routePath,
            builder: (context, params) =>
                $utility_functions_library_8g4bud.TestPageWidget(),
          ),
          FFRoute(
            name: $that_audio_player_oo85ab.HomePageWidget.routeName,
            path: $that_audio_player_oo85ab.HomePageWidget.routePath,
            builder: (context, params) =>
                $that_audio_player_oo85ab.HomePageWidget(),
          ),
          FFRoute(
            name: $that_audio_player_oo85ab.PlayerPageFocusWidget.routeName,
            path: $that_audio_player_oo85ab.PlayerPageFocusWidget.routePath,
            builder: (context, params) =>
                $that_audio_player_oo85ab.PlayerPageFocusWidget(),
          ),
          FFRoute(
            name: $that_audio_player_oo85ab.PlayerPageSleepWidget.routeName,
            path: $that_audio_player_oo85ab.PlayerPageSleepWidget.routePath,
            builder: (context, params) =>
                $that_audio_player_oo85ab.PlayerPageSleepWidget(),
          ),
          FFRoute(
            name: $that_audio_player_oo85ab.PlayerPageNatureWidget.routeName,
            path: $that_audio_player_oo85ab.PlayerPageNatureWidget.routePath,
            builder: (context, params) =>
                $that_audio_player_oo85ab.PlayerPageNatureWidget(),
          ),
          FFRoute(
            name: $that_audio_player_oo85ab
                .PlayerPageMusicMediationsWidget.routeName,
            path: $that_audio_player_oo85ab
                .PlayerPageMusicMediationsWidget.routePath,
            builder: (context, params) =>
                $that_audio_player_oo85ab.PlayerPageMusicMediationsWidget(),
          ),
          FFRoute(
            name:
                $that_audio_player_oo85ab.PlayerPageFINALAllTabWidget.routeName,
            path:
                $that_audio_player_oo85ab.PlayerPageFINALAllTabWidget.routePath,
            builder: (context, params) =>
                $that_audio_player_oo85ab.PlayerPageFINALAllTabWidget(
              currentSong: params.getParam(
                'currentSong',
                ParamType.DataStruct,
                isList: false,
                structBuilder: that_audio_player_oo85ab_data_schema
                    .MediaStruct.fromSerializableMap,
              ),
            ),
          ),
          FFRoute(
            name: $that_audio_player_oo85ab.SampleWidget.routeName,
            path: $that_audio_player_oo85ab.SampleWidget.routePath,
            builder: (context, params) =>
                $that_audio_player_oo85ab.SampleWidget(),
          ),
          FFRoute(
            name: $that_audio_player_oo85ab.PlayerPageLucilleWidget.routeName,
            path: $that_audio_player_oo85ab.PlayerPageLucilleWidget.routePath,
            builder: (context, params) =>
                $that_audio_player_oo85ab.PlayerPageLucilleWidget(
              currentSong: params.getParam(
                'currentSong',
                ParamType.DataStruct,
                isList: false,
                structBuilder: that_audio_player_oo85ab_data_schema
                    .MediaStruct.fromSerializableMap,
              ),
              lucilleAudioUrl: params.getParam(
                'lucilleAudioUrl',
                ParamType.String,
              ),
              soundscapeTitle: params.getParam(
                'soundscapeTitle',
                ParamType.String,
              ),
              soundscapeID: params.getParam(
                'soundscapeID',
                ParamType.String,
              ),
              soundscapeCategory: params.getParam(
                'soundscapeCategory',
                ParamType.String,
              ),
              sessionID: params.getParam(
                'sessionID',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: $that_slideable_list_item_mrpo3s.HomePageWidget.routeName,
            path: $that_slideable_list_item_mrpo3s.HomePageWidget.routePath,
            builder: (context, params) =>
                $that_slideable_list_item_mrpo3s.HomePageWidget(),
          )
        ].map((r) => r.toRoute(appStateNotifier)).toList(),
      ),
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
    observers: [routeObserver],
  );
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo {
    final possibleKeys = [
      '__transition_info__',
      '__transition_info__cupertino_time_picker_hiuzb7',
      '__transition_info__tiktokfeed_wz8en7',
      '__transition_info__confetti_modualo_library_b75kfy',
      '__transition_info__utility_functions_library_8g4bud',
      '__transition_info__that_audio_player_oo85ab',
      '__transition_info__that_slideable_list_item_mrpo3s'
    ];
    for (final key in possibleKeys) {
      if (extraMap.containsKey(key)) {
        return extraMap[key] as TransitionInfo;
      }
    }
    return TransitionInfo.appDefault();
  }
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashScreenVersion5';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Welcome_to_Escape.gif',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
