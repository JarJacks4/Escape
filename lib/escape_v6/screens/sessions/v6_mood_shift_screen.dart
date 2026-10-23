// Escape v6 — "Has your mood shifted?" (Figma Make: Rewards.tsx › MoodShift).
//
// Two quick questions after a session: a 5-step shift slider (−2 … +2) and the closest mood now.
// Honest answers teach Lucille what helps; a negative shift opens the gentle support sheet (store
// hook) once the reward page is showing, so the sheet never disappears with this page.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/escape_v6/v6.dart';

const kV6ShiftWords = ['Much worse', 'A bit worse', 'About the same', 'A bit better', 'Much better'];

class V6MoodShiftScreen extends StatefulWidget {
  const V6MoodShiftScreen({super.key});

  @override
  State<V6MoodShiftScreen> createState() => _V6MoodShiftScreenState();
}

class _V6MoodShiftScreenState extends State<V6MoodShiftScreen> {
  int _step = 0;
  int? _shift;
  V6Mood? _after;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    final s = V6Store.instance;
    _after = s.lastSession?.beforeMood ?? s.currentMood;
  }

  void _finish({int? shift, V6Mood? after}) {
    if (_done) return;
    _done = true;
    final store = V6Store.instance;
    final router = GoRouter.of(context);
    final negative = shift != null && shift < 0;
    if (!negative && (shift != null || after != null)) store.recordMoodShift(shift, after);
    router.pushReplacementNamed(V6Routes.reward);
    if (negative) {
      // Let the reward page settle first so the support sheet sits on top of it.
      Timer(const Duration(milliseconds: 600), () => store.recordMoodShift(shift, after));
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = V6Store.instance;
    final last = s.lastSession;
    final before = last?.beforeMood;
    // System Back on question 2 returns to question 1 instead of leaving the flow.
    return PopScope(
      canPop: _step == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _step == 1) setState(() => _step = 0);
      },
      child: V6Page(
      child: V6ActionPage(
        top: Row(children: [
          const SizedBox(width: 64),
          Expanded(child: V6PageDots(count: 2, index: _step)),
          SizedBox(
            width: 64,
            child: V6Link(
              label: 'Skip',
              onTap: () => _finish(shift: _step == 1 ? _shift : null),
            ),
          ),
        ]),
        children: [
          V6Fade(
            child: KeyedSubtree(
              key: ValueKey(_step),
              child: _step == 0 ? _q1(last, before) : _q2(last, before),
            ),
          ),
        ],
        footer: [
          if (_step == 0)
            V6PrimaryPill(label: 'Next', onTap: _shift == null ? null : () => setState(() => _step = 1))
          else
            V6PrimaryPill(label: 'Continue', onTap: () => _finish(shift: _shift, after: _after)),
          if (_step == 1) V6Link(label: 'Back', onTap: () => setState(() => _step = 0)),
        ],
      ),
      ),
    );
  }

  Widget _q1(V6SessionResult? last, V6Mood? before) {
    final v = _shift ?? 0;
    final off = V6Store.instance.reduceMotion || (MediaQuery.maybeOf(context)?.disableAnimations ?? false);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6Eyebrow('${last?.title ?? 'Your session'} · question 1 of 2'),
      const SizedBox(height: 14),
      Semantics(header: true, child: const V6Display('Has your mood shifted?', size: 34)),
      const SizedBox(height: 10),
      const V6Text("There's no right answer. Honest ratings teach Lucille what actually helps you.", ink: V6Ink.muted),
      const SizedBox(height: 18),
      Center(
        child: AnimatedScale(
          scale: 0.82 + (v + 2) * 0.07,
          duration: off ? Duration.zero : const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: V6MoodOrb(
            mood: before ?? V6Mood.calm,
            size: 150,
            live: true,
            glow: _shift != null && _shift! > 0,
          ),
        ),
      ),
      const SizedBox(height: 14),
      Semantics(
        liveRegion: true,
        child: V6Fade(
          child: V6Display(
            _shift == null ? 'Slide to rate' : kV6ShiftWords[v + 2],
            key: ValueKey(_shift),
            size: 26,
            ink: _shift == null ? V6Ink.faint : V6Ink.normal,
            align: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 10),
      _ShiftSlider(value: _shift, onChanged: (x) => setState(() => _shift = x)),
      if (_shift != null && _shift! < 0) ...[
        const SizedBox(height: 14),
        const V6Glass(
          padding: EdgeInsets.all(16),
          radius: 20,
          child: V6Text("Thanks for being honest. Not every session lands, and that's useful to know.", size: 14),
        ),
      ],
    ]);
  }

  Widget _q2(V6SessionResult? last, V6Mood? before) {
    final after = _after;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6Eyebrow('${last?.title ?? 'Your session'} · question 2 of 2'),
      const SizedBox(height: 14),
      Semantics(header: true, child: const V6Display('How do you feel now?', size: 34)),
      const SizedBox(height: 10),
      const V6Text('Pick the closest one. It helps Lucille learn what works for you.', ink: V6Ink.muted),
      const SizedBox(height: 20),
      GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        // 0.85: room for the 52 pt orb + label at 1.3× text on a 360 pt phone.
        childAspectRatio: 0.85,
        children: [
          for (final m in kV6Moods)
            _MoodTile(option: m, selected: after == m.id, onTap: () => setState(() => _after = m.id)),
        ],
      ),
      if (before != null && after != null) ...[
        const SizedBox(height: 16),
        V6Glass(
          padding: const EdgeInsets.all(16),
          radius: 20,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            V6MoodOrb(mood: before, size: 28),
            const SizedBox(width: 12),
            Flexible(
              child: V6Text('${moodOption(before).label} → ${moodOption(after).label}',
                  size: 15, weight: FontWeight.w600, align: TextAlign.center),
            ),
            const SizedBox(width: 12),
            V6MoodOrb(mood: after, size: 28, glow: true),
          ]),
        ),
      ],
    ]);
  }
}

class _ShiftSlider extends StatelessWidget {
  const _ShiftSlider({required this.value, required this.onChanged});
  final int? value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final v = value ?? 0;
    return Column(children: [
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 6,
          activeTrackColor: p.accent,
          inactiveTrackColor: p.glass[0],
          thumbColor: value == null ? p.inkMuted : p.ink,
          overlayColor: p.accent.withOpacity(0.16),
          activeTickMarkColor: p.onInk.withOpacity(0.5),
          inactiveTickMarkColor: p.inkFaint,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 13),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 26),
        ),
        child: Slider(
          value: v.toDouble(),
          min: -2,
          max: 2,
          divisions: 4,
          semanticFormatterCallback: (x) => kV6ShiftWords[x.round() + 2],
          onChangeStart: (_) {
            if (value == null) onChanged(0);
          },
          onChanged: (x) => onChanged(x.round()),
        ),
      ),
      Row(children: [
        for (var i = 0; i < kV6ShiftWords.length; i++)
          Expanded(
            child: V6Pressable(
              onTap: () => onChanged(i - 2),
              semanticLabel: kV6ShiftWords[i],
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48),
                child: Center(
                  child: V6Text(
                    kV6ShiftWords[i],
                    size: 11,
                    align: TextAlign.center,
                    height: 1.2,
                    weight: value == i - 2 ? FontWeight.w600 : FontWeight.w400,
                    ink: value == i - 2 ? V6Ink.normal : V6Ink.faint,
                  ),
                ),
              ),
            ),
          ),
      ]),
    ]);
  }
}

class _MoodTile extends StatelessWidget {
  const _MoodTile({required this.option, required this.selected, required this.onTap});
  final V6MoodOption option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      selected: selected,
      child: V6Pressable(
        onTap: onTap,
        semanticLabel: '${option.label}. ${option.line}',
        child: AnimatedContainer(
          duration: V6Motion.quick,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          decoration: BoxDecoration(
            color: selected ? p.glass[0] : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: selected ? p.ink : p.glassBorder, width: selected ? 1.5 : 1),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            V6MoodOrb(mood: option.id, size: 52, glow: selected, pulse: selected),
            const SizedBox(height: 8),
            V6Text(option.label, size: 13, weight: selected ? FontWeight.w600 : FontWeight.w500, maxLines: 1),
          ]),
        ),
      ),
    );
  }
}
