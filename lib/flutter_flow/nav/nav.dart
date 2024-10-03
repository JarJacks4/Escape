import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const StartLogoScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const NavBarPage()
              : const StartLogoScreenWidget(),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => const OnboardingWidget(),
        ),
        FFRoute(
          name: 'completeProfile',
          path: '/completeProfile',
          builder: (context, params) => const CompleteProfileWidget(),
        ),
        FFRoute(
          name: 'UserGoalsSwipeStack',
          path: '/goals',
          builder: (context, params) => const UserGoalsSwipeStackWidget(),
        ),
        FFRoute(
          name: 'registrationSuccess',
          path: '/registrationSuccess',
          builder: (context, params) => const RegistrationSuccessWidget(),
        ),
        FFRoute(
          name: 'registerSignUp',
          path: '/register1',
          builder: (context, params) => const RegisterSignUpWidget(),
        ),
        FFRoute(
          name: 'SoundsPageMain',
          path: '/soundsPageMain',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'SoundsPageMain')
              : const SoundsPageMainWidget(),
        ),
        FFRoute(
          name: 'NewHome',
          path: '/newHome',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'NewHome')
              : const NewHomeWidget(),
        ),
        FFRoute(
          name: 'BodyHome',
          path: '/bodyHome',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'BodyHome')
              : const BodyHomeWidget(),
        ),
        FFRoute(
          name: 'MeditationPageMain',
          path: '/meditationPageMain',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'MeditationPageMain')
              : const MeditationPageMainWidget(),
        ),
        FFRoute(
          name: 'MusicPlayer',
          path: '/musicPlayer',
          builder: (context, params) => const MusicPlayerWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsPlaylists',
          path: '/soundsDetailsPlaylists',
          builder: (context, params) => const SoundsDetailsPlaylistsWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsBinauralBeats',
          path: '/soundsDetailsBinauralBeats',
          builder: (context, params) => const SoundsDetailsBinauralBeatsWidget(),
        ),
        FFRoute(
          name: 'AffirmationsMainPage',
          path: '/affirmationsMainPage',
          builder: (context, params) => const AffirmationsMainPageWidget(),
        ),
        FFRoute(
          name: 'MeditationTeachingPages',
          path: '/meditationTeachingPages',
          builder: (context, params) => const MeditationTeachingPagesWidget(),
        ),
        FFRoute(
          name: 'LearningToMeditatePage1',
          path: '/learningToMeditatePage1',
          builder: (context, params) => const LearningToMeditatePage1Widget(),
        ),
        FFRoute(
          name: 'LearningToMeditatePage2',
          path: '/learningToMeditatePage2',
          builder: (context, params) => const LearningToMeditatePage2Widget(),
        ),
        FFRoute(
          name: 'MeditationTutorial',
          path: '/meditationTutorial',
          builder: (context, params) => const MeditationTutorialWidget(),
        ),
        FFRoute(
          name: 'Details14Destination',
          path: '/details14Destination',
          builder: (context, params) => const Details14DestinationWidget(),
        ),
        FFRoute(
          name: 'TimedMeditations',
          path: '/timedMeditations',
          builder: (context, params) => const TimedMeditationsWidget(),
        ),
        FFRoute(
          name: 'Details15Timer',
          path: '/details15Timer',
          builder: (context, params) => const Details15TimerWidget(),
        ),
        FFRoute(
          name: 'MeditationPlayerTimer',
          path: '/meditationPlayerTimer',
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
          path: '/blogs',
          builder: (context, params) => const BlogsWidget(),
        ),
        FFRoute(
          name: 'BlogsHome',
          path: '/blogsHome',
          builder: (context, params) => const BlogsHomeWidget(),
        ),
        FFRoute(
          name: 'LearningToMeditatePage1Copy2',
          path: '/learningToMeditatePage1Copy2',
          builder: (context, params) => const LearningToMeditatePage1Copy2Widget(),
        ),
        FFRoute(
          name: 'UserCommunityPageView',
          path: '/userCommunityPageView',
          builder: (context, params) => const UserCommunityPageViewWidget(),
        ),
        FFRoute(
          name: 'UserCommunityOnboarding',
          path: '/userCommunityOnboarding',
          builder: (context, params) => const UserCommunityOnboardingWidget(),
        ),
        FFRoute(
          name: 'ClassesPage',
          path: '/classesPage',
          builder: (context, params) => const ClassesPageWidget(),
        ),
        FFRoute(
          name: 'StartLogoScreen',
          path: '/startLogoScreen',
          builder: (context, params) => const StartLogoScreenWidget(),
        ),
        FFRoute(
          name: 'ProfilePage2',
          path: '/profilePage2',
          builder: (context, params) => const ProfilePage2Widget(),
        ),
        FFRoute(
          name: 'EventsFINAL',
          path: '/eventsFINAL',
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
            eventPrice: params.getParam(
              'eventPrice',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'completeProfileFINAL',
          path: '/completeProfileCopy',
          builder: (context, params) => const CompleteProfileFINALWidget(),
        ),
        FFRoute(
          name: 'UpliftandAwareness',
          path: '/upliftandAwareness',
          builder: (context, params) => const UpliftandAwarenessWidget(),
        ),
        FFRoute(
          name: 'IncreaseFocus',
          path: '/increaseFocus',
          builder: (context, params) => const IncreaseFocusWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsAmbientMusic',
          path: '/soundsDetailsAmbientMusic',
          builder: (context, params) => const SoundsDetailsAmbientMusicWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsNatureSounds',
          path: '/soundsDetailsNatureSounds',
          builder: (context, params) => const SoundsDetailsNatureSoundsWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsTaiChi',
          path: '/soundsDetailsTaiChi',
          builder: (context, params) => const SoundsDetailsTaiChiWidget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => const ProfilePageWidget(),
        ),
        FFRoute(
          name: 'ProfilePage3',
          path: '/profilePage3',
          builder: (context, params) => const ProfilePage3Widget(),
        ),
        FFRoute(
          name: 'notificationsScreen',
          path: '/notificationsScreen',
          builder: (context, params) => const NotificationsScreenWidget(),
        ),
        FFRoute(
          name: 'Home15Store',
          path: '/home15Store',
          builder: (context, params) => const Home15StoreWidget(),
        ),
        FFRoute(
          name: 'fetchapi',
          path: '/fetchapi',
          builder: (context, params) => const FetchapiWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsBody',
          path: '/soundsDetailsBody',
          builder: (context, params) => const SoundsDetailsBodyWidget(),
        ),
        FFRoute(
          name: 'EliminateDepression',
          path: '/eliminateDepression',
          builder: (context, params) => const EliminateDepressionWidget(),
        ),
        FFRoute(
          name: 'UsingVibration',
          path: '/usingVibration',
          builder: (context, params) => const UsingVibrationWidget(),
        ),
        FFRoute(
          name: 'HelpAnxiety',
          path: '/helpAnxiety',
          builder: (context, params) => const HelpAnxietyWidget(),
        ),
        FFRoute(
          name: 'KemeticYoga',
          path: '/kemeticYoga',
          builder: (context, params) => const KemeticYogaWidget(),
        ),
        FFRoute(
          name: 'YogaPoseVideos',
          path: '/yogaPoseVideos',
          builder: (context, params) => const YogaPoseVideosWidget(),
        ),
        FFRoute(
          name: 'BeginnersYoga',
          path: '/beginnersYoga',
          builder: (context, params) => const BeginnersYogaWidget(),
        ),
        FFRoute(
          name: 'youtubetestFINAL',
          path: '/youtubetestFINAL',
          builder: (context, params) => YoutubetestFINALWidget(
            videoid: params.getParam(
              'videoid',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            channelTitle: params.getParam(
              'channelTitle',
              ParamType.String,
            ),
            videoTitle: params.getParam(
              'videoTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SelfCareAIPromo',
          path: '/selfCareAIPromo',
          builder: (context, params) => const SelfCareAIPromoWidget(),
        ),
        FFRoute(
          name: 'UserCommunityPageViewFINALCopy',
          path: '/userCommunityPageViewFINALCopy',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'UserCommunityPageViewFINALCopy')
              : const UserCommunityPageViewFINALCopyWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsFireSounds',
          path: '/soundsDetailsFireSounds',
          builder: (context, params) => const SoundsDetailsFireSoundsWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsThunderstorms',
          path: '/soundsDetailsThunderstorms',
          builder: (context, params) => const SoundsDetailsThunderstormsWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsTaiChiForm8',
          path: '/soundsDetailsTaiChiForm8',
          builder: (context, params) => const SoundsDetailsTaiChiForm8Widget(),
        ),
        FFRoute(
          name: 'SoundsDetailsTaiChQigong',
          path: '/soundsDetailsTaiChQigong',
          builder: (context, params) => const SoundsDetailsTaiChQigongWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsTaiChMindfulness',
          path: '/soundsDetailsTaiChMindfulness',
          builder: (context, params) => const SoundsDetailsTaiChMindfulnessWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsTaiChSpirit',
          path: '/soundsDetailsTaiChSpirit',
          builder: (context, params) => const SoundsDetailsTaiChSpiritWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsDarkAmbient',
          path: '/soundsDetailsDarkAmbient',
          builder: (context, params) => const SoundsDetailsDarkAmbientWidget(),
        ),
        FFRoute(
          name: 'EventsAndClassesFirstPageFINAL',
          path: '/eventsAndClassesFirstPageFINAL',
          builder: (context, params) => const EventsAndClassesFirstPageFINALWidget(),
        ),
        FFRoute(
          name: 'ClassesFINAL',
          path: '/classesFINAL',
          builder: (context, params) => ClassesFINALWidget(
            classesName: params.getParam(
              'classesName',
              ParamType.String,
            ),
            classDate: params.getParam(
              'classDate',
              ParamType.String,
            ),
            classDescription: params.getParam(
              'classDescription',
              ParamType.String,
            ),
            classPrice: params.getParam(
              'classPrice',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'SoundsDetailsGuidedMeditations',
          path: '/soundsDetailsGuidedMeditations',
          builder: (context, params) => const SoundsDetailsGuidedMeditationsWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsSleep',
          path: '/soundsDetailsSleep',
          builder: (context, params) => const SoundsDetailsSleepWidget(),
        ),
        FFRoute(
          name: 'SoundsDetailsGrounding',
          path: '/soundsDetailsGrounding',
          builder: (context, params) => const SoundsDetailsGroundingWidget(),
        ),
        FFRoute(
          name: 'registerSignInFINAL',
          path: '/register2',
          builder: (context, params) => const RegisterSignInFINALWidget(),
        ),
        FFRoute(
          name: 'subscriptionProfilePage',
          path: '/subscriptionProfilePage',
          builder: (context, params) => const SubscriptionProfilePageWidget(),
        ),
        FFRoute(
          name: 'CheckoutSubscriptionBottomSheet',
          path: '/checkoutSubscriptionBottomSheet',
          builder: (context, params) => const CheckoutSubscriptionBottomSheetWidget(),
        )
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
            return '/startLogoScreen';
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
                  color: const Color(0xFF000220),
                  child: Image.asset(
                    'assets/images/ESCAPE_Logo_Clear.png',
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
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
