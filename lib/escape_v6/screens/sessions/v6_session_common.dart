// Escape v6 — small pieces shared by the Mind / Reset lists and the session pages
// (Figma Make: MindReset.tsx ExerciseRow, Sessions.tsx exerciseMood / fmt).
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';

/// The Mood Orb loop that matches an exercise palette (sleep → tired, neutral palettes → calm).
V6Mood v6ExerciseMood(V6Exercise e) => switch (e.palette) {
      V6PaletteId.calm => V6Mood.calm,
      V6PaletteId.energized => V6Mood.energized,
      V6PaletteId.focused => V6Mood.focused,
      V6PaletteId.restless => V6Mood.restless,
      V6PaletteId.tired || V6PaletteId.sleep => V6Mood.tired,
      V6PaletteId.low => V6Mood.low,
      _ => V6Mood.calm,
    };

/// Orb for list rows (Figma `paletteMood`): neutral palettes get the neutral loop (null).
V6Mood? v6ExerciseRowMood(V6Exercise e) => switch (e.palette) {
      V6PaletteId.day || V6PaletteId.night || V6PaletteId.daySoundscape || V6PaletteId.body => null,
      _ => v6ExerciseMood(e),
    };

/// 0:00 clock.
String v6Clock(int seconds) {
  final s = seconds < 0 ? 0 : seconds;
  return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
}

/// Session row: thumbnail (photo with Hero, or a poster orb), title, category · minutes.
class V6ExerciseRow extends StatelessWidget {
  const V6ExerciseRow({super.key, required this.exercise, this.divider = false, this.onTap});
  final V6Exercise exercise;
  final bool divider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final e = exercise;
    final img = e.image;
    final Widget thumb = img != null
        ? V6Hero(
            tag: e.heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: 48,
                height: 48,
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [p.base[0], p.base[2]]))),
                ),
              ),
            ),
          )
        // No photo: the orb itself flies into the detail page.
        : V6MoodOrb(mood: v6ExerciseRowMood(e), size: 48, heroTag: e.heroTag);
    return V6Pressable(
      onTap: onTap ?? () => v6Open(context, '${V6Routes.exercise}?id=${e.id}'),
      semanticLabel: '${e.title}. ${e.category}, ${e.minutes} minutes',
      child: Container(
        constraints: const BoxConstraints(minHeight: 68),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: divider ? Border(top: BorderSide(color: p.glassBorder)) : null,
        ),
        child: Row(children: [
          ExcludeSemantics(child: thumb),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              V6Text(e.title, size: 15, weight: FontWeight.w600, maxLines: 1),
              const SizedBox(height: 2),
              V6Text('${e.category} · ${e.minutes} min', size: 13, ink: V6Ink.faint, maxLines: 1),
            ]),
          ),
          Icon(Icons.chevron_right_rounded, size: 20, color: p.inkFaint),
        ]),
      ),
    );
  }
}

/// A glass list of exercise rows with hairline dividers.
class V6ExerciseList extends StatelessWidget {
  const V6ExerciseList({super.key, required this.items});
  final List<V6Exercise> items;

  @override
  Widget build(BuildContext context) => V6Glass(
        padding: const EdgeInsets.all(6),
        child: Column(children: [
          for (var i = 0; i < items.length; i++) V6ExerciseRow(exercise: items[i], divider: i > 0),
        ]),
      );
}

/// Energy-center orb: the real Soundscapes Mood Orb, tinted to the center's colour (Figma size).
class V6CenterOrb extends StatelessWidget {
  const V6CenterOrb({super.key, required this.color, this.size = 52, this.heroTag, this.live = false});
  final Color color;
  final double size;
  final Object? heroTag;
  final bool live;

  @override
  Widget build(BuildContext context) => V6MoodOrb(
        mood: V6Mood.calm,
        size: size,
        tint: color,
        glow: true,
        live: live,
        heroTag: heroTag,
      );
}
