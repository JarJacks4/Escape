import '/components/confetti_page_expert_comp_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'increase_focus_goal_model.dart';
export 'increase_focus_goal_model.dart';

class IncreaseFocusGoalWidget extends StatefulWidget {
  const IncreaseFocusGoalWidget({super.key});

  static String routeName = 'IncreaseFocusGoal';
  static String routePath = 'increaseFocusGoal';

  @override
  State<IncreaseFocusGoalWidget> createState() =>
      _IncreaseFocusGoalWidgetState();
}

class _IncreaseFocusGoalWidgetState extends State<IncreaseFocusGoalWidget> {
  late IncreaseFocusGoalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncreaseFocusGoalModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'IncreaseFocusGoal'});
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
            // ── Background GIF ───────────────────────────────────────────────
            Opacity(
              opacity: 0.7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/download_(39).gif',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // ── Content ──────────────────────────────────────────────────────
            SafeArea(
              child: Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // ── Header row with back button + title ──────────────────
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
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
                                  'INCREASE_FOCUS_GOAL_arrow_back_ICN_ON_TA');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.safePop();
                            },
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '8loqmiw2' /* Increase Focus */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'The Seasons',
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    // ── Subtitle ─────────────────────────────────────────────
                    Text(
                      FFLocalizations.of(context).getText(
                        'tuy2its7' /* Binaural Beats are brainwave s... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            lineHeight: 1.5,
                          ),
                    ),
                    // ── Spacer pushes player + button to bottom ───────────────
                    Spacer(),
                    // ── Audio Player ─────────────────────────────────────────
                    FlutterFlowAudioPlayer(
                      audio: Audio.network(
                        'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Binaural%20Cloud%20(Alpha%207%20Hz)%20-%20Syntropy.mp3?alt=media&token=68c213c6-1d70-40b1-9998-25aa64093d13',
                        metas: Metas(
                          id: 'ES_Binaural%20Cloud%20(Alpha%207%20Hz)%20-%20Syntropy.mp3?alt=media&token=68c213c6-1d70-40b1-9998-25aa64093d13-8c2813e6',
                          title: 'Binaural Cloud (Alpha 7 Hz) - Syntropy',
                        ),
                      ),
                      titleTextStyle:
                          FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: 'The Seasons',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                              ),
                      playbackDurationTextStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                      fillColor: Color(0x4ED0E3F7),
                      playbackButtonColor:
                          FlutterFlowTheme.of(context).accent1,
                      activeTrackColor: FlutterFlowTheme.of(context).accent1,
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).primary,
                      elevation: 0.0,
                      playInBackground: PlayInBackground.disabledPause,
                    ),
                    SizedBox(height: 16.0),
                    // ── Tap to Finish button ──────────────────────────────────
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'INCREASE_FOCUS_GOAL_TAP_TO_FINISH_BTN_ON');
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
                              FFAppState().pointsEarned + 150;
                          FFAppState().pointsEarnedPercentage =
                              FFAppState().pointsEarnedPercentage + 0.15;
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
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: ConfettiPageExpertCompWidget(
                                    exerciseTitle: '',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'e6ojm4vp' /* Tap to Finish */,
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
