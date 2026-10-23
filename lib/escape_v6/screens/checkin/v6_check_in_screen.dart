// Escape v6 — the daily / login Mood Check-in (Figma Make: CheckIn.tsx CheckIn).
//
// 1 How are you feeling? (mood orbs + energy) → 2 What's shaping it? (tags + optional note)
// → 3 "Here's what I noticed… Does this feel right?" (trust gate + intention)
// → "Tuning your space…" (labor illusion while it saves) → result with Lucille's line and a
// suggested session that says WHY. Low / drained check-ins open the gentle support sheet.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/escape_v6/v6.dart';
import 'v6_checkin_parts.dart';

const kV6CheckInTags = <String>[
  'Sleep',
  'Work',
  'School',
  'Relationships',
  'Family',
  'Health',
  'Money',
  'Body',
  'Weather',
  'Nothing in particular',
];

const _kNothing = 'Nothing in particular';

/// Why Lucille suggests the session for each mood (she always explains herself).
const _kWhy = <V6Mood, String>{
  V6Mood.calm: "Because you're feeling calm, a few easy breaths help you notice and keep this softness.",
  V6Mood.energized: "Because you're feeling energized, a steady breathing pattern turns the spark into focus.",
  V6Mood.focused: "Because you're feeling focused, this short session protects your clarity before you dive in.",
  V6Mood.restless:
      "Because you're feeling restless, a one-minute reset gives that energy somewhere slow to go.",
  V6Mood.tired: "Because you're feeling tired, long exhales tell your body it's safe to slow down.",
  V6Mood.low: "Because you're feeling low, something small and kind, with no effort required.",
};

enum _Phase { flow, saving, result }

class V6CheckInScreen extends StatefulWidget {
  const V6CheckInScreen({super.key, this.daily = false});

  /// Opened automatically on the first visit of the day (shows "Not now").
  final bool daily;

  @override
  State<V6CheckInScreen> createState() => _V6CheckInScreenState();
}

class _V6CheckInScreenState extends State<V6CheckInScreen> {
  int _step = 0;
  _Phase _phase = _Phase.flow;

  V6Mood? _mood;
  double _energy = 0.5;
  final Set<String> _tags = {};
  final _note = TextEditingController();
  bool _distress = false;
  String? _intention;
  bool _confirmed = false;
  late final bool _isRecheck;

  @override
  void initState() {
    super.initState();
    final s = V6Store.instance;
    final c = s.checkIn;
    _isRecheck = c.isToday;
    if (c.isToday) {
      _mood = c.mood;
      _energy = c.energy;
      _tags.addAll(c.tags);
      _intention = c.intention;
    }
    if (_mood != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => s.setPreviewMood(_mood));
    }
    if (s.healthConnected) unawaited(s.refreshHealth());
  }

  @override
  void dispose() {
    _note.dispose();
    // Leaving without saving: drop the preview (deferred, the tree is locked during dispose).
    if (_phase == _Phase.flow) Future.microtask(() => V6Store.instance.setPreviewMood(null));
    super.dispose();
  }

  // ───────────────────────── helpers ─────────────────────────

  /// Latest heart rate from Health, only if it's from the last 2 hours. Never invented.
  double? get _bpm {
    final s = V6Store.instance;
    if (!s.healthConnected) return null;
    final h = s.health;
    final hr = h?.heartRate;
    final at = h?.heartRateAt;
    if (hr == null || at == null) return null;
    if (DateTime.now().difference(at) > const Duration(hours: 2)) return null;
    return hr;
  }

  String get _healthSource => defaultTargetPlatform == TargetPlatform.iOS ? 'Apple Health' : 'Health Connect';

  void _goStep(int s) {
    FocusScope.of(context).unfocus();
    setState(() => _step = s);
  }

  void _pickMood(V6Mood m) {
    HapticFeedback.selectionClick();
    setState(() {
      _mood = m;
      _confirmed = false;
    });
    V6Store.instance.setPreviewMood(m);
  }

  void _toggleTag(String t) {
    setState(() {
      if (_tags.contains(t)) {
        _tags.remove(t);
      } else if (t == _kNothing) {
        _tags
          ..clear()
          ..add(t);
      } else {
        _tags
          ..remove(_kNothing)
          ..add(t);
      }
    });
  }

  void _notNow() {
    V6Store.instance.skipCheckInToday();
    Navigator.of(context).maybePop();
  }

  void _next() {
    HapticFeedback.lightImpact();
    switch (_step) {
      case 0:
        _goStep(1);
      case 1:
        final note = _note.text.trim();
        if (!_distress && note.isNotEmpty && detectDistress(note)) {
          // The note is never sent anywhere; real people first.
          setState(() => _distress = true);
          showV6Support(context, V6SupportLevel.urgent);
          return;
        }
        _goStep(2);
      default:
        _save();
    }
  }

  Future<void> _save() async {
    final mood = _mood;
    if (mood == null || _phase != _Phase.flow) return;
    FocusScope.of(context).unfocus();
    final note = _note.text.trim();
    final bpm = _bpm;
    setState(() => _phase = _Phase.saving);
    final c = V6CheckIn(
      mood: mood,
      intention: _intention,
      energy: _energy,
      tags: _tags.toList(),
      note: _distress || note.isEmpty ? null : note,
    );
    unawaited(V6Store.instance.completeCheckIn(c, bpm: bpm).then((_) {}, onError: (Object e) {
      debugPrint('V6CheckIn save: $e');
    }));
    await Future.delayed(Duration(milliseconds: V6Theme.motionOff(context) ? 900 : 1800));
    if (!mounted) return;
    HapticFeedback.mediumImpact();
    setState(() => _phase = _Phase.result);
    if (v6NeedsSupport(mood, _energy)) {
      await Future.delayed(const Duration(milliseconds: 900));
      if (mounted) await showV6Support(context, V6SupportLevel.gentle);
    }
  }

  void _start(V6Exercise e) {
    final nav = Navigator.of(context);
    final ctx = nav.context;
    nav.pop();
    v6Open(ctx, 'v6Exercise?id=${e.id}');
  }

  // ───────────────────────── build ─────────────────────────

  @override
  Widget build(BuildContext context) {
    final canPop = _phase == _Phase.result || (_phase == _Phase.flow && _step == 0);
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          if (widget.daily && _phase == _Phase.flow) V6Store.instance.skipCheckInToday();
          return;
        }
        if (_phase == _Phase.flow && _step > 0) _goStep(_step - 1);
      },
      child: V6Page(
        child: Stack(children: [
          Positioned.fill(
            child: V6Fade(
              duration: const Duration(milliseconds: 500),
              child: switch (_phase) {
                _Phase.flow => KeyedSubtree(key: const ValueKey('flow'), child: _flow(context)),
                _Phase.saving => KeyedSubtree(key: const ValueKey('saving'), child: _saving()),
                _Phase.result => KeyedSubtree(key: const ValueKey('result'), child: _result(context)),
              },
            ),
          ),
          const V6AutoHelp(page: 'checkIn'),
        ]),
      ),
    );
  }

  Widget _flow(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    final keyboard = MediaQuery.viewInsetsOf(context).bottom > 0;
    final label = _step == 2 ? (_isRecheck ? 'Update my day' : 'Begin my day') : 'Continue';
    return Column(children: [
      SizedBox(height: pad.top + 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter),
        child: V6StepBar(
          count: 3,
          index: _step,
          leading: _step == 0
              ? V6IconButton(
                  icon: Icons.close_rounded,
                  label: widget.daily ? 'Not now' : 'Close',
                  onTap: () => Navigator.of(context).maybePop(),
                )
              : V6IconButton(icon: Icons.arrow_back_rounded, label: 'Back', onTap: () => _goStep(_step - 1)),
          trailing: const V6HelpButton(page: 'checkIn'),
        ),
      ),
      Expanded(
        child: V6Fade(
          child: KeyedSubtree(
            key: ValueKey(_step),
            child: switch (_step) {
              0 => _moodStep(),
              1 => _tagsStep(),
              _ => _confirmStep(),
            },
          ),
        ),
      ),
      V6AnimatedHeroOrb(
        mood: _mood,
        heroTag: 'checkin-orb',
        visible: keyboard ? 100 : (_step == 0 ? 200 : 130),
        child: V6OrbCta(label: label, onTap: _mood == null ? null : _next),
      ),
      SizedBox(height: keyboard ? 0 : pad.bottom * 0.4),
    ]);
  }

  Widget _scroll(List<Widget> items, {double gap = 18}) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.fromLTRB(24, 22, 24, 12),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(height: gap),
        itemBuilder: (context, i) => V6Rise(index: i, child: items[i]),
      );

  Widget _moodStep() {
    final name = V6Store.instance.firstName;
    return _scroll([
      V6Eyebrow(name.isEmpty ? v6GreetingWord() : '${v6GreetingWord()}, $name'),
      Semantics(header: true, child: const V6SmokeIn(child: V6Display('How are you feeling right now?', size: 34))),
      V6HelpTarget(
        id: 'checkin.moods',
        child: V6CheckInMoodRow(value: _mood, onChanged: _pickMood),
      ),
      V6HelpTarget(
        id: 'checkin.energy',
        child: V6CheckInEnergySlider(value: _energy, onChanged: (v) => setState(() => _energy = v)),
      ),
      Wrap(spacing: 18, runSpacing: 0, children: [
        V6Link(
          label: "I'm really struggling",
          underline: true,
          onTap: () => showV6Support(context, V6SupportLevel.urgent),
        ),
        V6Link(label: 'Use Mood Scan instead', onTap: () => v6Open(context, 'moodScan')),
        if (widget.daily) V6Link(label: 'Not now', ink: V6Ink.faint, onTap: _notNow),
      ]),
    ]);
  }

  Widget _tagsStep() => _scroll([
        Semantics(header: true, child: const V6SmokeIn(child: V6Display("What's shaping it?", size: 34))),
        const V6Text('Pick any that apply. This helps Lucille understand, nothing more.', ink: V6Ink.muted),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final t in kV6CheckInTags) V6Chip(label: t, selected: _tags.contains(t), onTap: () => _toggleTag(t)),
        ]),
        V6TextField(
          controller: _note,
          hint: 'Anything else on your mind? (optional)',
          maxLines: 4,
          maxLength: 500,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
        ),
        V6Fade(
          child: _distress
              ? V6Glass(
                  key: const ValueKey('distress'),
                  padding: const EdgeInsets.all(18),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    const V6Eyebrow('Lucille', ink: V6Ink.accent),
                    const SizedBox(height: 8),
                    const V6Text(kDistressReply),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: V6Link(
                        label: 'Show ways to reach someone',
                        underline: true,
                        ink: V6Ink.accent,
                        onTap: () => showV6Support(context, V6SupportLevel.urgent),
                      ),
                    ),
                  ]),
                )
              : const V6Text(
                  'Your note stays private to you and Lucille.',
                  key: ValueKey('hint'),
                  size: 12,
                  ink: V6Ink.faint,
                ),
        ),
      ]);

  Widget _confirmStep() {
    final p = V6Theme.of(context);
    final mood = _mood;
    final label = mood == null ? 'unsure' : moodOption(mood).label.toLowerCase();
    final shaping = _tags.where((t) => t != _kNothing).take(2).map((t) => t.toLowerCase()).toList();
    final around = shaping.isEmpty ? '' : ', mostly around ${shaping.join(' and ')}';
    return _scroll([
      Semantics(header: true, child: const V6SmokeIn(child: V6Display("Here's what I noticed…", size: 34))),
      V6Glass(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            Icon(Icons.auto_awesome_rounded, size: 18, color: p.accent),
            const SizedBox(width: 10),
            const V6Eyebrow('Lucille'),
          ]),
          const SizedBox(height: 12),
          V6Display("You're feeling $label with ${v6EnergyWord(_energy)} energy$around.", size: 21),
          const SizedBox(height: 12),
          const V6Text('Does this feel right?', size: 14, ink: V6Ink.muted),
          const SizedBox(height: 10),
          Wrap(spacing: 8, runSpacing: 8, children: [
            V6Chip(
              label: 'Yes',
              icon: _confirmed ? Icons.check_rounded : null,
              selected: _confirmed,
              onTap: () => setState(() => _confirmed = true),
            ),
            V6Chip(label: 'Not quite', onTap: () => _goStep(0)),
            V6Chip(label: "I'll choose manually", onTap: () => _goStep(1)),
          ]),
        ]),
      ),
      V6Watch(builder: (context, s) {
        final bpm = _bpm;
        if (bpm == null) return const SizedBox.shrink();
        return Align(
          alignment: Alignment.centerLeft,
          child: Semantics(
            label: 'Heart rate ${bpm.round()} beats per minute, from $_healthSource',
            excludeSemantics: true,
            child: V6Chip(
              icon: Icons.favorite_rounded,
              label: 'Heart rate ${bpm.round()} bpm · from $_healthSource',
            ),
          ),
        );
      }),
      const V6Eyebrow('One intention for today'),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (final t in kV6Intentions)
          V6Chip(
            label: t,
            selected: _intention == t,
            onTap: () => setState(() => _intention = _intention == t ? null : t),
          ),
      ]),
      const V6Text('Your check-in is private. You can delete it any time in Privacy & data.',
          size: 12, ink: V6Ink.faint),
    ]);
  }

  Widget _saving() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          V6MoodOrb(mood: _mood, size: 160, glow: true, live: true, semanticLabel: 'Your mood orb'),
          const SizedBox(height: 30),
          Semantics(
            liveRegion: true,
            child: const V6Display('Tuning your space…', size: 28, align: TextAlign.center),
          ),
          const SizedBox(height: 10),
          V6Text(
            _intention == null ? 'Built around how you feel' : 'Built around “$_intention”',
            ink: V6Ink.muted,
            align: TextAlign.center,
          ),
        ]),
      ),
    );
  }

  Widget _result(BuildContext context) {
    final mood = _mood;
    final opt = mood == null ? null : moodOption(mood);
    final e = v6Exercise(v6ExerciseForMood(mood));
    final note = kV6LucilleNotes[mood?.name ?? 'none'] ?? kV6LucilleNotes['none']!;
    final p = V6Theme.of(context);
    return V6ActionPage(
      gap: 18,
      children: [
        const SizedBox(height: 12),
        Center(child: V6MoodOrb(mood: mood, size: 112, glow: true, live: true, semanticLabel: 'Your mood orb')),
        Semantics(
          header: true,
          liveRegion: true,
          child: V6SmokeIn(
            child: V6Display(
              opt == null ? 'Checked in.' : 'Your space is tuned to ${opt.label.toLowerCase()}.',
              size: 30,
              align: TextAlign.center,
            ),
          ),
        ),
        V6Glass(
          padding: const EdgeInsets.all(18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(children: [
              Icon(Icons.auto_awesome_rounded, size: 18, color: p.accent),
              const SizedBox(width: 10),
              const V6Eyebrow('Lucille'),
            ]),
            const SizedBox(height: 10),
            V6Display(note, size: 21),
          ]),
        ),
        if (e != null)
          V6Glass(
            padding: const EdgeInsets.all(18),
            onTap: () => _start(e),
            semanticLabel: 'Suggested: ${e.title}, ${e.minutes} minutes',
            child: Row(children: [
              V6MoodOrb(mood: mood, size: 48),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  V6Eyebrow('Suggested for you · ${e.minutes} min', ink: V6Ink.faint),
                  const SizedBox(height: 4),
                  V6Text(e.title, size: 16, weight: FontWeight.w600),
                  const SizedBox(height: 4),
                  V6Text(
                    mood == null ? e.summary : (_kWhy[mood] ?? e.summary),
                    size: 13,
                    ink: V6Ink.muted,
                    height: 1.4,
                  ),
                ]),
              ),
              Icon(Icons.chevron_right_rounded, color: p.inkFaint),
            ]),
          ),
      ],
      footer: [
        if (e != null) V6PrimaryPill(label: 'Start', icon: Icons.play_arrow_rounded, onTap: () => _start(e)),
        V6GhostPill(label: 'Go home', onTap: () => Navigator.of(context).maybePop()),
      ],
    );
  }
}
