// Escape v6 — Home tab body (Figma Make: src/screens/Home.tsx).
//
// Glanceable self-care widgets on glass: greeting + date, today's mood orb, Lucille's suggestion
// (from /v1/home, with the reason), a widget grid (plan with one-tap check, mindful minutes,
// water, streak & coins, journal, Health), a short "How can I support you today?" list (4 options,
// Hick's law) and "Today's picks" for the current mood + time of day.
//
// Every number comes from V6Store (local-first) or the server values it caches; server numbers
// show "—" until they arrive. This is a TAB BODY: no Scaffold / V6Page (the shell draws them).
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import '/escape_v6/screens/checkin/v6_quick_check_in_sheet.dart';
import '/escape_v6/screens/lucille_claude/v6_claude_brief.dart';
import '/escape_v6/v6.dart';
import 'v6_home_widgets.dart';

class V6HomeScreen extends StatelessWidget {
  const V6HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return V6Watch(
      builder: (context, s) => V6ScrollPage(
        withNav: true,
        gap: 20,
        children: [
          _Header(s: s),
          const V6ClaudeBriefCard(),
          _MoodWidget(s: s),
          const _SuggestionCard(),
          V6HelpTarget(id: 'home.widgets', child: _Widgets(s: s)),
          const V6HelpTarget(id: 'home.support', child: _SupportList()),
          _Picks(s: s),
        ],
      ),
    );
  }
}

// ───────────────────────── header ─────────────────────────

class _Header extends StatelessWidget {
  const _Header({required this.s});
  final V6Store s;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final name = s.firstName;
    final greeting = name.isEmpty ? v6Greeting(now) : '${v6Greeting(now)}, $name';
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            V6Eyebrow(v6LongDate(now)),
            const SizedBox(height: 6),
            Semantics(header: true, child: V6SmokeText(greeting, style: V6Type.displayStyle(30, V6Theme.of(context).ink))),
          ]),
        ),
      ),
      const V6AutoHelp(page: 'home'),
      const SizedBox(width: 8),
      const V6HelpButton(page: 'home'),
      const SizedBox(width: 4),
      const V6HelpTarget(id: 'home.daynight', child: V6DayNightOrb()),
    ]);
  }
}

// ───────────────────────── today's mood ─────────────────────────

class _MoodWidget extends StatelessWidget {
  const _MoodWidget({required this.s});
  final V6Store s;

  @override
  Widget build(BuildContext context) {
    final mood = s.currentMood;
    final opt = mood == null ? null : moodOption(mood);
    final intention = s.checkIn.isToday ? s.checkIn.intention : null;
    final title = opt == null ? 'How are you feeling?' : 'Feeling ${opt.label.toLowerCase()}';
    final sub = opt == null
        ? 'A 10-second check-in'
        : (intention != null && intention.isNotEmpty ? 'Intention · $intention' : opt.line);
    return V6Glass(
      onTap: () => showV6QuickCheckIn(context),
      semanticLabel: opt == null ? 'Check in: how are you feeling?' : '$title. Check in again',
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      radius: 22,
      child: Row(children: [
        // Figma: 40 pt Mood Orb; it flies into the daily check-in's hero orb.
        V6MoodOrb(mood: mood, size: 40, heroTag: 'checkin-orb', glow: mood != null),
        const SizedBox(width: 12),
        Expanded(
          child: V6Fade(
            child: Column(
              key: ValueKey('mood-${mood?.name}-$intention'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                V6Text(title, size: 15, weight: FontWeight.w600, maxLines: 1),
                const SizedBox(height: 1),
                V6Text(sub, size: 12, ink: V6Ink.faint, maxLines: 2, height: 1.3),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        V6SoftPill(opt == null ? 'Check in' : 'Check in again'),
      ]),
    );
  }
}

// ───────────────────────── Lucille's suggestion ─────────────────────────

class _SuggestionCard extends StatefulWidget {
  const _SuggestionCard();

  @override
  State<_SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<_SuggestionCard> {
  // Stop the loading shimmer after a while (offline): the mood line just stays, calmly.
  bool _waitedLong = false;
  Timer? _t;

  @override
  void initState() {
    super.initState();
    _t = Timer(const Duration(seconds: 8), () {
      if (mounted) setState(() => _waitedLong = true);
    });
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return V6Watch(builder: (context, s) {
      final mood = s.currentMood;
      final title = s.suggestionTitle?.trim();
      final ready = title != null && title.isNotEmpty;
      final why = s.suggestionWhy?.trim();
      final route = (s.suggestionRoute != null && s.suggestionRoute!.isNotEmpty)
          ? s.suggestionRoute!
          : '${V6Routes.exercise}?id=${v6ExerciseForMood(mood)}';
      final note = kV6LucilleNotes[mood?.name ?? 'none'] ?? kV6LucilleNotes['none']!;

      final Widget body = ready
          ? Column(
              key: ValueKey('suggestion-$title'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                V6Display(title, size: 22, maxLines: 2),
                if (why != null && why.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  V6Text(why, size: 14, ink: V6Ink.muted),
                ],
                const SizedBox(height: 14),
                Row(children: [
                  _StartPill(label: 'Start', onTap: () => v6Open(context, route)),
                  const SizedBox(width: 12),
                  V6Link(label: 'Something else', onTap: () => v6Open(context, V6Routes.lucilleText)),
                ]),
              ],
            )
          : Column(
              key: const ValueKey('suggestion-note'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  liveRegion: true,
                  label: _waitedLong ? null : 'Lucille is choosing a suggestion',
                  child: V6Shimmer(
                    active: !_waitedLong,
                    child: V6Display('“$note”', size: 20),
                  ),
                ),
                if (_waitedLong) ...[
                  const SizedBox(height: 6),
                  V6Link(label: 'Talk it through', onTap: () => v6Open(context, V6Routes.tabLucille)),
                ],
              ],
            );

      return V6Glass(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            V6MoodOrb(mood: mood ?? V6Mood.calm, size: 24, pulse: false),
            const SizedBox(width: 10),
            V6Eyebrow(ready ? 'Lucille suggests' : 'A thought from Lucille'),
          ]),
          const SizedBox(height: 12),
          V6SmokeSwitch(child: body),
        ]),
      );
    });
  }
}

class _StartPill extends StatelessWidget {
  const _StartPill({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: onTap,
      semanticLabel: label,
      child: Container(
        height: V6Space.minTarget,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(color: p.ink, borderRadius: BorderRadius.circular(999)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.play_arrow_rounded, size: 20, color: p.onInk),
          const SizedBox(width: 6),
          Text(label, style: V6Type.body(15, p.onInk, weight: FontWeight.w600, height: 1.2)),
        ]),
      ),
    );
  }
}

// ───────────────────────── widgets grid ─────────────────────────

class _Widgets extends StatelessWidget {
  const _Widgets({required this.s});
  final V6Store s;

  @override
  Widget build(BuildContext context) {
    final health = _healthCard(s);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6SectionHeader('Today', action: 'Progress', onAction: () => v6Open(context, V6Routes.progress)),
      const SizedBox(height: 8),
      _PlanWidget(s: s),
      const SizedBox(height: 10),
      IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(child: _MinutesWidget(s: s)),
          const SizedBox(width: 10),
          Expanded(child: _WaterWidget(s: s)),
        ]),
      ),
      const SizedBox(height: 10),
      IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(child: _StreakCoinsWidget(s: s)),
          const SizedBox(width: 10),
          const Expanded(child: _JournalWidget()),
        ]),
      ),
      if (health != null) ...[const SizedBox(height: 10), health],
    ]);
  }

  /// Health card: real values when connected, a connect card when not (iOS / Android only).
  static Widget? _healthCard(V6Store s) {
    if (kIsWeb) return null;
    final ios = defaultTargetPlatform == TargetPlatform.iOS;
    final android = defaultTargetPlatform == TargetPlatform.android;
    if (!ios && !android) return null;
    if (!s.healthConnected) return _ConnectHealthCard(ios: ios);
    final h = s.health;
    if (h == null) return null;
    final hr = h.heartRate ?? h.restingHeartRate;
    final sleep = h.sleepMinutesLastNight;
    if (hr == null && (sleep == null || sleep <= 0)) return null;
    return _HealthWidget(
      ios: ios,
      bpm: hr?.round(),
      bpmIsResting: h.heartRate == null,
      sleepMinutes: sleep != null && sleep > 0 ? sleep : null,
    );
  }
}

class _PlanWidget extends StatefulWidget {
  const _PlanWidget({required this.s});
  final V6Store s;

  @override
  State<_PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<_PlanWidget> {
  String? _completing;

  Future<void> _complete(V6Task t) async {
    if (_completing != null) return;
    HapticFeedback.mediumImpact();
    setState(() => _completing = t.id);
    // Let the check land before the next task fades in.
    await Future.delayed(const Duration(milliseconds: 420));
    unawaited(V6Store.instance.toggleTask(t.id));
    if (mounted) setState(() => _completing = null);
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.s;
    final p = V6Theme.of(context);
    final total = s.tasks.length;
    final done = s.tasks.where((t) => t.done).length;
    final next = s.nextTask;
    final pct = total == 0 ? 0 : (done / total * 100).round();
    final String headline;
    final String sub;
    if (next != null) {
      headline = next.title;
      sub = '${next.fromLucille ? 'Suggested by Lucille' : 'From your plan'}'
          '${next.minutes > 0 ? ' · ${next.minutes} min' : ''}';
    } else if (total == 0) {
      headline = 'Plan your day';
      sub = 'Add one kind thing to start.';
    } else {
      headline = 'All done for today';
      sub = 'Rest counts too. Tomorrow starts fresh.';
    }

    return V6Glass(
      onTap: () => v6Open(context, V6Routes.dailyPlan),
      semanticLabel: 'Daily plan, $done of $total done. Open plan',
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: V6Fade(
              child: Column(
                key: ValueKey('plan-${next?.id ?? 'none'}-$total'),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  V6Eyebrow('Daily plan · $done of $total', ink: V6Ink.faint),
                  const SizedBox(height: 4),
                  V6Display(headline, size: 22, maxLines: 2),
                  const SizedBox(height: 4),
                  Row(children: [
                    if (next != null && next.fromLucille) ...[
                      Icon(Icons.auto_awesome_rounded, size: 13, color: p.accent),
                      const SizedBox(width: 4),
                    ],
                    Flexible(child: V6Text(sub, size: 13, ink: V6Ink.muted, maxLines: 1)),
                  ]),
                ],
              ),
            ),
          ),
          if (next != null) ...[
            const SizedBox(width: 12),
            _CheckButton(
              checked: _completing == next.id,
              label: 'Mark “${next.title}” done',
              onTap: () => _complete(next),
            ),
          ],
        ]),
        const SizedBox(height: 14),
        Row(children: [
          Expanded(
            child: V6ProgressBar(value: total == 0 ? 0 : done / total, semanticLabel: 'Daily plan progress'),
          ),
          const SizedBox(width: 10),
          Semantics(
            liveRegion: true,
            child: V6Fade(child: V6Text('$pct%', key: ValueKey('pct-$pct'), size: 13, weight: FontWeight.w600)),
          ),
        ]),
      ]),
    );
  }
}

class _CheckButton extends StatelessWidget {
  const _CheckButton({required this.checked, required this.label, required this.onTap});
  final bool checked;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: onTap,
      haptic: false,
      scale: 0.9,
      semanticLabel: label,
      child: AnimatedContainer(
        duration: V6Motion.quick,
        width: V6Space.minTarget,
        height: V6Space.minTarget,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: checked ? p.accent : p.ink,
          boxShadow: checked ? [BoxShadow(color: p.accent.withOpacity(0.5), blurRadius: 16)] : const [],
        ),
        child: AnimatedScale(
          duration: V6Motion.quick,
          scale: checked ? 1.15 : 1,
          child: Icon(Icons.check_rounded, size: 24, color: p.onInk),
        ),
      ),
    );
  }
}

class _MinutesWidget extends StatelessWidget {
  const _MinutesWidget({required this.s});
  final V6Store s;

  @override
  Widget build(BuildContext context) {
    final goal = s.profile.dailyGoalMin;
    final min = s.minutesToday;
    return V6Glass(
      onTap: () => v6Open(context, V6Routes.progress),
      semanticLabel: 'Mindful minutes: $min of $goal. Open progress',
      padding: const EdgeInsets.all(16),
      radius: 22,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        V6Ring(
          value: goal > 0 ? min / goal : 0,
          size: 58,
          semanticLabel: 'Mindful minutes goal',
          child: V6Fade(child: V6Text('$min', key: ValueKey('min-$min'), size: 15, weight: FontWeight.w600)),
        ),
        const SizedBox(height: 12),
        const V6Text('Mindful minutes', size: 14, weight: FontWeight.w600, maxLines: 1),
        V6Text('Goal $goal min', size: 12, ink: V6Ink.faint, maxLines: 1),
      ]),
    );
  }
}

class _WaterWidget extends StatelessWidget {
  const _WaterWidget({required this.s});
  final V6Store s;

  void _remove() {
    if (V6Store.instance.water <= 0) return;
    HapticFeedback.lightImpact();
    V6Store.instance.addWater(-1);
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final water = s.water;
    final goal = s.waterGoal;
    return Semantics(
      container: true,
      label: 'Water, $water of $goal glasses',
      customSemanticsActions: {
        const CustomSemanticsAction(label: 'Remove a glass'): _remove,
      },
      child: GestureDetector(
        onLongPress: _remove,
        child: V6Glass(
          padding: const EdgeInsets.all(16),
          radius: 22,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(
                child: V6Fade(
                  child: Text.rich(
                    key: ValueKey('water-$water'),
                    TextSpan(children: [
                      TextSpan(text: '$water', style: V6Type.displayStyle(30, p.ink)),
                      TextSpan(text: ' / $goal', style: V6Type.body(15, p.inkFaint)),
                    ]),
                  ),
                ),
              ),
              V6Pressable(
                onTap: () => V6Store.instance.addWater(1),
                onLongPress: _remove,
                scale: 0.9,
                semanticLabel: 'Add a glass of water',
                child: Container(
                  width: V6Space.minTarget,
                  height: V6Space.minTarget,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: p.accentSoft,
                    border: Border.all(color: p.glassBorder),
                  ),
                  child: Icon(Icons.add_rounded, size: 24, color: p.ink),
                ),
              ),
            ]),
            const SizedBox(height: 12),
            ExcludeSemantics(
              child: Row(children: [
                for (var i = 0; i < goal; i++)
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 1.5),
                      decoration: BoxDecoration(
                        color: i < water ? p.accent : p.glass[2],
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: p.glassBorder),
                      ),
                    ),
                  ),
              ]),
            ),
            const SizedBox(height: 10),
            Row(children: [
              const Expanded(child: V6Text('Water', size: 14, weight: FontWeight.w600, maxLines: 1)),
              V6Text(water > 0 ? 'Hold to undo' : 'Tap + per glass', size: 11, ink: V6Ink.faint, maxLines: 1),
            ]),
          ]),
        ),
      ),
    );
  }
}

class _StreakCoinsWidget extends StatelessWidget {
  const _StreakCoinsWidget({required this.s});
  final V6Store s;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final streak = s.streakDays;
    final coins = s.coins;
    final coinText = coins == null ? '—' : v6FormatInt(coins);
    return V6Glass(
      onTap: () => v6Open(context, V6Routes.marketplace),
      semanticLabel: '${streak == null ? 'Streak loading' : '$streak day streak'}, '
          '${coins == null ? 'coins loading' : '$coinText Escape Coins'}. Open Marketplace',
      padding: const EdgeInsets.all(16),
      radius: 22,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Icon(Icons.local_fire_department_rounded, size: 22, color: p.accent),
          const SizedBox(width: 6),
          V6Fade(child: V6Display(streak == null ? '—' : '$streak', key: ValueKey('streak-$streak'), size: 28)),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: V6Text(streak == 1 ? 'day' : 'days', size: 13, ink: V6Ink.faint),
          ),
        ]),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: p.accentSoft,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: p.glassBorder),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.toll_rounded, size: 16, color: p.accent),
            const SizedBox(width: 6),
            V6Fade(child: V6Text(coinText, key: ValueKey('coins-$coins'), size: 13, weight: FontWeight.w600)),
          ]),
        ),
        const SizedBox(height: 10),
        const V6Text('Streak & coins', size: 14, weight: FontWeight.w600, maxLines: 1),
      ]),
    );
  }
}

class _JournalWidget extends StatelessWidget {
  const _JournalWidget();

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final part = v6DayPart();
    final prompt = part == V6DayPart.morning || part == V6DayPart.afternoon
        ? '“What would make today feel lighter?”'
        : '“What felt lighter today?”';
    return V6Glass(
      onTap: () => v6Open(context, 'journal'),
      semanticLabel: 'Journal. $prompt',
      padding: const EdgeInsets.all(16),
      radius: 22,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(Icons.auto_awesome_rounded, size: 20, color: p.accent),
        const SizedBox(height: 10),
        V6Display(prompt, size: 17, maxLines: 3),
        const SizedBox(height: 8),
        const V6Text('Journal · write or speak', size: 12, ink: V6Ink.faint, maxLines: 1),
      ]),
    );
  }
}

class _HealthWidget extends StatelessWidget {
  const _HealthWidget({required this.ios, this.bpm, this.bpmIsResting = false, this.sleepMinutes});
  final bool ios;
  final int? bpm;
  final bool bpmIsResting;
  final int? sleepMinutes;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final sleep = sleepMinutes;
    Widget metric(IconData icon, String value, String unit, String label) => Expanded(
          child: Row(children: [
            Icon(icon, size: 20, color: p.accent),
            const SizedBox(width: 10),
            Flexible(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                V6Fade(
                  child: Text.rich(
                    key: ValueKey('$label-$value'),
                    TextSpan(children: [
                      TextSpan(text: value, style: V6Type.displayStyle(22, p.ink)),
                      TextSpan(text: unit, style: V6Type.body(12, p.inkFaint)),
                    ]),
                  ),
                ),
                V6Text(label, size: 12, ink: V6Ink.faint, maxLines: 1),
              ]),
            ),
          ]),
        );
    return V6Glass(
      onTap: () => v6Open(context, V6Routes.body),
      semanticLabel: [
        if (bpm != null) '${bpmIsResting ? 'Resting heart rate' : 'Heart rate'} $bpm beats per minute',
        if (sleep != null) 'Sleep last night ${sleep ~/ 60} hours ${sleep % 60} minutes',
        'Open Body',
      ].join('. '),
      padding: const EdgeInsets.all(16),
      radius: 22,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        V6Eyebrow('Body · from ${ios ? 'Apple Health' : 'Health Connect'}', ink: V6Ink.faint),
        const SizedBox(height: 12),
        Row(children: [
          if (bpm != null) metric(Icons.favorite_rounded, '$bpm', ' bpm', bpmIsResting ? 'Resting heart rate' : 'Heart rate'),
          if (bpm != null && sleep != null) const SizedBox(width: 12),
          if (sleep != null)
            metric(Icons.bedtime_rounded, '${sleep ~/ 60}h ${sleep % 60}', 'm', 'Sleep last night'),
        ]),
      ]),
    );
  }
}

class _ConnectHealthCard extends StatefulWidget {
  const _ConnectHealthCard({required this.ios});
  final bool ios;

  @override
  State<_ConnectHealthCard> createState() => _ConnectHealthCardState();
}

class _ConnectHealthCardState extends State<_ConnectHealthCard> {
  bool _busy = false;

  Future<void> _connect() async {
    if (_busy) return;
    setState(() => _busy = true);
    var ok = false;
    try {
      ok = await V6Store.instance.connectHealth();
    } catch (_) {}
    if (!mounted) return;
    setState(() => _busy = false);
    if (!ok) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(const SnackBar(
        content: Text("Health isn't connected yet. You can try again any time."),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final title = widget.ios ? 'Connect Apple Health' : 'Connect Health Connect';
    return V6Glass(
      onTap: _busy ? null : _connect,
      semanticLabel: title,
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      radius: 22,
      child: Row(children: [
        V6TintBadge(icon: Icons.favorite_border_rounded, color: V6Brand.danger, size: 40, radius: 14),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            V6Text(title, size: 15, weight: FontWeight.w600, maxLines: 1),
            const V6Text('Heart rate and sleep help Lucille pick the right session.',
                size: 12, ink: V6Ink.faint, height: 1.3),
          ]),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 24,
          height: 24,
          child: _busy
              ? CircularProgressIndicator(strokeWidth: 2, color: p.accent)
              : Icon(Icons.chevron_right_rounded, color: p.inkFaint),
        ),
      ]),
    );
  }
}

// ───────────────────────── support list ─────────────────────────

const _support = [
  (
    title: 'Relax & reduce stress',
    sub: 'Calming tools for right now',
    icon: Icons.spa_rounded,
    color: V6Brand.lilac,
    route: V6Routes.reset,
  ),
  (
    title: 'Talk & vent',
    sub: 'Lucille is here to listen',
    icon: Icons.graphic_eq_rounded,
    color: V6Brand.cyan,
    route: V6Routes.lucilleVoice,
  ),
  (
    title: 'Build healthy habits',
    sub: 'Small, kind steps in your plan',
    icon: Icons.eco_rounded,
    color: V6Brand.success,
    route: V6Routes.dailyPlan,
  ),
  (
    title: 'Sleep better',
    sub: 'A slow body scan for bed',
    icon: Icons.bedtime_rounded,
    color: V6Brand.emberLight,
    route: 'v6Exercise?id=deep-sleep',
  ),
];

class _SupportList extends StatelessWidget {
  const _SupportList();

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Semantics(header: true, child: const V6Display('How can I support you today?', size: 22)),
      const SizedBox(height: 12),
      V6Glass(
        padding: const EdgeInsets.all(6),
        child: Column(children: [
          for (var i = 0; i < _support.length; i++)
            DecoratedBox(
              decoration: BoxDecoration(
                border: i == 0 ? null : Border(top: BorderSide(color: p.glassBorder)),
              ),
              child: V6Pressable(
                onTap: () => v6Open(context, _support[i].route),
                semanticLabel: '${_support[i].title}. ${_support[i].sub}',
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 68),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(children: [
                      V6TintBadge(icon: _support[i].icon, color: _support[i].color),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          V6Text(_support[i].title, size: 15, weight: FontWeight.w600, maxLines: 1),
                          const SizedBox(height: 2),
                          V6Text(_support[i].sub, size: 13, ink: V6Ink.faint, maxLines: 1),
                        ]),
                      ),
                      Icon(Icons.chevron_right_rounded, color: p.inkFaint),
                    ]),
                  ),
                ),
              ),
            ),
        ]),
      ),
    ]);
  }
}

// ───────────────────────── today's picks ─────────────────────────

class _Picks extends StatelessWidget {
  const _Picks({required this.s});
  final V6Store s;

  @override
  Widget build(BuildContext context) {
    final mood = s.currentMood;
    final now = DateTime.now();
    final part = v6DayPart(now);
    final picks = v6TodaysPicks(mood, now: now);
    final width = MediaQuery.sizeOf(context).width - 2 * V6Space.gutter;
    // Card width leaves the next card peeking in (affordance: there's more to scroll).
    final cardW = (width * 0.72).clamp(200.0, 320.0);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6SectionHeader("Today's picks", action: 'View all', onAction: () => v6Open(context, V6Routes.tabExplore)),
      V6Fade(child: V6Text(v6PicksWhy(mood, now), key: ValueKey('why-${mood?.name}-$part'), size: 13, ink: V6Ink.faint)),
      const SizedBox(height: 12),
      SizedBox(
        height: 200,
        child: V6HeroSafeSwitcher(
          child: ListView.separated(
            key: ValueKey('picks-${mood?.name}-$part'),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: picks.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final e = picks[i];
              return V6ExerciseCard(
                exercise: e,
                width: cardW,
                height: 200,
                eyebrow: i == 0 ? "Lucille's pick" : e.group,
                onTap: () => v6Open(context, '${V6Routes.exercise}?id=${e.id}'),
              );
            },
          ),
        ),
      ),
    ]);
  }
}
