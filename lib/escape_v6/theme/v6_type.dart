// Escape v6 — type, spacing and motion tokens.
//
// Display = Gilda Display (bundled: assets/fonts/GildaDisplay-Regular.ttf), UI = Work Sans
// (bundled family 'WorkSans'). Bundled fonts mean no network fetch and no layout jump.
import 'package:flutter/animation.dart';
import 'package:flutter/painting.dart';

class V6Type {
  static const display = 'GildaDisplay';
  static const ui = 'WorkSans';

  static TextStyle displayStyle(double size, Color color) => TextStyle(
        fontFamily: display,
        fontSize: size,
        height: 1.12,
        letterSpacing: -0.01 * size,
        color: color,
      );

  static TextStyle body(double size, Color color,
          {FontWeight weight = FontWeight.w400, double height = 1.45}) =>
      TextStyle(
        fontFamily: ui,
        fontSize: size,
        fontWeight: weight,
        height: height,
        color: color,
      );

  static TextStyle eyebrow(Color color) => TextStyle(
        fontFamily: ui,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.54,
        color: color,
      );
}

/// Spacing & radii (Figma Make index.css).
class V6Space {
  static const gutter = 20.0;
  static const radiusCard = 20.0;
  static const radiusPanel = 24.0;
  static const radiusSheet = 28.0;
  static const radiusInput = 16.0;

  /// Bottom padding for scrolling pages that sit above the floating nav bar.
  static const navClearance = 120.0;

  /// Minimum touch target (Apple 44pt / Material 48dp — we use 48 everywhere).
  static const minTarget = 48.0;

  /// Primary CTA pill height (thumb-zone anchor).
  static const ctaHeight = 56.0;
}

/// Motion tokens. Every fade in the app uses one of these so the whole UI breathes together.
class V6Motion {
  /// Palette / ambient cross-fade (Figma: 1.2 s).
  static const ambient = Duration(milliseconds: 1200);

  /// Page transitions (fade + 3% rise).
  static const page = Duration(milliseconds: 420);
  static const pageReverse = Duration(milliseconds: 320);

  /// Content inside a page (staggered rise-in).
  static const rise = Duration(milliseconds: 420);
  static const stagger = Duration(milliseconds: 60);

  /// Taps, toggles, chips.
  static const quick = Duration(milliseconds: 200);

  /// Hero flights (orb between pages).
  static const hero = Duration(milliseconds: 560);

  static const ease = Cubic(0.2, 0.8, 0.2, 1);
  static const easeInOut = Curves.easeInOut;
}
