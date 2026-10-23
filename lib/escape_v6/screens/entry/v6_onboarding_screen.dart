// Escape v6 — onboarding (Figma Make: Entry.tsx AgeGate + Onboarding).
//
// Age gate → Meet Lucille → first mood → Personalize → Reminders → Privacy → All Set.
// No swiping: every step moves with Continue / Back only, so required steps (age, mood) can't
// be skipped. The hero orb rising from the bottom is the live Mood Orb and follows the mood the
// user picks; the whole app palette previews it too.
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/escape_v6/v6.dart';
import '/flutter_flow/nav/nav.dart' show GoRouterExtensions;
import '../checkin/v6_checkin_parts.dart';
import 'v6_onboarding_steps.dart';

class V6OnboardingScreen extends StatefulWidget {
  const V6OnboardingScreen({super.key});

  @override
  State<V6OnboardingScreen> createState() => _V6OnboardingScreenState();
}

class _V6OnboardingScreenState extends State<V6OnboardingScreen> {
  static const _steps = 6; // age, lucille, mood, personalize, reminders, privacy
  static const _orbVisible = <double>[170, 300, 240, 150, 220, 150];

  final _pages = PageController();
  int _page = 0;

  // Age gate (nothing is stored until the user is confirmed 13+).
  int? _month;
  int? _year;
  bool _teenNotice = false;
  bool _under13 = false;
  bool _signingOut = false;

  V6Mood? _mood;

  late final TextEditingController _name;
  final Set<String> _goals = {};
  int _dailyGoal = 15;
  String? _energyType;

  bool _reminder = true;
  int _hour = 9;
  int _minute = 0;
  bool _notifications = false;
  bool _denied = false;

  // Consent defaults are off: special-category data needs an explicit yes.
  bool _wellbeing = false;
  bool _ai = false;
  bool _personal = false;

  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final s = V6Store.instance;
    final display = FirebaseAuth.instance.currentUser?.displayName?.trim() ?? '';
    _name = TextEditingController(text: s.profile.name.isNotEmpty ? s.profile.name : display.split(' ').first);
    _goals.addAll(s.profile.goals);
    _dailyGoal = const [5, 15, 20].contains(s.profile.dailyGoalMin) ? s.profile.dailyGoalMin : 15;
    _energyType = s.profile.energyType;
    _reminder = s.profile.moodReminder;
    _hour = s.profile.reminderHour;
    _minute = s.profile.reminderMinute;
  }

  @override
  void dispose() {
    _pages.dispose();
    _name.dispose();
    // The preview must never outlive the flow (deferred: the tree is locked during dispose).
    final saved = V6Store.instance.checkIn.isToday;
    if (!saved) Future.microtask(() => V6Store.instance.setPreviewMood(null));
    super.dispose();
  }

  bool get _teen => V6Store.instance.ageBand == V6AgeBand.teen;

  // ───────────────────────── navigation ─────────────────────────

  void _go(int page) {
    FocusScope.of(context).unfocus();
    setState(() => _page = page);
    if (V6Theme.motionOff(context)) {
      _pages.jumpToPage(page);
    } else {
      _pages.animateToPage(page, duration: V6Motion.page, curve: V6Motion.ease);
    }
  }

  void _back() {
    if (_saving || _under13) return;
    if (_page == 0 && _teenNotice) {
      setState(() => _teenNotice = false);
    } else if (_page > 0) {
      _go(_page - 1);
    }
  }

  bool get _canContinue => switch (_page) {
        0 => _teenNotice || (_month != null && _year != null),
        2 => _mood != null,
        _ => true,
      };

  String get _ctaLabel => switch (_page) {
        1 => 'Hi, Lucille',
        5 => "I'm ready",
        _ => 'Continue',
      };

  void _next() {
    HapticFeedback.lightImpact();
    if (_page == 0) {
      if (_teenNotice) return _go(1);
      _submitAge();
      return;
    }
    if (_page < _steps - 1) return _go(_page + 1);
    _finish();
  }

  void _submitAge() {
    final m = _month, y = _year;
    if (m == null || y == null) return;
    final band = bandForAge(ageFrom(y, m + 1));
    if (band == V6AgeBand.under13) {
      // Nothing is saved for under-13s; the only way on is signing out.
      setState(() => _under13 = true);
      return;
    }
    V6Store.instance.setAge(y, band);
    if (band == V6AgeBand.teen) {
      setState(() => _teenNotice = true);
    } else {
      _go(1);
    }
  }

  Future<void> _signOutUnder13() async {
    setState(() => _signingOut = true);
    final router = GoRouter.of(context);
    try {
      router.prepareAuthEvent();
      // Remove (not save) local state so no trace of this account's answers stays on the phone.
      await V6Store.instance.deleteLocalData();
      await authManager.signOut();
      router.clearRedirectLocation();
    } catch (e) {
      debugPrint('V6Onboarding sign out: $e');
    }
    if (!mounted) return;
    router.goNamed('_initialize');
  }

  Future<void> _call988() async {
    try {
      await launchUrl(Uri.parse('tel:988'), mode: LaunchMode.externalApplication);
    } catch (_) {}
  }

  // ───────────────────────── step actions ─────────────────────────

  void _pickMood(V6Mood m) {
    HapticFeedback.selectionClick();
    setState(() => _mood = m);
    V6Store.instance.setPreviewMood(m);
  }

  Future<void> _toggleNotifications(bool on) async {
    if (!on) {
      setState(() => _notifications = false);
      return;
    }
    final ok = await V6Reminders.requestPermission();
    if (!mounted) return;
    setState(() {
      _notifications = ok;
      _denied = !ok;
    });
  }

  void _toggleReminder(bool on) {
    setState(() => _reminder = on);
    if (on && !_notifications && !_denied) unawaited(_toggleNotifications(true));
  }

  Future<void> _pickTime() async {
    final p = V6Theme.of(context);
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: _hour, minute: _minute),
      helpText: 'Mood check-in time',
      builder: (ctx, child) => Theme(data: _pickerTheme(p), child: child ?? const SizedBox()),
    );
    if (t == null || !mounted) return;
    HapticFeedback.selectionClick();
    setState(() {
      _hour = t.hour;
      _minute = t.minute;
    });
  }

  ThemeData _pickerTheme(V6Palette p) {
    final scheme = p.isLight
        ? ColorScheme.light(
            primary: p.accent,
            onPrimary: Colors.white,
            surface: const Color(0xFFF6F8FF),
            onSurface: p.ink,
          )
        : ColorScheme.dark(
            primary: p.accent,
            onPrimary: V6Brand.night,
            surface: V6Brand.surface,
            onSurface: V6Brand.mist,
          );
    return ThemeData(useMaterial3: true, colorScheme: scheme, fontFamily: V6Type.ui);
  }

  String get _timeLabel => TimeOfDay(hour: _hour, minute: _minute).format(context);

  // ───────────────────────── finish ─────────────────────────

  Future<void> _finish() async {
    if (_saving) return;
    setState(() => _saving = true);
    final s = V6Store.instance;
    final router = GoRouter.of(context);
    final name = _name.text.trim();

    s.updateProfile((p) {
      p.name = name;
      p.goals = _goals.toList();
      p.dailyGoalMin = _dailyGoal;
      p.energyType = _energyType;
      p.moodReminder = _reminder;
      p.reminderHour = _hour;
      p.reminderMinute = _minute;
    });
    s.setNotifications(_notifications);
    s.setPersonalize(_personal);

    // Consents first, so the first check-in is stored under the user's real choice.
    try {
      await Future.wait([
        V6Api.setConsent('wellbeing_data', _wellbeing),
        V6Api.setConsent('ai_reflection', _ai),
        V6Api.setConsent('personalization', _personal),
      ]).timeout(const Duration(seconds: 6));
    } catch (e) {
      debugPrint('V6Onboarding consents: $e');
    }

    if (_notifications && _reminder) {
      unawaited(V6Reminders.scheduleDaily(hour: _hour, minute: _minute));
    } else {
      unawaited(V6Reminders.cancel());
    }

    final m = _mood;
    // "Save my check-ins" off: the first mood stays on this phone only (never sent).
    if (m != null) unawaited(s.completeCheckIn(V6CheckIn(mood: m), sync: _wellbeing));
    s.finishOnboarding();
    if (!mounted) return;
    router.pushReplacementNamed(V6Routes.allSet);
  }

  // ───────────────────────── build ─────────────────────────

  Widget _stepAt(int i) => switch (i) {
        0 => V6ObAgeStep(
            month: _month,
            year: _year,
            teenNotice: _teenNotice,
            onMonth: (v) => setState(() => _month = v),
            onYear: (v) => setState(() => _year = v),
          ),
        1 => V6ObLucilleStep(teen: _teen),
        2 => V6ObMoodStep(mood: _mood, onMood: _pickMood),
        3 => V6ObPersonalizeStep(
            name: _name,
            goals: _goals,
            onGoal: (g) => setState(() => _goals.contains(g) ? _goals.remove(g) : _goals.add(g)),
            dailyGoal: _dailyGoal,
            onDailyGoal: (m) => setState(() => _dailyGoal = m),
            energyType: _energyType,
            onEnergyType: (e) => setState(() => _energyType = e),
          ),
        4 => V6ObRemindersStep(
            reminder: _reminder,
            onReminder: _toggleReminder,
            timeLabel: _timeLabel,
            onPickTime: _pickTime,
            notifications: _notifications,
            onNotifications: _toggleNotifications,
            denied: _denied,
          ),
        _ => V6ObPrivacyStep(
            wellbeing: _wellbeing,
            ai: _ai,
            personal: _personal,
            onWellbeing: (v) => setState(() => _wellbeing = v),
            onAi: (v) => setState(() => _ai = v),
            onPersonal: (v) => setState(() => _personal = v),
          ),
      };

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: V6Page(
        entryScreen: true,
        child: V6Fade(
          duration: const Duration(milliseconds: 500),
          child: _under13
              ? V6ObUnder13(
                  key: const ValueKey('under13'),
                  onCall: _call988,
                  onSignOut: _signOutUnder13,
                  signingOut: _signingOut,
                )
              : _flow(context),
        ),
      ),
    );
  }

  Widget _flow(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    final keyboard = MediaQuery.viewInsetsOf(context).bottom > 0;
    final showBack = _page > 0 || _teenNotice;
    return Column(key: const ValueKey('flow'), children: [
      SizedBox(height: pad.top + 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter),
        child: V6StepBar(
          count: _steps,
          index: _page,
          leading: AnimatedOpacity(
            opacity: showBack ? 1 : 0,
            duration: V6Motion.quick,
            child: IgnorePointer(
              ignoring: !showBack,
              child: ExcludeSemantics(
                excluding: !showBack,
                child: V6IconButton(icon: Icons.arrow_back_rounded, label: 'Back', onTap: _back),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: PageView.builder(
          controller: _pages,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _steps,
          itemBuilder: (context, i) => AnimatedBuilder(
            animation: _pages,
            builder: (context, child) {
              final pos = _pages.hasClients && _pages.position.haveDimensions
                  ? (_pages.page ?? _page.toDouble())
                  : _page.toDouble();
              final t = (1 - (pos - i).abs()).clamp(0.0, 1.0);
              return Opacity(opacity: Curves.easeIn.transform(t), child: child);
            },
            child: _stepAt(i),
          ),
        ),
      ),
      // Collapse the orb while typing so the field stays visible.
      V6AnimatedHeroOrb(
        mood: _mood,
        visible: keyboard ? 110 : _orbVisible[_page],
        child: V6OrbCta(
          label: _ctaLabel,
          loading: _saving,
          onTap: _canContinue ? _next : null,
        ),
      ),
      SizedBox(height: keyboard ? 0 : pad.bottom * 0.4),
    ]);
  }
}
