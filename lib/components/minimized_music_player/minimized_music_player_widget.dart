import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'minimized_music_player_model.dart';
export 'minimized_music_player_model.dart';

class MinimizedMusicPlayerWidget extends StatefulWidget {
  const MinimizedMusicPlayerWidget({super.key});

  @override
  State<MinimizedMusicPlayerWidget> createState() =>
      _MinimizedMusicPlayerWidgetState();
}

class _MinimizedMusicPlayerWidgetState
    extends State<MinimizedMusicPlayerWidget> {
  late MinimizedMusicPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinimizedMusicPlayerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: double.infinity,
        height: 79.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).secondary
            ],
            stops: const [0.0, 1.0],
            begin: const AlignmentDirectional(0.0, -1.0),
            end: const AlignmentDirectional(0, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: FlutterFlowAudioPlayer(
            audio: Audio.network(
              'https://filesamples.com/samples/audio/mp3/sample3.mp3',
              metas: Metas(
                id: 'sample3.mp3-1dd8b953',
              ),
            ),
            titleTextStyle: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                  color: FlutterFlowTheme.of(context).secondary,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleLargeFamily),
                ),
            playbackDurationTextStyle: FlutterFlowTheme.of(context)
                .labelMedium
                .override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  color: FlutterFlowTheme.of(context).success,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            fillColor: const Color(0x7B040B1A),
            playbackButtonColor: const Color(0xFF1C162D),
            activeTrackColor: const Color(0xFF406090),
            inactiveTrackColor:
                FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 8.0,
            pauseOnNavigate: false,
            playInBackground: PlayInBackground.enabled,
          ),
        ),
      ),
    );
  }
}
