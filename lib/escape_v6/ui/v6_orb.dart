// Escape v6 — the Mood Orb (the real TouchDesigner orb from Soundscapes, not a CSS gradient).
//
// Wherever the Figma Make draws an orb (nav bar, check-in, hero orb, Lucille voice, mood
// history) we show the same loops the Soundscapes module and Journal play: the bundled poster
// appears instantly, then the loop fades in (600 ms). Sizes match the Figma.
//
// Interaction: the orb breathes (slow 3 s pulse), squeezes when pressed, and cross-fades when the
// mood changes. `live: false` keeps it to the poster (+ pulse) to save a video decoder, which is
// what small orbs (nav bar, history dots) use.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../theme/v6_palettes.dart';
import '../theme/v6_type.dart';
import 'v6_ambient.dart';
import 'v6_motion.dart';
import 'v6_video_pool.dart';

String v6OrbPosterAsset(V6Mood? m) =>
    'assets/orbs/${m == null ? kV6NeutralLoop : kV6MoodLoop[m]!}_poster.webp';

/// Loop source: streamed 720p (HEVC on iOS, H.264 on Android) for the mood, with the bundled
/// 540p loop of the same grid as the offline fallback.
String v6OrbLoopSource(V6Mood? m, {bool preferOffline = false}) {
  final loop = m == null ? kV6NeutralLoop : kV6MoodLoop[m]!;
  final grid = loop.split('_')[1]; // calm | focus | sleep | picks
  final offline = 'assets/orbs/escape_${grid}_e50_t50_v3_540_offline.mp4';
  if (preferOffline) return offline;
  return v6OrbVideoUrl(m, android: defaultTargetPlatform == TargetPlatform.android);
}

enum V6OrbState { idle, listening, thinking, speaking }

class V6MoodOrb extends StatefulWidget {
  const V6MoodOrb({
    super.key,
    required this.mood,
    this.size = 56,
    this.glow = false,
    this.live = false,
    this.pulse = true,
    this.heroTag,
    this.onTap,
    this.semanticLabel,
    this.state = V6OrbState.idle,
    this.level = 0,
    this.tint,
  });

  final V6Mood? mood;

  /// Re-colours the orb while keeping its TouchDesigner texture (energy centers use this).
  final Color? tint;
  final double size;
  final bool glow;

  /// Play the video loop (big orbs). Small orbs stay on the poster.
  final bool live;
  final bool pulse;
  final Object? heroTag;
  final VoidCallback? onTap;
  final String? semanticLabel;

  /// Lucille voice states change the motion: listening swells with [level] (mic 0…1),
  /// thinking turns slowly, speaking pulses quickly.
  final V6OrbState state;
  final double level;

  @override
  State<V6MoodOrb> createState() => _V6MoodOrbState();
}

class _V6MoodOrbState extends State<V6MoodOrb> with TickerProviderStateMixin {
  late final AnimationController _breath =
      AnimationController(vsync: this, duration: const Duration(seconds: 3));
  late final AnimationController _spin =
      AnimationController(vsync: this, duration: const Duration(seconds: 6));

  @override
  void initState() {
    super.initState();
    _syncAnim();
  }

  @override
  void didUpdateWidget(covariant V6MoodOrb old) {
    super.didUpdateWidget(old);
    _syncAnim();
  }

  void _syncAnim() {
    final speaking = widget.state == V6OrbState.speaking;
    _breath.duration = Duration(milliseconds: speaking ? 900 : 3000);
    if (widget.pulse && !_breath.isAnimating) _breath.repeat(reverse: true);
    if (!widget.pulse && _breath.isAnimating) _breath.stop();
    if (widget.state == V6OrbState.thinking) {
      if (!_spin.isAnimating) _spin.repeat();
    } else if (_spin.isAnimating) {
      _spin.stop();
    }
  }

  @override
  void dispose() {
    _breath.dispose();
    _spin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final off = V6Theme.motionOff(context);
    // Hidden tabs and routes covered by an opaque page run with tickers off: drop to the poster
    // there so they don't hold one of the few hardware video decoders.
    final live = widget.live && !off && TickerMode.of(context);
    final p = widget.mood == null ? null : v6Palette(paletteForMood(widget.mood!));
    final glowColor = widget.tint ?? p?.glowB ?? V6Theme.of(context).accentSoft;
    final s = widget.size;

    Widget orb = AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchInCurve: V6Motion.ease,
      transitionBuilder: (c, a) => FadeTransition(opacity: a, child: c),
      child: _OrbFace(
        key: ValueKey('${widget.mood}-$live-${widget.tint?.value}'),
        mood: widget.mood,
        size: s,
        live: live,
      ),
    );
    final tint = widget.tint;
    if (tint != null) {
      // `color` blend keeps the orb's light and texture, swaps its hue.
      orb = ColorFiltered(colorFilter: ColorFilter.mode(tint, BlendMode.color), child: orb);
    }

    orb = Container(
      width: s,
      height: s,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.28), width: 1),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(widget.glow ? 0.75 : 0.25),
            blurRadius: s * (widget.glow ? 0.6 : 0.2),
          ),
        ],
      ),
      child: ClipOval(child: orb),
    );

    if (!off) {
      orb = AnimatedBuilder(
        animation: Listenable.merge([_breath, _spin]),
        builder: (context, child) {
          final b = Curves.easeInOut.transform(_breath.value);
          var scale = widget.pulse ? 1 + 0.04 * b : 1.0;
          if (widget.state == V6OrbState.listening) scale += 0.12 * widget.level.clamp(0, 1);
          if (widget.state == V6OrbState.speaking) scale = 1 + 0.07 * b;
          return Transform.rotate(
            angle: widget.state == V6OrbState.thinking ? _spin.value * 6.283 : 0,
            child: Transform.scale(scale: scale, child: child),
          );
        },
        child: orb,
      );
    }

    if (widget.heroTag != null) orb = V6Hero(tag: widget.heroTag!, child: orb);

    if (widget.onTap != null) {
      orb = V6Pressable(
        onTap: widget.onTap,
        scale: 0.94,
        semanticLabel: widget.semanticLabel ?? 'Mood orb',
        child: orb,
      );
    } else if (widget.semanticLabel != null) {
      orb = Semantics(image: true, label: widget.semanticLabel, child: orb);
    }
    return orb;
  }
}

class _OrbFace extends StatefulWidget {
  const _OrbFace({super.key, required this.mood, required this.size, required this.live});
  final V6Mood? mood;
  final double size;
  final bool live;

  @override
  State<_OrbFace> createState() => _OrbFaceState();
}

class _OrbFaceState extends State<_OrbFace> {
  String? _src;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    if (widget.live) _start(v6OrbLoopSource(widget.mood));
  }

  void _start(String src) {
    // Pool full (too many live loops on screen): stay on the poster, never a blank decoder.
    if (!V6VideoPool.hasRoom(src)) return;
    _src = src;
    final c = V6VideoPool.acquire(src);
    // Already playing elsewhere (Hero flight, the tab we came from): show it at once, no re-fade.
    if (c.value.isInitialized) _ready = true;
    V6VideoPool.ready(src).then((ok) {
      if (!mounted || _src != src) return;
      if (ok) {
        if (!_ready) setState(() => _ready = true);
      } else if (!src.startsWith('assets/')) {
        // Streaming failed (offline): fall back to the bundled loop of the same family.
        V6VideoPool.release(src);
        _src = null;
        _start(v6OrbLoopSource(widget.mood, preferOffline: true));
      }
    });
  }

  @override
  void dispose() {
    final s = _src;
    if (s != null) V6VideoPool.release(s);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final poster = Image.asset(
      v6OrbPosterAsset(widget.mood),
      width: widget.size,
      height: widget.size,
      fit: BoxFit.cover,
      gaplessPlayback: true,
      errorBuilder: (_, __, ___) => _GradientOrb(mood: widget.mood),
    );
    final src = _src;
    final c = src == null ? null : V6VideoPool.peek(src);
    return Stack(fit: StackFit.expand, children: [
      poster,
      if (c != null)
        AnimatedOpacity(
          opacity: _ready && c.value.isInitialized ? 1 : 0,
          duration: const Duration(milliseconds: 600),
          child: _ready && c.value.isInitialized
              ? FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(width: c.value.size.width, height: c.value.size.height, child: VideoPlayer(c)),
                )
              : const SizedBox(),
        ),
    ]);
  }
}

/// Fallback when even the poster can't load (never a blank circle).
class _GradientOrb extends StatelessWidget {
  const _GradientOrb({required this.mood});
  final V6Mood? mood;

  @override
  Widget build(BuildContext context) {
    final p = mood == null ? V6Theme.of(context) : v6Palette(paletteForMood(mood!));
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.36, -0.44),
          colors: [p.glowA, p.base[0], p.base[2]],
          stops: const [0, 0.38, 1],
        ),
      ),
    );
  }
}

/// The huge orb rising from the bottom edge (onboarding, check-in, All Set).
/// Same geometry as the Figma: a [size] sphere with only the top [visible] px showing.
class V6HeroOrb extends StatelessWidget {
  const V6HeroOrb({
    super.key,
    required this.mood,
    this.size = 560,
    this.visible = 320,
    this.child,
    this.heroTag,
    this.live = true,
  });

  final V6Mood? mood;
  final double size;
  final double visible;
  final Widget? child;
  final Object? heroTag;
  final bool live;

  @override
  Widget build(BuildContext context) {
    final p = mood == null ? V6Theme.of(context) : v6Palette(paletteForMood(mood!));
    return SizedBox(
      height: visible,
      child: Stack(clipBehavior: Clip.hardEdge, alignment: Alignment.topCenter, children: [
        Positioned(
          top: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: p.glowB, blurRadius: 120, offset: const Offset(0, -30))],
            ),
            child: V6MoodOrb(mood: mood, size: size, live: live, heroTag: heroTag, pulse: true),
          ),
        ),
        if (child != null)
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Align(alignment: Alignment.bottomCenter, child: child),
            ),
          ),
      ]),
    );
  }
}
