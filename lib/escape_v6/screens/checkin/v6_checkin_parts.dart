// Escape v6 — pieces shared by onboarding, the daily check-in and the quick check-in sheet
// (Figma Make: Entry.tsx MoodPicker / OrbButton, CheckIn.tsx EnergySlider / needsSupport).
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/escape_v6/v6.dart';

/// "Low" moods and very low energy are treated as needs-support moments (gentle sheet).
bool v6NeedsSupport(V6Mood? mood, double energy) =>
    mood == V6Mood.low || (mood == V6Mood.tired && energy < 0.34);

/// low / steady / high (used by the trust gate copy and the slider label).
String v6EnergyWord(double e) => e < 0.34 ? 'low' : (e < 0.67 ? 'steady' : 'high');

String v6GreetingWord([DateTime? now]) {
  final h = (now ?? DateTime.now()).hour;
  if (h < 5) return 'Still up';
  if (h < 12) return 'Good morning';
  if (h < 18) return 'Good afternoon';
  return 'Good evening';
}

/// Row of the 6 mood orbs (poster only). Selected orb grows and gets a glass halo.
/// [fit] spreads the orbs across the width instead of scrolling (bottom sheet).
class V6CheckInMoodRow extends StatelessWidget {
  const V6CheckInMoodRow({
    super.key,
    required this.value,
    required this.onChanged,
    this.orbSize = 44,
    this.fit = false,
  });

  final V6Mood? value;
  final ValueChanged<V6Mood> onChanged;
  final double orbSize;
  final bool fit;

  Widget _item(BuildContext context, V6MoodOption m, double orb, double? width) {
    final p = V6Theme.of(context);
    final on = value == m.id;
    return MergeSemantics(
      child: Semantics(
      inMutuallyExclusiveGroup: true,
      checked: on,
      hint: m.line,
      child: V6Pressable(
        onTap: () => onChanged(m.id),
        child: AnimatedContainer(
          duration: V6Motion.quick,
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: on ? p.glass[0] : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: on ? p.glassBorder : Colors.transparent),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            AnimatedScale(
              scale: on ? 1.15 : 1,
              duration: const Duration(milliseconds: 250),
              curve: V6Motion.ease,
              child: V6MoodOrb(mood: m.id, size: orb, glow: on, pulse: on),
            ),
            const SizedBox(height: 10),
            Text(
              m.label,
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: V6Type.body(12, on ? p.ink : p.inkMuted,
                  weight: on ? FontWeight.w600 : FontWeight.w500, height: 1.2),
            ),
          ]),
        ),
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (fit) {
      return LayoutBuilder(builder: (context, box) {
        final cell = box.maxWidth / kV6Moods.length;
        final orb = (cell - 12).clamp(28.0, orbSize);
        return Row(children: [
          for (final m in kV6Moods) Expanded(child: _item(context, m, orb, null)),
        ]);
      });
    }
    return SizedBox(
      height: orbSize * 1.15 + 54,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        itemCount: kV6Moods.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, i) => _item(context, kV6Moods[i], orbSize, 72),
      ),
    );
  }
}

/// Energy slider 0…1, "Drained … Charged".
class V6CheckInEnergySlider extends StatelessWidget {
  const V6CheckInEnergySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        const V6Text('Drained', size: 12, ink: V6Ink.faint),
        Expanded(
          child: Semantics(
            liveRegion: true,
            child: V6Text('Energy · ${v6EnergyWord(value)}',
                size: 13, weight: FontWeight.w600, align: TextAlign.center),
          ),
        ),
        const V6Text('Charged', size: 12, ink: V6Ink.faint),
      ]),
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 6,
          activeTrackColor: p.accent,
          inactiveTrackColor: p.glassBorder,
          thumbColor: p.ink,
          overlayColor: p.accentSoft,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
          trackShape: const RoundedRectSliderTrackShape(),
        ),
        child: Slider(
          value: value.clamp(0.0, 1.0),
          semanticFormatterCallback: (v) => 'Energy ${v6EnergyWord(v)}, ${(v * 100).round()} percent',
          onChanged: (v) {
            if (v6EnergyWord(v) != v6EnergyWord(value)) HapticFeedback.selectionClick();
            onChanged(v);
          },
        ),
      ),
    ]);
  }
}

/// The dark pill that sits on a bright hero orb (Figma OrbButton). Fixed colours: it always
/// sits on the orb, never on the page background.
class V6OrbCta extends StatelessWidget {
  const V6OrbCta({super.key, required this.label, this.onTap, this.loading = false});
  final String label;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null || loading;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: V6Pressable(
          onTap: disabled ? null : onTap,
          semanticLabel: label,
          child: AnimatedOpacity(
            duration: V6Motion.quick,
            opacity: onTap == null ? 0.45 : 1,
            child: Container(
              height: 58,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: Colors.white.withOpacity(0.18)),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [V6Brand.inkNavy, V6Brand.night],
                ),
                boxShadow: [BoxShadow(color: V6Brand.night.withOpacity(0.35), blurRadius: 30, offset: const Offset(0, 12))],
              ),
              child: loading
                  ? const SizedBox(
                      width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.2, color: Color(0xFFF6F8FF)))
                  : Text(label, style: V6Type.body(16, const Color(0xFFF6F8FF), weight: FontWeight.w600, height: 1.2)),
            ),
          ),
        ),
      ),
    );
  }
}

/// Hero orb whose visible height eases between steps.
class V6AnimatedHeroOrb extends StatelessWidget {
  const V6AnimatedHeroOrb({super.key, required this.mood, required this.visible, this.child, this.heroTag});
  final V6Mood? mood;
  final double visible;
  final Widget? child;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    final off = V6Theme.motionOff(context);
    return TweenAnimationBuilder<double>(
      tween: Tween(end: visible),
      duration: off ? Duration.zero : const Duration(milliseconds: 520),
      curve: V6Motion.ease,
      builder: (context, v, _) => V6HeroOrb(mood: mood, visible: v, heroTag: heroTag, child: child),
    );
  }
}

/// Accent-dot bullet list inside a glass panel.
class V6Bullets extends StatelessWidget {
  const V6Bullets(this.items, {super.key});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Glass(
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(height: 14),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(top: 7),
              decoration: BoxDecoration(shape: BoxShape.circle, color: p.accent),
            ),
            const SizedBox(width: 12),
            Expanded(child: V6Text(items[i])),
          ]),
        ],
      ]),
    );
  }
}

/// Fixed-height top row: leading control, page dots, trailing control.
class V6StepBar extends StatelessWidget {
  const V6StepBar({super.key, required this.count, required this.index, this.leading, this.trailing});
  final int count;
  final int index;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48,
        child: Row(children: [
          SizedBox(width: 72, child: Align(alignment: Alignment.centerLeft, child: leading)),
          Expanded(child: V6PageDots(count: count, index: index)),
          SizedBox(width: 72, child: Align(alignment: Alignment.centerRight, child: trailing)),
        ]),
      );
}
