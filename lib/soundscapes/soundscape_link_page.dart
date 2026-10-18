import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/nav/nav.dart';
import '/index.dart';
import 'soundscapes_launcher.dart';

/// Opened by a shared soundscape link:
///   escapeinnerverse://escape.com/playSoundscape?track=<trackId>&title=<title>
/// Goes to Home underneath, then opens Soundscapes playing that track.
class SoundscapeLinkPageWidget extends StatefulWidget {
  const SoundscapeLinkPageWidget({super.key, this.track, this.title});

  final String? track;
  final String? title;

  static String routeName = 'SoundscapeLinkPage';
  static String routePath = '/playSoundscape';

  @override
  State<SoundscapeLinkPageWidget> createState() =>
      _SoundscapeLinkPageWidgetState();
}

class _SoundscapeLinkPageWidgetState extends State<SoundscapeLinkPageWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final track = widget.track, title = widget.title;
      context.goNamed(HomeVersion5Widget.routeName);
      // Let Home settle, then open the module from the app's navigator.
      await Future.delayed(const Duration(milliseconds: 400));
      final ctx = appNavigatorKey.currentContext;
      if (ctx == null) return;
      if ((track ?? '').isEmpty && (title ?? '').isEmpty) {
        await SoundscapesLauncher.openOrFallback(ctx);
      } else {
        await SoundscapesLauncher.openTrack(ctx, trackId: track, title: title);
      }
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Color(0xFF0B1230),
        body: Center(
          child: SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
        ),
      );
}
