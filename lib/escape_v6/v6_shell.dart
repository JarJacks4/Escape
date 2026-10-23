// Escape v6 — the tab shell (Figma Make: App.tsx AppShell).
//
// Stack(AmbientBackground, IndexedStack(tab pages), floating glass tab bar). Used by NavBarPage
// in main.dart, so every existing `NavBarPage(initialPage: ...)` call keeps working.
//
// Entry rules (run once the store has loaded):
//   * Brand-new account (created < 30 min ago, no v6 state yet) → v6 onboarding.
//   * Existing account → straight in.
//   * First open of the day → the daily Mood Check-in (skippable, "Not now" holds until tomorrow).
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/index.dart' show AISoundscapesFINALWidget;
import '/soundscapes/soundscapes_launcher.dart';
import 'screens/explore/v6_explore_screen.dart';
import 'screens/home/v6_home_screen.dart';
import 'screens/lucille/v6_lucille_home_screen.dart';
import 'screens/profile/v6_profile_screen.dart';
import 'services/v6_api.dart';
import 'state/v6_store.dart';
import 'ui/v6_ambient.dart';
import 'ui/v6_nav.dart';
import 'ui/v6_sheets.dart';
import 'ui/v6_video_pool.dart';
import 'v6_routes.dart';

class V6TabShell extends StatefulWidget {
  const V6TabShell({super.key, this.initialPage, this.page, this.resizeToAvoidBottomInset = true});

  /// A tab name (HomeVersion5, ExplorePageVersion5FINAL, LucilleHome, ProfileV6) or any other
  /// page name that came with [page] (e.g. MarketplaceVersion5).
  final String? initialPage;
  final Widget? page;

  /// NavBarPage(disableResizeToAvoidBottomInset: true) still works.
  final bool resizeToAvoidBottomInset;

  @override
  State<V6TabShell> createState() => _V6TabShellState();
}

const _tabOrder = [V6Routes.tabHome, V6Routes.tabExplore, V6Routes.tabLucille, V6Routes.tabProfile];

V6Tab _tabFor(String name) => switch (name) {
      V6Routes.tabExplore => V6Tab.explore,
      V6Routes.tabLucille => V6Tab.lucille,
      V6Routes.tabProfile => V6Tab.profile,
      _ => V6Tab.home,
    };

class _V6TabShellState extends State<V6TabShell> with WidgetsBindingObserver {
  late String _current;
  Widget? _override;
  final _visited = <String>{};
  bool _entryChecked = false;
  ModalRoute<dynamic>? _route;

  /// Old FF routes push a second NavBarPage over the first (e.g. /homeVersion5 above '/'), so
  /// several shells can be alive. The newest one owns the global hooks; when it goes, the one
  /// below takes them back (otherwise tab switching and the Support sheet would go dead).
  static final List<_V6TabShellState> _live = [];

  void _installHooks() {
    V6TabSwitcher.switchTo = _switchTo;
    V6TabSwitcher.shellRoute = _route;
    V6Api.consentPrompt = (purpose) async {
      if (!mounted) return false;
      return showV6Consent(context, purpose);
    };
    V6Store.instance.onOpenSupport = (level) {
      if (mounted) showV6Support(context, level);
    };
  }

  void _switchTo(String tab) {
    if (!mounted) return;
    setState(() {
      _override = null;
      _current = _tabOrder.contains(tab) ? tab : V6Routes.tabHome;
      _visited.add(_current);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route = ModalRoute.of(context);
    if (_live.isNotEmpty && identical(_live.last, this)) V6TabSwitcher.shellRoute = _route;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final init = widget.initialPage ?? V6Routes.tabHome;
    if (_tabOrder.contains(init)) {
      _current = init;
    } else {
      // Non-tab pages (Marketplace, the old Sound page on phones without the module…) show
      // over the Home tab.
      _current = V6Routes.tabHome;
      _override = widget.page ?? (init == V6Routes.tabSound ? AISoundscapesFINALWidget() : null);
    }
    _visited.add(_current);

    _live.add(this);
    _installHooks();
    _boot();
  }

  Future<void> _boot() async {
    final s = V6Store.instance;
    await s.load();
    unawaited(s.refreshFromServer());
    unawaited(s.refreshHealth());
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) => _entryFlow());
  }

  Future<void> _entryFlow() async {
    if (_entryChecked || !mounted) return;
    _entryChecked = true;
    final s = V6Store.instance;
    if (!s.hasOnboarded) {
      final created = FirebaseAuth.instance.currentUser?.metadata.creationTime;
      final justCreated = created != null && DateTime.now().difference(created) < const Duration(minutes: 30);
      // Saved v6 state without hasOnboarded = onboarding was started on this phone and not
      // finished (app killed mid-flow): resume it, never skip the age gate by adoption.
      final unfinished = s.hasSavedState || s.birthYear != null;
      if (justCreated || unfinished) {
        GoRouter.of(context).pushNamed(V6Routes.onboarding);
        return;
      }
      s.adoptExistingAccount();
    }
    if (s.needsDailyCheckIn() && _override == null) {
      GoRouter.of(context).pushNamed(V6Routes.checkIn, queryParameters: {'daily': '1'});
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      V6VideoPool.resumeAll();
      final s = V6Store.instance;
      s.onResume();
      unawaited(s.refreshFromServer());
      unawaited(s.refreshHealth());
      // A new day while the app sat in the background: offer the check-in again.
      if (mounted && s.needsDailyCheckIn() && (ModalRoute.of(context)?.isCurrent ?? false)) {
        GoRouter.of(context).pushNamed(V6Routes.checkIn, queryParameters: {'daily': '1'});
      }
    } else if (state == AppLifecycleState.paused) {
      V6VideoPool.pauseAll();
      unawaited(V6Store.instance.save());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    final wasOwner = _live.isNotEmpty && identical(_live.last, this);
    _live.remove(this);
    if (_live.isNotEmpty) {
      if (wasOwner) _live.last._installHooks();
    } else {
      V6TabSwitcher.switchTo = null;
      V6TabSwitcher.shellRoute = null;
      V6Api.consentPrompt = null;
      V6Store.instance.onOpenSupport = null;
    }
    super.dispose();
  }

  void _select(V6Tab t) {
    if (t == V6Tab.soundscapes) {
      SoundscapesLauncher.openOrFallback(context);
      return;
    }
    final name = switch (t) {
      V6Tab.explore => V6Routes.tabExplore,
      V6Tab.lucille => V6Routes.tabLucille,
      V6Tab.profile => V6Routes.tabProfile,
      _ => V6Routes.tabHome,
    };
    setState(() {
      _override = null;
      _current = name;
      _visited.add(name);
    });
  }

  Widget _tabBody(String name) => switch (name) {
        V6Routes.tabExplore => const V6ExploreScreen(),
        V6Routes.tabLucille => const V6LucilleHomeScreen(),
        V6Routes.tabProfile => const V6ProfileScreen(),
        _ => const V6HomeScreen(),
      };

  @override
  Widget build(BuildContext context) {
    final index = _tabOrder.indexOf(_current);
    return V6Ambient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        body: _override ??
            IndexedStack(
              index: index < 0 ? 0 : index,
              children: [
                for (final name in _tabOrder)
                  TickerMode(
                    enabled: name == _current,
                    child: HeroMode(
                      enabled: name == _current,
                      child: ExcludeFocus(
                        excluding: name != _current,
                        child: _visited.contains(name) ? _tabBody(name) : const SizedBox.shrink(),
                      ),
                    ),
                  ),
              ],
            ),
        bottomNavigationBar: V6NavBar(current: _tabFor(_current), onSelect: _select),
      ),
    );
  }
}
