// Escape v6 — "Well done" (Figma Make: Rewards.tsx › SessionReward). Used after Mind, Reset and
// Body sessions; everything comes from V6Store.instance.lastSession.
//
// Peak-end: the session ends on a warm, personal high point. Coins are server-awarded only (never
// invented): when none came back we say they're added once online. Streak / milestone appear
// only when the server has given us the numbers.
import 'dart:math' as math;

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/escape_v6/v6.dart';
import 'v6_mood_shift_screen.dart' show kV6ShiftWords;

class V6RewardScreen extends StatefulWidget {
  const V6RewardScreen({super.key});

  @override
  State<V6RewardScreen> createState() => _V6RewardScreenState();
}

class _V6RewardScreenState extends State<V6RewardScreen> {
  final _confetti = ConfettiController(duration: const Duration(milliseconds: 1400));
  bool _started = false;

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  void _maybeConfetti(bool motionOff) {
    if (_started) return;
    _started = true;
    if (motionOff || V6Store.instance.lastSession == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _confetti.play();
    });
  }

  void _home() {
    final router = GoRouter.of(context);
    V6TabSwitcher.switchTo?.call(V6Routes.tabHome);
    router.goNamed('_initialize');
  }

  void _journal() {
    // Leave the finished flow first, then open the journal on top of Home.
    final router = GoRouter.of(context);
    V6TabSwitcher.switchTo?.call(V6Routes.tabHome);
    router.goNamed('_initialize');
    Future.delayed(const Duration(milliseconds: 350), () {
      try {
        router.pushNamed(V6Routes.journal);
      } catch (e) {
        debugPrint('V6 reward: journal route failed ($e)');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return V6Page(
      child: Builder(builder: (context) {
        final off = V6Theme.motionOff(context);
        _maybeConfetti(off);
        final p = V6Theme.of(context);
        return Stack(children: [
          V6Watch(builder: (context, s) {
            final last = s.lastSession;
            return V6ActionPage(
              children: last == null ? _doneOnly(s) : _content(context, s, last, off),
              footer: [
                V6PrimaryPill(label: 'Back to Home', onTap: _home),
                V6Link(label: 'Journal about it', onTap: _journal),
              ],
            );
          }),
          if (!off)
            Align(
              alignment: Alignment.topCenter,
              child: IgnorePointer(
                child: ConfettiWidget(
                  confettiController: _confetti,
                  blastDirection: math.pi / 2,
                  blastDirectionality: BlastDirectionality.directional,
                  emissionFrequency: 0.05,
                  numberOfParticles: 8,
                  maxBlastForce: 12,
                  minBlastForce: 4,
                  gravity: 0.15,
                  particleDrag: 0.06,
                  shouldLoop: false,
                  colors: [p.accent, p.ink, V6Brand.lilac, V6Brand.emberLight, const Color(0xFF9CC2FF)],
                ),
              ),
            ),
        ]);
      }),
    );
  }

  List<Widget> _doneOnly(V6Store s) => [
        const SizedBox(height: 40),
        Center(child: V6MoodOrb(mood: s.currentMood, size: 126, live: true, glow: true)),
        Semantics(header: true, child: const V6SmokeIn(child: V6Display('All done', size: 36, align: TextAlign.center))),
        const V6Text('Nice work taking a moment for yourself.', ink: V6Ink.muted, align: TextAlign.center),
      ];

  List<Widget> _content(BuildContext context, V6Store s, V6SessionResult last, bool off) {
    final name = s.firstName;
    final before = last.beforeMood;
    final after = last.afterMood;
    final shift = last.shift;
    final streak = last.streakDays ?? s.streakDays;
    final insight = shift != null && shift > 0
        ? "${last.title} seems to help you. I'll offer it again on days like this."
        : shift != null && shift < 0
            ? "Thanks for telling me. I'll try something different next time."
            : 'Showing up is the hard part, and you did it.';
    String? moodValue;
    if (before != null && after != null && after != before) {
      moodValue = null; // shown with orbs below
    } else if (shift != null) {
      moodValue = kV6ShiftWords[(shift + 2).clamp(0, 4)];
    } else if (before != null) {
      moodValue = moodOption(before).label;
    }

    return [
      const SizedBox(height: 16),
      Center(child: _RippleOrb(mood: after ?? before ?? s.currentMood, animate: !off)),
      Semantics(
        header: true,
        child: V6SmokeIn(child: V6Display(name.isEmpty ? 'Well done.' : 'Well done, $name.', size: 36, align: TextAlign.center)),
      ),
      V6Text('You completed ${last.title}.', ink: V6Ink.muted, align: TextAlign.center),
      V6Glass(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _CoinsRow(coins: last.coins, animate: !off),
          const SizedBox(height: 10),
          Container(height: 1, color: V6Theme.of(context).glassBorder),
          const SizedBox(height: 6),
          _Stat(label: 'Duration', child: V6Text('${last.minutes} min', size: 15, weight: FontWeight.w600)),
          if (before != null && after != null && after != before)
            _Stat(
              label: 'Mood',
              semantics: '${moodOption(before).label} to ${moodOption(after).label}',
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                V6MoodOrb(mood: before, size: 24),
                const SizedBox(width: 6),
                V6Text(moodOption(before).label, size: 14, weight: FontWeight.w600),
                const SizedBox(width: 6),
                const V6Text('→', size: 14, ink: V6Ink.muted),
                const SizedBox(width: 6),
                V6MoodOrb(mood: after, size: 24, glow: true),
                const SizedBox(width: 6),
                V6Text(moodOption(after).label, size: 14, weight: FontWeight.w600),
              ]),
            )
          else if (moodValue != null)
            _Stat(label: 'Mood', child: V6Text(moodValue, size: 15, weight: FontWeight.w600)),
          if (streak != null)
            _Stat(
              label: 'Streak',
              semantics: '$streak ${streak == 1 ? 'day' : 'days'}',
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.local_fire_department_rounded, size: 16, color: V6Theme.of(context).accent),
                const SizedBox(width: 4),
                V6Text('$streak ${streak == 1 ? 'day' : 'days'}', size: 15, weight: FontWeight.w600),
              ]),
            ),
        ]),
      ),
      if (s.coins != null) _Milestone(coins: s.coins!),
      V6Glass(
        padding: const EdgeInsets.all(18),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          V6MoodOrb(mood: s.currentMood ?? after ?? before, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const V6Eyebrow('Lucille noticed', ink: V6Ink.faint),
              const SizedBox(height: 4),
              V6Text(insight, size: 15),
            ]),
          ),
        ]),
      ),
    ];
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.child, this.semantics});
  final String label;
  final Widget child;
  final String? semantics;

  @override
  Widget build(BuildContext context) {
    final row = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 36),
      child: Row(children: [
        Expanded(child: V6Text(label, size: 14, ink: V6Ink.muted)),
        Flexible(child: FittedBox(fit: BoxFit.scaleDown, alignment: Alignment.centerRight, child: child)),
      ]),
    );
    if (semantics == null) return row;
    return Semantics(label: '$label: $semantics', child: ExcludeSemantics(child: row));
  }
}

class _CoinsRow extends StatelessWidget {
  const _CoinsRow({required this.coins, required this.animate});
  final int coins;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final head = Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.toll_rounded, size: 20, color: p.accent),
      const SizedBox(width: 8),
      const V6Text('Coins earned', size: 15, weight: FontWeight.w600),
    ]);
    if (coins <= 0) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        head,
        const SizedBox(height: 6),
        const V6Text("Coins are added when you're back online.", size: 13, ink: V6Ink.faint),
      ]);
    }
    return Semantics(
      label: '$coins coins earned',
      child: ExcludeSemantics(
        child: Row(children: [
          Expanded(child: head),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: animate ? 0 : coins.toDouble(), end: coins.toDouble()),
            duration: animate ? const Duration(milliseconds: 900) : Duration.zero,
            curve: Curves.easeOutCubic,
            builder: (context, v, _) => V6Display('+${v.round()}', size: 30, ink: V6Ink.accent),
          ),
        ]),
      ),
    );
  }
}

/// Goal gradient: the next 1,000-coin milestone always feels reachable. Only with a real balance.
class _Milestone extends StatelessWidget {
  const _Milestone({required this.coins});
  final int coins;

  @override
  Widget build(BuildContext context) {
    final next = (coins ~/ 1000 + 1) * 1000;
    final toGo = next - coins;
    final value = (coins % 1000) / 1000;
    return V6Glass(
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          const Expanded(child: V6Eyebrow('Next milestone', ink: V6Ink.faint)),
          V6Text('${_fmt(coins)} / ${_fmt(next)}', size: 13, weight: FontWeight.w600),
        ]),
        const SizedBox(height: 10),
        V6ProgressBar(value: value, height: 8, semanticLabel: 'Progress to ${_fmt(next)} coins'),
        const SizedBox(height: 10),
        V6Text('${_fmt(toGo)} coins to go. Rest days never cost you anything.', size: 13, ink: V6Ink.muted),
      ]),
    );
  }
}

String _fmt(int n) {
  final s = n.toString();
  final b = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
    b.write(s[i]);
  }
  return b.toString();
}

/// The orb with two soft ripples (none with reduce motion).
class _RippleOrb extends StatefulWidget {
  const _RippleOrb({required this.mood, required this.animate});
  final V6Mood? mood;
  final bool animate;

  @override
  State<_RippleOrb> createState() => _RippleOrbState();
}

class _RippleOrbState extends State<_RippleOrb> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 2600));

  @override
  void initState() {
    super.initState();
    if (widget.animate) _c.repeat();
  }

  @override
  void didUpdateWidget(covariant _RippleOrb old) {
    super.didUpdateWidget(old);
    if (widget.animate && !_c.isAnimating) _c.repeat();
    if (!widget.animate && _c.isAnimating) _c.stop();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return SizedBox(
      width: 170,
      height: 170,
      child: Stack(alignment: Alignment.center, children: [
        if (widget.animate)
          for (final d in const [0.0, 0.35])
            AnimatedBuilder(
              animation: _c,
              builder: (context, _) {
                final t = (_c.value + d) % 1.0;
                return Opacity(
                  opacity: (1 - t) * 0.6,
                  child: Container(
                    width: 126 + 44 * t,
                    height: 126 + 44 * t,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: p.inkMuted, width: 1.5),
                    ),
                  ),
                );
              },
            ),
        V6MoodOrb(mood: widget.mood, size: 126, glow: true, live: true),
      ]),
    );
  }
}
