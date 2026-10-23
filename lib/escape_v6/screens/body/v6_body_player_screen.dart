// Escape v6 — Body player (Figma Make: Body.tsx → BodyPlayer).
//
// 3D viewport (GLB per move via model-viewer, Start / End switch for two-pose moves, calm
// silhouette + steps while a move has no model yet), current move + cue, and the bottom dock:
// pacing ring (countdown, or rep counter with +), previous / pause / next. Heart rate shows
// small at the top only when Health is connected and the reading is recent.
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '/escape_v6/v6.dart';
import 'v6_body_content.dart';

class V6BodyPlayerScreen extends StatefulWidget {
  const V6BodyPlayerScreen({super.key, required this.id});
  final String id;

  @override
  State<V6BodyPlayerScreen> createState() => _V6BodyPlayerScreenState();
}

class _V6BodyPlayerScreenState extends State<V6BodyPlayerScreen> with WidgetsBindingObserver {
  V6BodyRoutine? _r;
  int _idx = 0;
  int _t = 0; // seconds into the current timed move
  int _reps = 0; // reps counted on the current rep move
  int _model = 0; // Start / End pose index
  bool _paused = false;
  bool _showSteps = false;
  bool _finishing = false;
  bool _leaving = false;
  bool _confirming = false; // end-early sheet open (double Back / double tap)
  int _activeS = 0; // seconds actually practised (pauses excluded)
  Timer? _tick;
  Timer? _health;
  Timer? _repAdvance;

  /// A context below V6Page, so the end-early sheet takes the Body palette.
  BuildContext? _themed;

  BodyMove get _move => _r!.moves[_idx];
  bool get _isReps => _move.reps > 0;

  @override
  void initState() {
    super.initState();
    _r = v6BodyRoutine(widget.id);
    if (_r == null || _r!.moves.isEmpty) return;
    WidgetsBinding.instance.addObserver(this);
    V6Store.instance.startSession();
    _tick = Timer.periodic(const Duration(seconds: 1), (_) => _onTick());
    final s = V6Store.instance;
    if (s.healthConnected) {
      s.refreshHealth();
      _health = Timer.periodic(const Duration(seconds: 30), (_) => V6Store.instance.refreshHealth());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tick?.cancel();
    _health?.cancel();
    _repAdvance?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Leaving the app pauses the routine; coming back waits for the user.
    if (state == AppLifecycleState.paused && !_paused && !_finishing && mounted) {
      setState(() => _paused = true);
    }
  }

  void _onTick() {
    if (!mounted || _paused || _finishing) return;
    _activeS += 1;
    if (_isReps) return;
    setState(() => _t += 1);
    if (_t >= _move.seconds) _jump(1);
  }

  void _togglePause() {
    if (_finishing) return;
    HapticFeedback.lightImpact();
    setState(() => _paused = !_paused);
    // Reps were completed while paused: move on once the user resumes.
    if (!_paused && _isReps && _reps >= _move.reps) _jump(1);
  }

  Future<void> _confirmEnd(BuildContext themed) async {
    if (_finishing || _leaving || _confirming) return;
    _confirming = true;
    final wasPaused = _paused;
    if (!_paused) setState(() => _paused = true);
    final enough = _activeS >= 30 || _idx > 0;
    final choice = await showV6Sheet<String>(
      themed,
      title: 'End early?',
      builder: (sheet) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const V6Text("That's okay. Listening to your body is the point.", ink: V6Ink.muted),
        if (enough) ...[
          const SizedBox(height: 8),
          V6Text('You moved through ${_idx + 1} of ${_r!.moves.length}. It can still count.', size: 14, ink: V6Ink.faint),
        ],
        const SizedBox(height: 22),
        V6PrimaryPill(label: 'Keep going', onTap: () => Navigator.of(sheet).pop('keep')),
        if (enough) ...[
          const SizedBox(height: 10),
          V6GhostPill(label: 'Finish and reflect', onTap: () => Navigator.of(sheet).pop('finish')),
        ],
        const SizedBox(height: 6),
        Center(child: V6Link(label: 'Leave without saving', onTap: () => Navigator.of(sheet).pop('leave'))),
      ]),
    );
    _confirming = false;
    if (!mounted) return;
    switch (choice) {
      case 'finish':
        _finish();
      case 'leave':
        setState(() => _leaving = true);
        _tick?.cancel();
        _repAdvance?.cancel();
        final nav = Navigator.of(context);
        if (nav.canPop()) {
          nav.pop();
        } else {
          v6Open(context, V6Routes.body); // deep link with nothing underneath
        }
      default:
        if (!wasPaused) setState(() => _paused = false);
    }
  }

  void _jump(int d) {
    _repAdvance?.cancel();
    final r = _r!;
    final n = _idx + d;
    if (n < 0) {
      setState(() {
        _t = 0;
        _reps = 0;
      });
      return;
    }
    if (n >= r.moves.length) {
      _finish();
      return;
    }
    HapticFeedback.mediumImpact();
    setState(() {
      _idx = n;
      _t = 0;
      _reps = 0;
      _model = 0;
      _showSteps = v6GlbFor(r.moves[n]) == null;
    });
  }

  void _addRep() {
    if (_finishing) return;
    HapticFeedback.selectionClick();
    setState(() => _reps = (_reps + 1).clamp(0, _move.reps));
    if (_reps >= _move.reps) {
      _repAdvance?.cancel();
      _repAdvance = Timer(const Duration(milliseconds: 900), () {
        if (mounted && !_paused) _jump(1);
      });
    }
  }

  Future<void> _finish() async {
    if (_finishing) return;
    final r = _r!;
    _tick?.cancel();
    _repAdvance?.cancel();
    setState(() => _finishing = true);
    HapticFeedback.heavyImpact();
    final minutes = ((_activeS + 59) ~/ 60).clamp(1, 600);
    final store = V6Store.instance;
    final done = store.completeSession(
      V6SessionResult(
        area: V6Area.body,
        id: r.id,
        title: r.title,
        minutes: minutes,
        beforeMood: store.currentMood,
      ),
      taskId: 'stretch',
    );
    // lastSession is set synchronously; give the server a moment for coins, never block on it.
    try {
      await done.timeout(const Duration(seconds: 4));
    } catch (_) {}
    if (!mounted) return;
    GoRouter.of(context).pushReplacementNamed(V6Routes.bodyReflection);
  }

  String _fmt(int s) {
    final v = s < 0 ? 0 : s;
    return '${v ~/ 60}:${(v % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final r = _r;
    if (r == null || r.moves.isEmpty) {
      return V6Page(
        activity: V6PaletteId.body,
        child: V6ActionPage(
          top: const V6TopBar(closeIcon: true),
          footer: [V6PrimaryPill(label: 'Back to Body', onTap: () => v6Open(context, V6Routes.body))],
          children: const [
            V6Display("We couldn't find that routine", size: 26),
            V6Text('Pick another one on the Body page.', ink: V6Ink.muted),
          ],
        ),
      );
    }
    final pad = MediaQuery.paddingOf(context);
    final m = _move;
    final glbs = v6GlbsFor(m);
    final next = _idx + 1 < r.moves.length ? r.moves[_idx + 1] : null;
    return PopScope(
      canPop: _finishing || _leaving,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmEnd(_themed ?? context);
      },
      child: V6Page(
      activity: V6PaletteId.body,
      child: Builder(builder: (themed) {
        _themed = themed;
        return Padding(
        padding: EdgeInsets.fromLTRB(V6Space.gutter, pad.top + 8, V6Space.gutter, pad.bottom + 20),
        child: Column(children: [
          _TopRow(title: r.title, index: _idx, total: r.moves.length),
          const SizedBox(height: 8),
          V6ProgressBar(
            value: (_idx + _moveProgress()) / r.moves.length,
            height: 4,
            semanticLabel: 'Routine progress',
          ),
          Expanded(
            child: V6Fade(
              duration: const Duration(milliseconds: 450),
              child: KeyedSubtree(
                key: ValueKey('move-$_idx'),
                child: _Viewport(
                  move: m,
                  glbs: glbs,
                  model: _model,
                  paused: _paused,
                  showSteps: _showSteps || glbs.isEmpty,
                  color: r.section.color,
                  onModel: (i) => setState(() => _model = i),
                ),
              ),
            ),
          ),
          Semantics(
            liveRegion: true,
            child: V6Fade(
              child: Column(key: ValueKey('cue-$_idx'), children: [
                V6Display(m.name, size: 28, align: TextAlign.center, maxLines: 2),
                const SizedBox(height: 6),
                V6Text(m.cue, size: 15, ink: V6Ink.muted, align: TextAlign.center, maxLines: 3),
              ]),
            ),
          ),
          if (glbs.isNotEmpty)
            V6Link(
              label: _showSteps ? 'Hide steps' : 'How to do it',
              onTap: () => setState(() => _showSteps = !_showSteps),
            )
          else
            const SizedBox(height: 12),
          if (next != null) ...[
            V6Fade(child: _NextPeek(key: ValueKey('next-$_idx'), move: next)),
            const SizedBox(height: 10),
          ] else
            const SizedBox(height: 10),
          _Dock(
            isReps: _isReps,
            ringValue: _moveProgress(),
            ringLabel: _isReps ? '$_reps/${m.reps}' : _fmt(m.seconds - _t),
            ringSemantics: _isReps ? '$_reps of ${m.reps} reps' : '${m.seconds - _t} seconds left',
            paused: _paused,
            busy: _finishing,
            isLast: next == null,
            onPrev: () => _jump(-1),
            onNext: () => _jump(1),
            onPause: _togglePause,
            onRep: _addRep,
          ),
        ]),
        );
      }),
      ),
    );
  }

  double _moveProgress() {
    final m = _move;
    if (m.reps > 0) return _reps / m.reps;
    return m.seconds <= 0 ? 0 : (_t / m.seconds).clamp(0.0, 1.0);
  }
}

// ───────────────────────── pieces ─────────────────────────

class _TopRow extends StatelessWidget {
  const _TopRow({required this.title, required this.index, required this.total});
  final String title;
  final int index;
  final int total;

  @override
  Widget build(BuildContext context) => Row(children: [
        V6IconButton(
          icon: Icons.close_rounded,
          label: 'End session',
          onTap: () => Navigator.of(context).maybePop(),
        ),
        Expanded(
          child: Column(children: [
            Semantics(header: true, child: V6Text(title, size: 15, weight: FontWeight.w600, maxLines: 1)),
            V6Text('Move ${index + 1} of $total', size: 12, ink: V6Ink.faint),
          ]),
        ),
        const SizedBox(width: 48, height: 48, child: Center(child: _HeartRate())),
      ]);
}

/// Live heart rate, only when Health is connected and the reading is from the last 10 minutes.
class _HeartRate extends StatelessWidget {
  const _HeartRate();

  @override
  Widget build(BuildContext context) => V6Watch(builder: (context, s) {
        final h = s.health;
        final bpm = h?.heartRate;
        final at = h?.heartRateAt;
        final recent = at != null && DateTime.now().difference(at).inMinutes <= 10;
        if (!s.healthConnected || bpm == null || !recent) return const SizedBox.shrink();
        return Semantics(
          label: 'Heart rate ${bpm.round()} beats per minute',
          child: ExcludeSemantics(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.favorite_rounded, size: 14, color: Color(0xFFFF8A80)),
              V6Text('${bpm.round()}', size: 13, weight: FontWeight.w600, height: 1.1),
            ]),
          ),
        );
      });
}

class _Viewport extends StatelessWidget {
  const _Viewport({
    required this.move,
    required this.glbs,
    required this.model,
    required this.paused,
    required this.showSteps,
    required this.color,
    required this.onModel,
  });
  final BodyMove move;
  final List<String> glbs;
  final int model;
  final bool paused;
  final bool showSteps;
  final Color color;
  final ValueChanged<int> onModel;

  @override
  Widget build(BuildContext context) {
    final glow = Positioned(
      bottom: 24,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 260,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            gradient: const RadialGradient(colors: [Color(0x5938BDF8), Color(0x1A34D399), Color(0x0038BDF8)]),
          ),
        ),
      ),
    );

    if (glbs.isEmpty) {
      // No 3D model yet: calm figure + the steps.
      return LayoutBuilder(builder: (context, box) {
        // No lower clamp: on a 360×640 phone with large text the viewport can be ~120 pt tall.
        final fig = math.max(0.0, math.min(240.0, box.maxHeight * 0.45));
        if (box.maxHeight < 140) {
          // Too short for the figure (small phone + large text): steps only, never an overflow.
          return SingleChildScrollView(child: V6BodySteps(steps: move.steps, size: 14));
        }
        return Column(children: [
          const SizedBox(height: 8),
          SizedBox(
            height: fig + 24,
            child: Stack(alignment: Alignment.center, children: [
              glow,
              V6BodySilhouette(paused: paused, height: fig, color: color),
            ]),
          ),
          const V6Text('3D move coming soon', size: 12, ink: V6Ink.faint),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: V6BodySteps(steps: move.steps, size: 14),
            ),
          ),
        ]);
      });
    }

    final i = model.clamp(0, glbs.length - 1);
    final labels = move.stepLabels;
    return LayoutBuilder(builder: (context, box) {
      // Steps never take more than ~40% of the viewport, so the model keeps room on small phones.
      final stepsMax = math.max(0.0, math.min(150.0, box.maxHeight * 0.4));
      return Column(children: [
      Expanded(
        child: Stack(children: [
          glow,
          Positioned.fill(
            child: V6Fade(child: V6BodyModel(key: ValueKey(glbs[i]), glb: glbs[i], alt: move.name)),
          ),
          if (paused)
            Positioned(
              top: 12,
              left: 0,
              right: 0,
              child: Center(child: V6Chip(label: 'Paused', icon: Icons.pause_rounded)),
            ),
        ]),
      ),
      if (glbs.length > 1)
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var k = 0; k < glbs.length; k++) ...[
              if (k > 0) const SizedBox(width: 8),
              V6Chip(
                label: k < labels.length ? labels[k] : 'Pose ${k + 1}',
                selected: k == i,
                onTap: () => onModel(k),
              ),
            ],
          ]),
        ),
      AnimatedSize(
        duration: V6Theme.motionOff(context) ? Duration.zero : const Duration(milliseconds: 280),
        curve: V6Motion.ease,
        child: showSteps
            ? ConstrainedBox(
                constraints: BoxConstraints(maxHeight: stepsMax),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 12),
                  child: V6BodySteps(steps: move.steps, size: 13),
                ),
              )
            : const SizedBox(width: double.infinity),
      ),
    ]);
    });
  }
}

class _NextPeek extends StatelessWidget {
  const _NextPeek({super.key, required this.move});
  final BodyMove move;

  @override
  Widget build(BuildContext context) => V6Glass(
        radius: 18,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(children: [
          const V6Eyebrow('Up next', ink: V6Ink.faint),
          const SizedBox(width: 10),
          Expanded(child: V6Text(move.name, size: 14, weight: FontWeight.w500, maxLines: 1)),
          V6Text(v6BodyMoveLabel(move), size: 12, ink: V6Ink.faint),
        ]),
      );
}

class _Dock extends StatelessWidget {
  const _Dock({
    required this.isReps,
    required this.ringValue,
    required this.ringLabel,
    required this.ringSemantics,
    required this.paused,
    required this.busy,
    required this.isLast,
    required this.onPrev,
    required this.onNext,
    required this.onPause,
    required this.onRep,
  });
  final bool isReps;
  final double ringValue;
  final String ringLabel;
  final String ringSemantics;
  final bool paused;
  final bool busy;
  final bool isLast;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onPause;
  final VoidCallback onRep;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Glass(
      radius: 28,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(children: [
        V6Ring(
          value: ringValue,
          size: 56,
          stroke: 4,
          semanticLabel: ringSemantics,
          child: V6Text(ringLabel, size: 12, weight: FontWeight.w600, height: 1),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
            V6IconButton(icon: Icons.skip_previous_rounded, label: 'Previous move', onTap: busy ? null : onPrev),
            const SizedBox(width: 12),
            V6Pressable(
              onTap: busy ? null : onPause,
              semanticLabel: paused ? 'Resume' : 'Pause',
              scale: 0.92,
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: p.ink,
                  boxShadow: [BoxShadow(color: p.accent.withOpacity(0.35), blurRadius: 24)],
                ),
                child: busy
                    ? Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircularProgressIndicator(strokeWidth: 2.2, color: p.onInk),
                      )
                    : Icon(paused ? Icons.play_arrow_rounded : Icons.pause_rounded, size: 30, color: p.onInk),
              ),
            ),
            const SizedBox(width: 12),
            V6IconButton(
              icon: isLast ? Icons.check_rounded : Icons.skip_next_rounded,
              label: isLast ? 'Finish' : 'Next move',
              onTap: busy ? null : onNext,
            ),
          ]),
          ),
        ),
        if (isReps)
          V6IconButton(icon: Icons.add_rounded, label: 'Count a rep', size: 56, onTap: busy ? null : onRep)
        else
          const SizedBox(width: 56),
      ]),
    );
  }
}
