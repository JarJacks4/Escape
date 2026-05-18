import '/components/confetti_page_expert_comp_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'thunderstroms_and_transformation_goal_model.dart';
export 'thunderstroms_and_transformation_goal_model.dart';

class ThunderstromsAndTransformationGoalWidget extends StatefulWidget {
  const ThunderstromsAndTransformationGoalWidget({super.key});

  static String routeName = 'ThunderstromsAndTransformationGoal';
  static String routePath = '/thunderstromsAndTransformationGoal';

  @override
  State<ThunderstromsAndTransformationGoalWidget> createState() =>
      _ThunderstromsAndTransformationGoalWidgetState();
}

class _ThunderstromsAndTransformationGoalWidgetState
    extends State<ThunderstromsAndTransformationGoalWidget> {
  late ThunderstromsAndTransformationGoalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ThunderstromsAndTransformationGoalModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThunderstromsAndTransformationGoal'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Opacity(
              opacity: 0.7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Heavy_Thunderstorm_Sounds___Relaxing_Rain,_Thunder_&_Lightning_Ambience_for_Sleep___HD_Nature_Video.gif',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'nrngtfd4' /* Thunderstorms and Transformati... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'The Seasons',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'bits9a86' /* Take a listen to the thudersto... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 6.0)),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'THUNDERSTROMS_AND_TRANSFORMATION_GOAL_ar');
                                  logFirebaseEvent('IconButton_navigate_back');
                                  context.safePop();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 300.0, 0.0, 8.0),
                      child: FlutterFlowAudioPlayer(
                        audio: Audio.network(
                          'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/rain-and-thunder-321270.mp3?alt=media&token=5edecf79-5db6-4158-8da6-6b43ee047617',
                          metas: Metas(
                            id: 'rain-and-thunder-321270.mp3?alt=media&token=5edecf79-5db6-4158-8da6-6b43ee047617-1dbb3cae',
                            title: 'Rain and Thunder Soundscape',
                          ),
                        ),
                        titleTextStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'The Seasons',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        playbackDurationTextStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).accent1,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        fillColor: Color(0x641C2444),
                        playbackButtonColor: Color(0xBBF0831A),
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).primary,
                        elevation: 0.0,
                        playInBackground: PlayInBackground.disabledPause,
                      ),
                    ),
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'THUNDERSTROMS_AND_TRANSFORMATION_GOAL_TA');
                          logFirebaseEvent('Button_haptic_feedback');
                          HapticFeedback.vibrate();
                          logFirebaseEvent('Button_play_sound');
                          _model.soundPlayer ??= AudioPlayer();
                          if (_model.soundPlayer!.playing) {
                            await _model.soundPlayer!.stop();
                          }
                          _model.soundPlayer!.setVolume(0.76);
                          await _model.soundPlayer!
                              .setAsset(
                                  'assets/audios/ES_Achievement,_Level_Up,_Notification,_Goal_Achieved,_Positive_06_-_Epidemic_Sound.mp3')
                              .then((_) => _model.soundPlayer!.play());

                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().pointsEarned =
                              FFAppState().pointsEarned + 50;
                          FFAppState().pointsEarnedPercentage =
                              FFAppState().pointsEarnedPercentage + 0.05;
                          safeSetState(() {});
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            barrierColor: Color(0xC7000000),
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: ConfettiPageExpertCompWidget(
                                      exerciseTitle: 'Thunderstorms Meditation',
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'pcr7gwf4' /* Tap to Finish */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 49.4,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).accent1,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
