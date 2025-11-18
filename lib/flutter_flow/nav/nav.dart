import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:tiktokfeed_wz8en7/index.dart' as $tiktokfeed_wz8en7;

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
  $tiktokfeed_wz8en7.initializeRoutes(
    homePageWidgetName: 'tiktokfeed_wz8en7.HomePage',
    homePageWidgetPath: 'homePage1',
    page2WidgetName: 'tiktokfeed_wz8en7.page2',
    page2WidgetPath: 'page2',
    reelsWidgetName: 'tiktokfeed_wz8en7.Reels',
    reelsWidgetPath: 'Reels',
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
            name: MeditationTutorialWidget.routeName,
            path: MeditationTutorialWidget.routePath,
            builder: (context, params) => MeditationTutorialWidget(),
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
            name: HomeVersion4Widget.routeName,
            path: HomeVersion4Widget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'HomeVersion4')
                : HomeVersion4Widget(),
          ),
          FFRoute(
            name: LoginPageWidget.routeName,
            path: LoginPageWidget.routePath,
            builder: (context, params) => LoginPageWidget(
              tabBarIndex: params.getParam(
                'tabBarIndex',
                ParamType.int,
              ),
            ),
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
            name: AnalyzingMoodStatusPageWidget.routeName,
            path: AnalyzingMoodStatusPageWidget.routePath,
            builder: (context, params) => AnalyzingMoodStatusPageWidget(),
          ),
          FFRoute(
              name: ProfileFINALWidget.routeName,
              path: ProfileFINALWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'profileFINAL')
                  : NavBarPage(
                      initialPage: 'profileFINAL',
                      page: ProfileFINALWidget(),
                    )),
          FFRoute(
            name: SelfCarePlanPageWidget.routeName,
            path: SelfCarePlanPageWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'SelfCarePlanPage')
                : SelfCarePlanPageWidget(),
          ),
          FFRoute(
            name: RecommendationsPageWidget.routeName,
            path: RecommendationsPageWidget.routePath,
            builder: (context, params) => RecommendationsPageWidget(),
          ),
          FFRoute(
            name: JournalPageFINALWidget.routeName,
            path: JournalPageFINALWidget.routePath,
            builder: (context, params) => JournalPageFINALWidget(),
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
            name: DailyMoodFaceCheckInPageWidget.routeName,
            path: DailyMoodFaceCheckInPageWidget.routePath,
            builder: (context, params) => DailyMoodFaceCheckInPageWidget(),
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
            name: TherapistDirectoryWidget.routeName,
            path: TherapistDirectoryWidget.routePath,
            builder: (context, params) => TherapistDirectoryWidget(),
          ),
          FFRoute(
            name: CommunityHomeCopyWidget.routeName,
            path: CommunityHomeCopyWidget.routePath,
            builder: (context, params) => CommunityHomeCopyWidget(),
          ),
          FFRoute(
            name: CommunityHomeVersion5Widget.routeName,
            path: CommunityHomeVersion5Widget.routePath,
            builder: (context, params) => CommunityHomeVersion5Widget(),
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
            name: CommunityHomeFINALWidget.routeName,
            path: CommunityHomeFINALWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'CommunityHomeFINAL')
                : CommunityHomeFINALWidget(
                    forYouIndex: params.getParam(
                      'forYouIndex',
                      ParamType.int,
                    ),
                    breathingIndex: params.getParam(
                      'breathingIndex',
                      ParamType.int,
                    ),
                    bodyIndex: params.getParam(
                      'bodyIndex',
                      ParamType.int,
                    ),
                    initialTabIndex: params.getParam(
                      'initialTabIndex',
                      ParamType.int,
                    ),
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
            name: BlankSampleWidget.routeName,
            path: BlankSampleWidget.routePath,
            builder: (context, params) => BlankSampleWidget(),
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
            name: MeditationReorderWidget.routeName,
            path: MeditationReorderWidget.routePath,
            builder: (context, params) => MeditationReorderWidget(
              tabIndex: params.getParam(
                'tabIndex',
                ParamType.int,
              ),
            ),
          ),
          FFRoute(
            name: FocusReorderWidget.routeName,
            path: FocusReorderWidget.routePath,
            builder: (context, params) => FocusReorderWidget(
              tabIndex: params.getParam(
                'tabIndex',
                ParamType.int,
              ),
            ),
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
            name: JournalPageFINALCopyWidget.routeName,
            path: JournalPageFINALCopyWidget.routePath,
            builder: (context, params) => JournalPageFINALCopyWidget(),
          ),
          FFRoute(
            name: SoundscapesHomeFinalWidget.routeName,
            path: SoundscapesHomeFinalWidget.routePath,
            builder: (context, params) => SoundscapesHomeFinalWidget(),
          ),
          FFRoute(
            name: MusicPlayerWidget.routeName,
            path: MusicPlayerWidget.routePath,
            builder: (context, params) => MusicPlayerWidget(),
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
            name: EscapeInnerverseWebViewWidget.routeName,
            path: EscapeInnerverseWebViewWidget.routePath,
            builder: (context, params) => EscapeInnerverseWebViewWidget(),
          ),
          FFRoute(
            name: JournalVersion5Widget.routeName,
            path: JournalVersion5Widget.routePath,
            builder: (context, params) => JournalVersion5Widget(),
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
            name: WorldsAndRealmsUnrealEngineWidget.routeName,
            path: WorldsAndRealmsUnrealEngineWidget.routePath,
            builder: (context, params) => WorldsAndRealmsUnrealEngineWidget(),
          ),
          FFRoute(
            name: MoodTrackingLoadingPageWidget.routeName,
            path: MoodTrackingLoadingPageWidget.routePath,
            builder: (context, params) => MoodTrackingLoadingPageWidget(),
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
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
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
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).alternate,
                      child: Image.asset(
                        'assets/images/Logo_ESCAPE_White.png',
                        fit: BoxFit.contain,
                      ),
                    )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
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
              : MaterialPage(key: state.pageKey, child: child);
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
