// Escape v6 — Exercise player (Figma Make: Sessions.tsx › ExercisePlayer, BreathSheet.tsx).
//
// The whole app takes the session palette. Breath sessions: a big live Mood Orb grows on the
// inhale, holds steady, shrinks on the exhale (timed from V6Breath), with a phase label and a
// countdown, plus optional haptics. Meditations: script lines cross-fade evenly across the
// session. Grounding: 5·4·3·2·1 cards with "Next".
//
// All controls sit in the bottom dock (thumb zone); Pause is the largest. Paused shows
// "Take your time" and hides the timer (no time pressure). Finishing replaces this page with the
// mood-shift step so Back never lands inside a finished session.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';

import '/escape_v6/v6.dart';
import 'v6_player_parts.dart';
import 'v6_session_common.dart';

enum _Ph { inhale, hold, exhale, rest }

class _Phase {
  const _Phase(this.kind, this.label, this.seconds);
  final _Ph kind;
  final String label;
  final int seconds;
}

List<_Phase> _phasesFor(V6Breath b) => [
      _Phase(_Ph.inhale, 'Breathe in', b.inhale),
      if (b.hold > 0) _Phase(_Ph.hold, 'Hold', b.hold),
      _Phase(_Ph.exhale, 'Breathe out', b.exhale),
      if (b.rest > 0) _Phase(_Ph.rest, 'Hold', b.rest),
    ].where((p) => p.seconds > 0).toList();

const _kGroundCounts = [5, 4, 3, 2, 1];

/// Orb scale at the bottom of an exhale (1.0 = full inhale).
const _kOrbMin = 0.62;

class V6ExercisePlayerScreen extends StatefulWidget {
  const V6ExercisePlayerScreen({super.key, required this.id});
  final String id;

  @override
  State<V6ExercisePlayerScreen> createState() => _V6ExercisePlayerScreenState();
}

class _V6ExercisePlayerScreenState extends State<V6ExercisePlayerScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  V6Exercise? _e;
  List<_Phase> _phases = const [];

  /// 0 = fully exhaled, 1 = fully inhaled.
  late final AnimationController _orb = AnimationController(vsync: this, value: 0);
  final Stopwatch _watch = Stopwatch();
  Timer? _tick;

  bool _paused = false;
  bool _haptics = true;
  bool _voice = false;
  bool _voiceBroken = false;
  bool _finishing = false;
  bool _leaving = false;
  bool _confirming = false; // the end-early sheet is open (double Back / double tap)
  bool _motionOff = false;

  int _phaseIndex = -1;
  int _cycleNo = -1;
  int _phaseLeftMs = 0;
  int _lastSecond = -1;
  int _ground = 0;

  /// True while re-syncing the phase after Resume: the orb continues, but no extra haptic.
  bool _resyncing = false;

  AudioPlayer? _player;
  final Map<String, String> _voiceCache = {};
  String? _lastSpoken;
  int _speakToken = 0;

  /// A context below V6Page (so sheets pick up the session palette).
  BuildContext? _themed;

  int get _totalS => math.max(1, (_e?.minutes ?? 1) * 60);
  int get _elapsedMs => _watch.elapsedMilliseconds;
  bool get _timed => _e?.kind != V6ExerciseKind.grounding;

  @override
  void initState() {
    super.initState();
    final e = v6Exercise(widget.id);
    _e = e;
    if (e == null) return;
    final b = e.breath;
    if (e.kind == V6ExerciseKind.breath && b != null && b.cycle > 0) _phases = _phasesFor(b);
    WidgetsBinding.instance.addObserver(this);
    V6Store.instance.startSession();
    _watch.start();
    _tick = Timer.periodic(const Duration(milliseconds: 200), (_) => _onTick());
    WidgetsBinding.instance.addPostFrameCallback((_) => _onTick());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tick?.cancel();
    _watch.stop();
    _orb.dispose();
    _speakToken++;
    final pl = _player;
    if (pl != null) unawaited(pl.dispose().catchError((_) {}));
    // Lucille's cached voice clips live in the temp dir only for this session.
    for (final path in _voiceCache.values) {
      unawaited(File(path).delete().then((_) {}, onError: (_) {}));
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Leaving the app pauses the session; coming back waits for the user.
    if (state == AppLifecycleState.paused) _pause();
  }

  // ───────────────────────── timing ─────────────────────────

  void _onTick() {
    if (!mounted || _finishing || _e == null) return;
    var changed = false;
    if (_phases.isNotEmpty && !_paused) changed = _syncPhase();
    if (_timed && _elapsedMs >= _totalS * 1000) {
      _finish(complete: true);
      return;
    }
    final sec = _elapsedMs ~/ 1000;
    if (sec != _lastSecond) {
      _lastSecond = sec;
      changed = true;
    }
    final cue = _currentCue();
    if (_voice && !_voiceBroken && !_paused && cue != null && cue != _lastSpoken) _speak(cue);
    if (changed) setState(() {});
  }

  /// Returns true when the breath phase changed.
  bool _syncPhase() {
    final cycleMs = _phases.fold<int>(0, (a, p) => a + p.seconds) * 1000;
    if (cycleMs <= 0) return false;
    final ms = _elapsedMs;
    final cyc = ms ~/ cycleMs;
    var t = ms % cycleMs;
    var idx = 0;
    var left = 0;
    for (var i = 0; i < _phases.length; i++) {
      final len = _phases[i].seconds * 1000;
      if (t < len) {
        idx = i;
        left = len - t;
        break;
      }
      t -= len;
    }
    _phaseLeftMs = left;
    if (idx == _phaseIndex && cyc == _cycleNo) return false;
    _phaseIndex = idx;
    _cycleNo = cyc;
    _onPhaseStart(_phases[idx], left, haptic: !_resyncing);
    _resyncing = false;
    return true;
  }

  void _onPhaseStart(_Phase ph, int leftMs, {bool haptic = true}) {
    if (_haptics && haptic) {
      if (ph.kind == _Ph.inhale) HapticFeedback.lightImpact();
      if (ph.kind == _Ph.exhale) HapticFeedback.selectionClick();
    }
    if (_motionOff) {
      _orb.value = 0.5;
      return;
    }
    final target = (ph.kind == _Ph.inhale || ph.kind == _Ph.hold) ? 1.0 : 0.0;
    final moving = ph.kind == _Ph.inhale || ph.kind == _Ph.exhale;
    _orb.animateTo(
      target,
      duration: Duration(milliseconds: math.max(1, moving ? leftMs : math.min(600, leftMs))),
      curve: Curves.easeInOut,
    );
  }

  String? _currentCue() {
    final e = _e;
    if (e == null) return null;
    if (_phases.isNotEmpty) return _phaseIndex < 0 ? null : _phases[_phaseIndex].label;
    if (e.kind == V6ExerciseKind.grounding) return e.steps.isEmpty ? null : e.steps[_ground.clamp(0, e.steps.length - 1)];
    if (e.script.isEmpty) return null;
    return e.script[_scriptIndex(e)];
  }

  int _scriptIndex(V6Exercise e) {
    final n = e.script.length;
    final i = (_elapsedMs / (_totalS * 1000) * n).floor();
    return i.clamp(0, n - 1);
  }

  // ───────────────────────── controls ─────────────────────────

  void _pause() {
    if (_paused || _finishing || _e == null) return;
    _paused = true;
    _watch.stop();
    _speakToken++;
    _player?.pause().catchError((_) {});
    if (!_motionOff && _phases.isNotEmpty) {
      _orb.animateTo(0.5, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    } else {
      _orb.stop();
    }
    if (mounted) setState(() {});
  }

  void _resume() {
    if (!_paused || _finishing) return;
    _paused = false;
    _watch.start();
    _phaseIndex = -1; // re-sync: the orb continues over the remaining phase time
    _resyncing = true; // ...without a second haptic for a phase that already started
    _lastSpoken = null;
    setState(() {});
    _onTick();
  }

  void _togglePause() => _paused ? _resume() : _pause();

  void _groundNext() {
    final e = _e;
    if (e == null || _finishing) return;
    if (_ground >= _kGroundCounts.length - 1 || _ground >= e.steps.length - 1) {
      _finish(complete: true);
      return;
    }
    setState(() => _ground++);
    _onTick();
  }

  Future<void> _confirmEnd() async {
    if (_finishing || _leaving || _confirming || _e == null) return;
    _confirming = true;
    final wasPaused = _paused;
    _pause();
    final enough = _elapsedMs >= 30000 || (!_timed && _ground > 0);
    final ctx = _themed ?? context;
    final choice = await showV6Sheet<String>(
      ctx,
      title: 'End early?',
      builder: (sheet) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const V6Text("That's okay. Stopping when you need to is part of the practice.", ink: V6Ink.muted),
        if (enough) ...[
          const SizedBox(height: 8),
          V6Text(
            _timed ? 'You practised for ${v6Clock(_elapsedMs ~/ 1000)}. It can still count.' : 'Every step you took still counts.',
            size: 14,
            ink: V6Ink.faint,
          ),
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
        _finish(complete: false);
      case 'leave':
        setState(() => _leaving = true);
        _tick?.cancel();
        _speakToken++;
        _player?.stop().catchError((_) {});
        final nav = Navigator.of(context);
        if (nav.canPop()) {
          nav.pop();
        } else {
          // Opened from a deep link with nothing underneath: land on Home, never a blank screen.
          v6Open(context, V6Routes.tabHome);
        }
      default:
        if (!wasPaused) _resume();
    }
  }

  Future<void> _finish({required bool complete}) async {
    final e = _e;
    if (_finishing || e == null) return;
    setState(() => _finishing = true);
    _tick?.cancel();
    _watch.stop();
    _orb.stop();
    _speakToken++;
    _player?.stop().catchError((_) {});
    HapticFeedback.mediumImpact();
    final store = V6Store.instance;
    final minutes = complete && _timed ? e.minutes : math.max(1, (_elapsedMs / 60000).round());
    final r = V6SessionResult(
      area: e.area == 'mind' ? V6Area.mind : V6Area.reset,
      id: e.id,
      title: e.title,
      minutes: minutes,
      beforeMood: store.currentMood,
    );
    final router = GoRouter.of(context);
    try {
      await store
          .completeSession(r, taskId: e.taskId)
          .timeout(const Duration(seconds: 8), onTimeout: () => store.lastSession ?? r);
    } catch (err) {
      debugPrint('V6 player: completeSession failed: $err');
    }
    if (!mounted) return;
    router.pushReplacementNamed(V6Routes.moodShift);
  }

  // ───────────────────────── Lucille's voice ─────────────────────────

  Future<void> _speak(String text) async {
    _lastSpoken = text;
    final token = ++_speakToken;
    try {
      var path = _voiceCache[text];
      if (path == null) {
        final r = await V6Api.speak(text);
        var audio = r.ok ? r.map['audio'] : null;
        if (audio is! String || audio.isEmpty) {
          _voiceBroken = true; // captions only from here on, silently
          return;
        }
        final comma = audio.indexOf(',');
        if (audio.startsWith('data:') && comma > 0) audio = audio.substring(comma + 1);
        final dir = await getTemporaryDirectory();
        final f = File('${dir.path}/v6_voice_${text.hashCode.toUnsigned(32)}.mp3');
        await f.writeAsBytes(base64Decode(audio), flush: true);
        path = f.path;
        _voiceCache[text] = path;
      }
      if (!mounted || token != _speakToken || !_voice || _paused || _finishing) return;
      final pl = _player ??= AudioPlayer();
      await pl.setAudioSource(AudioSource.file(
        path,
        tag: MediaItem(id: 'v6-voice-${text.hashCode.toUnsigned(32)}', title: 'Lucille', album: _e?.title),
      ));
      if (!mounted || token != _speakToken) return;
      unawaited(pl.play().catchError((_) {}));
    } catch (err) {
      debugPrint('V6 player: voice unavailable, captions only ($err)');
      _voiceBroken = true;
    }
  }

  void _setVoice(bool on) {
    setState(() => _voice = on);
    if (on) {
      _voiceBroken = false;
      _lastSpoken = null;
      _onTick();
    } else {
      _speakToken++;
      _player?.stop().catchError((_) {});
    }
  }

  // ───────────────────────── build ─────────────────────────

  @override
  Widget build(BuildContext context) {
    final e = _e;
    if (e == null) return const V6PlayerMissing();
    return PopScope(
      canPop: _finishing || _leaving,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmEnd();
      },
      child: V6Page(
        activity: e.palette,
        child: Builder(builder: (context) {
          _themed = context;
          _motionOff = V6Theme.motionOff(context);
          return _body(context, e);
        }),
      ),
    );
  }

  Widget _body(BuildContext context, V6Exercise e) {
    final mq = MediaQuery.of(context);
    final elapsedS = _elapsedMs ~/ 1000;
    final remaining = math.max(0, _totalS - elapsedS);
    final grounding = e.kind == V6ExerciseKind.grounding;
    // Figma: a 220 pt orb; smaller on short phones so the dock never overflows.
    final orbSize = math.min(220.0, mq.size.height * (grounding ? 0.2 : 0.3));
    final String subtitle;
    if (_finishing) {
      subtitle = 'Well done';
    } else if (_paused) {
      subtitle = 'Paused';
    } else if (grounding) {
      subtitle = 'Step ${_ground + 1} of ${_kGroundCounts.length}';
    } else {
      subtitle = '${v6Clock(remaining)} left';
    }
    final progress = grounding ? _ground / _kGroundCounts.length : elapsedS / _totalS;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(height: mq.padding.top + 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Semantics(header: true, child: V6Text(e.title, size: 16, weight: FontWeight.w600, align: TextAlign.center)),
            V6Fade(child: V6Text(subtitle, key: ValueKey(subtitle), size: 12, ink: V6Ink.faint)),
          ]),
        ),
      ),
      Expanded(
        child: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter, vertical: 12),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                width: orbSize + 24,
                height: orbSize + 24,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _orb,
                    builder: (context, child) {
                      final s = _phases.isEmpty || _motionOff ? 1.0 : _kOrbMin + (1 - _kOrbMin) * _orb.value;
                      return Transform.scale(scale: s, child: child);
                    },
                    child: V6MoodOrb(
                      mood: v6ExerciseMood(e),
                      size: orbSize,
                      glow: true,
                      live: true,
                      // Continues from the detail page's orb (photo sessions keep the photo there).
                      heroTag: (e.image == null || e.image!.isEmpty) ? e.heroTag : null,
                      pulse: _phases.isEmpty && !_paused,
                    ),
                  ),
                ),
              ),
              SizedBox(height: grounding ? 16 : 28),
              _caption(e),
            ]),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(V6Space.gutter, 4, V6Space.gutter, 16 + mq.padding.bottom),
        child: V6PlayerDock(
          paused: _paused,
          finishing: _finishing,
          progress: progress,
          ringLabel: grounding ? '${_ground + 1}/${_kGroundCounts.length}' : v6Clock(remaining),
          ringSemantics: grounding
              ? 'Step ${_ground + 1} of ${_kGroundCounts.length}'
              : '${v6Clock(remaining)} remaining',
          showHaptics: _phases.isNotEmpty,
          haptics: _haptics,
          onHaptics: (v) => setState(() => _haptics = v),
          voice: _voice,
          onVoice: _setVoice,
          onPause: _togglePause,
          onEnd: _confirmEnd,
        ),
      ),
    ]);
  }

  Widget _caption(V6Exercise e) {
    if (_finishing) {
      return Semantics(
        liveRegion: true,
        child: const Column(children: [
          V6Display('Well done', size: 32, align: TextAlign.center),
          SizedBox(height: 8),
          V6Text('Saving your session…', ink: V6Ink.muted),
        ]),
      );
    }
    if (_phases.isNotEmpty) {
      final ph = _phaseIndex < 0 ? _phases.first : _phases[_phaseIndex];
      final label = _paused ? 'Paused' : ph.label;
      final count = _paused ? 'Take your time' : '${(_phaseLeftMs / 1000).ceil().clamp(1, 99)}';
      return Semantics(
        liveRegion: true,
        label: _paused ? 'Paused. Take your time' : ph.label,
        child: ExcludeSemantics(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 96),
            child: Column(children: [
              V6Fade(child: V6Display(label, key: ValueKey('l$label'), size: 32, align: TextAlign.center)),
              const SizedBox(height: 8),
              V6Fade(
                duration: const Duration(milliseconds: 250),
                child: V6Text(count, key: ValueKey('c$count'), size: _paused ? 15 : 22, ink: V6Ink.muted, weight: FontWeight.w500),
              ),
            ]),
          ),
        ),
      );
    }
    if (e.kind == V6ExerciseKind.grounding && e.steps.isNotEmpty) {
      final i = _ground.clamp(0, math.min(_kGroundCounts.length, e.steps.length) - 1);
      final last = i >= math.min(_kGroundCounts.length, e.steps.length) - 1;
      return Column(children: [
        V6Fade(
          child: V6GroundCard(
            key: ValueKey(i),
            count: _kGroundCounts[i],
            text: e.steps[i],
          ),
        ),
        const SizedBox(height: 14),
        if (_paused)
          const V6Text('Take your time', ink: V6Ink.muted)
        else
          SizedBox(
            width: 200,
            child: V6GhostPill(
              label: last ? 'Finish' : 'Next',
              icon: last ? Icons.check_rounded : Icons.arrow_forward_rounded,
              onTap: _groundNext,
            ),
          ),
      ]);
    }
    final line = e.script.isEmpty ? e.summary : e.script[_scriptIndex(e)];
    return Semantics(
      liveRegion: true,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 110),
        child: Column(children: [
          V6Fade(
            duration: const Duration(milliseconds: 900),
            child: V6Display(line, key: ValueKey(line), size: 24, align: TextAlign.center),
          ),
          const SizedBox(height: 12),
          V6Fade(
            child: _paused
                ? const V6Text('Paused · Take your time', key: ValueKey('p'), size: 14, ink: V6Ink.muted)
                : const SizedBox(key: ValueKey('r'), height: 20),
          ),
        ]),
      ),
    );
  }
}
