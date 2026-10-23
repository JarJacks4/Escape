// Escape v6 — pieces shared by the Profile pages: grouped list panel, confirm sheet, sign out,
// snackbar.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/auth/firebase_auth/auth_util.dart' show authManager;
import '/escape_v6/v6.dart';
import '/flutter_flow/nav/nav.dart' show NavigationExtensions, GoRouterExtensions;
import '/index.dart' show SplashScreenVersion5Widget;

/// The profile header orb continues into Edit profile (unique within each route).
const kV6ProfileOrbHeroTag = 'v6-profile-orb';

/// A glass panel holding [V6Row]s separated by hairlines (Figma: GlassPanel padding 6 + Divider).
class V6ListPanel extends StatelessWidget {
  const V6ListPanel({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Glass(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Column(children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) Divider(height: 1, thickness: 1, color: p.glassBorder),
          children[i],
        ],
      ]),
    );
  }
}

/// Leading icon tile for list rows.
class V6RowIcon extends StatelessWidget {
  const V6RowIcon(this.icon, {super.key, this.danger = false});
  final IconData icon;
  final bool danger;

  @override
  Widget build(BuildContext context) =>
      V6IconBadge(icon: icon, size: 40, color: danger ? V6Brand.danger : null);
}

/// Confirm sheet. With [safeFirst] the big primary pill is the safe choice ([cancelLabel]) and
/// the destructive action is a quieter outlined button below it.
Future<bool> showV6Confirm(
  BuildContext context, {
  required String title,
  required String body,
  required String confirmLabel,
  String cancelLabel = 'Cancel',
  bool safeFirst = false,
}) async {
  final yes = await showV6Sheet<bool>(
    context,
    title: title,
    builder: (ctx) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6Text(body, ink: V6Ink.muted),
      const SizedBox(height: 22),
      if (safeFirst) ...[
        V6PrimaryPill(label: cancelLabel, onTap: () => Navigator.of(ctx).pop(false)),
        const SizedBox(height: 10),
        _DangerPill(label: confirmLabel, onTap: () => Navigator.of(ctx).pop(true)),
      ] else ...[
        V6PrimaryPill(label: confirmLabel, onTap: () => Navigator.of(ctx).pop(true)),
        const SizedBox(height: 10),
        V6GhostPill(label: cancelLabel, onTap: () => Navigator.of(ctx).pop(false)),
      ],
    ]),
  );
  return yes == true;
}

class _DangerPill extends StatelessWidget {
  const _DangerPill({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: onTap,
      semanticLabel: label,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: V6Brand.danger.withOpacity(0.12),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: V6Brand.danger.withOpacity(0.6)),
        ),
        child: Text(label, style: V6Type.body(15, p.ink, weight: FontWeight.w600, height: 1.2)),
      ),
    );
  }
}

void v6Snack(BuildContext context, String text) {
  final m = ScaffoldMessenger.maybeOf(context);
  if (m == null) return;
  // Inside a v6 page use its live palette; otherwise resolve it from the store.
  final p = context.findAncestorWidgetOfExactType<V6Theme>()?.palette ??
      v6Palette(V6Store.instance.resolvePalette());
  m
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: p.ink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 110),
      content: Semantics(
        liveRegion: true,
        child: Text(text, style: V6Type.body(14, p.onInk, weight: FontWeight.w600)),
      ),
    ));
}

/// Signs out exactly like the existing Profile page (prepareAuthEvent → authManager.signOut →
/// splash), after clearing the v6 session state.
/// [saveState] false after the account (and its local data) was deleted, so nothing is written back.
Future<void> v6SignOut(BuildContext context, {bool saveState = true}) async {
  final router = GoRouter.of(context);
  router.prepareAuthEvent();
  if (saveState) await V6Store.instance.signOut();
  await authManager.signOut();
  router.clearRedirectLocation();
  if (!context.mounted) return;
  context.goNamedAuth(SplashScreenVersion5Widget.routeName, context.mounted);
}
