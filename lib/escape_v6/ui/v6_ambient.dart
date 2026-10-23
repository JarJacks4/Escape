// Escape v6 — AmbientBackground + V6Theme (Figma Make: src/ambient/AmbientBackground.tsx).
//
// Layers, bottom to top (Jared's glass spec):
//   1. Base 3-stop gradient from the palette.
//   2. The TouchDesigner Mood Orb loop for this palette, scaled to cover the screen, under a
//      40/40 blur (BackdropFilter would blur content behind it; here we blur the loop itself with
//      ImageFiltered, which is what "a 40/40 blur on top of a GIF in a container" does).
//   3. A container with no image and three gradient stops at 15% / 25% / 100%.
//   4. Two slow drifting glows (28 s / 34 s), off when Reduce Motion is on.
// Palettes cross-fade over 1.2 s, so a mood check-in or the sun/moon toggle washes over the app.
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../state/v6_store.dart';
import '../theme/v6_palettes.dart';
import '../theme/v6_type.dart';
import 'v6_video_pool.dart';

/// Gives every v6 widget the live (animated) palette.
class V6Theme extends InheritedWidget {
  const V6Theme({super.key, required this.palette, required this.reduceMotion, required super.child});
  final V6Palette palette;
  final bool reduceMotion;

  static V6Palette of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<V6Theme>()?.palette ?? v6Palette(V6PaletteId.night);

  static bool motionOff(BuildContext context) {
    final t = context.dependOnInheritedWidgetOfExactType<V6Theme>();
    final os = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return os || (t?.reduceMotion ?? false);
  }

  @override
  bool updateShouldNotify(V6Theme old) => old.palette != palette || old.reduceMotion != reduceMotion;
}

/// Which offline orb loop tints each palette's background.
String ambientLoopFor(V6PaletteId id) => switch (id) {
      V6PaletteId.day || V6PaletteId.calm => 'assets/orbs/escape_calm_e50_t50_v3_540_offline.mp4',
      V6PaletteId.focused ||
      V6PaletteId.restless ||
      V6PaletteId.body =>
        'assets/orbs/escape_focus_e50_t50_v3_540_offline.mp4',
      V6PaletteId.energized ||
      V6PaletteId.daySoundscape =>
        'assets/orbs/escape_picks_e50_t50_v3_540_offline.mp4',
      _ => 'assets/orbs/escape_sleep_e50_t50_v3_540_offline.mp4',
    };

String ambientPosterFor(V6PaletteId id) =>
    ambientLoopFor(id).replaceFirst('_540_offline.mp4', '_poster.webp');

/// Wraps a page (or the whole shell) in the ambient background and provides [V6Theme].
///
/// [activity] pins a palette (exercise player, body player); otherwise the store resolves
/// mood > time of day. [entryScreen] ignores the saved mood (splash, sign-in, onboarding).
///
/// The palette cross-fade is driven by one controller, so [child] keeps its element (and all
/// its state: tabs, scroll positions, text fields, video) when the palette changes.
class V6Ambient extends StatefulWidget {
  const V6Ambient({
    super.key,
    required this.child,
    this.activity,
    this.entryScreen = false,
    this.showMedia = true,
  });

  final Widget child;
  final V6PaletteId? activity;
  final bool entryScreen;

  /// Set false on pages that already show a full-bleed orb or photo, to save a video decoder.
  final bool showMedia;

  @override
  State<V6Ambient> createState() => _V6AmbientState();
}

class _V6AmbientState extends State<V6Ambient> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: V6Motion.ambient, value: 1);
  late final CurvedAnimation _t = CurvedAnimation(parent: _c, curve: V6Motion.easeInOut);
  V6PaletteId? _id;
  V6Palette? _from;
  V6Palette _to = v6Palette(V6PaletteId.night);

  V6Palette get _current =>
      (_from == null || _c.value >= 1) ? _to : V6Palette.lerp(_from!, _to, _t.value);

  void _retarget(V6PaletteId id, bool reduce) {
    if (_id == id) return;
    final first = _id == null;
    final target = v6Palette(id);
    final from = first ? (_AmbientMemory.last ?? target) : _current;
    _id = id;
    _to = target;
    _from = from;
    if (reduce || identical(from, target)) {
      _c.value = 1;
    } else {
      _c.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _t.dispose();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return V6Watch(builder: (context, s) {
      final id = s.resolvePalette(activity: widget.activity, entryScreen: widget.entryScreen);
      _retarget(id, s.reduceMotion);
      return AnimatedBuilder(
        animation: _c,
        child: widget.child,
        builder: (context, child) {
          final p = _current;
          if (_c.value >= 1) _AmbientMemory.last = _to;
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: p.isLight ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
            child: V6Theme(
              palette: p,
              reduceMotion: s.reduceMotion,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _AmbientLayers(palette: p, id: id, showMedia: widget.showMedia, motionOff: s.reduceMotion),
                  child!,
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

/// Remembers the last settled palette so a new page starts its cross-fade from what was on
/// screen, not from black.
class _AmbientMemory {
  static V6Palette? last;
}

class _AmbientLayers extends StatelessWidget {
  const _AmbientLayers({required this.palette, required this.id, required this.showMedia, required this.motionOff});
  final V6Palette palette;
  final V6PaletteId id;
  final bool showMedia;
  final bool motionOff;

  @override
  Widget build(BuildContext context) {
    final p = palette;
    final off = motionOff || (MediaQuery.maybeOf(context)?.disableAnimations ?? false);
    return IgnorePointer(
      child: RepaintBoundary(
        child: Stack(fit: StackFit.expand, children: [
          // 1. base gradient
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: p.base,
                stops: const [0, 0.55, 1],
              ),
            ),
          ),
          // 2. blurred TouchDesigner loop
          if (showMedia)
            AnimatedSwitcher(
              duration: V6Motion.ambient,
              child: _BlurredLoop(
                key: ValueKey(ambientLoopFor(id)),
                asset: ambientLoopFor(id),
                poster: ambientPosterFor(id),
                live: !off,
                opacity: p.isLight ? 0.38 : 0.55,
              ),
            ),
          // 3. the 15 / 25 / 100 gradient container
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  p.base[0].withOpacity(p.isLight ? 0.55 : 0.35),
                  p.base[1].withOpacity(p.isLight ? 0.45 : 0.30),
                  p.base[2].withOpacity(p.isLight ? 0.80 : 0.85),
                ],
                stops: const [0.15, 0.25, 1.0],
              ),
            ),
          ),
          // 4. drifting glows
          _Glows(palette: p, animate: !off),
        ]),
      ),
    );
  }
}

class _BlurredLoop extends StatefulWidget {
  const _BlurredLoop({super.key, required this.asset, required this.poster, required this.live, required this.opacity});
  final String asset;
  final String poster;
  final bool live;
  final double opacity;

  @override
  State<_BlurredLoop> createState() => _BlurredLoopState();
}

class _BlurredLoopState extends State<_BlurredLoop> with WidgetsBindingObserver {
  VideoPlayerController? _c;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (widget.live) _start();
  }

  void _start() {
    if (!V6VideoPool.hasRoom(widget.asset)) return; // poster stays (decoder budget)
    _c = V6VideoPool.acquire(widget.asset);
    V6VideoPool.ready(widget.asset).then((ok) {
      if (mounted) setState(() => _ready = ok);
    });
  }

  @override
  void didUpdateWidget(covariant _BlurredLoop old) {
    super.didUpdateWidget(old);
    if (old.live != widget.live) {
      if (widget.live) {
        _start();
      } else if (_c != null) {
        V6VideoPool.release(widget.asset);
        _c = null;
        _ready = false;
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final c = _c;
    if (c == null || !c.value.isInitialized) return;
    if (state == AppLifecycleState.resumed) {
      c.play();
    } else if (state == AppLifecycleState.paused) {
      c.pause();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_c != null) V6VideoPool.release(widget.asset);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = _c;
    final media = (_ready && c != null && c.value.isInitialized)
        ? FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(width: c.value.size.width, height: c.value.size.height, child: VideoPlayer(c)),
          )
        : Image.asset(widget.poster, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const SizedBox());
    return Opacity(
      opacity: widget.opacity,
      child: ImageFiltered(
        imageFilter: ui.ImageFilter.blur(sigmaX: 40, sigmaY: 40, tileMode: TileMode.mirror),
        child: Transform.scale(scale: 1.25, child: media),
      ),
    );
  }
}

class _Glows extends StatefulWidget {
  const _Glows({required this.palette, required this.animate});
  final V6Palette palette;
  final bool animate;

  @override
  State<_Glows> createState() => _GlowsState();
}

class _GlowsState extends State<_Glows> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(seconds: 34));

  @override
  void initState() {
    super.initState();
    if (widget.animate) _c.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(covariant _Glows old) {
    super.didUpdateWidget(old);
    if (widget.animate && !_c.isAnimating) _c.repeat(reverse: true);
    if (!widget.animate && _c.isAnimating) _c.stop();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.palette;
    return LayoutBuilder(builder: (context, box) {
      return AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          final t = Curves.easeInOut.transform(_c.value);
          // Glow A drifts on a 28 s feel (faster phase), glow B on 34 s.
          final ta = math.sin(t * math.pi * 34 / 28);
          return Stack(children: [
            Positioned(
              left: -160 + 90 * ta,
              top: -180 + 140 * ta,
              child: _glow(520 * (1 + 0.15 * ta), p.glowA),
            ),
            Positioned(
              right: -200 + 110 * t,
              bottom: -220 + 160 * t,
              child: _glow(560 * (1 + 0.1 * t), p.glowB),
            ),
          ]);
        },
      );
    });
  }

  Widget _glow(double size, Color c) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [c, c.withOpacity(0)], stops: const [0, 0.65]),
        ),
      );
}
