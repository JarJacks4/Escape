import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;

import '/index.dart';

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

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : SplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SplashScreenWidget(),
          routes: [
            FFRoute(
              name: RegistrationSuccessWidget.routeName,
              path: RegistrationSuccessWidget.routePath,
              builder: (context, params) => RegistrationSuccessWidget(),
            ),
            FFRoute(
              name: SoundsDetailsArtistWidget.routeName,
              path: SoundsDetailsArtistWidget.routePath,
              builder: (context, params) => SoundsDetailsArtistWidget(),
            ),
            FFRoute(
              name: MusicPlayerWidget.routeName,
              path: MusicPlayerWidget.routePath,
              builder: (context, params) => MusicPlayerWidget(),
            ),
            FFRoute(
              name: SoundsDetailsAlbumsWidget.routeName,
              path: SoundsDetailsAlbumsWidget.routePath,
              builder: (context, params) => SoundsDetailsAlbumsWidget(),
            ),
            FFRoute(
              name: SoundsDetailsMetaphysicsWidget.routeName,
              path: SoundsDetailsMetaphysicsWidget.routePath,
              builder: (context, params) => SoundsDetailsMetaphysicsWidget(),
            ),
            FFRoute(
              name: SoundsDetailsSleepWidget.routeName,
              path: SoundsDetailsSleepWidget.routePath,
              builder: (context, params) => SoundsDetailsSleepWidget(),
            ),
            FFRoute(
              name: SoundsDetailsKidsWidget.routeName,
              path: SoundsDetailsKidsWidget.routePath,
              builder: (context, params) => SoundsDetailsKidsWidget(),
            ),
            FFRoute(
              name: SoundsDetailsPlaylistsWidget.routeName,
              path: SoundsDetailsPlaylistsWidget.routePath,
              builder: (context, params) => SoundsDetailsPlaylistsWidget(),
            ),
            FFRoute(
              name: SoundsDetailsBinauralBeatsWidget.routeName,
              path: SoundsDetailsBinauralBeatsWidget.routePath,
              builder: (context, params) => SoundsDetailsBinauralBeatsWidget(),
            ),
            FFRoute(
              name: MeditationTeachingPagesWidget.routeName,
              path: MeditationTeachingPagesWidget.routePath,
              builder: (context, params) => MeditationTeachingPagesWidget(),
            ),
            FFRoute(
              name: LearningToMeditatePage1Widget.routeName,
              path: LearningToMeditatePage1Widget.routePath,
              builder: (context, params) => LearningToMeditatePage1Widget(),
            ),
            FFRoute(
              name: LearningToMeditatePage2Widget.routeName,
              path: LearningToMeditatePage2Widget.routePath,
              builder: (context, params) => LearningToMeditatePage2Widget(),
            ),
            FFRoute(
              name: MeditationTutorialWidget.routeName,
              path: MeditationTutorialWidget.routePath,
              builder: (context, params) => MeditationTutorialWidget(),
            ),
            FFRoute(
              name: Details14DestinationWidget.routeName,
              path: Details14DestinationWidget.routePath,
              builder: (context, params) => Details14DestinationWidget(),
            ),
            FFRoute(
              name: TimedMeditationsWidget.routeName,
              path: TimedMeditationsWidget.routePath,
              builder: (context, params) => TimedMeditationsWidget(),
            ),
            FFRoute(
              name: Details15TimerWidget.routeName,
              path: Details15TimerWidget.routePath,
              builder: (context, params) => Details15TimerWidget(),
            ),
            FFRoute(
              name: MeditationPlayerTimerWidget.routeName,
              path: MeditationPlayerTimerWidget.routePath,
              builder: (context, params) => MeditationPlayerTimerWidget(
                meditationPose: params.getParam(
                  'meditationPose',
                  ParamType.String,
                ),
                meditationPlace: params.getParam(
                  'meditationPlace',
                  ParamType.String,
                ),
                meditationTime: params.getParam(
                  'meditationTime',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: BlogsWidget.routeName,
              path: BlogsWidget.routePath,
              builder: (context, params) => BlogsWidget(),
            ),
            FFRoute(
              name: LearningToMeditatePage1Copy2Widget.routeName,
              path: LearningToMeditatePage1Copy2Widget.routePath,
              builder: (context, params) =>
                  LearningToMeditatePage1Copy2Widget(),
            ),
            FFRoute(
              name: ClassesPageWidget.routeName,
              path: ClassesPageWidget.routePath,
              builder: (context, params) => ClassesPageWidget(),
            ),
            FFRoute(
              name: EventsPageWidget.routeName,
              path: EventsPageWidget.routePath,
              builder: (context, params) => EventsPageWidget(),
            ),
            FFRoute(
              name: EventsFINALWidget.routeName,
              path: EventsFINALWidget.routePath,
              builder: (context, params) => EventsFINALWidget(
                eventsName: params.getParam(
                  'eventsName',
                  ParamType.String,
                ),
                eventDate: params.getParam(
                  'eventDate',
                  ParamType.String,
                ),
                eventDescription: params.getParam(
                  'eventDescription',
                  ParamType.String,
                ),
                eventLocation: params.getParam(
                  'eventLocation',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SoundsDetailsAmbientMusicWidget.routeName,
              path: SoundsDetailsAmbientMusicWidget.routePath,
              builder: (context, params) => SoundsDetailsAmbientMusicWidget(),
            ),
            FFRoute(
              name: SoundsDetailsNatureSoundsWidget.routeName,
              path: SoundsDetailsNatureSoundsWidget.routePath,
              builder: (context, params) => SoundsDetailsNatureSoundsWidget(),
            ),
            FFRoute(
              name: SoundsDetailsTaiChiWidget.routeName,
              path: SoundsDetailsTaiChiWidget.routePath,
              builder: (context, params) => SoundsDetailsTaiChiWidget(),
            ),
            FFRoute(
              name: NotificationsScreenWidget.routeName,
              path: NotificationsScreenWidget.routePath,
              builder: (context, params) => NotificationsScreenWidget(),
            ),
            FFRoute(
              name: SoundsDetailsAlbumsCopyWidget.routeName,
              path: SoundsDetailsAlbumsCopyWidget.routePath,
              builder: (context, params) => SoundsDetailsAlbumsCopyWidget(),
            ),
            FFRoute(
              name: EventsFirstPageWidget.routeName,
              path: EventsFirstPageWidget.routePath,
              builder: (context, params) => EventsFirstPageWidget(),
            ),
            FFRoute(
              name: SoundsDetailsBodyWidget.routeName,
              path: SoundsDetailsBodyWidget.routePath,
              builder: (context, params) => SoundsDetailsBodyWidget(),
            ),
            FFRoute(
              name: EliminateDepressionWidget.routeName,
              path: EliminateDepressionWidget.routePath,
              builder: (context, params) => EliminateDepressionWidget(),
            ),
            FFRoute(
              name: SubscriptionWidget.routeName,
              path: SubscriptionWidget.routePath,
              builder: (context, params) => SubscriptionWidget(),
            ),
            FFRoute(
              name: SubscriptionCompWidget.routeName,
              path: SubscriptionCompWidget.routePath,
              builder: (context, params) => SubscriptionCompWidget(),
            ),
            FFRoute(
              name: IncreaseFocusFINALWidget.routeName,
              path: IncreaseFocusFINALWidget.routePath,
              builder: (context, params) => IncreaseFocusFINALWidget(),
            ),
            FFRoute(
              name: ClassesAndEventsWidget.routeName,
              path: ClassesAndEventsWidget.routePath,
              builder: (context, params) => ClassesAndEventsWidget(),
            ),
            FFRoute(
              name: HomeVersion2Widget.routeName,
              path: HomeVersion2Widget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomeVersion2')
                  : HomeVersion2Widget(),
            ),
            FFRoute(
              name: NaturePAgeFINALWidget.routeName,
              path: NaturePAgeFINALWidget.routePath,
              builder: (context, params) => NaturePAgeFINALWidget(),
            ),
            FFRoute(
              name: BinauralBeatsPageWidget.routeName,
              path: BinauralBeatsPageWidget.routePath,
              builder: (context, params) => BinauralBeatsPageWidget(),
            ),
            FFRoute(
              name: BodyPageWidget.routeName,
              path: BodyPageWidget.routePath,
              builder: (context, params) => BodyPageWidget(),
            ),
            FFRoute(
              name: MeditationPageWidget.routeName,
              path: MeditationPageWidget.routePath,
              builder: (context, params) => MeditationPageWidget(),
            ),
            FFRoute(
              name: CommunityHomeWidget.routeName,
              path: CommunityHomeWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'CommunityHome')
                  : CommunityHomeWidget(),
            ),
            FFRoute(
              name: LucilleChatAIPageWidget.routeName,
              path: LucilleChatAIPageWidget.routePath,
              builder: (context, params) => LucilleChatAIPageWidget(
                deepFeelingsGemini: params.getParam(
                  'deepFeelingsGemini',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SleepPageWidget.routeName,
              path: SleepPageWidget.routePath,
              builder: (context, params) => SleepPageWidget(),
            ),
            FFRoute(
              name: LucilleChatPageWidget.routeName,
              path: LucilleChatPageWidget.routePath,
              builder: (context, params) => LucilleChatPageWidget(),
            ),
            FFRoute(
              name: LucilleChatHistoryScreenWidget.routeName,
              path: LucilleChatHistoryScreenWidget.routePath,
              builder: (context, params) => LucilleChatHistoryScreenWidget(),
            ),
            FFRoute(
              name: SplashScreenWidget.routeName,
              path: SplashScreenWidget.routePath,
              builder: (context, params) => SplashScreenWidget(),
            ),
            FFRoute(
              name: LoginPageWidget.routeName,
              path: LoginPageWidget.routePath,
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: InterestsPageWidget.routeName,
              path: InterestsPageWidget.routePath,
              builder: (context, params) => InterestsPageWidget(),
            ),
            FFRoute(
              name: DisplayNamePageWidget.routeName,
              path: DisplayNamePageWidget.routePath,
              builder: (context, params) => DisplayNamePageWidget(),
            ),
            FFRoute(
              name: ProfileDetailsWidget.routeName,
              path: ProfileDetailsWidget.routePath,
              builder: (context, params) => ProfileDetailsWidget(),
            ),
            FFRoute(
              name: DisplayNamePageCopyWidget.routeName,
              path: DisplayNamePageCopyWidget.routePath,
              builder: (context, params) => DisplayNamePageCopyWidget(),
            ),
            FFRoute(
              name: DisplayNameWidget.routeName,
              path: DisplayNameWidget.routePath,
              builder: (context, params) => DisplayNameWidget(),
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
              name: AISoundscapesWidget.routeName,
              path: AISoundscapesWidget.routePath,
              builder: (context, params) => AISoundscapesWidget(
                meditationaudio: params.getParam(
                  'meditationaudio',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AnalyzingMoodStatusPageWidget.routeName,
              path: AnalyzingMoodStatusPageWidget.routePath,
              builder: (context, params) => AnalyzingMoodStatusPageWidget(),
            ),
            FFRoute(
              name: MoodTrackHomeWidget.routeName,
              path: MoodTrackHomeWidget.routePath,
              builder: (context, params) => MoodTrackHomeWidget(),
            ),
            FFRoute(
              name: ProfileFINALWidget.routeName,
              path: ProfileFINALWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'profileFINAL')
                  : NavBarPage(
                      initialPage: 'profileFINAL',
                      page: ProfileFINALWidget(),
                    ),
            ),
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
              name: DeepFeelingsResponseWidget.routeName,
              path: DeepFeelingsResponseWidget.routePath,
              builder: (context, params) => DeepFeelingsResponseWidget(),
            ),
            FFRoute(
              name: JournalPageWidget.routeName,
              path: JournalPageWidget.routePath,
              builder: (context, params) => JournalPageWidget(),
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
              builder: (context, params) =>
                  MicrcosmicMeditationGoalPageWidget(),
            ),
            FFRoute(
              name: BlankSampleWidget.routeName,
              path: BlankSampleWidget.routePath,
              builder: (context, params) => BlankSampleWidget(),
            ),
            FFRoute(
              name: DailyMoodFaceCheckInPageWidget.routeName,
              path: DailyMoodFaceCheckInPageWidget.routePath,
              builder: (context, params) => DailyMoodFaceCheckInPageWidget(),
            ),
            FFRoute(
              name: MoodTrackHomeCopyWidget.routeName,
              path: MoodTrackHomeCopyWidget.routePath,
              builder: (context, params) => MoodTrackHomeCopyWidget(),
            ),
            FFRoute(
              name: LucilleHomeWidget.routeName,
              path: LucilleHomeWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'LucilleHome')
                  : NavBarPage(
                      initialPage: 'LucilleHome',
                      page: LucilleHomeWidget(),
                    ),
            ),
            FFRoute(
              name: SampleMusicWidget.routeName,
              path: SampleMusicWidget.routePath,
              builder: (context, params) => SampleMusicWidget(
                music: params.getParam(
                  'music',
                  ParamType.String,
                ),
              ),
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
              name: BinauralBeatsMeditationsWidget.routeName,
              path: BinauralBeatsMeditationsWidget.routePath,
              builder: (context, params) => BinauralBeatsMeditationsWidget(),
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
              name: LucilleGPTWidget.routeName,
              path: LucilleGPTWidget.routePath,
              builder: (context, params) => LucilleGPTWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

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
            return '/splashScreen';
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
                  color: FlutterFlowTheme.of(context).alternate,
                  child: Image.asset(
                    'assets/images/Logo_ESCAPE_White.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

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
