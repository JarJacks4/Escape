// Escape v6 — the smoke reveal.
//
// Headlines, Lucille's replies and the one line that carries a screen resolve *out of smoke*
// rather than fading flatly in. It is deliberately quiet: one soft noise edge and ~14 px of
// drift over 900 ms. Used on a handful of elements per screen, never on lists or chrome —
// smoke everywhere would read as a loading failure.
//
// The shader lives in assets/shaders/v6_smoke_reveal.frag. If it can't compile or load (older
// devices, Skia without Impeller, a web build), every widget here silently degrades to the
// ordinary fade, so nothing ever disappears because of a GPU feature.
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../theme/v6_type.dart';
import 'v6_ambient.dart';

/// Loads (once) and caches the smoke program. Never throws.
class V6SmokeShader {
  V6SmokeShader._();

  static const _asset = 'assets/shaders/v6_smoke_reveal.frag';

  static ui.FragmentProgram? _program;
  static bool _tried = false;
  static Future<void>? _loading;

  /// True once the program is ready. False while loading or if loading failed.
  static bool get ready => _program != null;

  /// Kicks off the load. Safe to call repeatedly; only the first call does work.
  static Future<void> warmUp() {
    if (_tried) return _loading ?? Future<void>.value();
    _tried = true;
    _loading = ui.FragmentProgram.fromAsset(_asset).then<void>((p) {
      _program = p;
    }).catchError((Object e, StackTrace s) {
      // Not fatal: callers fall back to a plain fade.
      debugPrint('V6Smoke: shader unavailable, falling back to fade ($e)');
    });
    return _loading!;
  }

  static ui.FragmentShader? newShader() => _program?.fragmentShader();
}

/// Paints [child] through the smoke shader at [progress] (0 = smoke, 1 = resolved).
///
/// Prefer [V6SmokeIn] / [V6SmokeSwitch]; use this directly only when you drive the progress
/// yourself (e.g. tied to a scroll position or a breath phase).
class V6Smoke extends StatelessWidget {
  const V6Smoke({
    super.key,
    required this.child,
    required this.progress,
    this.seed = 0,
    this.drift = 14,
    this.softness = 0.22,
    this.enabled = true,
  });

  final Widget child;
  final double progress;

  /// Decorrelates neighbouring lines so a stack doesn't dissolve in lockstep.
  final double seed;

  /// Logical pixels the unresolved pixels lift. 0 dissolves in place.
  final double drift;

  /// Width of the noise edge, 0.05 (crisp) … 0.6 (very soft).
  final double softness;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final t = progress.clamp(0.0, 1.0);
    // Reduce Motion, no shader, or nothing to do: plain opacity.
    if (!enabled || !V6SmokeShader.ready || V6Theme.motionOff(context)) {
      return t >= 1 ? child : Opacity(opacity: t, child: child);
    }
    if (t >= 1) return child;
    return AnimatedSampler(
      (ui.Image image, Size size, Canvas canvas) {
        final shader = V6SmokeShader.newShader();
        if (shader == null) {
          // Lost between the ready check and here; draw the layer plainly.
          canvas.drawImageRect(
            image,
            Offset.zero & Size(image.width.toDouble(), image.height.toDouble()),
            Offset.zero & size,
            Paint()..color = Color.fromRGBO(255, 255, 255, t),
          );
          return;
        }
        shader
          ..setFloat(0, size.width)
          ..setFloat(1, size.height)
          ..setFloat(2, t)
          ..setFloat(3, seed)
          ..setFloat(4, drift)
          ..setFloat(5, softness)
          ..setImageSampler(0, image);
        canvas.drawRect(Offset.zero & size, Paint()..shader = shader);
        shader.dispose();
      },
      child: child,
    );
  }
}

/// Resolves [child] out of smoke once, when it first appears.
///
/// Put it on the handful of elements that carry a screen: the page title, the greeting,
/// Lucille's reply, a reward headline. [index] staggers a small group (max ~5).
class V6SmokeIn extends StatefulWidget {
  const V6SmokeIn({
    super.key,
    required this.child,
    this.index = 0,
    this.duration = const Duration(milliseconds: 900),
    this.delay = Duration.zero,
    this.drift = 14,
    this.seed,
  });

  final Widget child;
  final int index;
  final Duration duration;
  final Duration delay;
  final double drift;

  /// Defaults to a stable value derived from [index].
  final double? seed;

  @override
  State<V6SmokeIn> createState() => _V6SmokeInState();
}

class _V6SmokeInState extends State<V6SmokeIn> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: widget.duration);
  // Built once: a CurvedAnimation created in build() leaks a listener on every rebuild.
  late final CurvedAnimation _curved =
      CurvedAnimation(parent: _c, curve: V6Motion.ease);

  @override
  void initState() {
    super.initState();
    final delay = widget.delay + V6Motion.stagger * widget.index.clamp(0, 5);
    // The shader may still be loading on the very first frame of the app; waiting for it keeps
    // the first screen from popping in un-smoked while later ones animate.
    V6SmokeShader.warmUp().whenComplete(() {
      if (!mounted) return;
      if (delay == Duration.zero) {
        _c.forward();
      } else {
        Future.delayed(delay, () {
          if (mounted) _c.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _curved.dispose();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _curved,
        builder: (context, child) => V6Smoke(
          progress: _curved.value,
          seed: widget.seed ?? (widget.index * 0.37 + 0.11),
          drift: widget.drift,
          child: child!,
        ),
        child: widget.child,
      );
}

/// Cross-fades between children, the outgoing one dispersing into smoke while the incoming one
/// resolves. Give each child a [Key] (as with [AnimatedSwitcher]).
///
/// Use where one line *replaces* another in place — Lucille's status line, the breath phase
/// label, a mood name under the orb.
class V6SmokeSwitch extends StatelessWidget {
  const V6SmokeSwitch({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.drift = 10,
    this.alignment = Alignment.centerLeft,
  });

  final Widget child;
  final Duration duration;
  final double drift;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final plain = !V6SmokeShader.ready || V6Theme.motionOff(context);
    return AnimatedSwitcher(
      duration: duration,
      // The outgoing line disperses a little faster than the new one arrives, so the two never
      // read as one muddy overlap.
      reverseDuration: Duration(milliseconds: (duration.inMilliseconds * 0.7).round()),
      switchInCurve: V6Motion.ease,
      switchOutCurve: Curves.easeIn,
      layoutBuilder: (current, previous) => Stack(
        alignment: alignment,
        children: [...previous, if (current != null) current],
      ),
      transitionBuilder: (c, a) => plain
          ? FadeTransition(opacity: a, child: c)
          : AnimatedBuilder(
              animation: a,
              builder: (context, child) =>
                  V6Smoke(progress: a.value, drift: drift, child: child!),
              child: c,
            ),
      child: child,
    );
  }
}

/// Convenience: a [Text] that resolves out of smoke once.
///
/// Only for a screen's headline or a single carried line — body copy and list rows use
/// `V6Rise`, which is cheaper and calmer.
class V6SmokeText extends StatelessWidget {
  const V6SmokeText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.index = 0,
    this.duration = const Duration(milliseconds: 1000),
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final int index;
  final Duration duration;

  @override
  Widget build(BuildContext context) => V6SmokeIn(
        index: index,
        duration: duration,
        // Keyed on the string so a changed headline re-resolves instead of snapping.
        key: ValueKey('smoke-$text-$index'),
        child: Text(
          text,
          style: style,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: maxLines == null ? null : TextOverflow.ellipsis,
        ),
      );
}
