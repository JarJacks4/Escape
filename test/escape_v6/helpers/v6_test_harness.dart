// Shared test harness for the Escape v6 suites (unit + widget).
//
// What it fakes, and why:
//   * V6Api.transport     -> FakeApi: records every /v1 call and answers from canned payloads
//                            (or {'ok': false, 'status': 0} when offline).
//   * Firebase core/auth  -> in-memory mocks, so `FirebaseAuth.instance.currentUser` is simply null
//                            (onboarding, V6Store.firstName and V6Api.chat read it).
//   * video_player        -> a platform that refuses to create decoders (orbs stay on the poster,
//                            V6VideoPool's error path runs, nothing hangs).
//   * Platform channels   -> haptics, url_launcher, path_provider, audio_session, just_audio,
//                            permission_handler, local notifications: answered with harmless values.
//   * Fonts               -> the real Work Sans + Gilda Display are loaded, so the overflow checks
//                            measure the same glyph widths as a phone (not the square test font).
//
// Every v6 page is pumped inside a real GoRouter (the same V6TransitionPage nav.dart uses), so
// v6Open / pushNamed / pushReplacementNamed / goNamed('_initialize') behave like the app.
import 'dart:async';
import 'dart:io';

import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:video_player_platform_interface/video_player_platform_interface.dart';

import 'package:escape/escape_v6/v6.dart';
import 'package:escape/escape_v6/screens/checkin/v6_checkin_parts.dart' show V6OrbCta;
import 'package:escape/escape_v6/v6_pages.dart';

// ───────────────────────── fake API transport ─────────────────────────

class ApiCall {
  ApiCall(this.method, this.path, this.body);
  final String method;
  final String path;
  final dynamic body;

  String get key => '$method $path';

  @override
  String toString() => '$method $path ${body ?? ''}';
}

typedef ApiResponder = dynamic Function(ApiCall call);

Map<String, dynamic> ok([Map<String, dynamic> data = const {}]) => {'ok': true, 'status': 200, 'data': data};

const Map<String, dynamic> kOffline = {'ok': false, 'status': 0};

/// Records every call. Responders are matched by prefix of "METHOD /path?query" (longest wins).
class FakeApi {
  FakeApi({this.offline = false});

  final List<ApiCall> calls = [];
  final Map<String, ApiResponder> _routes = {};
  bool offline;

  void on(String methodAndPathPrefix, ApiResponder responder) => _routes[methodAndPathPrefix] = responder;

  /// Same as [on] but with a fixed response.
  void reply(String methodAndPathPrefix, Map<String, dynamic> response) => on(methodAndPathPrefix, (_) => response);

  Future<dynamic> transport(String method, String path, dynamic body) async {
    final c = ApiCall(method, path, body);
    calls.add(c);
    if (offline) return kOffline;
    String? best;
    for (final k in _routes.keys) {
      if (c.key.startsWith(k) && (best == null || k.length > best.length)) best = k;
    }
    if (best != null) return _routes[best]!(c);
    return ok();
  }

  Iterable<ApiCall> where(String method, String pathPrefix) =>
      calls.where((c) => c.method == method && c.path.startsWith(pathPrefix));

  /// Installs this fake as V6Api.transport and restores the real one after the test.
  FakeApi install() {
    final previous = V6Api.transport;
    V6Api.transport = transport;
    addTearDown(() => V6Api.transport = previous);
    return this;
  }
}

/// Realistic /v1/home payload (shape of the Lucille API).
Map<String, dynamic> homePayload({
  int coins = 120,
  int streakDays = 4,
  List<Map<String, dynamic>>? todayPlan,
}) =>
    ok({
      'displayName': 'Alex Rivera',
      'coins': coins,
      'streakDays': streakDays,
      'suggestion': {
        'title': 'Box Breathing',
        'why': 'You said work feels heavy today',
        'deeplink': {
          'route': 'v6Exercise',
          'params': {'id': 'box-breathing'}
        },
      },
      'todayPlan': todayPlan ??
          [
            {
              'planId': 'plan-7',
              'itemId': 'i1',
              'title': 'Walk for 10 minutes',
              'minutes': 10,
              'done': false,
              'deeplink': {'route': 'v6Body'},
            },
            {'planId': 'plan-7', 'itemId': 'i2', 'label': 'Drink a glass of water', 'done': true},
          ],
    });

/// A FakeApi answering every endpoint the v6 pages read with realistic payloads.
FakeApi onlineApi() {
  final api = FakeApi();
  api.reply('GET /v1/home', homePayload());
  api.reply(
      'GET /v1/me/progress',
      ok({
        'streakDays': 4,
        'bestStreak': 9,
        'recentDays': <String>[],
        'coins': 120,
        'lifetimeCoins': 860,
        'energy': {
          'level': 2,
          'step': 640,
          'coinsToNext': 140,
          'current': {'name': 'Sacral', 'chakra': 'Svadhisthana', 'color': '#EF7702'},
          'next': {'name': 'Solar Plexus'},
          'centers': ['root', 'sacral', 'solar', 'heart', 'throat', 'third-eye', 'crown'],
        },
      }));
  api.reply('GET /v1/mood/checkins', ok({'items': <Map<String, dynamic>>[]}));
  api.reply('GET /v1/mood/summary', ok({'entries': 0, 'caption': null}));
  api.reply('POST /v1/mood/checkins', ok({'id': 'c1', 'orb': {'loop': 'escape_calm_e50_t15_v3'}}));
  api.reply('POST /v1/sessions/complete', ok({'coinsAwarded': 10, 'coins': 130, 'streakDays': 5}));
  api.on('POST /v1/selfcare/plans/', (_) => ok({'coinsAwarded': 5}));
  // Consents behave like the server: PUT merges, both answer with every flag.
  final flags = <String, bool>{'wellbeing_data': true, 'ai_reflection': false, 'personalization': false};
  api.on('GET /v1/privacy/consents',
      (_) => ok({'flags': Map.of(flags), 'restricted': false, 'policyVersion': '2026-09'}));
  api.on('PUT /v1/privacy/consents', (c) {
    final f = (c.body as Map?)?['flags'];
    if (f is Map) f.forEach((k, v) => flags[k.toString()] = v == true);
    return ok({'flags': Map.of(flags)});
  });
  api.reply(
      'GET /v1/privacy/purposes',
      ok({
        'purposes': [
          {'key': 'wellbeing_data', 'label': 'Save my check-ins'},
          {'key': 'ai_reflection', 'label': 'Let Lucille read what I write'},
          {'key': 'personalization', 'label': 'Personalise my plan'},
        ]
      }));
  api.reply(
      'GET /v1/privacy/disclosure',
      ok({
        'ai': 'Lucille is an AI companion, not a person.',
        'notTherapy': 'Escape is not therapy and not a crisis service.',
      }));
  api.on('DELETE /v1/privacy/data', (_) => ok({'deleted': true}));
  api.reply('POST /v1/voice/speak', ok({'audio': ''}));
  return api;
}

// ───────────────────────── platform fakes ─────────────────────────

/// FirebaseAuth with nobody signed in. `implements` + noSuchMethod: only what v6 touches is
/// answered (delegateFor / setInitialValues return this, currentUser is null).
class FakeFirebaseAuthPlatform with MockPlatformInterfaceMixin implements FirebaseAuthPlatform {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    final n = invocation.memberName;
    if (n == #delegateFor || n == #setInitialValues) return this;
    if (n == #authStateChanges || n == #idTokenChanges || n == #userChanges) {
      return const Stream<UserPlatform?>.empty();
    }
    if (invocation.isGetter) return null; // currentUser, languageCode, tenantId, app...
    if (invocation.isSetter) return null;
    throw UnimplementedError('FakeFirebaseAuthPlatform: $n');
  }
}

/// video_player that never creates a decoder: VideoPlayerController.initialize() fails, which is
/// exactly the path V6VideoPool / V6MoodOrb handle by staying on the bundled poster.
class NoVideoPlatform with MockPlatformInterfaceMixin implements VideoPlayerPlatform {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    final n = invocation.memberName;
    if (n == #init || n == #dispose || n == #setMixWithOthers) return Future<void>.value();
    if (n == #create || n == #createWithOptions) {
      return Future<int?>.error(UnsupportedError('no video decoder in widget tests'));
    }
    if (invocation.isGetter) return null;
    throw UnsupportedError('NoVideoPlatform: $n');
  }
}

/// Every URL a page tried to open (tel:, sms:, https:, mailto:).
final List<String> launchedUrls = [];

/// url_launcher that records instead of leaving the app (registered directly, so it works whether
/// or not the method-channel implementation is the default in this Flutter version).
class FakeUrlLauncher with MockPlatformInterfaceMixin implements UrlLauncherPlatform {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    final n = invocation.memberName;
    if (n == #launchUrl || n == #launch) {
      launchedUrls.add(invocation.positionalArguments.first.toString());
      return Future<bool>.value(true);
    }
    if (n == #canLaunch || n == #supportsMode || n == #supportsCloseForMode) return Future<bool>.value(true);
    if (n == #closeWebView) return Future<void>.value();
    if (invocation.isGetter) return null; // linkDelegate
    throw UnsupportedError('FakeUrlLauncher: $n');
  }
}

/// Platform method calls seen per channel (for assertions like "no permission prompt").
final Map<String, List<MethodCall>> channelCalls = {};

void _mockChannel(String name, Object? Function(MethodCall call) answer) {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(MethodChannel(name), (call) async {
    (channelCalls[name] ??= []).add(call);
    return answer(call);
  });
}

void _mockPlatformChannels() {
  // Haptics, system sounds, clipboard, status bar: nothing to do in a test.
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(SystemChannels.platform, (call) async => null);
  _mockChannel('plugins.flutter.io/url_launcher', (call) {
    final args = call.arguments;
    if (call.method == 'launch' && args is Map) launchedUrls.add(args['url'].toString());
    return true; // canLaunch / launch
  });
  _mockChannel('plugins.flutter.io/path_provider', (call) => Directory.systemTemp.path);
  _mockChannel('com.ryanheise.audio_session', (call) => null);
  _mockChannel('com.ryanheise.just_audio.methods', (call) => null);
  _mockChannel('flutter.baseflow.com/permissions/methods', (call) {
    // checkPermissionStatus -> denied (0); requestPermissions -> {permission: denied}.
    if (call.method == 'requestPermissions' && call.arguments is List) {
      return {for (final p in call.arguments as List) p: 0};
    }
    return 0;
  });
  _mockChannel('dexterous.com/flutter/local_notifications', (call) => null);
  _mockChannel('flutter_timezone', (call) => 'UTC');
}

Future<void> _loadFonts() async {
  Future<ByteData> read(String path) async {
    final bytes = await File(path).readAsBytes();
    return ByteData.sublistView(bytes);
  }

  try {
    final work = FontLoader(V6Type.ui);
    for (final w in ['Regular', 'Medium', 'SemiBold', 'Bold']) {
      work.addFont(read('assets/fonts/WorkSans-$w.ttf'));
    }
    await work.load();
    final gilda = FontLoader(V6Type.display)..addFont(read('assets/fonts/GildaDisplay-Regular.ttf'));
    await gilda.load();
  } catch (e) {
    // Run from another working directory: fall back to the test font (stricter widths).
    debugPrint('v6 harness: real fonts not loaded ($e)');
  }
}

bool _envReady = false;

/// Call from `setUpAll`. Safe to call more than once per file.
Future<void> setUpV6Environment() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  if (_envReady) return;
  _envReady = true;
  setupFirebaseCoreMocks();
  await Firebase.initializeApp();
  FirebaseAuthPlatform.instance = FakeFirebaseAuthPlatform();
  VideoPlayerPlatform.instance = NoVideoPlatform();
  UrlLauncherPlatform.instance = FakeUrlLauncher();
  _mockPlatformChannels();
  await _loadFonts();
}

// ───────────────────────── store ─────────────────────────

/// Fresh V6Store.instance for a widget test: onboarded, not a first-time user (no auto tours),
/// named Alex, and (unless [motion]) Reduce Motion on so no video decoder is ever requested.
Future<V6Store> resetStore({bool motion = false, String name = 'Alex'}) async {
  SharedPreferences.setMockInitialValues({});
  final s = V6Store.instance;
  await s.deleteLocalData();
  s.loaded = true;
  s.hasOnboarded = true;
  s.isNewUser = false;
  s.reduceMotion = !motion;
  s.profile.name = name;
  s.onOpenSupport = (level) {
    final ctx = v6TestNavigatorKey.currentContext;
    if (ctx != null) showV6Support(ctx, level);
  };
  V6Api.consentPrompt = null;
  launchedUrls.clear();
  channelCalls.clear();
  return s;
}

// ───────────────────────── pumping pages ─────────────────────────

final GlobalKey<NavigatorState> v6TestNavigatorKey = GlobalKey<NavigatorState>();

/// Text shown by the stand-in for '/' (the tab shell) and the old FF pages.
const kShellStub = 'SHELL (tab bar)';

Widget _stub(String label) => Scaffold(body: Center(child: Text(label)));

Page<void> _v6Page(GoRouterState state, Widget child) =>
    V6TransitionPage<void>(key: state.pageKey, name: state.name, child: child);

String? _q(GoRouterState s, String k) => s.uri.queryParameters[k];

/// Every v6 route nav.dart registers, mapped to the real screens. Voice chat is a stub (it needs
/// the microphone plugin); old pages and tabs are stubs too.
List<RouteBase> v6TestRoutes() => [
      GoRoute(name: '_initialize', path: '/', builder: (_, __) => _stub(kShellStub)),
      GoRoute(
          name: V6Routes.onboarding,
          path: '/v6/onboarding',
          pageBuilder: (_, s) => _v6Page(s, const V6OnboardingScreen())),
      GoRoute(name: V6Routes.allSet, path: '/v6/allSet', pageBuilder: (_, s) => _v6Page(s, const V6AllSetScreen())),
      GoRoute(
          name: V6Routes.checkIn,
          path: '/v6/checkIn',
          pageBuilder: (_, s) => _v6Page(s, V6CheckInScreen(daily: _q(s, 'daily') == '1'))),
      GoRoute(name: V6Routes.mind, path: '/v6/mind', pageBuilder: (_, s) => _v6Page(s, const V6MindScreen())),
      GoRoute(name: V6Routes.reset, path: '/v6/reset', pageBuilder: (_, s) => _v6Page(s, const V6ResetScreen())),
      GoRoute(
          name: V6Routes.exercise,
          path: '/v6/exercise',
          pageBuilder: (_, s) => _v6Page(s, V6ExerciseDetailScreen(id: _q(s, 'id') ?? 'basic-breathing'))),
      GoRoute(
          name: V6Routes.player,
          path: '/v6/player',
          pageBuilder: (_, s) => _v6Page(s, V6ExercisePlayerScreen(id: _q(s, 'id') ?? 'basic-breathing'))),
      GoRoute(
          name: V6Routes.moodShift,
          path: '/v6/moodShift',
          pageBuilder: (_, s) => _v6Page(s, const V6MoodShiftScreen())),
      GoRoute(name: V6Routes.reward, path: '/v6/reward', pageBuilder: (_, s) => _v6Page(s, const V6RewardScreen())),
      GoRoute(name: V6Routes.body, path: '/v6/body', pageBuilder: (_, s) => _v6Page(s, const V6BodyHubScreen())),
      GoRoute(
          name: V6Routes.bodySection,
          path: '/v6/bodySection',
          pageBuilder: (_, s) => _v6Page(s, V6BodySectionScreen(id: _q(s, 'id') ?? 'yoga'))),
      GoRoute(
          name: V6Routes.bodyDetail,
          path: '/v6/bodyDetail',
          pageBuilder: (_, s) => _v6Page(s, V6BodyDetailScreen(id: _q(s, 'id') ?? ''))),
      // The body player hosts model-viewer (a WebView): stubbed, covered by the device plan.
      GoRoute(name: V6Routes.bodyPlayer, path: '/v6/bodyPlayer', builder: (_, s) => _stub('BODY PLAYER ${_q(s, 'id')}')),
      GoRoute(
          name: V6Routes.bodyReflection,
          path: '/v6/bodyReflection',
          pageBuilder: (_, s) => _v6Page(s, const V6BodyReflectionScreen())),
      GoRoute(
          name: V6Routes.dailyPlan,
          path: '/v6/dailyPlan',
          pageBuilder: (_, s) => _v6Page(s, const V6DailyPlanScreen())),
      GoRoute(
          name: V6Routes.progress, path: '/v6/progress', pageBuilder: (_, s) => _v6Page(s, const V6ProgressScreen())),
      GoRoute(
          name: V6Routes.lucilleText,
          path: '/v6/lucilleText',
          pageBuilder: (_, s) => _v6Page(s, V6LucilleTextScreen(seed: _q(s, 'seed')))),
      GoRoute(name: V6Routes.lucilleVoice, path: '/v6/lucilleVoice', builder: (_, __) => _stub('VOICE CHAT')),
      GoRoute(
          name: V6Routes.editProfile,
          path: '/v6/editProfile',
          pageBuilder: (_, s) => _v6Page(s, const V6EditProfileScreen())),
      GoRoute(
          name: V6Routes.settings, path: '/v6/settings', pageBuilder: (_, s) => _v6Page(s, const V6SettingsScreen())),
      GoRoute(name: V6Routes.privacy, path: '/v6/privacy', pageBuilder: (_, s) => _v6Page(s, const V6PrivacyScreen())),
      GoRoute(name: V6Routes.help, path: '/v6/help', pageBuilder: (_, s) => _v6Page(s, const V6HelpScreen())),
      for (final n in [
        V6Routes.tabHome,
        V6Routes.tabExplore,
        V6Routes.tabLucille,
        V6Routes.tabProfile,
        V6Routes.journal,
        V6Routes.marketplace,
      ])
        GoRoute(name: n, path: '/stub/$n', builder: (_, __) => _stub('STUB $n')),
    ];

/// Pumps [screen] as the first page of a GoRouter app (or, with [overShell], pushed over a
/// stand-in for the tab shell) on a small phone (360 × 640 logical px) with 1.3× text and,
/// unless [motion], OS "reduce motion" on.
Future<GoRouter> pumpV6(
  WidgetTester tester,
  Widget screen, {
  bool motion = false,
  Size size = const Size(360, 640),
  double textScale = 1.3,
  TargetPlatform? platform,
  bool overShell = false,
}) async {
  tester.view.devicePixelRatio = 3;
  tester.view.physicalSize = Size(size.width * 3, size.height * 3);
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final router = GoRouter(
    navigatorKey: v6TestNavigatorKey,
    initialLocation: overShell ? '/' : '/test',
    routes: [
      GoRoute(path: '/test', pageBuilder: (_, state) => V6TransitionPage<void>(key: state.pageKey, child: screen)),
      ...v6TestRoutes(),
    ],
  );

  await tester.pumpWidget(MaterialApp.router(
    routerConfig: router,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(platform: platform),
    builder: (context, child) => MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(textScale),
        disableAnimations: !motion,
      ),
      child: child!,
    ),
  ));
  if (overShell) {
    // Like the app: the page is pushed over the tab shell, so it can pop / replace itself.
    await tester.pump();
    unawaited(router.push('/test'));
  }
  // First frame + staggered V6Rise (≤ 8 × 60 ms) + the ambient cross-fade.
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 600));
  return router;
}

/// Lets animations, debounced saves and rise-ins finish (never pumpAndSettle: orbs and glows loop).
Future<void> settle(WidgetTester tester, [Duration d = const Duration(milliseconds: 800)]) async {
  await tester.pump();
  await tester.pump(d);
}

/// Unmounts the app and flushes every timer the v6 code leaves behind (V6VideoPool's 2 s
/// linger, V6Store's 400 ms debounced save, V6Rise delays), then checks nothing threw.
Future<void> endV6Test(WidgetTester tester) async {
  expect(tester.takeException(), isNull);
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(seconds: 3));
  await tester.pump(const Duration(seconds: 1));
  expect(tester.takeException(), isNull);
}

/// The outermost vertical scrollable (page lists; skips PageViews and horizontal rows).
Finder mainScrollable() => find
    .byWidgetPredicate(
      (w) => w is Scrollable && axisDirectionToAxis(w.axisDirection) == Axis.vertical,
      description: 'vertical Scrollable',
    )
    .first;

/// Drags the main (outermost) scrollable to the end in steps so every lazily built item is laid
/// out at least once (that is when a RenderFlex overflow would be reported).
Future<void> scrollThrough(WidgetTester tester, {Finder? scrollable, int steps = 10}) async {
  final list = scrollable ?? mainScrollable();
  for (var i = 0; i < steps; i++) {
    if (list.evaluate().isEmpty) return;
    await tester.drag(list, const Offset(0, -350), warnIfMissed: false);
    await tester.pump(const Duration(milliseconds: 250));
  }
  expect(tester.takeException(), isNull);
}

/// Scrolls the outermost scrollable until [finder] is built and visible.
Future<void> scrollTo(WidgetTester tester, Finder finder, {Finder? scrollable}) async {
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(finder, 250, scrollable: scrollable ?? mainScrollable());
  }
  await tester.ensureVisible(finder.first);
  await tester.pump(const Duration(milliseconds: 300));
}

// ───────────────────────── finders & checks ─────────────────────────

/// A v6 call-to-action by its label: V6PrimaryPill, V6GhostPill or V6OrbCta.
Finder cta(String label) => find.byWidgetPredicate(
      (w) =>
          (w is V6PrimaryPill && w.label == label) ||
          (w is V6GhostPill && w.label == label) ||
          (w is V6OrbCta && w.label == label),
      description: 'CTA "$label"',
    );

/// Any V6Pressable by its semantic label (icon buttons, cards, rows).
Finder pressable(String semanticLabel) => find.byWidgetPredicate(
      (w) => w is V6Pressable && w.semanticLabel == semanticLabel,
      description: 'V6Pressable "$semanticLabel"',
    );

Finder toggle(String label) =>
    find.byWidgetPredicate((w) => w is V6Toggle && w.label == label, description: 'V6Toggle "$label"');

/// The CTA exists, is enabled (or [enabled] false: disabled) and is a ≥ 48 px tall touch target.
void expectCta(WidgetTester tester, String label, {bool enabled = true}) {
  final f = cta(label);
  expect(f, findsWidgets, reason: 'primary CTA "$label" missing');
  final size = tester.getSize(f.first);
  expect(size.height, greaterThanOrEqualTo(V6Space.minTarget), reason: '"$label" is ${size.height} px tall');
  final w = tester.widget(f.first);
  final onTap = switch (w) {
    V6PrimaryPill p => p.onTap,
    V6GhostPill g => g.onTap,
    V6OrbCta o => o.onTap,
    _ => null,
  };
  expect(onTap != null, enabled, reason: '"$label" should be ${enabled ? 'enabled' : 'disabled'}');
}

void expectTapTarget(WidgetTester tester, Finder f, {String? what}) {
  expect(f, findsWidgets, reason: '${what ?? f} missing');
  final size = tester.getSize(f.first);
  expect(size.height, greaterThanOrEqualTo(V6Space.minTarget), reason: '${what ?? f} is ${size.height} px tall');
  expect(size.width, greaterThanOrEqualTo(V6Space.minTarget), reason: '${what ?? f} is ${size.width} px wide');
}

Future<void> tapCta(WidgetTester tester, String label) async {
  await tester.ensureVisible(cta(label).first);
  await tester.pump(const Duration(milliseconds: 100));
  await tester.tap(cta(label).first);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
}

/// Taps a text, first bringing it on screen (it may sit in a lazy list, or in the cache
/// extent of a horizontal row, where finders treat it as offstage).
Future<void> tapText(WidgetTester tester, String text) async {
  final built = find.text(text, skipOffstage: false);
  if (built.evaluate().isEmpty) {
    await tester.scrollUntilVisible(find.text(text), 250, scrollable: mainScrollable());
  }
  await tester.ensureVisible(find.text(text, skipOffstage: false).first);
  await tester.pump(const Duration(milliseconds: 300));
  await tester.tap(find.text(text).first);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
}

/// Records whether anything created an HttpClient (V6Api.chat / converse use package:http
/// directly, not V6Api.transport). Every client creation fails like a phone in airplane mode.
class RecordingHttpOverrides extends HttpOverrides {
  int clientsCreated = 0;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    clientsCreated++;
    throw const SocketException('network disabled in v6 widget tests');
  }
}

RecordingHttpOverrides installNoNetwork() {
  final previous = HttpOverrides.current;
  final rec = RecordingHttpOverrides();
  HttpOverrides.global = rec;
  addTearDown(() => HttpOverrides.global = previous);
  return rec;
}
