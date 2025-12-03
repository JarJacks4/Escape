import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'that_mini_audio_player_model.dart';
export 'that_mini_audio_player_model.dart';

class ThatMiniAudioPlayerWidget extends StatefulWidget {
  const ThatMiniAudioPlayerWidget({super.key});

  @override
  State<ThatMiniAudioPlayerWidget> createState() =>
      _ThatMiniAudioPlayerWidgetState();
}

class _ThatMiniAudioPlayerWidgetState extends State<ThatMiniAudioPlayerWidget> {
  late ThatMiniAudioPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThatMiniAudioPlayerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.network(
                          FFAppState().currentMedia.mediaBanner,
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          FFAppState().currentMedia.mediaTitle,
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().isThatAudioPlayerPlaying)
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.pause_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await actions.pauseAudio();
                        },
                      ),
                    if (!FFAppState().isThatAudioPlayerPlaying)
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await actions.playAudio();
                        },
                      ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await actions.pauseAudio();
                        FFAppState().isMiniPlayerVisible = false;
                        FFAppState().update(() {});
                      },
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ],
          ),
          LinearPercentIndicator(
            percent: FFAppState().currentPositionOfAudioInSeconds /
                FFAppState().totalDurationOfAudioInSeconds,
            lineHeight: 2.0,
            animation: false,
            animateFromLastPercent: true,
            progressColor: FlutterFlowTheme.of(context).primary,
            backgroundColor: FlutterFlowTheme.of(context).accent4,
            barRadius: Radius.circular(12.0),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
