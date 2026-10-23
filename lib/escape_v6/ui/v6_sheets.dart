// Escape v6 — bottom sheets: themed sheet, consent, Support (crisis) sheet.
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/v6_safety.dart';
import '../v6_routes.dart';
import '../state/v6_store.dart';
import '../theme/v6_palettes.dart';
import '../theme/v6_type.dart';
import 'v6_ambient.dart';
import 'v6_glass.dart';

/// Shows a frosted sheet that follows the active palette. The sheet re-provides [V6Theme] so its
/// contents match the page underneath.
Future<T?> showV6Sheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  String? title,
  bool dismissible = true,
  bool scrollable = true,
}) {
  final palette = V6Theme.of(context);
  final reduce = V6Theme.motionOff(context);
  HapticFeedback.lightImpact();
  return showModalBottomSheet<T>(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    isDismissible: dismissible,
    enableDrag: dismissible,
    backgroundColor: Colors.transparent,
    barrierColor: const Color(0x8005081A),
    builder: (ctx) => V6Theme(
      palette: palette,
      reduceMotion: reduce,
      child: _V6SheetFrame(title: title, scrollable: scrollable, child: Builder(builder: builder)),
    ),
  );
}

class _V6SheetFrame extends StatelessWidget {
  const _V6SheetFrame({required this.child, this.title, this.scrollable = true});
  final Widget child;
  final String? title;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final mq = MediaQuery.of(context);
    final body = Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Center(
        child: Container(
          margin: const EdgeInsets.only(top: 12, bottom: 8),
          width: 36,
          height: 4,
          decoration: BoxDecoration(color: p.inkFaint, borderRadius: BorderRadius.circular(2)),
        ),
      ),
      if (title != null)
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 16),
          child: Semantics(header: true, child: V6Display(title!, size: 24)),
        ),
      Flexible(
        child: scrollable
            ? SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24 + mq.padding.bottom),
                child: child,
              )
            : Padding(padding: EdgeInsets.fromLTRB(24, 0, 24, 24 + mq.padding.bottom), child: child),
      ),
    ]);
    return Padding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: mq.size.height * 0.9),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(V6Space.radiusSheet)),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: p.navFill,
                gradient: LinearGradient(
                  begin: const Alignment(-0.7, -1),
                  end: const Alignment(0.7, 1),
                  colors: [p.glass[0], p.glass[1], p.navFill],
                  stops: const [0.15, 0.25, 1],
                ),
                border: Border(top: BorderSide(color: p.glassBorder)),
              ),
              child: Material(type: MaterialType.transparency, child: body),
            ),
          ),
        ),
      ),
    );
  }
}

// ───────────────────────── consent ─────────────────────────

const kV6ConsentCopy = <String, String>{
  'wellbeing_data':
      'Save your mood check-ins so your Mood Orb, plan and suggestions can grow with you.',
  'ai_reflection':
      'Let Lucille (AI) read what you write to reply. Your words are not used to train models.',
  'voice': 'Use your microphone to talk with Lucille. Recordings are turned into text and not stored.',
  'camera_scan': 'Use your camera for the pulse part of the Mood Scan. Frames never leave your phone.',
  'personalization': 'Use your history to personalise suggestions and plans.',
  'health_data': 'Read heart rate, HRV and sleep from Health to tune your sessions. Nothing is shared.',
};

Future<bool> showV6Consent(BuildContext context, String purpose) async {
  final yes = await showV6Sheet<bool>(
    context,
    title: 'Allow this?',
    builder: (ctx) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const V6Eyebrow('Your choice', ink: V6Ink.accent),
      const SizedBox(height: 10),
      V6Text(kV6ConsentCopy[purpose] ?? 'Escape needs your permission for this.', ink: V6Ink.muted),
      const SizedBox(height: 8),
      const V6Text('You can change this any time in Profile > Privacy & data.', size: 13, ink: V6Ink.faint),
      const SizedBox(height: 22),
      V6PrimaryPill(label: 'Allow', onTap: () => Navigator.of(ctx).pop(true)),
      const SizedBox(height: 10),
      V6GhostPill(label: 'Not now', onTap: () => Navigator.of(ctx).pop(false)),
    ]),
  );
  return yes == true;
}

// ───────────────────────── support (crisis) ─────────────────────────

/// Gentle: "Would talking to someone help?" with tools first.
/// Urgent: real people first. Never auto-dismisses; "I'm okay for now" closes it.
Future<void> showV6Support(BuildContext context, V6SupportLevel level) {
  return showV6Sheet<void>(
    context,
    title: level == V6SupportLevel.urgent ? "You don't have to do this alone" : 'Would some support help?',
    dismissible: level == V6SupportLevel.gentle,
    builder: (ctx) => _SupportBody(level: level),
  );
}

class _SupportBody extends StatelessWidget {
  const _SupportBody({required this.level});
  final V6SupportLevel level;

  Future<void> _open(String uri) async {
    final u = Uri.parse(uri);
    try {
      await launchUrl(u, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final urgent = level == V6SupportLevel.urgent;
    final people = [
      for (final l in kCrisisLines)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: V6Glass(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            radius: 18,
            onTap: () => _open(l.uri),
            semanticLabel: '${l.label}. ${l.detail}',
            child: Row(children: [
              V6IconBadge(
                  icon: l.uri.startsWith('tel')
                      ? Icons.call_rounded
                      : l.uri.startsWith('sms')
                          ? Icons.sms_rounded
                          : Icons.public_rounded,
                  color: urgent ? V6Brand.emberLight : p.accent),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  V6Text(l.label, weight: FontWeight.w600),
                  V6Text(l.detail, size: 13, ink: V6Ink.faint),
                ]),
              ),
            ]),
          ),
        ),
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6Text(
        urgent
            ? 'If you might act on thoughts of harming yourself, please reach a person now. '
                'These lines are free, confidential and open all day and night.'
            : "It sounds like things feel heavy. A short tool might help, or you can talk to someone.",
        ink: V6Ink.muted,
      ),
      const SizedBox(height: 18),
      if (urgent) ...people,
      if (!urgent) ...[
        V6Glass(
          padding: const EdgeInsets.all(16),
          radius: 18,
          onTap: () {
            final nav = Navigator.of(context);
            nav.pop();
            v6Open(nav.context, 'v6Exercise?id=long-exhale');
          },
          child: const Row(children: [
            V6IconBadge(icon: Icons.air_rounded),
            SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                V6Text('Two minutes of long exhales', weight: FontWeight.w600),
                V6Text('In for 4, out for 6', size: 13, ink: V6Ink.faint),
              ]),
            ),
          ]),
        ),
        const SizedBox(height: 18),
        const V6Eyebrow('Talk to a person'),
        const SizedBox(height: 10),
        ...people,
      ],
      const SizedBox(height: 6),
      const V6Text('Lucille is an AI companion, not a crisis service.', size: 12, ink: V6Ink.faint, align: TextAlign.center),
      const SizedBox(height: 14),
      V6GhostPill(label: "I'm okay for now", onTap: () => Navigator.of(context).pop()),
    ]);
  }
}
