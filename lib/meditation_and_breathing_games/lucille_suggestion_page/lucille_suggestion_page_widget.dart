import '/backend/api_requests/api_calls.dart';
import '/components/confetti_page_expert_comp_widget.dart';
import '/components/exercise_assessment_bottom_sheet_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lucille_suggestion_page_model.dart';
export 'lucille_suggestion_page_model.dart';

class LucilleSuggestionPageWidget extends StatefulWidget {
  const LucilleSuggestionPageWidget({
    super.key,
    this.exerciseTitle,
    this.exerciseDescription,
    this.exerciseDuration,
    this.exersiseSoundscape,
  });

  final String? exerciseTitle;
  final String? exerciseDescription;
  final double? exerciseDuration;
  final String? exersiseSoundscape;

  static String routeName = 'LucilleSuggestionPage';
  static String routePath = '/lucilleSuggestionPage';

  @override
  State<LucilleSuggestionPageWidget> createState() =>
      _LucilleSuggestionPageWidgetState();
}

class _LucilleSuggestionPageWidgetState
    extends State<LucilleSuggestionPageWidget> with TickerProviderStateMixin {
  late LucilleSuggestionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleSuggestionPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LucilleSuggestionPage'});
    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
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
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 14000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(6.0, 6.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: LucilleTherapyExercisesGroup.getExerciseDetailCall.call(
        exerciseID: FFAppState().exerciseID,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: SpinKitWave(
                  color: FlutterFlowTheme.of(context).accent1,
                  size: 100.0,
                ),
              ),
            ),
          );
        }
        final lucilleSuggestionPageGetExerciseDetailResponse = snapshot.data!;

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
                  opacity: 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/dbc134076bdc297451e61e49a8caec19.gif',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 402.1,
                  height: 876.36,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 40.0,
                        sigmaY: 40.0,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.exerciseTitle,
                                                'Stress and Anxiety Relief',
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'The Seasons',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.exerciseDescription,
                                                'Binaural Beats are brainwave sounds used to help occasions like overthinking and loss off groundedness. Tap Finish when done!',
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 1.5,
                                                      ),
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 6.0)),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 15.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'LUCILLE_SUGGESTION_arrow_back_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_navigate_back');
                                            context.safePop();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 8.0,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 300.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF76399F),
                                          FlutterFlowTheme.of(context).tertiary,
                                          Color(0xFF673AB7)
                                        ],
                                        stops: [0.0, 1.0, 1.0],
                                        begin: AlignmentDirectional(1.0, -0.64),
                                        end: AlignmentDirectional(-1.0, 0.64),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Stack(
                                      children: [
                                        Lottie.asset(
                                          'assets/jsons/ai_animation_Flow_1.json',
                                          width: 304.0,
                                          height: 317.1,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                        Container(
                                          width: 298.29,
                                          height: 298.29,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 80.0,
                                                color: Color(0xBDEDF1F7),
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 20.0,
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 20.0,
                                                sigmaY: 20.0,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 3.0,
                                                        shape:
                                                            const CircleBorder(),
                                                        child: Container(
                                                          width: 63.1,
                                                          height: 63.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xA5EDF1F7),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    10.0,
                                                                color: Color(
                                                                    0xC3EDF1F7),
                                                                offset: Offset(
                                                                  0.0,
                                                                  0.0,
                                                                ),
                                                                spreadRadius:
                                                                    10.0,
                                                              )
                                                            ],
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x5FEDF1F7),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation']!),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FlutterFlowTimer(
                                                        initialTime: _model
                                                            .timerInitialTimeMs,
                                                        getDisplayTime: (value) =>
                                                            StopWatchTimer
                                                                .getDisplayTime(
                                                          value,
                                                          hours: false,
                                                          minute: false,
                                                          milliSecond: false,
                                                        ),
                                                        controller: _model
                                                            .timerController,
                                                        updateStateInterval:
                                                            Duration(
                                                                milliseconds:
                                                                    7),
                                                        onChanged: (value,
                                                            displayTime,
                                                            shouldUpdate) {
                                                          _model.timerMilliseconds =
                                                              value;
                                                          _model.timerValue =
                                                              displayTime;
                                                          if (shouldUpdate)
                                                            safeSetState(() {});
                                                        },
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      28.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap[
                                                    'stackOnPageLoadAnimation']!),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (widget.exersiseSoundscape == null ||
                                      widget.exersiseSoundscape == ''
                                  ? false
                                  : true)
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: FlutterFlowAudioPlayer(
                                      audio: Audio.network(
                                        FFAppState()
                                            .SoundscapesAllTab
                                            .firstOrNull!
                                            .songUrl,
                                        metas: Metas(
                                          title: valueOrDefault<String>(
                                            that_audio_player_oo85ab_app_state
                                                    .FFAppState()
                                                .currentMediaAllTab
                                                .firstOrNull
                                                ?.mediaTitle,
                                            'Title',
                                          ),
                                        ),
                                      ),
                                      titleTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'The Seasons',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                              ),
                                      playbackDurationTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                        fontFamily: 'WorkSans',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        letterSpacing: 0.0,
                                        shadows: [
                                          Shadow(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 8.0,
                                          )
                                        ],
                                      ),
                                      fillColor: Color(0x4ED0E3F7),
                                      playbackButtonColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      elevation: 0.0,
                                      playInBackground:
                                          PlayInBackground.disabledPause,
                                    ),
                                  ),
                                ),
                              Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'LUCILLE_SUGGESTION_TAP_TO_FINISH_BTN_ON_');
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
                                        .then(
                                            (_) => _model.soundPlayer!.play());

                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().pointsEarned =
                                        FFAppState().pointsEarned + 150;
                                    FFAppState().pointsEarnedPercentage =
                                        FFAppState().pointsEarnedPercentage +
                                            0.15;
                                    safeSetState(() {});
                                    logFirebaseEvent('Button_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  ExerciseAssessmentBottomSheetCopyWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    logFirebaseEvent('Button_backend_call');
                                    _model.memory = await LucilleMemoriesGroup
                                        .createMemoryCall
                                        .call(
                                      content:
                                          lucilleSuggestionPageGetExerciseDetailResponse
                                              .jsonBody
                                              .toString(),
                                      memoryType: 'Episodic',
                                      importance: 5,
                                    );

                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      barrierColor: Color(0xC7000000),
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child:
                                                  ConfettiPageExpertCompWidget(
                                                exerciseTitle: '',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'cmatewob' /* Tap to Finish */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 49.4,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).accent1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
