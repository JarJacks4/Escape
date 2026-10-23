// Escape v6 — Body hub (Figma Make: src/screens/Body.tsx → BodyHub).
//
// Body check (real Health readings only), the four sections, routines carousel and one
// "Lucille suggests" pick that explains why.
import 'package:escape_health/escape_health.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import 'v6_body_content.dart';

class V6BodyHubScreen extends StatefulWidget {
  const V6BodyHubScreen({super.key});

  @override
  State<V6BodyHubScreen> createState() => _V6BodyHubScreenState();
}

class _V6BodyHubScreenState extends State<V6BodyHubScreen> {
  int _alt = 0; // "Try another" offset for Lucille's pick
  bool _healthRead = false; // a Health read finished (snapshot may still be null)

  @override
  void initState() {
    super.initState();
    final s = V6Store.instance;
    if (s.healthConnected) {
      s.refreshHealth().catchError((_) {}).whenComplete(() {
        if (mounted) setState(() => _healthRead = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return V6Page(
      activity: V6PaletteId.body,
      child: Stack(children: [
        V6Watch(builder: (context, s) {
          final name = s.firstName;
          return V6ScrollPage(withNav: false, children: [
            V6TopBar(
              large: true,
              title: 'Body',
              subtitle: name.isEmpty ? 'Move gently. Your body keeps the score.' : 'Move gently, $name. Your body keeps the score.',
              actions: const [V6HelpButton(page: 'body')],
            ),
            V6HelpTarget(id: 'body.weather', child: _BodyCheckCard(store: s, read: _healthRead)),
            _LucillePick(store: s, alt: _alt, onAnother: () => setState(() => _alt++)),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const V6SectionHeader('Four ways to move'),
              const SizedBox(height: 12),
              V6HelpTarget(id: 'body.sections', child: _SectionGrid()),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const V6SectionHeader('Routines'),
              const SizedBox(height: 12),
              V6HelpTarget(id: 'body.routines', child: _RoutineCarousel()),
            ]),
          ]);
        }),
        const V6AutoHelp(page: 'body'),
      ]),
    );
  }
}

// ───────────────────────── body check ─────────────────────────

String _hm(int minutes) {
  final h = minutes ~/ 60, m = minutes % 60;
  return h == 0 ? '${m}m' : '${h}h ${m.toString().padLeft(2, '0')}m';
}

/// One plain-language line from the readings we actually have (null when nothing to say).
String? _meaning(HealthSnapshot h) {
  final sleep = h.sleepMinutesLastNight;
  if (sleep != null && sleep > 0 && sleep < 7 * 60) {
    return 'Sleep ${_hm(sleep)} — a gentle flow may suit today.';
  }
  final hr = _freshHr(h) ? h.heartRate : null, rest = h.restingHeartRate;
  if (hr != null && rest != null && hr > rest + 20) {
    return 'Heart rate ${hr.round()} bpm is above your resting ${rest.round()} — start slow and let it settle.';
  }
  final steps = h.stepsToday;
  if (steps != null && steps >= 8000) {
    return '${_steps(steps)} steps today — a stretch can help your body recover.';
  }
  if (steps != null && steps < 2000 && DateTime.now().hour >= 13) {
    return 'Only ${_steps(steps)} steps so far — a short flow can wake your body up.';
  }
  if (sleep != null && sleep >= 7 * 60) {
    return 'Sleep ${_hm(sleep)} — a good base for something stronger if you feel like it.';
  }
  return null;
}

/// Heart rate only when it is recent (the plugin returns the last 2 h; older is never shown).
bool _freshHr(HealthSnapshot h) {
  if (h.heartRate == null) return false;
  final at = h.heartRateAt;
  return at == null || DateTime.now().difference(at).inMinutes <= 120;
}

String _steps(int n) {
  final s = n.toString();
  final b = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
    b.write(s[i]);
  }
  return b.toString();
}

class _BodyCheckCard extends StatefulWidget {
  const _BodyCheckCard({required this.store, required this.read});
  final V6Store store;

  /// True once a Health read has finished, so a null snapshot means "couldn't read", not "loading".
  final bool read;

  @override
  State<_BodyCheckCard> createState() => _BodyCheckCardState();
}

class _BodyCheckCardState extends State<_BodyCheckCard> {
  bool _connecting = false;
  bool _unavailable = false;
  bool _readHere = false; // connectHealth() already ran a read

  Future<void> _connect() async {
    setState(() {
      _connecting = true;
      _unavailable = false;
    });
    final ok = await widget.store.connectHealth();
    if (!mounted) return;
    setState(() {
      _connecting = false;
      _unavailable = !ok;
      _readHere = ok;
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.store;
    final ios = defaultTargetPlatform == TargetPlatform.iOS;
    if (!s.healthConnected) {
      return V6Glass(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const V6Eyebrow('Body check'),
          const SizedBox(height: 8),
          const V6Display('Let your body have a say', size: 22),
          const SizedBox(height: 8),
          const V6Text(
            'Connect Health and Lucille can read your sleep, heart rate and steps to suggest a flow that fits '
            'today. It stays on your phone, and you can disconnect any time in Settings.',
            size: 14,
            ink: V6Ink.muted,
          ),
          if (_unavailable) ...[
            const SizedBox(height: 10),
            Semantics(
              liveRegion: true,
              child: const V6Text("Health couldn't be connected on this device. You can still use every routine.",
                  size: 13, ink: V6Ink.faint),
            ),
          ],
          const SizedBox(height: 16),
          V6GhostPill(
            label: _connecting ? 'Connecting…' : (ios ? 'Connect Apple Health' : 'Connect Health Connect'),
            icon: Icons.favorite_border_rounded,
            onTap: _connecting ? null : _connect,
          ),
        ]),
      );
    }

    final h = s.health;
    final read = widget.read || _readHere;
    final tiles = <Widget>[];
    if (h != null) {
      if (_freshHr(h)) tiles.add(_Metric('Heart rate', '${h.heartRate!.round()}', 'bpm'));
      if (h.restingHeartRate != null) tiles.add(_Metric('Resting', '${h.restingHeartRate!.round()}', 'bpm'));
      if (h.hrvMs != null) tiles.add(_Metric('HRV', '${h.hrvMs!.round()}', 'ms · trend'));
      if (h.sleepMinutesLastNight != null) tiles.add(_Metric('Sleep', _hm(h.sleepMinutesLastNight!), 'last night'));
      if (h.stepsToday != null) tiles.add(_Metric('Steps', _steps(h.stepsToday!), 'today'));
    }
    final meaning = h == null ? null : _meaning(h);
    return V6Glass(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Expanded(child: V6Eyebrow('Body check')),
          V6Text(ios ? 'Apple Health' : 'Health Connect', size: 12, ink: V6Ink.faint),
        ]),
        const SizedBox(height: 12),
        if (h == null && !read)
          Semantics(liveRegion: true, child: const V6Text('Reading Health…', size: 14, ink: V6Ink.muted))
        else if (h == null)
          Semantics(
            liveRegion: true,
            child: const V6Text("Couldn't read Health just now. Every routine still works.", size: 14, ink: V6Ink.muted),
          )
        else if (tiles.isEmpty)
          const V6Text(
            'No readings yet today. Wear your watch or carry your phone and they will show up here.',
            size: 14,
            ink: V6Ink.muted,
          )
        else
          Wrap(spacing: 10, runSpacing: 10, children: tiles),
        if (meaning != null) ...[
          const SizedBox(height: 14),
          Semantics(liveRegion: true, child: V6Text(meaning, size: 14, weight: FontWeight.w500)),
        ],
        if (h != null && h.hrvMs != null) ...[
          const SizedBox(height: 6),
          const V6Text('HRV is best read as a trend over days, not a score.', size: 12, ink: V6Ink.faint),
        ],
      ]),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric(this.label, this.value, this.unit);
  final String label;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      label: '$label $value $unit',
      child: ExcludeSemantics(
        child: Container(
          constraints: const BoxConstraints(minWidth: 96),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: p.glass[1],
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: p.glassBorder),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            V6Eyebrow(label, ink: V6Ink.faint),
            const SizedBox(height: 4),
            V6Display(value, size: 20),
            V6Text(unit, size: 11, ink: V6Ink.faint),
          ]),
        ),
      ),
    );
  }
}

// ───────────────────────── Lucille suggests ─────────────────────────

class _Pick {
  const _Pick(this.ids, this.why);
  final List<String> ids;
  final String why;
}

_Pick _pickFor(V6Store s) {
  final mood = s.currentMood;
  final hour = DateTime.now().hour;
  final sleep = s.health?.sleepMinutesLastNight;
  final shortSleep = sleep != null && sleep > 0 && sleep < 6 * 60;
  switch (mood) {
    case V6Mood.tired:
    case V6Mood.low:
      return _Pick(
        hour >= 17 ? ['yoga-evening-unwind', 'taichi-grounding-flow'] : ['taichi-grounding-flow', 'yoga-evening-unwind'],
        'You checked in feeling ${moodOption(mood!).label.toLowerCase()}, so I picked something gentle.',
      );
    case V6Mood.energized:
      if (shortSleep) {
        return const _Pick(['exercise-quick-strength', 'yoga-morning-wake-up'],
            'You feel energized, but sleep was short, so a steady session rather than a hard one.');
      }
      return const _Pick(['exercise-energy-boost', 'exercise-quick-strength'],
          'You checked in energized. Let\'s put that energy somewhere good.');
    case V6Mood.restless:
      return const _Pick(['taichi-opening-the-day', 'exercise-quick-strength'],
          'Restless energy settles best with slow, flowing movement.');
    case V6Mood.focused:
      return const _Pick(['pilates-core-basics', 'pilates-posture-reset'],
          'You feel focused. Pilates rewards that kind of attention.');
    case V6Mood.calm:
      return _Pick(
        hour < 12 ? ['yoga-morning-wake-up', 'taichi-opening-the-day'] : ['yoga-evening-unwind', 'pilates-posture-reset'],
        'You feel calm. This keeps it that way while your body wakes up a little.',
      );
    case null:
      if (shortSleep) {
        return const _Pick(['yoga-evening-unwind', 'taichi-grounding-flow'],
            'Sleep was short last night, so I picked something gentle.');
      }
      if (hour < 11) {
        return const _Pick(['yoga-morning-wake-up', 'taichi-opening-the-day'], 'A soft way to start the morning.');
      }
      if (hour >= 19) {
        return const _Pick(['yoga-evening-unwind', 'taichi-grounding-flow'], 'A slow flow to close the day.');
      }
      return const _Pick(['pilates-posture-reset', 'exercise-quick-strength'],
          'A midday reset for your back and shoulders. Check in and I can tailor this.');
  }
}

class _LucillePick extends StatelessWidget {
  const _LucillePick({required this.store, required this.alt, required this.onAnother});
  final V6Store store;
  final int alt;
  final VoidCallback onAnother;

  @override
  Widget build(BuildContext context) {
    final pick = _pickFor(store);
    final r = v6BodyRoutine(pick.ids[alt % pick.ids.length]);
    if (r == null) return const SizedBox.shrink();
    return V6Glass(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
      tint: r.section.color,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          V6MoodOrb(mood: store.currentMood, size: 36, semanticLabel: 'Lucille'),
          const SizedBox(width: 12),
          const Expanded(child: V6Eyebrow('Lucille suggests')),
        ]),
        const SizedBox(height: 12),
        V6Pressable(
          onTap: () => v6Open(context, '${V6Routes.bodyDetail}?id=${r.id}'),
          semanticLabel: 'Open ${r.title}, ${r.minutes} minutes',
          child: V6Fade(
            child: Row(key: ValueKey(r.id), children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  V6Display(r.title, size: 24),
                  const SizedBox(height: 4),
                  V6Text('${r.section.title} · ${r.minutes} min · ${r.intensity}', size: 13, ink: V6Ink.muted),
                ]),
              ),
              Icon(Icons.chevron_right_rounded, color: V6Theme.of(context).inkFaint),
            ]),
          ),
        ),
        const SizedBox(height: 8),
        V6Text(pick.why, size: 13, ink: V6Ink.muted),
        Align(
          alignment: Alignment.centerLeft,
          child: V6Link(label: 'Not quite right? Try another', onTap: onAnother),
        ),
      ]),
    );
  }
}

// ───────────────────────── sections ─────────────────────────

class _SectionGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final s = kBodySections;
    Widget card(BodySection x) => Expanded(child: _SectionCard(section: x));
    final rows = <Widget>[];
    for (var i = 0; i < s.length; i += 2) {
      if (i > 0) rows.add(const SizedBox(height: 12));
      rows.add(IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          card(s[i]),
          const SizedBox(width: 12),
          if (i + 1 < s.length) card(s[i + 1]) else const Expanded(child: SizedBox()),
        ]),
      ));
    }
    return Column(children: rows);
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.section});
  final BodySection section;

  @override
  Widget build(BuildContext context) => V6Glass(
        padding: const EdgeInsets.all(16),
        radius: V6Space.radiusCard,
        tint: section.color,
        onTap: () => v6Open(context, '${V6Routes.bodySection}?id=${section.id}'),
        semanticLabel: '${section.title}: ${section.tagline}. ${section.moves.length} moves',
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          V6IconBadge(icon: section.icon, color: section.color, size: 40),
          const SizedBox(height: 14),
          V6Text(section.title, size: 16, weight: FontWeight.w600),
          const SizedBox(height: 2),
          V6Text(section.tagline, size: 12, ink: V6Ink.muted, maxLines: 2),
          const SizedBox(height: 8),
          V6Text('${section.moves.length} moves', size: 11, ink: V6Ink.faint),
        ]),
      );
}

// ───────────────────────── routines carousel ─────────────────────────

class _RoutineCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, box) {
        // Bleed to the screen edges so the next card peeks in from the right.
        final w = box.maxWidth + V6Space.gutter * 2;
        return SizedBox(
          height: 210,
          child: OverflowBox(
            maxWidth: w,
            minWidth: w,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter),
              itemCount: kV6BodyRoutines.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, i) => _RoutineCard(routine: kV6BodyRoutines[i]),
            ),
          ),
        );
      });
}

class _RoutineCard extends StatelessWidget {
  const _RoutineCard({required this.routine});
  final V6BodyRoutine routine;

  @override
  Widget build(BuildContext context) {
    final r = routine;
    return V6Pressable(
      onTap: () => v6Open(context, '${V6Routes.bodyDetail}?id=${r.id}'),
      semanticLabel: '${r.title}, ${r.section.title}, ${r.minutes} minutes, ${r.intensity}',
      child: Container(
        width: 168,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: V6Theme.of(context).glassBorder),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(fit: StackFit.expand, children: [
          V6Hero(tag: r.heroTag, child: V6BodyRoutineArt(routine: r)),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: Colors.white.withOpacity(0.25)),
                ),
                child: Text(r.intensity,
                    style: V6Type.body(11, Colors.white, weight: FontWeight.w600, height: 1.1)),
              ),
              const Spacer(),
              Text(r.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: V6Type.displayStyle(20, Colors.white)),
              const SizedBox(height: 2),
              Text('${r.section.title} · ${r.minutes} min',
                  style: V6Type.body(12, const Color(0xCCE6EAF4), height: 1.3)),
            ]),
          ),
        ]),
      ),
    );
  }
}
