// Escape v6 — floating glass tab bar + Day/Night orb.
//
// Home · Explore · Lucille (raised Mood Orb, the most reachable spot) · Soundscapes · Profile.
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../state/v6_store.dart';
import '../theme/v6_palettes.dart';
import '../theme/v6_type.dart';
import 'v6_ambient.dart';
import 'v6_help.dart';
import 'v6_motion.dart';
import 'v6_orb.dart';

enum V6Tab { home, explore, lucille, soundscapes, profile }

class V6NavBar extends StatelessWidget {
  const V6NavBar({super.key, required this.current, required this.onSelect});
  final V6Tab current;
  final ValueChanged<V6Tab> onSelect;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 0, 12, (bottom > 0 ? bottom - 6 : 0) + 14),
      child: SizedBox(
        height: 92,
        child: Stack(clipBehavior: Clip.none, alignment: Alignment.bottomCenter, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: AnimatedContainer(
                duration: V6Motion.ambient,
                height: 72,
                decoration: BoxDecoration(
                  color: p.navFill,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: p.glassBorder),
                  boxShadow: const [BoxShadow(color: Color(0x4705081A), blurRadius: 40, offset: Offset(0, 12))],
                ),
                child: Row(children: [
                  _tab(context, V6Tab.home, Icons.home_outlined, Icons.home_rounded, 'Home'),
                  _tab(context, V6Tab.explore, Icons.explore_outlined, Icons.explore_rounded, 'Explore'),
                  const Expanded(child: SizedBox()),
                  _tab(context, V6Tab.soundscapes, Icons.graphic_eq_rounded, Icons.graphic_eq_rounded, 'Sounds'),
                  _tab(context, V6Tab.profile, Icons.person_outline_rounded, Icons.person_rounded, 'Profile'),
                ]),
              ),
            ),
          ),
          // Raised Lucille orb.
          Positioned(
            top: 0,
            child: V6HelpTarget(
              id: 'nav.lucille',
              child: V6Watch(
                builder: (context, s) => Column(mainAxisSize: MainAxisSize.min, children: [
                  V6Pressable(
                    onTap: () => onSelect(V6Tab.lucille),
                    semanticLabel: 'Talk to Lucille',
                    scale: 0.92,
                    child: Container(
                      width: 66,
                      height: 66,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: p.navFill,
                        border: Border.all(color: current == V6Tab.lucille ? p.ink : p.glassBorder),
                      ),
                      child: V6MoodOrb(mood: s.currentMood ?? V6Mood.calm, size: 54, glow: true),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text('Lucille',
                      style: V6Type.body(10, current == V6Tab.lucille ? p.ink : p.inkFaint,
                          weight: current == V6Tab.lucille ? FontWeight.w600 : FontWeight.w500, height: 1.1)),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _tab(BuildContext context, V6Tab t, IconData icon, IconData active, String label) {
    final p = V6Theme.of(context);
    final on = current == t;
    return Expanded(
      child: Semantics(
        selected: on,
        button: true,
        label: label,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            HapticFeedback.selectionClick();
            onSelect(t);
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedSwitcher(
              duration: V6Motion.quick,
              child: Icon(on ? active : icon, key: ValueKey(on), size: 24, color: on ? p.ink : p.inkFaint),
            ),
            const SizedBox(height: 4),
            Text(label,
                style: V6Type.body(10, on ? p.ink : p.inkFaint,
                    weight: on ? FontWeight.w600 : FontWeight.w500, height: 1.1)),
          ]),
        ),
      ),
    );
  }
}

/// Sun / moon orb that toggles Day and Night (1.2 s cross-fade across the whole app).
class V6DayNightOrb extends StatelessWidget {
  const V6DayNightOrb({super.key, this.size = 44, this.interactive = true});
  final double size;
  final bool interactive;

  @override
  Widget build(BuildContext context) {
    return V6Watch(builder: (context, s) {
      final day = s.isDaytime();
      final orb = SizedBox(
        width: size,
        height: size,
        child: Stack(children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 900),
            opacity: day ? 1 : 0,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 900),
              turns: day ? 0 : -0.11,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 900),
                scale: day ? 1 : 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      center: Alignment(-0.2, -0.3),
                      colors: [Colors.white, Color(0xFFF6F8FF), Color(0xFFFFD9A8), Color(0xFFF08A1D)],
                      stops: [0, 0.35, 0.75, 1],
                    ),
                    boxShadow: [BoxShadow(color: const Color(0xBFFFD6A0), blurRadius: size * 0.5)],
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 900),
            opacity: day ? 0 : 1,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 900),
              turns: day ? 0.11 : 0,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 900),
                scale: day ? 0.6 : 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      center: Alignment(-0.3, -0.4),
                      colors: [Color(0xFFE6EAF4), Color(0xFFB9A3F0), Color(0xFF39519F)],
                      stops: [0, 0.45, 1],
                    ),
                    boxShadow: [BoxShadow(color: const Color(0x8CB9A3F0), blurRadius: size * 0.5)],
                  ),
                  child: ClipOval(
                    child: Stack(children: [
                      Positioned(
                        top: -size * 0.18,
                        left: size * 0.32,
                        child: Container(
                          width: size,
                          height: size,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xC70B1230)),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ]),
      );
      if (!interactive) return orb;
      return V6Pressable(
        onTap: () {
          HapticFeedback.mediumImpact();
          s.toggleDayNight();
        },
        semanticLabel: day ? 'Switch to night mode' : 'Switch to day mode',
        scale: 0.9,
        child: SizedBox(width: 48, height: 48, child: Center(child: orb)),
      );
    });
  }
}
