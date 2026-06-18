import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'flutter_flow/firebase_app_check_util.dart';
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

  await FlutterFlowTheme.initialize();

  await FFLocalizations.initialize();

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
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  await initializeFirebaseAppCheck();

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

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

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

    super.dispose();
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          thickness: WidgetStateProperty.all(0.2),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return Color(4287382645);
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

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomeVersion5': HomeVersion5Widget(),
      'LucilleHome': LucilleHomeWidget(),
      'ExplorePageVersion5FINAL': ExplorePageVersion5FINALWidget(),
      'AISoundscapesCopyCopyCopy': AISoundscapesCopyCopyCopyWidget(),
      'ConnectionCommunityStartPageVersion5':
          ConnectionCommunityStartPageVersion5Widget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => safeSetState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
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
                'mbg8nrnp' /* Lucille */,
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
                Icons.people_outline,
                size: 24.0,
              ),
              activeIcon: FaIcon(
                FontAwesomeIcons.peopleCarry,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                'cly8mku8' /* Community */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
