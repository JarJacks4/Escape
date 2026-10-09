// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';

/// The real Mood Orb: a seamless particle loop rendered from the Five Ways to Make
/// Particles / TouchDesigner footage (journal_orb_{tone}_hevc.mp4), clipped to a circle
/// with a soft glow. Shows the poster instantly, then fades the video in.
///
/// FlutterFlow: Custom Code > Widgets > + Add > Widget, name `MoodOrbVideo`
///   Parameters: videoUrl (String), posterUrl (String, nullable), glowHex (String, nullable),
///               heroTag (String, nullable)
/// Feed it `orb.orbHevc` (iOS) or `orb.orbH264` (Android) and `orb.orbPoster` from any /v1 response.
class MoodOrbVideo extends StatefulWidget {
  const MoodOrbVideo({
    super.key,
    this.width,
    this.height,
    required this.videoUrl,
    this.posterUrl,
    this.glowHex,
    this.heroTag,
  });

  final double? width;
  final double? height;
  final String videoUrl;
  final String? posterUrl;
  final String? glowHex;
  final String? heroTag;

  @override
  State<MoodOrbVideo> createState() => _MoodOrbVideoState();
}

Color _orbHex(String? hex, [Color fallback = const Color(0xFF4CF6F6)]) {
  if (hex == null || hex.isEmpty) return fallback;
  final h = hex.replaceAll('#', '');
  final v = int.tryParse(h.length == 6 ? 'FF$h' : h, radix: 16);
  return v == null ? fallback : Color(v);
}

class _MoodOrbVideoState extends State<MoodOrbVideo> {
  VideoPlayerController? _c;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant MoodOrbVideo old) {
    super.didUpdateWidget(old);
    if (old.videoUrl != widget.videoUrl) {
      _disposeController();
      _ready = false;
      _load();
    }
  }

  Future<void> _load() async {
    if (widget.videoUrl.isEmpty) return;
    final c = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    _c = c;
    try {
      await c.initialize();
      await c.setLooping(true);
      await c.setVolume(0);
      await c.play();
      if (mounted && _c == c) setState(() => _ready = true);
    } catch (_) {
      // poster stays visible; never break the screen over a video
    }
  }

  void _disposeController() {
    _c?.dispose();
    _c = null;
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.width ?? widget.height ?? 120;
    final glow = _orbHex(widget.glowHex);
    Widget orb = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: glow.withOpacity(0.35), blurRadius: size * 0.22, spreadRadius: size * 0.02)],
      ),
      child: ClipOval(
        child: Stack(fit: StackFit.expand, children: [
          if (widget.posterUrl != null && widget.posterUrl!.isNotEmpty)
            CachedNetworkImage(
              imageUrl: widget.posterUrl!,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => _fallback(glow),
              placeholder: (_, __) => _fallback(glow),
            )
          else
            _fallback(glow),
          AnimatedOpacity(
            opacity: _ready ? 1 : 0,
            duration: const Duration(milliseconds: 600),
            child: _ready && _c != null
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _c!.value.size.width,
                      height: _c!.value.size.height,
                      child: VideoPlayer(_c!),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ]),
      ),
    );
    if (widget.heroTag != null && widget.heroTag!.isNotEmpty) {
      orb = Hero(tag: widget.heroTag!, child: orb);
    }
    return orb;
  }

  Widget _fallback(Color glow) => DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.25, -0.3),
            colors: [Colors.white, glow, const Color(0xFF0B1230)],
            stops: const [0.0, 0.45, 1.0],
          ),
        ),
      );
}
