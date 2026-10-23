// Escape v6 — Progress (Figma Make: src/screens/Productivity.tsx → Progress).
//
// Gentle trends, never judgment. Everything here is real:
//   * mindful minutes today — V6Store.minutesToday / profile.dailyGoalMin;
//   * streak, best streak, active days, Escape Coins, Energy level — GET /v1/me/progress
//     ({streakDays, bestStreak, recentDays[], coins, lifetimeCoins, energy{level, current, next,
//     coinsToNext, step, ...}});
//   * this week's moods — GET /v1/mood/checkins?day_from=… (latest check-in per local day) plus the
//     caption from GET /v1/mood/summary?period=week. No fake history: empty days stay empty.
import 'dart:async';

import 'package:flutter/material.dart';

import '/escape_v6/screens/checkin/v6_quick_check_in_sheet.dart';
import '/escape_v6/v6.dart';
import 'v6_home_widgets.dart';

class V6ProgressScreen extends StatefulWidget {
  const V6ProgressScreen({super.key});

  @override
  State<V6ProgressScreen> createState() => _V6ProgressScreenState();
}

class _Day {
  _Day(this.date, this.key);
  final DateTime date;
  final String key; // yyyy-mm-dd
  bool checkedIn = false;
  V6Mood? mood;
  int count = 0;
}

String _iso(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// A server check-in → the closest of the six v6 moods (by its word, then its family).
V6Mood? _moodOf(Map m) {
  final word = m['word']?.toString().toLowerCase().trim();
  for (final o in kV6Moods) {
    if (o.label.toLowerCase() == word) return o.id;
  }
  final v = (m['valence'] as num?)?.toDouble() ?? 0.5;
  final e = (m['energy'] as num?)?.toDouble() ?? 0.5;
  switch (m['family']?.toString()) {
    case 'energized':
    case 'bright':
      return V6Mood.energized;
    case 'calm':
    case 'tender':
      return V6Mood.calm;
    case 'restless':
      return V6Mood.restless;
    case 'heavy':
      return v < 0.3 ? V6Mood.low : V6Mood.tired;
  }
  // Mixed / unknown: place it on the mood field.
  if (v >= 0.55) return e >= 0.55 ? V6Mood.energized : V6Mood.calm;
  if (v <= 0.45) return e >= 0.55 ? V6Mood.restless : (v < 0.3 ? V6Mood.low : V6Mood.tired);
  return e >= 0.6 ? V6Mood.focused : null;
}

class _V6ProgressScreenState extends State<V6ProgressScreen> {
  bool _loading = true;
  Map<String, dynamic>? _progress;
  List<_Day>? _week;
  String? _caption;
  bool _weekFailed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final days = <_Day>[];
    for (var i = 6; i >= 0; i--) {
      final d = today.subtract(Duration(days: i));
      days.add(_Day(d, _iso(d)));
    }
    final res = await Future.wait([
      V6Api.progress(),
      V6Api.call('GET', '/v1/mood/checkins?limit=100&day_from=${days.first.key}'),
      V6Api.call('GET', '/v1/mood/summary?period=week'),
    ]);
    if (!mounted) return;
    final prog = res[0];
    final checkins = res[1];
    final summary = res[2];

    if (checkins.ok) {
      final byKey = {for (final d in days) d.key: d};
      final items = checkins.map['items'];
      if (items is List) {
        // Newest first: the first check-in we see for a day is that day's latest.
        for (final it in items.whereType<Map>()) {
          final created = it['createdAt']?.toString() ?? '';
          final key = it['localDay']?.toString() ?? (created.length >= 10 ? created.substring(0, 10) : null);
          final d = key == null ? null : byKey[key];
          if (d == null) continue;
          d.count += 1;
          if (!d.checkedIn) {
            d.checkedIn = true;
            d.mood = _moodOf(it);
          }
        }
      }
    }
    // Today's check-in is saved on the phone first; show it even before the server has it.
    final local = V6Store.instance.checkIn;
    if (local.isToday && !days.last.checkedIn && local.mood != null) {
      days.last
        ..checkedIn = true
        ..mood = local.mood
        ..count = 1;
    }

    setState(() {
      _loading = false;
      _progress = prog.ok ? prog.map : null;
      _weekFailed = !checkins.ok && !days.any((d) => d.checkedIn);
      _week = days;
      final cap = summary.ok ? summary.map['caption']?.toString() : null;
      final entries = summary.ok ? (summary.map['entries'] as num?)?.toInt() ?? 0 : 0;
      _caption = entries > 0 ? cap : null;
    });
  }

  Future<void> _checkIn(BuildContext ctx) async {
    await showV6QuickCheckIn(ctx);
    if (mounted) unawaited(_load());
  }

  @override
  Widget build(BuildContext context) {
    return V6Page(
      child: V6Watch(
        builder: (context, s) {
          final prog = _progress;
          final streak = (prog?['streakDays'] as num?)?.toInt() ?? s.streakDays;
          final best = (prog?['bestStreak'] as num?)?.toInt();
          final coins = (prog?['coins'] as num?)?.toInt() ?? s.coins;
          final lifetime = (prog?['lifetimeCoins'] as num?)?.toInt();
          final recent = prog?['recentDays'] is List
              ? (prog!['recentDays'] as List).map((e) => e.toString()).toSet()
              : null;
          final energy = prog?['energy'] is Map ? Map<String, dynamic>.from(prog!['energy'] as Map) : null;
          return RefreshIndicator(
            onRefresh: _load,
            color: V6Theme.of(context).accent,
            child: V6ScrollPage(
              withNav: false,
              gap: 16,
              children: [
                const V6TopBar(title: 'Your progress', subtitle: 'Gentle trends, never judgment'),
                _MinutesCard(minutes: s.minutesToday, goal: s.profile.dailyGoalMin),
                IntrinsicHeight(
                  child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Expanded(child: _StreakCard(streak: streak, best: best, recent: recent, week: _week)),
                    const SizedBox(width: 10),
                    Expanded(child: _CoinsCard(coins: coins, lifetime: lifetime)),
                  ]),
                ),
                if (energy != null) _EnergyCard(energy: energy, lifetime: lifetime),
                _MoodWeekCard(
                  loading: _loading && _week == null,
                  failed: _weekFailed,
                  week: _week,
                  caption: _caption,
                  onRetry: _load,
                  onCheckIn: () => _checkIn(context),
                ),
                if (!_loading && prog == null)
                  Center(
                    child: V6Link(label: "Couldn't reach Escape. Try again", onTap: _load),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MinutesCard extends StatelessWidget {
  const _MinutesCard({required this.minutes, required this.goal});
  final int minutes;
  final int goal;

  @override
  Widget build(BuildContext context) {
    final left = goal - minutes;
    return V6Glass(
      padding: const EdgeInsets.all(18),
      child: Row(children: [
        V6Ring(
          value: goal > 0 ? minutes / goal : 0,
          size: 88,
          stroke: 8,
          semanticLabel: 'Mindful minutes today, $minutes of $goal',
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            V6Fade(child: V6Display('$minutes', key: ValueKey('m-$minutes'), size: 26)),
            const V6Text('min', size: 11, ink: V6Ink.faint, height: 1),
          ]),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const V6Eyebrow('Today'),
            const SizedBox(height: 4),
            const V6Display('Mindful minutes', size: 22),
            const SizedBox(height: 4),
            V6Text(
              minutes == 0
                  ? 'Your $goal-minute goal starts with one breath.'
                  : (left <= 0 ? 'Daily goal reached. Lovely.' : '$left min to your $goal-minute goal'),
              size: 13,
              ink: V6Ink.muted,
            ),
          ]),
        ),
      ]),
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard({required this.streak, required this.best, required this.recent, required this.week});
  final int? streak;
  final int? best;
  final Set<String>? recent;
  final List<_Day>? week;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final w = week;
    final r = recent;
    return V6Glass(
      padding: const EdgeInsets.all(16),
      radius: 22,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Icon(Icons.local_fire_department_rounded, size: 20, color: p.accent),
          const SizedBox(width: 6),
          V6Fade(child: V6Display(streak == null ? '—' : '$streak', key: ValueKey('s-$streak'), size: 28)),
        ]),
        const SizedBox(height: 2),
        const V6Text('day streak', size: 12, ink: V6Ink.faint),
        if (best != null && best! > 0) V6Text('Best $best', size: 12, ink: V6Ink.faint),
        if (w != null && r != null) ...[
          const SizedBox(height: 10),
          Semantics(
            label: '${w.where((d) => r.contains(d.key)).length} active days this week',
            child: ExcludeSemantics(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                for (final d in w)
                  Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: r.contains(d.key) ? p.accent : Colors.transparent,
                        border: Border.all(color: r.contains(d.key) ? p.accent : p.inkFaint),
                      ),
                    ),
                    const SizedBox(height: 4),
                    V6Text(v6WeekdayLetter(d.date), size: 10, ink: V6Ink.faint, height: 1),
                  ]),
              ]),
            ),
          ),
        ],
        const SizedBox(height: 10),
        const V6Text("Streaks pause, they don't punish.", size: 12, ink: V6Ink.muted, height: 1.3),
      ]),
    );
  }
}

class _CoinsCard extends StatelessWidget {
  const _CoinsCard({required this.coins, required this.lifetime});
  final int? coins;
  final int? lifetime;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final c = coins;
    final l = lifetime;
    return V6Glass(
      onTap: () => v6Open(context, V6Routes.marketplace),
      semanticLabel: '${c == null ? 'Coins loading' : '${v6FormatInt(c)} Escape Coins'}. Open Marketplace',
      padding: const EdgeInsets.all(16),
      radius: 22,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Icon(Icons.toll_rounded, size: 20, color: p.accent),
          const SizedBox(width: 6),
          Flexible(
            child: V6Fade(
              child: V6Display(c == null ? '—' : v6FormatInt(c), key: ValueKey('c-$c'), size: 28, maxLines: 1),
            ),
          ),
        ]),
        const SizedBox(height: 2),
        const V6Text('Escape Coins', size: 12, ink: V6Ink.faint),
        if (l != null) V6Text('${v6FormatInt(l)} earned in all', size: 12, ink: V6Ink.faint),
        const Spacer(),
        Row(children: [
          const Expanded(child: V6Text('Marketplace', size: 13, weight: FontWeight.w600)),
          Icon(Icons.chevron_right_rounded, size: 18, color: p.inkFaint),
        ]),
      ]),
    );
  }
}

class _EnergyCard extends StatelessWidget {
  const _EnergyCard({required this.energy, required this.lifetime});
  final Map<String, dynamic> energy;
  final int? lifetime;

  static Color? _hex(Object? v) {
    final s = v?.toString().replaceFirst('#', '');
    if (s == null || s.length != 6) return null;
    final n = int.tryParse(s, radix: 16);
    return n == null ? null : Color(0xFF000000 | n);
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final level = (energy['level'] as num?)?.toInt() ?? 0;
    final step = (energy['step'] as num?)?.toInt() ?? 0;
    final toNext = (energy['coinsToNext'] as num?)?.toInt() ?? 0;
    final current = energy['current'] is Map ? energy['current'] as Map : null;
    final next = energy['next'] is Map ? energy['next'] as Map : null;
    final total = energy['centers'] is List ? (energy['centers'] as List).length : 7;
    final color = _hex(current?['color']) ?? p.accent;
    final title = current == null
        ? 'Energy Scan'
        : '${current['name'] ?? 'Level $level'}${current['chakra'] != null ? ' · ${current['chakra']}' : ''}';
    final String line;
    if (next == null) {
      line = 'Every energy center is open. Beautiful work.';
    } else if (level == 0) {
      line = step > 0 ? '${v6FormatInt(toNext)} coins until your first energy center opens.' : 'Earn coins to open your first energy center.';
    } else {
      line = '${v6FormatInt(toNext)} coins to ${next['name'] ?? 'the next center'}.';
    }
    final fraction = next == null ? 1.0 : (step > 0 ? (1 - toNext / step).clamp(0.0, 1.0) : 0.0);
    return V6Glass(
      onTap: () => v6Open(context, V6Routes.mind),
      semanticLabel: 'Energy level $level of $total. $line',
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [BoxShadow(color: color.withOpacity(0.6), blurRadius: 10)],
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(child: V6Eyebrow('Energy level')),
          V6Text('Level $level of $total', size: 12, ink: V6Ink.faint),
        ]),
        const SizedBox(height: 10),
        V6Display(title, size: 22),
        const SizedBox(height: 4),
        V6Text(line, size: 13, ink: V6Ink.muted),
        const SizedBox(height: 12),
        V6ProgressBar(value: fraction, semanticLabel: 'Progress to the next energy center'),
      ]),
    );
  }
}

class _MoodWeekCard extends StatelessWidget {
  const _MoodWeekCard({
    required this.loading,
    required this.failed,
    required this.week,
    required this.caption,
    required this.onRetry,
    required this.onCheckIn,
  });
  final bool loading;
  final bool failed;
  final List<_Day>? week;
  final String? caption;
  final VoidCallback onRetry;
  final VoidCallback onCheckIn;

  @override
  Widget build(BuildContext context) {
    final w = week ?? const <_Day>[];
    final any = w.any((d) => d.checkedIn);
    Widget body;
    if (loading) {
      body = const Padding(
        key: ValueKey('loading'),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: V6Shimmer(child: V6Text('Gathering your week…', ink: V6Ink.muted)),
      );
    } else if (failed) {
      body = Column(key: const ValueKey('failed'), crossAxisAlignment: CrossAxisAlignment.start, children: [
        const V6Text("Couldn't load your moods right now. Nothing is lost.", ink: V6Ink.muted),
        V6Link(label: 'Try again', onTap: onRetry),
      ]);
    } else {
      body = Column(key: ValueKey('week-$any'), crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          for (var i = 0; i < w.length; i++) _dayOrb(context, w[i], today: i == w.length - 1),
        ]),
        const SizedBox(height: 14),
        if (any)
          V6Text(caption ?? 'Each orb is the last way you checked in that day.', size: 14, ink: V6Ink.muted)
        else ...[
          const V6Text('No check-ins this week yet. Check in and your week takes shape here.',
              size: 14, ink: V6Ink.muted),
          const SizedBox(height: 12),
          V6GhostPill(label: 'Check in now', icon: Icons.favorite_border_rounded, onTap: onCheckIn),
        ],
      ]);
    }
    return V6Glass(
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Semantics(header: true, child: const V6Display('Mood this week', size: 20)),
        const SizedBox(height: 14),
        V6Fade(child: body),
        if (!loading && !failed && any) ...[
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: V6Link(label: 'Check in again', ink: V6Ink.accent, onTap: onCheckIn),
          ),
        ],
      ]),
    );
  }

  Widget _dayOrb(BuildContext context, _Day d, {required bool today}) {
    final p = V6Theme.of(context);
    final size = today ? 34.0 : 28.0;
    final label = today ? 'Today' : v6WeekdayLetter(d.date);
    final mood = d.mood;
    final desc = !d.checkedIn
        ? 'no check-in'
        : (mood == null ? 'checked in' : moodOption(mood).label.toLowerCase());
    return Semantics(
      label: '${today ? 'Today' : _weekdayName(d.date)}: $desc',
      child: ExcludeSemantics(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: d.checkedIn
                  ? V6MoodOrb(mood: mood, size: size, pulse: false, glow: today)
                  : Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: p.inkFaint.withOpacity(0.6)),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 8),
          V6Text(label, size: 11, ink: today ? V6Ink.normal : V6Ink.faint, height: 1),
        ]),
      ),
    );
  }

  static String _weekdayName(DateTime d) =>
      const ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'][d.weekday - 1];
}
