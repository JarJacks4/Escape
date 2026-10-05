import 'package:escape_soundscapes/escape_soundscapes.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/nav/nav.dart';
import '/index.dart';

/// Entry point for the native Soundscapes module (iOS 17+).
class SoundscapesLauncher {
  SoundscapesLauncher._();

  /// Bundled Figma data until the Soundscapes API is deployed.
  static const bool useMock = true;

  /// Soundscapes API base URL (Cloud Run). Used when [useMock] is false.
  static const String? apiBaseUrl = null;

  static Future<bool>? _supported;

  /// Set with --dart-define=SOUNDSCAPES_BETA=true (TestFlight beta builds only).
  static const bool betaEnabled = bool.fromEnvironment('SOUNDSCAPES_BETA');

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
    );
  }

  static Future<void> open(BuildContext context) async {
    try {
      // Best effort: stop the old Sound tab player so the two don't overlap.
      await actions.pauseAudio();
    } catch (_) {}
    try {
      await EscapeSoundscapes.open(mock: useMock, baseUrl: apiBaseUrl);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open Soundscapes: $e')),
      );
    }
  }

  /// The user tapped another tab inside Soundscapes.
  static void _onExit(String? tab) {
    final ctx = appNavigatorKey.currentContext;
    if (ctx == null || tab == null) return;
    switch (tab) {
      case 'Home':
        ctx.goNamed(HomeVersion5Widget.routeName);
        break;
      case 'Lucille':
        ctx.goNamed(LucilleHomeWidget.routeName);
        break;
      case 'Realms':
        ctx.pushNamed(ChooseRealmsPageWidget.routeName);
        break;
      case 'Profile':
        ctx.pushNamed(DashboardPageWidget.routeName);
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
