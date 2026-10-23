// Escape v6 — building blocks shared by Home, Daily plan, Progress and Explore.
//
// * [v6TodaysPicks] chooses sessions for the current mood + time of day (Home "Today's picks").
// * [V6ExerciseCard] is the photo / orb card that flies into the exercise detail page (Hero on
//   `exercise.heroTag`).
// * [V6HeroSafeSwitcher] cross-fades content without two heroes with the same tag being live at
//   once (the outgoing copy has its heroes switched off).
// * [V6Shimmer] is the subtle "still loading" sweep over real text (never placeholder lorem).
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';

// ───────────────────────── mood / time helpers ─────────────────────────

/// The orb that best represents an exercise's palette (orb tiles when a session has no photo).
V6Mood? v6MoodForPalette(V6PaletteId id) => switch (id) {
      V6PaletteId.calm => V6Mood.calm,
      V6PaletteId.energized => V6Mood.energized,
      V6PaletteId.focused => V6Mood.focused,
      V6PaletteId.restless => V6Mood.restless,
      V6PaletteId.tired || V6PaletteId.sleep => V6Mood.tired,
      V6PaletteId.low => V6Mood.low,
      _ => null,
    };

enum V6DayPart { morning, afternoon, evening, night }

V6DayPart v6DayPart([DateTime? now]) {
  final h = (now ?? DateTime.now()).hour;
  if (h >= 5 && h < 12) return V6DayPart.morning;
  if (h >= 12 && h < 17) return V6DayPart.afternoon;
  if (h >= 17 && h < 22) return V6DayPart.evening;
  return V6DayPart.night;
}

String v6Greeting([DateTime? now]) {
  final h = (now ?? DateTime.now()).hour;
  if (h >= 5 && h < 12) return 'Good morning';
  if (h >= 12 && h < 17) return 'Good afternoon';
  return 'Good evening';
}

const _weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
const _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

/// "Wednesday, October 21" (no locale data needed).
String v6LongDate(DateTime d) => '${_weekdays[d.weekday - 1]}, ${_months[d.month - 1]} ${d.day}';

/// "M", "T", … for a date.
String v6WeekdayLetter(DateTime d) => _weekdays[d.weekday - 1].substring(0, 1);

/// 1234 -> "1,234".
String v6FormatInt(int n) {
  final s = n.abs().toString();
  final b = StringBuffer(n < 0 ? '-' : '');
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
    b.write(s[i]);
  }
  return b.toString();
}

const Map<V6Mood, List<String>> _moodTags = {
  V6Mood.calm: ['calm', 'nature', 'centering'],
  V6Mood.energized: ['focus', 'energy', 'productivity', 'work'],
  V6Mood.focused: ['focus', 'work', 'study', 'productivity'],
  V6Mood.restless: ['restless', 'stress', 'panic', 'anxious', 'overthinking', 'irritable'],
  V6Mood.tired: ['tired', 'sleep', 'low', 'heavy'],
  V6Mood.low: ['low', 'sad', 'heavy', 'calm'],
};

/// Sessions for the current mood + time of day, best first.
List<V6Exercise> v6TodaysPicks(V6Mood? mood, {DateTime? now, int count = 5}) {
  final part = v6DayPart(now);
  final first = v6ExerciseForMood(mood);
  final tags = mood == null ? const ['calm', 'breathe', 'stress'] : _moodTags[mood]!;
  int score(V6Exercise e) {
    var s = 0;
    if (e.id == first) s += 6;
    s += 2 * e.tags.where(tags.contains).length;
    final sleepy = e.category == 'Sleep' || e.tags.contains('sleep');
    if (part == V6DayPart.night) {
      if (sleepy) s += 5;
      if (e.category == 'Focus') s -= 3;
    } else if (part == V6DayPart.evening) {
      if (sleepy) s += 2;
      if (e.category == 'Focus') s -= 1;
    } else if (part == V6DayPart.morning) {
      if (sleepy) s -= 4;
      if (e.category == 'Focus' || e.category == 'Energy') s += 1;
    } else {
      if (sleepy) s -= 3;
      if (e.minutes <= 5) s += 1;
    }
    return s;
  }

  final scored = [for (final e in kV6Exercises) (e: e, s: score(e))];
  scored.sort((a, b) {
    final d = b.s - a.s;
    return d != 0 ? d : a.e.minutes.compareTo(b.e.minutes);
  });
  return scored.take(count).map((x) => x.e).toList();
}

/// Why these picks (Lucille explains her suggestions).
String v6PicksWhy(V6Mood? mood, [DateTime? now]) {
  final when = switch (v6DayPart(now)) {
    V6DayPart.morning => 'this morning',
    V6DayPart.afternoon => 'this afternoon',
    V6DayPart.evening => 'this evening',
    V6DayPart.night => 'tonight',
  };
  if (mood == null) return 'Gentle places to start $when. Check in and these follow your mood.';
  return 'Chosen for feeling ${moodOption(mood).label.toLowerCase()} $when.';
}

// ───────────────────────── cards ─────────────────────────

/// Session card: photo with scrim (Hero into the detail page) or a glass tile with its orb.
class V6ExerciseCard extends StatelessWidget {
  const V6ExerciseCard({
    super.key,
    required this.exercise,
    required this.onTap,
    this.width,
    this.height = 190,
    this.eyebrow,
  });

  final V6Exercise exercise;
  final VoidCallback onTap;
  final double? width;
  final double height;
  final String? eyebrow;

  @override
  Widget build(BuildContext context) {
    final e = exercise;
    final meta = '${e.minutes} min · ${e.category}';
    final img = e.image;
    Widget card;
    if (img != null && img.isNotEmpty) {
      card = V6Photo(
        url: img,
        height: height,
        heroTag: e.heroTag,
        semanticLabel: e.title,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (eyebrow != null) ...[
                Text(eyebrow!.toUpperCase(), style: V6Type.eyebrow(const Color(0xD9FFFFFF))),
                const SizedBox(height: 4),
              ],
              Text(e.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: V6Type.displayStyle(21, Colors.white)),
              const SizedBox(height: 2),
              Text(meta, style: V6Type.body(12, const Color(0xD9FFFFFF), height: 1.3)),
            ],
          ),
        ),
      );
    } else {
      card = SizedBox(
        height: height,
        child: V6Glass(
          radius: V6Space.radiusCard,
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // No photo: the orb itself flies into the detail page (same tag as its big orb).
            V6MoodOrb(mood: v6MoodForPalette(e.palette), size: 56, pulse: false, heroTag: e.heroTag),
            const Spacer(),
            if (eyebrow != null) ...[V6Eyebrow(eyebrow!, ink: V6Ink.faint), const SizedBox(height: 4)],
            V6Text(e.title, size: 16, weight: FontWeight.w600, maxLines: 2, height: 1.25),
            const SizedBox(height: 2),
            V6Text(meta, size: 12, ink: V6Ink.faint, maxLines: 1),
          ]),
        ),
      );
    }
    return SizedBox(
      width: width,
      child: V6Pressable(onTap: onTap, semanticLabel: '${e.title}, ${e.minutes} minutes', child: card),
    );
  }
}

/// Rounded icon badge in a soft wash of [color] (support list, guides).
class V6TintBadge extends StatelessWidget {
  const V6TintBadge({super.key, required this.icon, required this.color, this.size = 46, this.radius = 16});
  final IconData icon;
  final Color color;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(p.isLight ? 0.22 : 0.18),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Icon(icon, size: size * 0.48, color: p.isLight ? Color.lerp(color, p.ink, 0.45) : color),
    );
  }
}

/// Small accent pill used as a non-interactive call-to-action label inside tappable cards.
class V6SoftPill extends StatelessWidget {
  const V6SoftPill(this.label, {super.key, this.icon});
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: p.accentSoft,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: p.glassBorder),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[Icon(icon, size: 15, color: p.ink), const SizedBox(width: 6)],
        Text(label, style: V6Type.body(13, p.ink, weight: FontWeight.w600, height: 1.2)),
      ]),
    );
  }
}

// ───────────────────────── motion ─────────────────────────

/// Cross-fade that switches heroes off in the outgoing copy, so two copies of the same card never
/// fight over a Hero tag mid-fade.
class V6HeroSafeSwitcher extends StatelessWidget {
  const V6HeroSafeSwitcher({super.key, required this.child, this.duration = const Duration(milliseconds: 320)});
  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final off = V6Theme.motionOff(context);
    return AnimatedSwitcher(
      duration: off ? Duration.zero : duration,
      switchInCurve: V6Motion.ease,
      switchOutCurve: Curves.easeIn,
      layoutBuilder: (current, previous) => Stack(
        alignment: Alignment.topCenter,
        children: [...previous, if (current != null) current],
      ),
      transitionBuilder: (c, a) => AnimatedBuilder(
        animation: a,
        builder: (context, child) => HeroMode(
          enabled: a.status == AnimationStatus.forward || a.status == AnimationStatus.completed,
          child: child!,
        ),
        child: FadeTransition(opacity: a, child: c),
      ),
      child: child,
    );
  }
}

/// A soft light sweep across [child] while [active] (e.g. while Lucille's suggestion loads).
class V6Shimmer extends StatefulWidget {
  const V6Shimmer({super.key, required this.child, this.active = true});
  final Widget child;
  final bool active;

  @override
  State<V6Shimmer> createState() => _V6ShimmerState();
}

class _V6ShimmerState extends State<V6Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final on = widget.active && !V6Theme.motionOff(context);
    if (!on) {
      if (_c.isAnimating) _c.stop();
      return widget.child;
    }
    if (!_c.isAnimating) _c.repeat();
    final light = V6Theme.of(context).isLight;
    final hi = light ? Colors.white.withOpacity(0.7) : Colors.white.withOpacity(0.45);
    return AnimatedBuilder(
      animation: _c,
      child: widget.child,
      builder: (context, child) => ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (b) {
          final x = -b.width + 2 * b.width * _c.value;
          return LinearGradient(
            colors: [hi.withOpacity(0), hi, hi.withOpacity(0)],
            stops: const [0.3, 0.5, 0.7],
          ).createShader(Rect.fromLTWH(x, 0, b.width, b.height));
        },
        child: child,
      ),
    );
  }
}
