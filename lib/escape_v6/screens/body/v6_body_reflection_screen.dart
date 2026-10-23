// Escape v6 — Body reflection (Figma Make: Body.tsx → BodyReflection).
//
// "How does your body feel now?" — somatic shift chips + a 5-step shift slider, saved with
// store.recordMoodShift, then on to the shared reward screen (which reads store.lastSession).
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/escape_v6/v6.dart';

const _kFeelings = ['Looser', 'Warmer', 'More energy', 'Calmer', 'About the same', 'Sore'];

const _kShiftLabels = ['Worse', 'A little worse', 'About the same', 'A little better', 'Much better'];

class V6BodyReflectionScreen extends StatefulWidget {
  const V6BodyReflectionScreen({super.key});

  @override
  State<V6BodyReflectionScreen> createState() => _V6BodyReflectionScreenState();
}

class _V6BodyReflectionScreenState extends State<V6BodyReflectionScreen> {
  final Set<String> _picked = {};
  double? _shift; // -2 … +2, null until the user moves it
  bool _done = false;

  void _toggle(String f) {
    setState(() {
      if (f == 'About the same') {
        _picked
          ..clear()
          ..add(f);
        _shift ??= 0;
        return;
      }
      _picked.remove('About the same');
      if (!_picked.remove(f)) _picked.add(f);
    });
  }

  V6Mood? _afterMood() {
    if (_picked.contains('Calmer')) return V6Mood.calm;
    if (_picked.contains('More energy')) return V6Mood.energized;
    return null;
  }

  void _continue({bool skip = false}) {
    if (_done) return; // double taps
    _done = true;
    final store = V6Store.instance;
    final shift = skip ? null : _shift?.round();
    final after = skip ? null : _afterMood();
    final negative = shift != null && shift < 0;
    if (!skip && !negative && (shift != null || after != null)) store.recordMoodShift(shift, after);
    GoRouter.of(context).pushReplacementNamed(V6Routes.reward);
    if (negative) {
      // A worse shift opens the gentle support sheet (store hook). Opened now it would sit on this
      // page and vanish with the replacement, so let the reward page settle first.
      Timer(const Duration(milliseconds: 600), () => store.recordMoodShift(shift, after));
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final last = V6Store.instance.lastSession;
    final shiftIdx = _shift == null ? null : _shift!.round() + 2;
    return V6Page(
      activity: V6PaletteId.body,
      child: V6ActionPage(
        footer: [
          V6PrimaryPill(label: 'See how you did', onTap: () => _continue()),
          V6Link(label: 'Skip', ink: V6Ink.faint, onTap: () => _continue(skip: true)),
        ],
        children: [
          const SizedBox(height: 24),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            V6Eyebrow(last == null ? 'Session complete' : '${last.title} · ${last.minutes} min'),
            const SizedBox(height: 10),
            Semantics(header: true, child: const V6SmokeIn(child: V6Display('How does your body feel now?', size: 32))),
            const SizedBox(height: 8),
            const V6Text('Notice it without judging it. Pick any that fit.', ink: V6Ink.muted),
          ]),
          Wrap(spacing: 8, runSpacing: 10, children: [
            for (final f in _kFeelings) V6Chip(label: f, selected: _picked.contains(f), onTap: () => _toggle(f)),
          ]),
          if (_picked.contains('Sore'))
            V6Glass(
              padding: const EdgeInsets.all(16),
              radius: V6Space.radiusCard,
              child: const V6Text(
                'A little muscle soreness is normal after moving. Sharp or lasting pain is not: rest that area, '
                'and check with a doctor if it stays.',
                size: 13,
                ink: V6Ink.muted,
              ),
            ),
          V6Glass(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const V6Eyebrow('Somatic shift'),
              const SizedBox(height: 8),
              Semantics(
                liveRegion: true,
                child: V6Fade(
                  child: V6Display(
                    shiftIdx == null ? 'Compared with before…' : _kShiftLabels[shiftIdx],
                    key: ValueKey(shiftIdx),
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: p.accent,
                  inactiveTrackColor: p.glassBorder,
                  thumbColor: _shift == null ? p.inkFaint : p.ink,
                  overlayColor: p.accentSoft,
                  activeTickMarkColor: p.ink.withOpacity(0.6),
                  inactiveTickMarkColor: p.inkFaint,
                  trackHeight: 4,
                ),
                child: Slider(
                  value: _shift ?? 0,
                  min: -2,
                  max: 2,
                  divisions: 4,
                  label: shiftIdx == null ? null : _kShiftLabels[shiftIdx],
                  semanticFormatterCallback: (v) => _kShiftLabels[v.round() + 2],
                  onChanged: (v) => setState(() => _shift = v),
                ),
              ),
              Row(children: const [
                V6Text('Worse', size: 12, ink: V6Ink.faint),
                Spacer(),
                V6Text('Much better', size: 12, ink: V6Ink.faint),
              ]),
            ]),
          ),
        ],
      ),
    );
  }
}
