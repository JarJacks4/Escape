// Escape v6 — route names and one navigation helper.
//
// Every v6 page is a GoRouter route (registered in lib/flutter_flow/nav/nav.dart) so server
// deeplinks, push notifications and back gestures all work the same way.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/soundscapes/soundscapes_launcher.dart';

import 'state/v6_store.dart';

class V6Routes {
  static const onboarding = 'v6Onboarding';
  static const allSet = 'v6AllSet';
  static const checkIn = 'v6CheckIn';
  static const mind = 'v6Mind';
  static const reset = 'v6Reset';
  static const exercise = 'v6Exercise'; // ?id=
  static const player = 'v6Player'; // ?id=
  static const moodShift = 'v6MoodShift';
  static const reward = 'v6Reward';
  static const body = 'v6Body';
  static const bodySection = 'v6BodySection'; // ?id=yoga|pilates|taichi|exercise
  static const bodyDetail = 'v6BodyDetail'; // ?id=
  static const bodyPlayer = 'v6BodyPlayer'; // ?id=
  static const bodyReflection = 'v6BodyReflection';
  static const dailyPlan = 'v6DailyPlan';
  static const progress = 'v6Progress';
  static const lucilleText = 'v6LucilleText'; // ?seed=
  static const lucilleVoice = 'v6LucilleVoice';

  /// Lucille, Claude edition (behind V6Store.v6ClaudeEdition — see screens/lucille_claude).
  static const claudeThread = 'v6ClaudeThread'; // ?threadId=&seed=
  static const claudeThreads = 'v6ClaudeThreads';

  /// Claude-authored self-care plans (/v2/plans/*).
  static const v6Plan = 'v6Plan'; // ?planId=
  static const v6PlanBuilder = 'v6PlanBuilder';
  static const v6PlanProgress = 'v6PlanProgress'; // ?planId=
  static const editProfile = 'v6EditProfile';
  static const settings = 'v6Settings';
  static const privacy = 'v6PrivacyData';
  static const help = 'v6Help';

  /// Existing pages the v6 screens hand off to.
  static const journal = 'JournalHomeV2';
  static const marketplace = 'MarketplaceVersion5';

  /// Tab names understood by NavBarPage(initialPage: ...).
  static const tabHome = 'HomeVersion5';
  static const tabExplore = 'ExplorePageVersion5FINAL';
  static const tabLucille = 'LucilleHome';
  static const tabSound = 'AISoundscapesFINAL';
  static const tabProfile = 'ProfileV6';

  /// Old names (server deeplinks, notifications) → v6 pages.
  static const Map<String, String> legacy = {
    'BasicBreathingGoalPage': 'v6Exercise?id=basic-breathing',
    'BoxBreathingMeditationPage': 'v6Exercise?id=box-breathing',
    'MindPage': mind,
    'ResetPageCopy': reset,
    'ResetPage': reset,
    'BodyPageVersion5': body,
    'ChatWithLucilleVersion5': lucilleText,
    'LucilleVoiceChatWebView': lucilleVoice,
    'DashboardPage': tabProfile,
    'TodaysHelpVersion5': help,
    'ContactUsVersion5': help,
    'MoodScanVersion5': checkIn,
    'journal': journal,
    // Lucille API deeplinks (escape_api/data/deeplinks.json) that have a v6 port.
    'BoxBreathingGoalPage': 'v6Exercise?id=box-breathing',
    'AnxietyReliefGoal': 'v6Exercise?id=anxiety-relief',
    'ADHDAndOverthinkingGoal': 'v6Exercise?id=adhd-overthinking',
    'IncreaseFocusGoal': 'v6Exercise?id=increase-focus',
    'DeepSleepGoal': 'v6Exercise?id=deep-sleep',
    'MicrcosmicMeditationGoalPage': 'v6Exercise?id=microcosmic-orbit',
    'SelfCarePlanV2': dailyPlan,
    'v6Plan': v6Plan,
    'v6PlanBuilder': v6PlanBuilder,
    'MoodStatsV2': progress,
    'SoundscapesNowPlaying': 'soundscapes',
  };
}

/// Opens a v6 route string like `v6Exercise?id=box-breathing`, a legacy page name, a tab, or
/// `soundscapes` / `moodScan` (native module). Unknown routes never crash: they land on Home.
Future<void> v6Open(BuildContext context, String route, {Object? extra}) async {
  var r = V6Routes.legacy[route] ?? route;
  final q = <String, String>{};
  final i = r.indexOf('?');
  if (i >= 0) {
    q.addAll(Uri.splitQueryString(r.substring(i + 1)));
    r = r.substring(0, i);
  }
  r = V6Routes.legacy[r] ?? r;
  // The Claude edition replaces the chat pages in place: same entry points, same back, one
  // thread that takes both typing and voice. With the flag off (the default) this never fires,
  // so nothing changes for today's users.
  if (V6Store.instance.v6ClaudeEdition &&
      (r == V6Routes.lucilleText || r == V6Routes.lucilleVoice)) {
    r = V6Routes.claudeThread;
  }
  if (r == 'soundscapes' || r == V6Routes.tabSound) {
    await SoundscapesLauncher.openOrFallback(context);
    return;
  }
  if (r == 'moodScan' || r == 'MoodScan') {
    await SoundscapesLauncher.openMoodScan(context);
    return;
  }
  if (r.startsWith('/')) {
    GoRouter.of(context).push(r);
    return;
  }
  const tabs = {
    V6Routes.tabHome,
    V6Routes.tabExplore,
    V6Routes.tabLucille,
    V6Routes.tabProfile,
  };
  if (tabs.contains(r)) {
    final sw = V6TabSwitcher.switchTo;
    if (sw != null) {
      sw(r);
      // Back to the shell that owns the tabs (not past it: old routes can stack two shells).
      final shell = V6TabSwitcher.shellRoute;
      Navigator.of(context, rootNavigator: true)
          .popUntil((route) => route.isFirst || (shell != null && route == shell));
      return;
    }
  }
  try {
    await GoRouter.of(context).pushNamed(r, queryParameters: q, extra: extra);
  } catch (e) {
    debugPrint('v6Open: unknown route "$route" ($e)');
    V6TabSwitcher.switchTo?.call(V6Routes.tabHome);
  }
}

/// The tab shell registers itself here so any page can switch tabs.
class V6TabSwitcher {
  static void Function(String tab)? switchTo;

  /// The route that hosts the active shell (set by the shell).
  static ModalRoute<dynamic>? shellRoute;
}
