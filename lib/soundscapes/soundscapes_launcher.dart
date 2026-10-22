import 'package:escape_soundscapes/escape_soundscapes.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/auth/firebase_auth/auth_util.dart';
import 'lucille_memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/custom_code/actions/index.dart' as actions;
import 'package:that_audio_player_oo85ab/custom_code/actions/index.dart'
    as that_audio_player_oo85ab_actions;
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/nav/nav.dart';
import '/index.dart';

/// Entry point for the native Soundscapes module (iOS 17+).
class SoundscapesLauncher {
  SoundscapesLauncher._();

  /// Bundled Figma data until the Soundscapes API is deployed.
  static const bool useMock = true;

  /// Browse + Now Playing on the Lucille v1 catalog; the rest stays on the mock until the beta
  /// blockers are fixed. Turn off with --dart-define=SOUNDSCAPES_LUCILLE=false.
  static const bool useLucilleCatalog =
      bool.fromEnvironment('SOUNDSCAPES_LUCILLE', defaultValue: true);

  /// Soundscapes API base URL (Cloud Run). Used when [useMock] is false.
  static const String? apiBaseUrl = null;

  static Future<bool>? _supported;

  /// Ticks every time the native module closes (any way out), so pages can refresh what it
  /// may have changed, e.g. Home's latest Mood Scan.
  static final ValueNotifier<int> moduleClosed = ValueNotifier<int>(0);

  /// On by default; build with --dart-define=SOUNDSCAPES_BETA=false to hide the module.
  static const bool betaEnabled = bool.fromEnvironment('SOUNDSCAPES_BETA', defaultValue: true);

  /// Cached: true on iOS 17+ when the beta flag is set.
  static Future<bool> isSupported() => betaEnabled
      ? (_supported ??= EscapeSoundscapes.isSupported())
      : Future.value(false);

  /// Call once from main().
  static void configure() {
    if (!betaEnabled) return;
    EscapeSoundscapes.configure(
      tokenProvider: () async =>
          FirebaseAuth.instance.currentUser?.getIdToken(),
      onExit: _onExit,
      onFeedback: _saveFeedback,
      onMemory: (m) => LucilleMemory.remember(
        '${m['text'] ?? ''}',
        kind: '${m['kind'] ?? 'soundscapes'}',
        tags: ((m['tags'] as List?) ?? const []).map((t) => '$t').toList(),
        importance: (m['importance'] as num?)?.toInt() ?? 5,
      ),
    );
  }

  /// Opens a Lucille v1 `deeplink` ({route, path, params}). Soundscapes and Mood Scan go to the
  /// native module; anything else is pushed by path with its params (e.g. a journal `mode`),
  /// since pushing the route name alone drops them. Returns false when there's no path.
  static bool openLucilleLink(BuildContext context, Map? link) {
    final route = link?['route']?.toString();
    final path = link?['path']?.toString();
    if (route == 'AISoundscapesFINAL' || path == '/aISoundscapesFINAL') {
      openOrFallback(context);
      return true;
    }
    if (route == 'MoodScanVersion5' || path == '/moodScanVersion5') {
      openMoodScan(context);
      return true;
    }
    if (path == null || path.isEmpty) return false;
    final params = (link?['params'] as Map?)
            ?.map((k, v) => MapEntry(k.toString(), v.toString())) ??
        <String, String>{};
    final uri = Uri(path: path, queryParameters: params.isEmpty ? null : params);
    try {
      GoRouter.of(context).push(uri.toString());
      return true;
    } catch (_) {
      return false;
    }
  }

  /// New Soundscapes module when supported (iOS 17+), otherwise the old Sound page.
  static Future<void> openOrFallback(BuildContext context) async {
    final supported = await isSupported();
    if (!context.mounted) return;
    if (supported) {
      await open(context);
    } else {
      GoRouter.of(context).pushNamed(AISoundscapesFINALWidget.routeName);
    }
  }

  /// New Mood Scan (inside the module) when supported (iOS 17+), otherwise the old Mood Scan page.
  static Future<void> openMoodScan(BuildContext context) async {
    final supported = await isSupported();
    if (!context.mounted) return;
    if (supported) {
      await open(context, screen: 'MoodScan');
    } else {
      GoRouter.of(context).pushNamed(MoodScanVersion5Widget.routeName);
    }
  }

  /// After sign-in: Home underneath, then the new Mood Scan on top (closing it lands on Home).
  /// iOS 15/16 keep the old Mood Scan page.
  static Future<void> openMoodScanAfterSignIn(BuildContext context) async {
    final supported = await isSupported();
    if (!context.mounted) return;
    if (supported) {
      context.goNamedAuth(HomeVersion5Widget.routeName, context.mounted);
      await open(context, screen: 'MoodScan');
    } else {
      context.goNamedAuth(MoodScanVersion5Widget.routeName, context.mounted);
    }
  }

  /// Plays one Lucille track in the new module (Journal V2's "Tuned for this mood"),
  /// by id when the API gives one, else by title. Below iOS 17: the old Sound page.
  static Future<void> openTrack(BuildContext context,
      {String? trackId, String? title}) async {
    final supported = await isSupported();
    if (!context.mounted) return;
    if (supported) {
      await open(context, playTrackId: trackId, playTitle: title);
    } else {
      GoRouter.of(context).pushNamed(AISoundscapesFINALWidget.routeName);
    }
  }

  static Future<void> open(BuildContext context,
      {String? screen, String? playTrackId, String? playTitle}) async {
    try {
      // Best effort: stop the old Sound tab player so the two don't overlap.
      await actions.pauseAudio();
      await that_audio_player_oo85ab_actions.pauseAudio();
    } catch (_) {}
    try {
      await EscapeSoundscapes.open(
          mock: useMock,
          baseUrl: apiBaseUrl,
          lucille: useLucilleCatalog,
          firstName: _firstName(),
          screen: screen,
          playTrackId: playTrackId,
          playTitle: playTitle);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open Soundscapes: $e')),
      );
    }
  }

  /// First word of the user's display name, for the module's greeting (null if unknown).
  static String? _firstName() {
    final full = currentUserDisplayName.trim();
    if (full.isEmpty) return null;
    return full.split(RegExp(r'\s+')).first;
  }

  /// Beta feedback from the native module, saved to Firestore (soundscapesBetaFeedback).
  static Future<void> _saveFeedback(Map<String, dynamic> feedback) async {
    final user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('soundscapesBetaFeedback').add({
      ...feedback,
      'uid': user?.uid,
      'email': user?.email,
      'platform': 'ios',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// The user tapped another tab inside Soundscapes.
  static void _onExit(String? tab) {
    moduleClosed.value++;
    final ctx = appNavigatorKey.currentContext;
    if (ctx == null || tab == null) return;
    switch (tab) {
      case 'Home':
        ctx.goNamed(HomeVersion5Widget.routeName);
        break;
      case 'Lucille':
        ctx.goNamed(LucilleHomeWidget.routeName);
        break;
      case 'Explore':
        ctx.goNamed(ExplorePageVersion5FINALWidget.routeName);
        break;
      case 'Market':
        ctx.goNamed(MarketplaceVersion5Widget.routeName);
        break;
      case 'Body': // Move mode, until the Lucille catalog has Move tracks
        ctx.pushNamed(BodyPageVersion5Widget.routeName);
        break;
      case 'Journal': // "Save this moment" on the Mood Scan result
        ctx.pushNamed(JournalHomeV2Widget.routeName);
        break;
      case 'Mind': // Mood Scan result: section suggestions
        ctx.pushNamed(MindPageWidget.routeName);
        break;
      case 'Reset':
        ctx.pushNamed(ResetPageCopyWidget.routeName);
        break;
    }
  }
}

/// "AI Soundscapes" pill for the Home quick-access row, next to "Sounds". Hidden below iOS 17.
class SoundscapesBetaPill extends StatelessWidget {
  const SoundscapesBetaPill({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: SoundscapesLauncher.isSupported(),
      builder: (context, snapshot) {
        if (snapshot.data != true) return const SizedBox.shrink();
        final theme = FlutterFlowTheme.of(context);
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              HapticFeedback.lightImpact();
              SoundscapesLauncher.open(context);
            },
            child: Container(
              height: 36.0,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6B5BD6), Color(0xFFB9A3F0)],
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.0,
                    color: theme.secondary,
                    offset: const Offset(0.0, 2.0),
                    spreadRadius: 3.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.graphic_eq_rounded,
                        size: 16.0, color: Colors.white),
                    const SizedBox(width: 6.0),
                    Text(
                      'AI Soundscapes',
                      style: theme.bodyMedium.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 1.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: const Text(
                        'BETA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
