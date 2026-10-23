// Escape v6 — first-visit walkthrough (PageHelp) with a real spotlight.
//
// Each tip can point at an element wrapped in [V6HelpTarget]. The tour scrolls that element into
// view, cuts a soft rounded hole around it, and puts the tip card on the side with more room, so
// the user always sees exactly what the tip is about. Tips without a target show as a card above
// the tab bar. "Skip tour" is always there; the "?" button replays it.
import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/v6_help_content.dart';
import '../state/v6_store.dart';
import '../theme/v6_type.dart';
import 'v6_ambient.dart';
import 'v6_glass.dart';

/// Marks an element a tour tip can point at. Ids look like 'home.plan'.
class V6HelpTarget extends StatefulWidget {
  const V6HelpTarget({super.key, required this.id, required this.child});
  final String id;
  final Widget child;

  static final Map<String, GlobalKey> _keys = {};

  static GlobalKey? keyFor(String id) => _keys[id];

  @override
  State<V6HelpTarget> createState() => _V6HelpTargetState();
}

class _V6HelpTargetState extends State<V6HelpTarget> {
  final _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    V6HelpTarget._keys[widget.id] = _key;
  }

  @override
  void dispose() {
    if (V6HelpTarget._keys[widget.id] == _key) V6HelpTarget._keys.remove(widget.id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyedSubtree(key: _key, child: widget.child);
}

/// Opens the page's tour automatically the first time (new users), once the page is on screen.
/// Put one in each main page's tree (it renders nothing).
class V6AutoHelp extends StatefulWidget {
  const V6AutoHelp({super.key, required this.page});
  final String page;

  @override
  State<V6AutoHelp> createState() => _V6AutoHelpState();
}

class _V6AutoHelpState extends State<V6AutoHelp> {
  Timer? _t;

  @override
  void initState() {
    super.initState();
    // Keep checking (cheaply) until the page is actually on screen: a new user's Home sits under
    // onboarding / the daily check-in first, and hidden tabs only become visible later.
    _t = Timer.periodic(const Duration(milliseconds: 900), (_) => _maybeOpen());
  }

  void _maybeOpen() {
    final s = V6Store.instance;
    if (!mounted) return;
    if (s.loaded && !s.shouldAutoHelp(widget.page)) {
      _t?.cancel(); // already seen: stop polling
      return;
    }
    if (!s.loaded || _helpOpen) return;
    // Only when this page is the one showing (not a hidden tab or a covered route).
    final route = ModalRoute.of(context);
    if (route != null && !route.isCurrent) return;
    if (!TickerMode.of(context)) return;
    _t?.cancel();
    showV6Help(context, widget.page);
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

/// The "?" button for the top bar.
class V6HelpButton extends StatelessWidget {
  const V6HelpButton({super.key, required this.page});
  final String page;

  @override
  Widget build(BuildContext context) => V6IconButton(
        icon: Icons.help_outline_rounded,
        label: 'How this page works',
        onTap: () => showV6Help(context, page),
        child: V6Text('?', size: 18, weight: FontWeight.w600),
      );
}

bool _helpOpen = false;

Future<void> showV6Help(BuildContext context, String page) async {
  final help = kV6PageHelp[page];
  if (help == null || _helpOpen) return;
  _helpOpen = true;
  final overlay = Overlay.of(context, rootOverlay: true);
  final done = Completer<void>();
  late OverlayEntry entry;
  final palette = V6Theme.of(context);
  final reduce = V6Theme.motionOff(context);
  entry = OverlayEntry(
    builder: (_) => V6Theme(
      palette: palette,
      reduceMotion: reduce,
      child: _HelpOverlay(
        help: help,
        onClose: () {
          // "Got it" + a scrim tap in the same frame must not remove the entry twice.
          if (!entry.mounted) return;
          entry.remove();
          V6Store.instance.markHelpSeen(page);
          _helpOpen = false;
          if (!done.isCompleted) done.complete();
        },
      ),
    ),
  );
  overlay.insert(entry);
  return done.future;
}

class _HelpOverlay extends StatefulWidget {
  const _HelpOverlay({required this.help, required this.onClose});
  final V6PageHelpData help;
  final VoidCallback onClose;

  @override
  State<_HelpOverlay> createState() => _HelpOverlayState();
}

class _HelpOverlayState extends State<_HelpOverlay> with SingleTickerProviderStateMixin {
  int _i = 0;
  Rect? _hole;
  Timer? _track;
  late final AnimationController _in =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 320))..forward();

  V6HelpTip get _tip => widget.help.tips[_i];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _enter());
    // Keep the hole glued to the element while things settle (rise-in animations, scrolling).
    _track = Timer.periodic(const Duration(milliseconds: 120), (_) => _measure());
  }

  @override
  void dispose() {
    _track?.cancel();
    _in.dispose();
    super.dispose();
  }

  Future<void> _enter() async {
    final id = _tip.target;
    final ctx = id == null ? null : V6HelpTarget.keyFor(id)?.currentContext;
    if (ctx != null && ctx.mounted) {
      try {
        await Scrollable.ensureVisible(ctx,
            alignment: 0.35, duration: const Duration(milliseconds: 420), curve: V6Motion.ease);
      } catch (_) {}
    }
    _measure();
  }

  void _measure() {
    if (!mounted) return;
    final id = _tip.target;
    Rect? r;
    final ctx = id == null ? null : V6HelpTarget.keyFor(id)?.currentContext;
    final box = ctx?.findRenderObject();
    if (box is RenderBox && box.attached && box.hasSize) {
      final o = box.localToGlobal(Offset.zero);
      r = (o & box.size).inflate(8);
      final screen = Offset.zero & MediaQuery.sizeOf(context);
      if (!screen.overlaps(r)) r = null;
    }
    if (r != _hole) setState(() => _hole = r);
  }

  void _next() {
    HapticFeedback.selectionClick();
    if (_i >= widget.help.tips.length - 1) {
      widget.onClose();
      return;
    }
    setState(() {
      _i++;
      _hole = null;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _enter());
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final pad = MediaQuery.paddingOf(context);
    final hole = _hole;
    final last = _i == widget.help.tips.length - 1;

    // Card goes below the hole when there's more room there, otherwise above.
    final cardBelow = hole != null && (size.height - hole.bottom) > hole.top;
    final card = Material(
      type: MaterialType.transparency,
      child: Semantics(
        liveRegion: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: p.navFill,
                gradient: LinearGradient(
                  begin: const Alignment(-0.85, -1),
                  end: const Alignment(0.85, 1),
                  colors: [p.glass[0], p.glass[1], p.navFill],
                  stops: const [0.15, 0.25, 1],
                ),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: p.glassBorder),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Row(children: [
                  Expanded(child: V6Eyebrow('${widget.help.title} · ${_i + 1}/${widget.help.tips.length}')),
                  V6Link(label: 'Skip tour', onTap: widget.onClose),
                ]),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (c, a) => FadeTransition(
                    opacity: a,
                    child: SlideTransition(
                        position: Tween(begin: const Offset(0, 0.08), end: Offset.zero).animate(a), child: c),
                  ),
                  child: Column(
                    key: ValueKey(_i),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      V6Display(_tip.title, size: 24),
                      const SizedBox(height: 6),
                      V6Text(_tip.body, ink: V6Ink.muted),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                V6PageDots(count: widget.help.tips.length, index: _i),
                const SizedBox(height: 14),
                V6PrimaryPill(label: last ? 'Got it' : 'Next', onTap: _next),
              ]),
            ),
          ),
        ),
      ),
    );

    final overlay = FadeTransition(
      opacity: _in,
      child: Stack(children: [
        // Scrim with a hole. Taps on the scrim advance (never trap the user).
        Positioned.fill(
          child: GestureDetector(
            onTap: _next,
            child: TweenAnimationBuilder<Rect?>(
              tween: RectTween(end: hole ?? Rect.fromCircle(center: size.center(Offset.zero), radius: 0)),
              duration: const Duration(milliseconds: 380),
              curve: V6Motion.ease,
              builder: (context, r, _) => CustomPaint(painter: _ScrimPainter(hole == null ? null : r, p.accent)),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 380),
          curve: V6Motion.ease,
          left: 12,
          right: 12,
          top: hole != null && cardBelow ? _clampSafe(hole.bottom + 14, pad.top + 8, size.height - 300) : null,
          bottom: hole == null
              ? 108 + pad.bottom
              : (!cardBelow ? _clampSafe(size.height - hole.top + 14, pad.bottom + 16, size.height - 300) : null),
          child: card,
        ),
      ]),
    );
    // Android back closes the tour instead of popping the page under it (which would leave the
    // tour floating over the wrong screen).
    if (Router.maybeOf(context) == null) return overlay;
    return BackButtonListener(
      onBackButtonPressed: () async {
        widget.onClose();
        return true;
      },
      child: overlay,
    );
  }
}

class _ScrimPainter extends CustomPainter {
  _ScrimPainter(this.hole, this.ring);
  final Rect? hole;
  final Color ring;

  @override
  void paint(Canvas canvas, Size size) {
    final scrim = Paint()..color = const Color(0x9905081A);
    final full = Path()..addRect(Offset.zero & size);
    final h = hole;
    if (h == null || h.width < 2) {
      canvas.drawPath(full, scrim);
      return;
    }
    final rr = RRect.fromRectAndRadius(h, Radius.circular(h.shortestSide > 120 ? 28 : h.shortestSide / 2));
    canvas.drawPath(Path.combine(PathOperation.difference, full, Path()..addRRect(rr)), scrim);
    canvas.drawRRect(
      rr,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = ring.withOpacity(0.9),
    );
    canvas.drawRRect(
      rr.inflate(6),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8)
        ..color = ring.withOpacity(0.35),
    );
  }

  @override
  bool shouldRepaint(_ScrimPainter o) => o.hole != hole || o.ring != ring;
}

double _clampSafe(double v, double lo, double hi) => hi < lo ? lo : v.clamp(lo, hi);
