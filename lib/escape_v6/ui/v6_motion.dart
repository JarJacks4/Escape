// Escape v6 — motion helpers: page routes, rise-in, press feedback.
//
// Rules (so motion supports the user path instead of competing with it):
//  * One thing moves at a time: content rises in with a 60 ms stagger, max ~8 items.
//  * Hero flights only for an object that *continues* onto the next page (the Mood Orb, a card
//    that expands into its detail page). Never for chrome.
//  * Everything honours Reduce Motion (OS setting or Settings > Reduce motion): rise-ins become
//    plain fades, drifting glows stop, the orb stops pulsing.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/v6_type.dart';
import 'v6_ambient.dart';

/// Fade + 3% rise page transition used by every v6 route.
class V6PageRoute<T> extends PageRouteBuilder<T> {
  V6PageRoute({required WidgetBuilder builder, super.settings, bool fullscreenDialog = false})
      : super(
          fullscreenDialog: fullscreenDialog,
          opaque: true,
          transitionDuration: V6Motion.page,
          reverseTransitionDuration: V6Motion.pageReverse,
          pageBuilder: (context, _, __) => builder(context),
          transitionsBuilder: v6Transition,
        );
}

/// GoRouter page for every v6 route (nav.dart): the same fade + rise as [V6PageRoute], plus the
/// iOS edge swipe-back that `CustomTransitionPage` does not have. The swipe respects PopScope
/// (onboarding, a check-in mid-save) exactly like the Cupertino gesture does.
class V6TransitionPage<T> extends Page<T> {
  const V6TransitionPage({required this.child, super.key, super.name, super.arguments, super.restorationId});
  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => _V6PageBasedRoute<T>(this);
}

class _V6PageBasedRoute<T> extends PageRoute<T> {
  _V6PageBasedRoute(V6TransitionPage<T> page) : super(settings: page);

  V6TransitionPage<T> get _page => settings as V6TransitionPage<T>;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => true;

  @override
  Duration get transitionDuration => V6Motion.page;

  @override
  Duration get reverseTransitionDuration => V6Motion.pageReverse;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
      Semantics(scopesRoute: true, explicitChildNodes: true, child: _page.child);

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    final t = v6Transition(context, animation, secondaryAnimation, child);
    final platform = Theme.of(context).platform;
    if (platform != TargetPlatform.iOS && platform != TargetPlatform.macOS) return t;
    return _V6BackSwipe(route: this, child: t);
  }

  bool get _canSwipe {
    final nav = navigator;
    if (nav == null || nav.userGestureInProgress) return false;
    if (isFirst || willHandlePopInternally || fullscreenDialog) return false;
    if (popDisposition == RoutePopDisposition.doNotPop) return false;
    return animation?.status == AnimationStatus.completed;
  }

  void _swipeStart() => navigator?.didStartUserGesture();

  void _swipeUpdate(double fraction) {
    final c = controller;
    if (c != null) c.value = (c.value - fraction).clamp(0.0, 1.0);
  }

  void _swipeEnd(double velocity) {
    final nav = navigator;
    final c = controller;
    if (nav == null || c == null) return;
    final pop = velocity.abs() >= 1.0 ? velocity > 0 : c.value <= 0.5;
    if (pop) {
      nav.pop();
    } else {
      c.forward();
    }
    if (c.isAnimating) {
      late final AnimationStatusListener l;
      l = (status) {
        if (status == AnimationStatus.forward || status == AnimationStatus.reverse) return;
        nav.didStopUserGesture();
        c.removeStatusListener(l);
      };
      c.addStatusListener(l);
    } else {
      nav.didStopUserGesture();
    }
  }
}

class _V6BackSwipe extends StatefulWidget {
  const _V6BackSwipe({required this.route, required this.child});
  final _V6PageBasedRoute<dynamic> route;
  final Widget child;

  @override
  State<_V6BackSwipe> createState() => _V6BackSwipeState();
}

class _V6BackSwipeState extends State<_V6BackSwipe> {
  bool _active = false;

  double get _width => context.size?.width ?? MediaQuery.sizeOf(context).width;

  @override
  Widget build(BuildContext context) {
    final edge = MediaQuery.paddingOf(context).left.clamp(20.0, 44.0);
    return Stack(fit: StackFit.passthrough, children: [
      widget.child,
      PositionedDirectional(
        start: 0,
        width: edge,
        top: 0,
        bottom: 0,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          excludeFromSemantics: true,
          onHorizontalDragStart: (_) {
            _active = widget.route._canSwipe;
            if (_active) widget.route._swipeStart();
          },
          onHorizontalDragUpdate: (d) {
            if (_active) widget.route._swipeUpdate((d.primaryDelta ?? 0) / _width);
          },
          onHorizontalDragEnd: (d) {
            if (!_active) return;
            _active = false;
            widget.route._swipeEnd((d.primaryVelocity ?? 0) / _width);
          },
          onHorizontalDragCancel: () {
            if (!_active) return;
            _active = false;
            widget.route._swipeEnd(0);
          },
        ),
      ),
    ]);
  }
}

Widget v6Transition(BuildContext context, Animation<double> anim, Animation<double> secondary, Widget child) {
  final curved = CurvedAnimation(parent: anim, curve: V6Motion.ease, reverseCurve: Curves.easeIn);
  return FadeTransition(
    opacity: curved,
    child: SlideTransition(
      position: Tween(begin: const Offset(0, 0.03), end: Offset.zero).animate(curved),
      child: child,
    ),
  );
}

/// Fades and rises a child in after [index] × 60 ms. Use for page content, not chrome.
class V6Rise extends StatefulWidget {
  const V6Rise({super.key, required this.child, this.index = 0, this.offset = 12});
  final Widget child;
  final int index;
  final double offset;

  @override
  State<V6Rise> createState() => _V6RiseState();
}

class _V6RiseState extends State<V6Rise> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: V6Motion.rise);
  // Created once: a CurvedAnimation made in build() leaks a status listener per rebuild.
  late final CurvedAnimation _curved = CurvedAnimation(parent: _c, curve: V6Motion.ease);

  @override
  void initState() {
    super.initState();
    final delay = V6Motion.stagger * widget.index.clamp(0, 8);
    Future.delayed(delay, () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _curved.dispose();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final off = V6Theme.motionOff(context);
    final curved = _curved;
    return AnimatedBuilder(
      animation: curved,
      builder: (context, child) => Opacity(
        opacity: curved.value,
        child: Transform.translate(
          offset: Offset(0, off ? 0 : widget.offset * (1 - curved.value)),
          child: child,
        ),
      ),
      child: widget.child,
    );
  }
}

/// Scale-down press feedback + selection haptic. Wrap any tappable glass surface.
class V6Pressable extends StatefulWidget {
  const V6Pressable({
    super.key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.semanticLabel,
    this.haptic = true,
    this.scale = 0.97,
  });
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String? semanticLabel;
  final bool haptic;
  final double scale;

  @override
  State<V6Pressable> createState() => _V6PressableState();
}

class _V6PressableState extends State<V6Pressable> {
  bool _down = false;

  void _set(bool v) {
    if (_down != v) setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.semanticLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? (_) => _set(true) : null,
        onTapCancel: () => _set(false),
        onTapUp: (_) => _set(false),
        onLongPress: widget.onLongPress,
        onTap: enabled
            ? () {
                if (widget.haptic) HapticFeedback.selectionClick();
                widget.onTap!();
              }
            : null,
        child: AnimatedScale(
          scale: _down ? widget.scale : 1,
          duration: V6Motion.quick,
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}

/// Cross-fades between children when [child]'s key changes (text that updates, swapped cards).
class V6Fade extends StatelessWidget {
  const V6Fade({super.key, required this.child, this.duration = const Duration(milliseconds: 350)});
  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: duration,
        switchInCurve: V6Motion.ease,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (c, a) => FadeTransition(opacity: a, child: c),
        child: child,
      );
}

/// Hero that only flies when motion is allowed; text inside flies without overflow errors.
class V6Hero extends StatelessWidget {
  const V6Hero({super.key, required this.tag, required this.child});
  final Object tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (V6Theme.motionOff(context)) return child;
    return Hero(
      tag: tag,
      flightShuttleBuilder: (ctx, anim, dir, from, to) {
        // Gentle 1.02× scale settle: the object breathes up slightly mid-flight then settles.
        final settle = TweenSequence<double>([
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.02).chain(CurveTween(curve: Curves.easeOut)), weight: 50),
          TweenSequenceItem(tween: Tween(begin: 1.02, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
        ]).animate(anim);
        return AnimatedBuilder(
          animation: settle,
          builder: (context, child) => Transform.scale(scale: settle.value, child: child),
          child: Material(
            type: MaterialType.transparency,
            child: ((dir == HeroFlightDirection.push ? to.widget : from.widget) as Hero).child,
          ),
        );
      },
      child: Material(type: MaterialType.transparency, child: child),
    );
  }
}
