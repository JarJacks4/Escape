// Escape v6 — themed primitives (Figma Make: components/glass.tsx + kit.tsx).
//
// Touch targets: everything tappable is ≥ 48 × 48. Primary CTAs are 56 pt pills that live in the
// bottom 30% of the screen (thumb zone). The top bar only holds rare / escape actions
// (Back, Close, Help, Favourite).
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/v6_palettes.dart';
import '../theme/v6_type.dart';
import 'v6_ambient.dart';
import 'v6_motion.dart';

// ───────────────────────── glass ─────────────────────────

/// GlassPanel: BackdropFilter blur 40 + a 3-stop gradient at 15% / 25% / 100% + 1px border.
class V6Glass extends StatelessWidget {
  const V6Glass({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.radius = V6Space.radiusPanel,
    this.onTap,
    this.semanticLabel,
    this.tint,
    this.border,
    this.width,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final VoidCallback? onTap;
  final String? semanticLabel;

  /// Optional accent wash over the glass (e.g. a mood colour).
  final Color? tint;
  final Color? border;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final br = BorderRadius.circular(radius);
    Widget box = ClipRRect(
      borderRadius: br,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: br,
            gradient: LinearGradient(
              begin: const Alignment(-0.85, -1),
              end: const Alignment(0.85, 1),
              colors: [
                tint == null ? p.glass[0] : Color.alphaBlend(tint!.withOpacity(0.18), p.glass[0]),
                p.glass[1],
                p.glass[2],
              ],
              stops: const [0.15, 0.25, 1.0],
            ),
            border: Border.all(color: border ?? p.glassBorder, width: 1),
          ),
          child: DefaultTextStyle.merge(style: TextStyle(color: p.ink), child: child),
        ),
      ),
    );
    if (onTap != null) {
      box = V6Pressable(onTap: onTap, semanticLabel: semanticLabel, child: box);
    }
    return box;
  }
}

// ───────────────────────── text ─────────────────────────

enum V6Ink { normal, muted, faint, accent }

Color _ink(V6Palette p, V6Ink i) => switch (i) {
      V6Ink.normal => p.ink,
      V6Ink.muted => p.inkMuted,
      V6Ink.faint => p.inkFaint,
      V6Ink.accent => p.accent,
    };

class V6Display extends StatelessWidget {
  const V6Display(this.text, {super.key, this.size = 32, this.ink = V6Ink.normal, this.align, this.maxLines});
  final String text;
  final double size;
  final V6Ink ink;
  final TextAlign? align;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: align,
        maxLines: maxLines,
        overflow: maxLines == null ? null : TextOverflow.ellipsis,
        style: V6Type.displayStyle(size, _ink(V6Theme.of(context), ink)),
      );
}

class V6Text extends StatelessWidget {
  const V6Text(
    this.text, {
    super.key,
    this.size = 15,
    this.ink = V6Ink.normal,
    this.weight = FontWeight.w400,
    this.align,
    this.maxLines,
    this.height = 1.45,
  });
  final String text;
  final double size;
  final V6Ink ink;
  final FontWeight weight;
  final TextAlign? align;
  final int? maxLines;
  final double height;

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: align,
        maxLines: maxLines,
        overflow: maxLines == null ? null : TextOverflow.ellipsis,
        style: V6Type.body(size, _ink(V6Theme.of(context), ink), weight: weight, height: height),
      );
}

class V6Eyebrow extends StatelessWidget {
  const V6Eyebrow(this.text, {super.key, this.ink = V6Ink.muted});
  final String text;
  final V6Ink ink;

  @override
  Widget build(BuildContext context) =>
      Text(text.toUpperCase(), style: V6Type.eyebrow(_ink(V6Theme.of(context), ink)));
}

class V6SectionHeader extends StatelessWidget {
  const V6SectionHeader(this.title, {super.key, this.action, this.onAction});
  final String title;
  final String? action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Semantics(header: true, child: V6Display(title, size: 22))),
          if (action != null)
            V6Pressable(
              onTap: onAction,
              semanticLabel: '$action: $title',
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: V6Space.minTarget, minWidth: V6Space.minTarget),
                child: Center(child: V6Text(action!, size: 13, weight: FontWeight.w500, ink: V6Ink.muted)),
              ),
            ),
        ],
      );
}

// ───────────────────────── controls ─────────────────────────

class V6Chip extends StatelessWidget {
  const V6Chip({super.key, required this.label, this.selected = false, this.onTap, this.icon});
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final fg = selected ? p.onInk : p.ink;
    return Semantics(
      selected: selected,
      child: V6Pressable(
        onTap: onTap,
        semanticLabel: label,
        child: AnimatedContainer(
          duration: V6Motion.quick,
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? p.ink : p.glass[1],
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: selected ? p.ink : p.glassBorder),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            if (icon != null) ...[Icon(icon, size: 16, color: fg), const SizedBox(width: 6)],
            Text(label,
                style: V6Type.body(14, fg, weight: selected ? FontWeight.w600 : FontWeight.w500, height: 1.2)),
          ]),
        ),
      ),
    );
  }
}

/// The main CTA: ink-filled so it reads on every palette.
class V6PrimaryPill extends StatelessWidget {
  const V6PrimaryPill({super.key, required this.label, this.onTap, this.icon, this.loading = false, this.danger = false});
  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool loading;

  /// Red destructive variant (approval "Delete" / "Remove").
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final disabled = onTap == null || loading;
    final bg = danger ? V6Brand.danger : p.ink;
    final fg = danger ? Colors.white : p.onInk;
    return V6Pressable(
      onTap: disabled ? null : onTap,
      semanticLabel: label,
      child: AnimatedOpacity(
        duration: V6Motion.quick,
        opacity: onTap == null ? 0.35 : 1,
        child: Container(
          height: V6Space.ctaHeight,
          width: double.infinity,
          decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
          alignment: Alignment.center,
          child: loading
              ? SizedBox(
                  width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.2, color: fg))
              : Row(mainAxisSize: MainAxisSize.min, children: [
                  if (icon != null) ...[Icon(icon, size: 20, color: fg), const SizedBox(width: 10)],
                  Text(label, style: V6Type.body(16, fg, weight: FontWeight.w600, height: 1.2)),
                ]),
        ),
      ),
    );
  }
}

/// Secondary action: glass pill.
class V6GhostPill extends StatelessWidget {
  const V6GhostPill({super.key, required this.label, this.onTap, this.icon});
  final String label;
  final VoidCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: onTap,
      semanticLabel: label,
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
          color: p.glass[1],
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: p.glassBorder),
        ),
        alignment: Alignment.center,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 18, color: p.ink), const SizedBox(width: 8)],
          Text(label, style: V6Type.body(15, p.ink, weight: FontWeight.w500, height: 1.2)),
        ]),
      ),
    );
  }
}

/// Text link (low-key actions like "I'm really struggling", "Skip").
class V6Link extends StatelessWidget {
  const V6Link({super.key, required this.label, this.onTap, this.ink = V6Ink.muted, this.underline = false});
  final String label;
  final VoidCallback? onTap;
  final V6Ink ink;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    final c = _ink(V6Theme.of(context), ink);
    return V6Pressable(
      onTap: onTap,
      semanticLabel: label,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: V6Space.minTarget),
        child: Center(
          widthFactor: 1,
          child: Text(label,
              style: V6Type.body(14, c, weight: FontWeight.w500).copyWith(
                  decoration: underline ? TextDecoration.underline : null, decorationColor: c)),
        ),
      ),
    );
  }
}

/// 48 × 48 circular glass button (back, close, help, favourite).
class V6IconButton extends StatelessWidget {
  const V6IconButton({super.key, required this.icon, required this.label, this.onTap, this.size = 48, this.child});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final double size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Tooltip(
      message: label,
      excludeFromSemantics: true,
      child: V6Pressable(
        onTap: onTap,
        semanticLabel: label,
        scale: 0.92,
        child: ClipOval(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: p.glass[1],
                border: Border.all(color: p.glassBorder),
              ),
              alignment: Alignment.center,
              child: child ?? Icon(icon, size: size * 0.42, color: p.ink),
            ),
          ),
        ),
      ),
    );
  }
}

class V6Toggle extends StatelessWidget {
  const V6Toggle({super.key, required this.on, required this.onChanged, required this.label});
  final bool on;
  final ValueChanged<bool> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      toggled: on,
      label: label,
      child: GestureDetector(
        // The 9 pt padding counts as target too (48 pt tall), not only the 30 pt track.
        behavior: HitTestBehavior.opaque,
        onTap: () {
          HapticFeedback.lightImpact();
          onChanged(!on);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: AnimatedContainer(
            duration: V6Motion.quick,
            width: 50,
            height: 30,
            padding: const EdgeInsets.all(3),
            alignment: on ? Alignment.centerRight : Alignment.centerLeft,
            decoration: BoxDecoration(
              color: on ? p.ink : p.glass[1],
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: p.glassBorder),
            ),
            child: AnimatedContainer(
              duration: V6Motion.quick,
              width: 22,
              height: 22,
              decoration: BoxDecoration(shape: BoxShape.circle, color: on ? p.onInk : p.ink),
            ),
          ),
        ),
      ),
    );
  }
}

/// A row in a settings-style list: label (+ hint) on the left, control on the right.
class V6Row extends StatelessWidget {
  const V6Row({super.key, required this.title, this.subtitle, this.trailing, this.onTap, this.leading, this.danger = false});
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback? onTap;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final row = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 56),
      child: Row(children: [
        if (leading != null) ...[leading!, const SizedBox(width: 14)],
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(title,
                style: V6Type.body(15, danger ? V6Brand.danger : p.ink, weight: FontWeight.w500, height: 1.3)),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(subtitle!, style: V6Type.body(13, p.inkFaint, height: 1.35)),
            ],
          ]),
        ),
        if (trailing != null) trailing! else if (onTap != null) Icon(Icons.chevron_right_rounded, color: p.inkFaint),
      ]),
    );
    return onTap == null ? row : V6Pressable(onTap: onTap, semanticLabel: title, child: row);
  }
}

// ───────────────────────── progress ─────────────────────────

class V6ProgressBar extends StatelessWidget {
  const V6ProgressBar({super.key, required this.value, this.height = 6, this.semanticLabel});
  final double value;
  final double height;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final v = value.clamp(0.0, 1.0);
    return Semantics(
      label: semanticLabel,
      value: '${(v * 100).round()}%',
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: p.glass[2],
          borderRadius: BorderRadius.circular(height),
          border: Border.all(color: p.glassBorder),
        ),
        child: LayoutBuilder(
          builder: (context, box) => Align(
            alignment: Alignment.centerLeft,
            child: TweenAnimationBuilder<double>(
              tween: Tween(end: v),
              duration: const Duration(milliseconds: 500),
              curve: V6Motion.ease,
              builder: (context, t, _) => Container(
                width: box.maxWidth * t,
                decoration: BoxDecoration(color: p.accent, borderRadius: BorderRadius.circular(height)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class V6Ring extends StatelessWidget {
  const V6Ring({super.key, required this.value, this.size = 64, this.stroke = 6, this.child, this.semanticLabel});
  final double value;
  final double size;
  final double stroke;
  final Widget? child;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      label: semanticLabel,
      value: '${(value.clamp(0, 1) * 100).round()}%',
      child: SizedBox(
        width: size,
        height: size,
        child: TweenAnimationBuilder<double>(
          tween: Tween(end: value.clamp(0.0, 1.0)),
          duration: const Duration(milliseconds: 600),
          curve: V6Motion.ease,
          builder: (context, t, c) => CustomPaint(
            painter: _RingPainter(t, stroke, p.glassBorder, p.accent),
            child: Center(child: c),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.v, this.stroke, this.track, this.fill);
  final double v;
  final double stroke;
  final Color track;
  final Color fill;

  @override
  void paint(Canvas canvas, Size size) {
    final r = (math.min(size.width, size.height) - stroke) / 2;
    final c = size.center(Offset.zero);
    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = track;
    canvas.drawCircle(c, r, base);
    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = fill;
    canvas.drawArc(Rect.fromCircle(center: c, radius: r), -math.pi / 2, 2 * math.pi * v, false, arc);
  }

  @override
  bool shouldRepaint(_RingPainter o) => o.v != v || o.fill != fill || o.track != track;
}

class V6PageDots extends StatelessWidget {
  const V6PageDots({super.key, required this.count, required this.index});
  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      label: 'Step ${index + 1} of $count',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
          (i) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: i == index ? 22 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: i == index ? p.ink : p.inkFaint,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}

// ───────────────────────── layout ─────────────────────────

/// Back on the top left by convention; rare actions on the right. Primary actions live at the
/// bottom of each page.
class V6TopBar extends StatelessWidget {
  const V6TopBar({
    super.key,
    this.title,
    this.subtitle,
    this.onBack,
    this.actions = const [],
    this.large = false,
    this.noBack = false,
    this.closeIcon = false,
  });

  final String? title;
  final String? subtitle;
  final VoidCallback? onBack;
  final List<Widget> actions;
  final bool large;
  final bool noBack;
  final bool closeIcon;

  @override
  Widget build(BuildContext context) {
    final back = onBack ?? () => Navigator.of(context).maybePop();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48),
        child: Row(children: [
          if (!noBack)
            V6IconButton(
              icon: closeIcon ? Icons.close_rounded : Icons.arrow_back_rounded,
              label: closeIcon ? 'Close' : 'Back',
              onTap: back,
            ),
          if (!noBack) const SizedBox(width: 12),
          Expanded(
            child: !large && title != null
                ? Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                    Semantics(header: true, child: V6Text(title!, weight: FontWeight.w600, size: 16, maxLines: 1)),
                    if (subtitle != null) V6Text(subtitle!, size: 12, ink: V6Ink.faint, maxLines: 1),
                  ])
                : const SizedBox(),
          ),
          for (final a in actions) ...[const SizedBox(width: 8), a],
        ]),
      ),
      if (large && title != null) ...[
        const SizedBox(height: 16),
        Semantics(header: true, child: V6Display(title!, size: 34)),
        if (subtitle != null) ...[const SizedBox(height: 6), V6Text(subtitle!, ink: V6Ink.muted)],
      ],
    ]);
  }
}

/// Scrolling page body (ScreenScaffold): status-bar spacer, gutter, nav clearance, staggered rise.
class V6ScrollPage extends StatelessWidget {
  const V6ScrollPage({
    super.key,
    required this.children,
    this.gap = 24,
    this.withNav = true,
    this.controller,
    this.rise = true,
  });
  final List<Widget> children;
  final double gap;
  final bool withNav;
  final ScrollController? controller;
  final bool rise;

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return ListView.separated(
      controller: controller,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.fromLTRB(
          V6Space.gutter, pad.top + 12, V6Space.gutter, (withNav ? V6Space.navClearance : 32) + pad.bottom),
      itemCount: children.length,
      separatorBuilder: (_, __) => SizedBox(height: gap),
      itemBuilder: (context, i) => rise ? V6Rise(index: i, child: children[i]) : children[i],
    );
  }
}

/// Full-bleed page with a fixed bottom action area in the thumb zone (onboarding, details, flows).
class V6ActionPage extends StatelessWidget {
  const V6ActionPage({super.key, required this.children, this.footer = const [], this.top, this.gap = 22});
  final List<Widget> children;
  final List<Widget> footer;
  final Widget? top;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return Column(children: [
      SizedBox(height: pad.top + 8),
      if (top != null) Padding(padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter), child: top),
      Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(V6Space.gutter, 16, V6Space.gutter, 16),
          itemCount: children.length,
          separatorBuilder: (_, __) => SizedBox(height: gap),
          itemBuilder: (context, i) => V6Rise(index: i, child: children[i]),
        ),
      ),
      if (footer.isNotEmpty)
        Padding(
          padding: EdgeInsets.fromLTRB(V6Space.gutter, 8, V6Space.gutter, 20 + pad.bottom),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            for (var i = 0; i < footer.length; i++) ...[if (i > 0) const SizedBox(height: 10), footer[i]],
          ]),
        ),
    ]);
  }
}

/// A transparent Scaffold inside the ambient background. Every v6 page uses this.
class V6Page extends StatelessWidget {
  const V6Page({
    super.key,
    required this.child,
    this.activity,
    this.entryScreen = false,
    this.showMedia = true,
    this.resizeToAvoidBottomInset = true,
  });
  final Widget child;
  final V6PaletteId? activity;
  final bool entryScreen;
  final bool showMedia;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) => V6Ambient(
        activity: activity,
        entryScreen: entryScreen,
        showMedia: showMedia,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body: child,
        ),
      );
}

/// Glass text field.
class V6TextField extends StatelessWidget {
  const V6TextField({
    super.key,
    required this.controller,
    this.hint,
    this.maxLines = 1,
    this.onSubmitted,
    this.onChanged,
    this.autofocus = false,
    this.label,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
  });
  final TextEditingController controller;
  final String? hint;
  final int maxLines;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final bool autofocus;
  final String? label;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: p.glass[1],
        borderRadius: BorderRadius.circular(V6Space.radiusInput),
        border: Border.all(color: p.glassBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        controller: controller,
        autofocus: autofocus,
        maxLines: maxLines,
        minLines: 1,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        cursorColor: p.accent,
        style: V6Type.body(16, p.ink),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
          labelText: label,
          labelStyle: V6Type.body(14, p.inkMuted),
          hintText: hint,
          hintStyle: V6Type.body(16, p.inkFaint),
        ),
      ),
    );
  }
}

/// Small icon in a soft accent circle (list leading icons).
class V6IconBadge extends StatelessWidget {
  const V6IconBadge({super.key, required this.icon, this.color, this.size = 44});
  final IconData icon;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final c = color ?? p.accent;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: c.withOpacity(0.18), border: Border.all(color: c.withOpacity(0.35))),
      child: Icon(icon, size: size * 0.48, color: p.isLight ? p.ink : c),
    );
  }
}

/// Network image with a dark scrim so text over photos keeps contrast in Day mode.
class V6Photo extends StatelessWidget {
  const V6Photo({super.key, required this.url, this.height = 160, this.radius = V6Space.radiusCard, this.child, this.heroTag, this.semanticLabel});
  final String? url;
  final double height;
  final double radius;
  final Widget? child;
  final Object? heroTag;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    Widget img = url == null || url!.isEmpty
        ? DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [p.base[0], p.base[2]])))
        : Image.network(
            url!,
            fit: BoxFit.cover,
            semanticLabel: semanticLabel,
            frameBuilder: (context, child, frame, sync) => AnimatedOpacity(
              opacity: frame == null && !sync ? 0 : 1,
              duration: const Duration(milliseconds: 400),
              child: child,
            ),
            errorBuilder: (_, __, ___) =>
                DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [p.base[0], p.base[2]]))),
          );
    if (heroTag != null) img = V6Hero(tag: heroTag!, child: img);
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(fit: StackFit.expand, children: [
          img,
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x1405081A), Color(0xB305081A)],
              ),
            ),
          ),
          if (child != null) child!,
        ]),
      ),
    );
  }
}
