import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'minimized_music_player_model.dart';
export 'minimized_music_player_model.dart';

class MinimizedMusicPlayerWidget extends StatefulWidget {
  const MinimizedMusicPlayerWidget({super.key});

  @override
  State<MinimizedMusicPlayerWidget> createState() =>
      _MinimizedMusicPlayerWidgetState();
}

class _MinimizedMusicPlayerWidgetState extends State<MinimizedMusicPlayerWidget>
    with TickerProviderStateMixin {
  late MinimizedMusicPlayerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinimizedMusicPlayerModel());

    animationsMap.addAll({
      'audioPlayerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
        height: 94.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: FlutterFlowAudioPlayer(
            audio: Audio.network(
              'https://filesamples.com/samples/audio/mp3/sample3.mp3',
              metas: Metas(
                id: 'sample3.mp3-1dd8b953',
              ),
            ),
            titleTextStyle: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'The Seasons',
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                ),
            playbackDurationTextStyle:
                FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'WorkSans',
                      color: FlutterFlowTheme.of(context).accent1,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
            fillColor: FlutterFlowTheme.of(context).alternate,
            playbackButtonColor: FlutterFlowTheme.of(context).accent1,
            activeTrackColor: FlutterFlowTheme.of(context).accent1,
            inactiveTrackColor: FlutterFlowTheme.of(context).secondary,
            elevation: 8.0,
            pauseOnNavigate: false,
            playInBackground: PlayInBackground.enabled,
          ).animateOnPageLoad(animationsMap['audioPlayerOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
