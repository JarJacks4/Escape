import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'soundscapes_starter_page_version5_copy_copy_model.dart';
export 'soundscapes_starter_page_version5_copy_copy_model.dart';

/// New Component Gen
class SoundscapesStarterPageVersion5CopyCopyWidget extends StatefulWidget {
  const SoundscapesStarterPageVersion5CopyCopyWidget({super.key});

  @override
  State<SoundscapesStarterPageVersion5CopyCopyWidget> createState() =>
      _SoundscapesStarterPageVersion5CopyCopyWidgetState();
}

class _SoundscapesStarterPageVersion5CopyCopyWidgetState
    extends State<SoundscapesStarterPageVersion5CopyCopyWidget> {
  late SoundscapesStarterPageVersion5CopyCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => SoundscapesStarterPageVersion5CopyCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.863,
                height: 228.4,
                decoration: BoxDecoration(),
                child: Lottie.asset(
                  'assets/jsons/Animation_-_1708891000222.json',
                  width: 200.0,
                  height: 182.08,
                  fit: BoxFit.contain,
                  animate: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      't413xrh9' /* Find Yourself Within Vibration... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'The Seasons',
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                '7ntv8hi2' /* Begin your first steps with ou... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'WorkSans',
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'SOUNDSCAPES_STARTER_VERSION5_COPY_COPY_I');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.lightImpact();
                      logFirebaseEvent('Button_play_sound');
                      _model.soundPlayer1 ??= AudioPlayer();
                      if (_model.soundPlayer1!.playing) {
                        await _model.soundPlayer1!.stop();
                      }
                      _model.soundPlayer1!.setVolume(1.0);
                      _model.soundPlayer1!
                          .setAsset(
                              'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                          .then((_) => _model.soundPlayer1!.play());

                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().isFirstTimeUserSoundscapes = false;
                      FFAppState().update(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'on35dlh5' /* Immerse Yourself In Vibration */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily: 'WorkSans',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'SOUNDSCAPES_STARTER_VERSION5_COPY_COPY_S');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.mediumImpact();
                      logFirebaseEvent('Button_play_sound');
                      _model.soundPlayer2 ??= AudioPlayer();
                      if (_model.soundPlayer2!.playing) {
                        await _model.soundPlayer2!.stop();
                      }
                      _model.soundPlayer2!.setVolume(1.0);
                      _model.soundPlayer2!
                          .setAsset(
                              'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                          .then((_) => _model.soundPlayer2!.play());

                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        HomeVersion5Widget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 1),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'fpeb9glb' /* Solo First */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.white,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Color(0x5B5A5C60),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Hero(
                tag: 'LucilleLogo',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Logo_ESCAPE_White.png',
                    width: 200.0,
                    height: 47.46,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
