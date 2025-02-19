import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

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
              name: 'registrationSuccess',
              path: 'registrationSuccess',
              builder: (context, params) => RegistrationSuccessWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsArtist',
              path: 'soundsDetailsArtist',
              builder: (context, params) => SoundsDetailsArtistWidget(),
            ),
            FFRoute(
              name: 'MusicPlayer',
              path: 'musicPlayer',
              builder: (context, params) => MusicPlayerWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsAlbums',
              path: 'soundsDetailsAlbums',
              builder: (context, params) => SoundsDetailsAlbumsWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsMetaphysics',
              path: 'soundsDetailsMetaphysics',
              builder: (context, params) => SoundsDetailsMetaphysicsWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsSleep',
              path: 'soundsDetailsSleep',
              builder: (context, params) => SoundsDetailsSleepWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsKids',
              path: 'soundsDetailsKids',
              builder: (context, params) => SoundsDetailsKidsWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsPlaylists',
              path: 'soundsDetailsPlaylists',
              builder: (context, params) => SoundsDetailsPlaylistsWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsBinauralBeats',
              path: 'soundsDetailsBinauralBeats',
              builder: (context, params) => SoundsDetailsBinauralBeatsWidget(),
            ),
            FFRoute(
              name: 'MeditationTeachingPages',
              path: 'meditationTeachingPages',
              builder: (context, params) => MeditationTeachingPagesWidget(),
            ),
            FFRoute(
              name: 'LearningToMeditatePage1',
              path: 'learningToMeditatePage1',
              builder: (context, params) => LearningToMeditatePage1Widget(),
            ),
            FFRoute(
              name: 'LearningToMeditatePage2',
              path: 'learningToMeditatePage2',
              builder: (context, params) => LearningToMeditatePage2Widget(),
            ),
            FFRoute(
              name: 'MeditationTutorial',
              path: 'meditationTutorial',
              builder: (context, params) => MeditationTutorialWidget(),
            ),
            FFRoute(
              name: 'Details14Destination',
              path: 'details14Destination',
              builder: (context, params) => Details14DestinationWidget(),
            ),
            FFRoute(
              name: 'TimedMeditations',
              path: 'timedMeditations',
              builder: (context, params) => TimedMeditationsWidget(),
            ),
            FFRoute(
              name: 'Details15Timer',
              path: 'details15Timer',
              builder: (context, params) => Details15TimerWidget(),
            ),
            FFRoute(
              name: 'MeditationPlayerTimer',
              path: 'meditationPlayerTimer',
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
              name: 'Blogs',
              path: 'blogs',
              builder: (context, params) => BlogsWidget(),
            ),
            FFRoute(
              name: 'LearningToMeditatePage1Copy2',
              path: 'learningToMeditatePage1Copy2',
              builder: (context, params) =>
                  LearningToMeditatePage1Copy2Widget(),
            ),
            FFRoute(
              name: 'ClassesPage',
              path: 'classesPage',
              builder: (context, params) => ClassesPageWidget(),
            ),
            FFRoute(
              name: 'EventsPage',
              path: 'eventsPage',
              builder: (context, params) => EventsPageWidget(),
            ),
            FFRoute(
              name: 'EventsFINAL',
              path: 'eventsFINAL',
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
              name: 'SoundsDetailsAmbientMusic',
              path: 'soundsDetailsAmbientMusic',
              builder: (context, params) => SoundsDetailsAmbientMusicWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsNatureSounds',
              path: 'soundsDetailsNatureSounds',
              builder: (context, params) => SoundsDetailsNatureSoundsWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsTaiChi',
              path: 'soundsDetailsTaiChi',
              builder: (context, params) => SoundsDetailsTaiChiWidget(),
            ),
            FFRoute(
              name: 'notificationsScreen',
              path: 'notificationsScreen',
              builder: (context, params) => NotificationsScreenWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsAlbumsCopy',
              path: 'soundsDetailsAlbumsCopy',
              builder: (context, params) => SoundsDetailsAlbumsCopyWidget(),
            ),
            FFRoute(
              name: 'EventsFirstPage',
              path: 'eventsFirstPage',
              builder: (context, params) => EventsFirstPageWidget(),
            ),
            FFRoute(
              name: 'SoundsDetailsBody',
              path: 'soundsDetailsBody',
              builder: (context, params) => SoundsDetailsBodyWidget(),
            ),
            FFRoute(
              name: 'EliminateDepression',
              path: 'eliminateDepression',
              builder: (context, params) => EliminateDepressionWidget(),
            ),
            FFRoute(
              name: 'subscription',
              path: 'subscription',
              builder: (context, params) => SubscriptionWidget(),
            ),
            FFRoute(
              name: 'SubscriptionComp',
              path: 'subscriptionComp',
              builder: (context, params) => SubscriptionCompWidget(),
            ),
            FFRoute(
              name: 'IncreaseFocusFINAL',
              path: 'increaseFocusFINAL',
              builder: (context, params) => IncreaseFocusFINALWidget(),
            ),
            FFRoute(
              name: 'ClassesAndEvents',
              path: 'classesAndEvents',
              builder: (context, params) => ClassesAndEventsWidget(),
            ),
            FFRoute(
              name: 'HomeVersion2',
              path: 'homeVersion2',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomeVersion2')
                  : HomeVersion2Widget(),
            ),
            FFRoute(
              name: 'NaturePAgeFINAL',
              path: 'naturePAgeFINAL',
              builder: (context, params) => NaturePAgeFINALWidget(),
            ),
            FFRoute(
              name: 'BinauralBeatsPage',
              path: 'binauralBeatsPage',
              builder: (context, params) => BinauralBeatsPageWidget(),
            ),
            FFRoute(
              name: 'BodyPage',
              path: 'bodyPage',
              builder: (context, params) => BodyPageWidget(),
            ),
            FFRoute(
              name: 'MeditationPage',
              path: 'meditationPage',
              builder: (context, params) => MeditationPageWidget(),
            ),
            FFRoute(
              name: 'ProviderCommunityHome',
              path: 'providerCommunityHome',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ProviderCommunityHome')
                  : ProviderCommunityHomeWidget(),
            ),
            FFRoute(
              name: 'LucilleChatAIPage',
              path: 'lucilleChatAIPage',
              builder: (context, params) => LucilleChatAIPageWidget(
                deepFeelingsGemini: params.getParam(
                  'deepFeelingsGemini',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'SleepPage',
              path: 'sleepPage',
              builder: (context, params) => SleepPageWidget(),
            ),
            FFRoute(
              name: 'LucilleChatPage',
              path: 'lucilleChatPage',
              builder: (context, params) => LucilleChatPageWidget(),
            ),
            FFRoute(
              name: 'LucilleChatHistoryScreen',
              path: 'lucilleChatHistoryScreen',
              builder: (context, params) => LucilleChatHistoryScreenWidget(),
            ),
            FFRoute(
              name: 'splashScreen',
              path: 'splashScreen',
              builder: (context, params) => SplashScreenWidget(),
            ),
            FFRoute(
              name: 'loginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'InterestsPage',
              path: 'interestsPage',
              builder: (context, params) => InterestsPageWidget(),
            ),
            FFRoute(
              name: 'DisplayNamePage',
              path: 'displayNamePage',
              builder: (context, params) => DisplayNamePageWidget(),
            ),
            FFRoute(
              name: 'ProfileDetails',
              path: 'profileDetails',
              builder: (context, params) => ProfileDetailsWidget(),
            ),
            FFRoute(
              name: 'DisplayNamePageCopy',
              path: 'displayNamePageCopy',
              builder: (context, params) => DisplayNamePageCopyWidget(),
            ),
            FFRoute(
              name: 'DisplayName',
              path: 'displayName',
              builder: (context, params) => DisplayNameWidget(),
            ),
            FFRoute(
              name: 'SelfCareGoals',
              path: 'selfCareGoals',
              builder: (context, params) => SelfCareGoalsWidget(),
            ),
            FFRoute(
              name: 'EnableNotifications',
              path: 'enableNotifications',
              builder: (context, params) => EnableNotificationsWidget(),
            ),
            FFRoute(
              name: 'AISoundscapes',
              path: 'aISoundscapes',
              builder: (context, params) => AISoundscapesWidget(),
            ),
            FFRoute(
              name: 'AnalyzingMoodStatusPage',
              path: 'analyzingMoodStatusPage',
              builder: (context, params) => AnalyzingMoodStatusPageWidget(),
            ),
            FFRoute(
              name: 'MoodTrackHome',
              path: 'moodTrackHome',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MoodTrackHome')
                  : MoodTrackHomeWidget(),
            ),
            FFRoute(
              name: 'profileFINAL',
              path: 'profileFINAL',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'profileFINAL')
                  : ProfileFINALWidget(),
            ),
            FFRoute(
              name: 'SelfCarePlanPage',
              path: 'selfCarePlanPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SelfCarePlanPage')
                  : SelfCarePlanPageWidget(),
            ),
            FFRoute(
              name: 'RecommendationsPage',
              path: 'recommendationsPage',
              builder: (context, params) => RecommendationsPageWidget(),
            ),
            FFRoute(
              name: 'DeepFeelingsResponse',
              path: 'deepFeelingsResponse',
              builder: (context, params) => DeepFeelingsResponseWidget(),
            ),
            FFRoute(
              name: 'JournalPage',
              path: 'journalPage',
              builder: (context, params) => JournalPageWidget(),
            ),
            FFRoute(
              name: 'MeditationChoicePage',
              path: 'meditationChoicePage',
              builder: (context, params) => MeditationChoicePageWidget(),
            ),
            FFRoute(
              name: 'BreathingChoicePage',
              path: 'breathingChoicePage',
              builder: (context, params) => BreathingChoicePageWidget(),
            ),
            FFRoute(
              name: 'BasicBreathingGoalPage',
              path: 'basicBreathingGoalPage',
              builder: (context, params) => BasicBreathingGoalPageWidget(),
            ),
            FFRoute(
              name: 'CalmBreathing',
              path: 'calmBreathing',
              builder: (context, params) => CalmBreathingWidget(),
            ),
            FFRoute(
              name: 'MicrcosmicMeditationGoalPage',
              path: 'micrcosmicMeditationGoalPage',
              builder: (context, params) =>
                  MicrcosmicMeditationGoalPageWidget(),
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
