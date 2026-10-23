// Shared, ref-counted video controllers for Mood Orb loops and the ambient background.
//
// Two widgets showing the same loop (e.g. the orb on Home and the same orb mid-Hero-flight on the
// check-in page) share one decoder, so a Hero transition never flashes or restarts the loop.
// Phones only have a few hardware decoders: callers keep at most ~3 live loops on screen.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class _Entry {
  _Entry(this.controller);
  final VideoPlayerController controller;
  int refs = 0;
  Future<bool>? ready;
  Timer? disposeTimer;
}

class V6VideoPool {
  V6VideoPool._();
  static final Map<String, _Entry> _entries = {};

  /// Max decoders held at once (orbs + ambient loops). Phones have few hardware decoders, so
  /// an orb asking beyond this stays on its poster (see [hasRoom]).
  static const maxLive = 4;

  static int get _active => _entries.values.where((e) => e.refs > 0).length;

  /// True when [source] is already held or one more decoder fits under [maxLive].
  static bool hasRoom(String source) {
    final e = _entries[source];
    if (e != null) return true;
    if (_active < maxLive) return true;
    return false;
  }

  /// Frees lingering (unreferenced) decoders right away when the pool is full.
  static void _evictIdle() {
    if (_entries.length < maxLive) return;
    final idle = _entries.entries.where((x) => x.value.refs <= 0).toList();
    for (final x in idle) {
      x.value.disposeTimer?.cancel();
      _entries.remove(x.key);
      x.value.controller.dispose();
    }
  }

  /// [source] is an asset path (assets/...) or an https URL.
  static VideoPlayerController acquire(String source) {
    if (!_entries.containsKey(source)) _evictIdle();
    final e = _entries.putIfAbsent(source, () {
      final c = source.startsWith('assets/')
          ? VideoPlayerController.asset(source,
              videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
          : VideoPlayerController.networkUrl(Uri.parse(source),
              videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
      return _Entry(c);
    });
    e.disposeTimer?.cancel();
    e.refs += 1;
    e.ready ??= _init(e.controller);
    return e.controller;
  }

  /// The controller for [source] if someone already holds it (no new reference).
  static VideoPlayerController? peek(String source) => _entries[source]?.controller;

  static Future<bool> ready(String source) => _entries[source]?.ready ?? Future.value(false);

  static Future<bool> _init(VideoPlayerController c) async {
    try {
      await c.initialize();
      await c.setLooping(true);
      await c.setVolume(0);
      await c.play();
      return true;
    } catch (e) {
      debugPrint('V6VideoPool: $e');
      return false;
    }
  }

  /// Releases one reference. The decoder lingers 2 s so a Hero flight or quick back/forward
  /// re-uses it instead of re-buffering.
  static void release(String source) {
    final e = _entries[source];
    if (e == null) return;
    e.refs -= 1;
    if (e.refs > 0) return;
    e.disposeTimer?.cancel();
    e.disposeTimer = Timer(const Duration(seconds: 2), () {
      if (e.refs <= 0) {
        _entries.remove(source);
        e.controller.dispose();
      }
    });
  }

  /// Pause everything (app in background) / resume.
  static void pauseAll() {
    for (final e in _entries.values) {
      if (e.controller.value.isInitialized) e.controller.pause();
    }
  }

  static void resumeAll() {
    for (final e in _entries.values) {
      if (e.refs > 0 && e.controller.value.isInitialized) e.controller.play();
    }
  }

  @visibleForTesting
  static int get liveCount => _entries.length;
}
