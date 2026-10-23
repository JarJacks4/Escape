// Escape v6 — ambient palettes.
//
// Every v6 surface reads its colours from the active [V6Palette], so time of day, mood and
// activity can take over the whole UI (Figma Make: src/ambient/palettes.ts).
//
// Glass recipe (Jared's spec): a 40/40 blur over the background GIF / TouchDesigner loop, then a
// container with no image and a 3-stop gradient at 15% / 25% / 100% (see [V6Palette.glass]).
import 'package:flutter/material.dart';

enum V6Mood { calm, energized, focused, restless, tired, low }

enum V6PaletteId {
  day,
  night,
  daySoundscape,
  sleep,
  body,
  calm,
  energized,
  focused,
  restless,
  tired,
  low,
}

enum V6Tone { light, dark }

@immutable
class V6Palette {
  const V6Palette({
    required this.id,
    required this.label,
    required this.tone,
    required this.base,
    required this.glowA,
    required this.glowB,
    required this.accent,
    required this.accentSoft,
    required this.ink,
    required this.inkMuted,
    required this.inkFaint,
    required this.glass,
    required this.glassBorder,
    required this.navFill,
  });

  final V6PaletteId id;
  final String label;

  /// light = dark ink on a pale field; dark = light ink on a deep field.
  final V6Tone tone;

  /// 3-stop base gradient, top -> bottom.
  final List<Color> base;
  final Color glowA;
  final Color glowB;
  final Color accent;
  final Color accentSoft;
  final Color ink;
  final Color inkMuted;
  final Color inkFaint;

  /// Glass fill stops at 15% / 25% / 100%.
  final List<Color> glass;
  final Color glassBorder;
  final Color navFill;

  bool get isLight => tone == V6Tone.light;

  /// Text / icon colour that sits on an ink-filled pill (the primary CTA).
  Color get onInk => isLight ? const Color(0xFFF6F8FF) : base[2];

  /// Status bar icons.
  Brightness get statusIcons => isLight ? Brightness.dark : Brightness.light;

  static V6Palette lerp(V6Palette a, V6Palette b, double t) {
    Color c(Color x, Color y) => Color.lerp(x, y, t)!;
    List<Color> l(List<Color> x, List<Color> y) =>
        List.generate(x.length, (i) => c(x[i], y[i]));
    return V6Palette(
      id: t < 0.5 ? a.id : b.id,
      label: t < 0.5 ? a.label : b.label,
      tone: t < 0.5 ? a.tone : b.tone,
      base: l(a.base, b.base),
      glowA: c(a.glowA, b.glowA),
      glowB: c(a.glowB, b.glowB),
      accent: c(a.accent, b.accent),
      accentSoft: c(a.accentSoft, b.accentSoft),
      ink: c(a.ink, b.ink),
      inkMuted: c(a.inkMuted, b.inkMuted),
      inkFaint: c(a.inkFaint, b.inkFaint),
      glass: l(a.glass, b.glass),
      glassBorder: c(a.glassBorder, b.glassBorder),
      navFill: c(a.navFill, b.navFill),
    );
  }
}

/// Brand colours (fixed; never palette-driven).
class V6Brand {
  static const night = Color(0xFF0B1230);
  static const inkNavy = Color(0xFF101E43);
  static const surface = Color(0xFF18224A);
  static const royal = Color(0xFF39519F);
  static const deepBlue = Color(0xFF164395);
  static const ember = Color(0xFFEF7702);
  static const emberLight = Color(0xFFF08A1D);
  static const lilac = Color(0xFFB9A3F0);
  static const violet = Color(0xFF8E7CD9);
  static const mist = Color(0xFFE6EAF4);
  static const haze = Color(0xFFA9B3D6);
  static const cyan = Color(0xFF4CF6F6);
  static const sleepBg = Color(0xFF05081A);
  static const danger = Color(0xFFFF8A80);
  static const success = Color(0xFF34D399);
}

const _darkInk = Color(0xFFE6EAF4);
const _darkInkMuted = Color(0xB8E6EAF4); // 72%
const _darkInkFaint = Color(0x8CE6EAF4); // 55% (≥4.5:1 on the night field for 12 pt labels)
const _darkGlass = [Color(0x29FFFFFF), Color(0x14FFFFFF), Color(0x08FFFFFF)];
const _darkBorder = Color(0x29E6EAF4);

V6Palette _dark({
  required V6PaletteId id,
  required String label,
  required List<Color> base,
  required Color glowA,
  required Color glowB,
  required Color accent,
  required Color accentSoft,
  required Color navFill,
}) =>
    V6Palette(
      id: id,
      label: label,
      tone: V6Tone.dark,
      base: base,
      glowA: glowA,
      glowB: glowB,
      accent: accent,
      accentSoft: accentSoft,
      ink: _darkInk,
      inkMuted: _darkInkMuted,
      inkFaint: _darkInkFaint,
      glass: _darkGlass,
      glassBorder: _darkBorder,
      navFill: navFill,
    );

final Map<V6PaletteId, V6Palette> kV6Palettes = {
  V6PaletteId.day: const V6Palette(
    id: V6PaletteId.day,
    label: 'Day',
    tone: V6Tone.light,
    base: [Color(0xFFF6F8FF), Color(0xFFDCE5FB), Color(0xFFB4C7F5)],
    glowA: Color(0xF2FFFFFF),
    glowB: Color(0x8C5678E8),
    accent: Color(0xFF3A5BD9),
    accentSoft: Color(0x243A5BD9),
    ink: Color(0xFF0B1230),
    inkMuted: Color(0xB80B1230),
    // 60%: ≥4.5:1 on Day glass (42% was ~2.7:1 for 10–12 pt labels).
    inkFaint: Color(0x990B1230),
    glass: [Color(0xB8FFFFFF), Color(0x7AFFFFFF), Color(0x47FFFFFF)],
    glassBorder: Color(0xD9FFFFFF),
    navFill: Color(0x9EF6F8FF),
  ),
  V6PaletteId.night: _dark(
    id: V6PaletteId.night,
    label: 'Night',
    base: const [Color(0xFF0B1230), Color(0xFF101E43), Color(0xFF0B1230)],
    glowA: const Color(0x528E7CD9),
    glowB: const Color(0x7339519F),
    accent: const Color(0xFFB9A3F0),
    accentSoft: const Color(0x29B9A3F0),
    navFill: const Color(0x9E101E43),
  ),
  V6PaletteId.daySoundscape: _dark(
    id: V6PaletteId.daySoundscape,
    label: 'Daylight',
    base: const [Color(0xFF6F8FF0), Color(0xFF3A5BD9), Color(0xFF1F37A8)],
    glowA: const Color(0x8CF0F4FF),
    glowB: const Color(0xB3164395),
    accent: const Color(0xFFF6F8FF),
    accentSoft: const Color(0x2EFFFFFF),
    navFill: const Color(0x8C1F37A8),
  ),
  V6PaletteId.sleep: _dark(
    id: V6PaletteId.sleep,
    label: 'Sleep',
    base: const [Color(0xFF05081A), Color(0xFF0A0F28), Color(0xFF05081A)],
    glowA: const Color(0x389C4F07),
    glowB: const Color(0xCC101E43),
    accent: const Color(0xFFF08A1D),
    accentSoft: const Color(0x24F08A1D),
    navFill: const Color(0xB305081A),
  ),
  V6PaletteId.body: _dark(
    id: V6PaletteId.body,
    label: 'Body',
    base: const [Color(0xFF0B1329), Color(0xFF070A12), Color(0xFF030508)],
    glowA: const Color(0x4D38BDF8),
    glowB: const Color(0x3834D399),
    accent: const Color(0xFF38BDF8),
    accentSoft: const Color(0x2938BDF8),
    navFill: const Color(0xB3070A12),
  ),
  V6PaletteId.calm: _dark(
    id: V6PaletteId.calm,
    label: 'Calm',
    base: const [Color(0xFF2A2366), Color(0xFF3D3190), Color(0xFF1A1648)],
    glowA: const Color(0x99B9A3F0),
    glowB: const Color(0x8C8E7CD9),
    accent: const Color(0xFFB9A3F0),
    accentSoft: const Color(0x33B9A3F0),
    navFill: const Color(0x992A2366),
  ),
  V6PaletteId.energized: _dark(
    id: V6PaletteId.energized,
    label: 'Energized',
    base: const [Color(0xFFF08A1D), Color(0xFFC85A00), Color(0xFF5A1F02)],
    glowA: const Color(0xB3FFC478),
    glowB: const Color(0xBFEF7702),
    accent: const Color(0xFFFFE2BF),
    accentSoft: const Color(0x33FFE2BF),
    navFill: const Color(0x80782C00),
  ),
  V6PaletteId.focused: _dark(
    id: V6PaletteId.focused,
    label: 'Focused',
    base: const [Color(0xFF164395), Color(0xFF0E2C6E), Color(0xFF071A4A)],
    glowA: const Color(0x7378AAFF),
    glowB: const Color(0xB339519F),
    accent: const Color(0xFF9CC2FF),
    accentSoft: const Color(0x2E9CC2FF),
    navFill: const Color(0x99071A4A),
  ),
  V6PaletteId.restless: _dark(
    id: V6PaletteId.restless,
    label: 'Restless',
    base: const [Color(0xFF4A2172), Color(0xFF2B1240), Color(0xFF1A0B2C)],
    glowA: const Color(0x73F08A1D),
    glowB: const Color(0x998E7CD9),
    accent: const Color(0xFFF5B26B),
    accentSoft: const Color(0x2EF5B26B),
    navFill: const Color(0x992B1240),
  ),
  V6PaletteId.tired: _dark(
    id: V6PaletteId.tired,
    label: 'Tired',
    base: const [Color(0xFF101E43), Color(0xFF0A1230), Color(0xFF05081A)],
    glowA: const Color(0x4D9C4F07),
    glowB: const Color(0xCC212C5A),
    accent: const Color(0xFFF0A55A),
    accentSoft: const Color(0x24F0A55A),
    navFill: const Color(0xB30A1230),
  ),
  V6PaletteId.low: _dark(
    id: V6PaletteId.low,
    label: 'Low',
    base: const [Color(0xFF3A4675), Color(0xFF232C55), Color(0xFF141A33)],
    glowA: const Color(0x66A9B3D6),
    glowB: const Color(0x8039519F),
    accent: const Color(0xFFC9D1EE),
    accentSoft: const Color(0x29C9D1EE),
    navFill: const Color(0x99141A33),
  ),
};

V6Palette v6Palette(V6PaletteId id) => kV6Palettes[id]!;

V6PaletteId paletteForMood(V6Mood m) => switch (m) {
      V6Mood.calm => V6PaletteId.calm,
      V6Mood.energized => V6PaletteId.energized,
      V6Mood.focused => V6PaletteId.focused,
      V6Mood.restless => V6PaletteId.restless,
      V6Mood.tired => V6PaletteId.tired,
      V6Mood.low => V6PaletteId.low,
    };

@immutable
class V6MoodOption {
  const V6MoodOption(this.id, this.label, this.line, this.valence);
  final V6Mood id;
  final String label;
  final String line;

  /// -1 (unpleasant) … +1 (pleasant). Sent to Apple Health State of Mind / the API.
  final double valence;
}

const kV6Moods = <V6MoodOption>[
  V6MoodOption(V6Mood.calm, 'Calm', 'Soft and settled', 0.6),
  V6MoodOption(V6Mood.energized, 'Energized', 'Bright, ready to move', 0.8),
  V6MoodOption(V6Mood.focused, 'Focused', 'Clear and locked in', 0.5),
  V6MoodOption(V6Mood.restless, 'Restless', "Buzzing, can't settle", -0.3),
  V6MoodOption(V6Mood.tired, 'Tired', 'Running on low', -0.2),
  V6MoodOption(V6Mood.low, 'Low', 'Heavy, a little grey', -0.6),
];

V6MoodOption moodOption(V6Mood m) => kV6Moods.firstWhere((o) => o.id == m);

V6Mood? moodFromName(String? s) {
  if (s == null) return null;
  for (final m in V6Mood.values) {
    if (m.name == s) return m;
  }
  return null;
}

const kV6Intentions = <String>[
  'Find focus',
  'Slow down',
  'Sleep better',
  'Feel lighter',
  'Move my body',
  'Be kind to myself',
];

/// The TouchDesigner Mood Orb loops (same files the Soundscapes module and Journal play).
const kV6OrbStorage =
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-505618.firebasestorage.app/o/visuals%2Fv3%2F';

/// Mood -> orb cell. Only the calm / focus / picks grids are spheres (the sleep grid is ribbons,
/// used for the night backdrop), so every mood maps to a sphere.
const Map<V6Mood, String> kV6MoodLoop = {
  V6Mood.energized: 'escape_focus_e85_t50_v3', // bright ember core
  V6Mood.calm: 'escape_calm_e50_t15_v3', // smooth lilac-blue
  V6Mood.focused: 'escape_picks_e50_t15_v3', // clear blue with white veins
  V6Mood.restless: 'escape_focus_e50_t85_v3', // swirling ember particles
  V6Mood.tired: 'escape_calm_e15_t50_v3', // dim, soft
  V6Mood.low: 'escape_calm_e15_t85_v3', // heavy, grainy
};

/// Neutral orb shown before the first check-in (never a blank).
const kV6NeutralLoop = 'escape_picks_e50_t50_v3';

String v6OrbVideoUrl(V6Mood? m, {bool android = false}) {
  final loop = m == null ? kV6NeutralLoop : kV6MoodLoop[m]!;
  return '$kV6OrbStorage${loop}_720_${android ? 'h264' : 'hevc'}.mp4?alt=media';
}

String v6OrbPosterUrl(V6Mood? m) {
  final loop = m == null ? kV6NeutralLoop : kV6MoodLoop[m]!;
  return '$kV6OrbStorage${loop}_poster.webp?alt=media';
}
