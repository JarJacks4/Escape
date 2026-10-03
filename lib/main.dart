import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'flutter_flow/firebase_app_check_util.dart';
import 'flutter_flow/quest_reminder_service.dart';
import 'flutter_flow/quest_sync_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'index.dart';

import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;

import '/app_events/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await initFirebase();

  await FFLocalizations.initialize();
  try {
    await QuestReminderService.initialize();
  } catch (error) {
    debugPrint('Could not initialize Quest reminders at startup: $error');
  }

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  final cupertino_time_picker_hiuzb7AppState =
      cupertino_time_picker_hiuzb7_app_state.FFAppState();
  await cupertino_time_picker_hiuzb7AppState.initializePersistedState();

  final tiktokfeed_wz8en7AppState = tiktokfeed_wz8en7_app_state.FFAppState();
  await tiktokfeed_wz8en7AppState.initializePersistedState();

  final confetti_modualo_library_b75kfyAppState =
      confetti_modualo_library_b75kfy_app_state.FFAppState();
  await confetti_modualo_library_b75kfyAppState.initializePersistedState();

  final that_audio_player_oo85abAppState =
      that_audio_player_oo85ab_app_state.FFAppState();
  await that_audio_player_oo85abAppState.initializePersistedState();

  if (!kIsWeb) {
    FlutterError.onError = (details) {
      if (kDebugMode) FlutterError.presentError(details);
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    };
  }

  await initializeFirebaseAppCheck();
  QuestSyncService.instance.start(appState);

  FFAppEventService.instance.init(onGlobalEvent: handleGlobalEvent);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => appState,
      ),
      ChangeNotifierProvider(
        create: (context) => cupertino_time_picker_hiuzb7AppState,
      ),
      ChangeNotifierProvider(
        create: (context) => tiktokfeed_wz8en7AppState,
      ),
      ChangeNotifierProvider(
        create: (context) => confetti_modualo_library_b75kfyAppState,
      ),
      ChangeNotifierProvider(
        create: (context) => that_audio_player_oo85abAppState,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();

  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.path;
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen(
    (_) {},
    // Registering a token can fail for reasons outside the app's control.
    // Swallow it so it can't surface as an unhandled zone error on login.
    onError: (e) => print('Error registering FCM token: $e'),
  );

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = escapeFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 7000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Escape',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        Locale('es'),
        Locale('it'),
        Locale('fr'),
        Locale('de'),
        Locale('ru'),
        Locale('ja'),
        Locale('ar'),
        Locale('uk'),
        Locale('ko'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          thickness: WidgetStateProperty.all(0.2),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return Color(4293952282);
            }
            if (states.contains(WidgetState.hovered)) {
              return Color(3053241442);
            }
            return Color(2082219076);
          }),
        ),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key? key,
    this.initialPage,
    this.page,
    this.disableResizeToAvoidBottomInset = false,
  }) : super(key: key);

  final String? initialPage;
  final Widget? page;
  final bool disableResizeToAvoidBottomInset;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomeVersion5';
  late Widget? _currentPage;
  final _tabs = <String, Widget>{
    'HomeVersion5': HomeVersion5Widget(),
    'LucilleHome': LucilleHomeWidget(),
    'ExplorePageVersion5FINAL': ExplorePageVersion5FINALWidget(),
    'AISoundscapesFINAL': AISoundscapesFINALWidget(),
    'MarketplaceVersion5': MarketplaceVersion5Widget(),
  };
  final _visitedPages = <String>{};

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
    if (_tabs.containsKey(_currentPageName)) {
      if (_currentPage != null) {
        _tabs[_currentPageName] = _currentPage!;
        _currentPage = null;
      }
      _visitedPages.add(_currentPageName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: _currentPage ??
          IndexedStack(
            index: currentIndex < 0 ? null : currentIndex,
            children: _tabs.entries.map((entry) {
              final isActive = entry.key == _currentPageName;
              return TickerMode(
                enabled: isActive,
                child: HeroMode(
                  enabled: isActive,
                  child: ExcludeFocus(
                    excluding: !isActive,
                    child: _visitedPages.contains(entry.key)
                        ? entry.value
                        : const SizedBox.shrink(),
                  ),
                ),
              );
            }).toList(),
          ),
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex < 0 ? 0 : currentIndex,
          onTap: (i) => safeSetState(() {
            _currentPage = null;
            _currentPageName = _tabs.keys.toList()[i];
            _visitedPages.add(_currentPageName);
          }),
          backgroundColor: Color(0xBDEDF1F7),
          selectedItemColor: FlutterFlowTheme.of(context).accent1,
          unselectedItemColor: Color(0xA55A5C60),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                'vq4xsokl' /* Home */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FFIcons.ksparkleStarAi,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                'uw8vfq28' /* Lucille */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                'hfk8faw6' /* Explore */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FFIcons.kmusic1,
              ),
              activeIcon: Icon(
                Icons.surround_sound,
              ),
              label: FFLocalizations.of(context).getText(
                's8tgji9v' /* Sound */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FFIcons.kmarket,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                '6kelildm' /* Market */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
