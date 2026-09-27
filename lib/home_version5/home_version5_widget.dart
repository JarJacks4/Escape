import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/help_comp_widget.dart';
import '/components/how_are_you_feeling_assessment_comp_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/app_events/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:material_palette/material_palette.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_version5_model.dart';
export 'home_version5_model.dart';

class HomeVersion5Widget extends StatefulWidget {
  const HomeVersion5Widget({super.key});

  static String routeName = 'HomeVersion5';
  static String routePath = '/homeVersion5';

  @override
  State<HomeVersion5Widget> createState() => _HomeVersion5WidgetState();
}

class _HomeVersion5WidgetState extends State<HomeVersion5Widget>
    with TickerProviderStateMixin {
  late HomeVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomeVersion5'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_VERSION5_HomeVersion5_ON_INIT_STATE');
      if (valueOrDefault<bool>(
          currentUserDocument?.hasSeenWalkthrough, false)) {
        logFirebaseEvent('HomeVersion5_update_app_state');
        FFAppState().isFinishedIntroWalkthrough = true;
        safeSetState(() {});
      }
      logFirebaseEvent('HomeVersion5_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('HomeVersion5_play_sound');
      _model.soundPlayer1 ??= AudioPlayer();
      if (_model.soundPlayer1!.playing) {
        await _model.soundPlayer1!.stop();
      }
      _model.soundPlayer1!.setVolume(0.86);
      _model.soundPlayer1!
          .setAsset(
              'assets/audios/lucadialessandro-calm-ambient-intro-490646.mp3')
          .then((_) => _model.soundPlayer1!.play());

      logFirebaseEvent('HomeVersion5_backend_call');
      _model.usersCompleteProfile4 =
          await TheoryOfMindOnboardingGroup.userCompleteProfileCall.call(
        userID: currentUserUid,
      );

      if (FFAppState().chatSessionId != '') {
        logFirebaseEvent('HomeVersion5_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Session ID Set!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        logFirebaseEvent('HomeVersion5_hide_snack_bar');
        ScaffoldMessenger.of(context).clearSnackBars();
      } else {
        logFirebaseEvent('HomeVersion5_backend_call');
        _model.createSession =
            await TheoryOfMindSessionManagementGroup.createIDCall.call();

        logFirebaseEvent('HomeVersion5_update_app_state');
        FFAppState().chatSessionId =
            TheoryOfMindSessionManagementGroup.createIDCall.sessionID(
          (_model.createSession?.jsonBody ?? ''),
        )!;
        FFAppState().update(() {});
      }

      logFirebaseEvent('HomeVersion5_backend_call');
      _model.usersCompleteProfile =
          await TheoryOfMindOnboardingGroup.updateUserProfileCall.call(
        displayName: currentUserUid,
      );

      logFirebaseEvent('HomeVersion5_backend_call');
      _model.recommendedExercises =
          await LucilleTherapyExercisesGroup.recommendedExercisesCall.call(
        userID: currentUserUid,
        limit: 1,
      );

      logFirebaseEvent('HomeVersion5_trigger_app_event');
      FFAppEventService.instance.triggerAppEvent(
        AiRecommendationReadyEvent(
          timestamp: DateTime.now(),
          waitForCompletion: false,
          debugId: '6',
        ),
      );

      logFirebaseEvent('HomeVersion5_trigger_app_event');
      FFAppEventService.instance.triggerAppEvent(
        AiThinkingEvent(
          timestamp: DateTime.now(),
          waitForCompletion: false,
          debugId: '8',
        ),
      );

      logFirebaseEvent('HomeVersion5_trigger_app_event');
      FFAppEventService.instance.triggerAppEvent(
        SafetyAndCrisisAssessmentEvent(
          timestamp: DateTime.now(),
          waitForCompletion: true,
          debugId: '5',
        ),
      );

      if (FFAppState().isFinishedIntroWalkthrough == false) {
        logFirebaseEvent('HomeVersion5_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          hasSeenWalkthrough: true,
        ));
        logFirebaseEvent('HomeVersion5_update_app_state');
        FFAppState().isFinishedIntroWalkthrough = true;
        FFAppState().update(() {});
      } else {
        logFirebaseEvent('HomeVersion5_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please hit the help button to see the walkthrough again!',
              style: TextStyle(
                fontFamily: 'WorkSans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 14.0,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }

      if (FFAppState().lastMoodDate !=
          dateTimeFormat(
            "yMMMd",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          )) {
        logFirebaseEvent('HomeVersion5_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.95,
                    child: HowAreYouFeelingAssessmentCompWidget(),
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        logFirebaseEvent('HomeVersion5_update_app_state');
        FFAppState().lastMoodDate = dateTimeFormat(
          "yMMMd",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        );
        FFAppState().update(() {});
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 190.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 190.0.ms,
            duration: 1220.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1680.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1780.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 320.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 260.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 260.0.ms,
            duration: 280.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 260.0.ms,
            duration: 660.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 330.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 330.0.ms,
            duration: 1670.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 600.0.ms,
            color: Color(0xA3E49D20),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1370.0.ms,
            begin: Offset(3.0, 3.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 840.0.ms,
            duration: 600.0.ms,
            begin: 0.15,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeIn,
            delay: 2810.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).primary,
            angle: 0.524,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1660.0.ms,
            color: Color(0x54EDF1F7),
            angle: 0.524,
          ),
        ],
      ),
    });
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => safeSetState(() {}),
                child: SideNavWidget(),
              ),
            ),
          ),
        ),
        body: Visibility(
          visible: FFAppState().isFinishedIntroWalkthrough == false,
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 5.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.0,
                                color: Colors.white,
                                offset: Offset(
                                  0.0,
                                  8.0,
                                ),
                                spreadRadius: 20.0,
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).tertiary,
                                FlutterFlowTheme.of(context).secondary
                              ],
                              stops: [0.0, 0.2, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Stack(
                                  children: [
                                    Opacity(
                                      opacity: 0.5,
                                      child: Hero(
                                        tag: 'background',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1).gif',
                                            width: 409.6,
                                            height: 876.8,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation1']!),
                                    ),
                                    Stack(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 1295.4,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0x78D0E3F7),
                                                  Color(0x53D0E3F7),
                                                  Color(0x75FFFFFF)
                                                ],
                                                stops: [0.0, 0.5, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 15.0,
                                                  sigmaY: 15.0,
                                                ),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 413.04,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0x25EDF1F7),
                                                        Color(0x35D0E3F7),
                                                        Color(0x86BC9FE4)
                                                      ],
                                                      stops: [0.0, 0.5, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              1.0, 0.34),
                                                      end: AlignmentDirectional(
                                                          -1.0, -0.34),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            controller: _model
                                                                .columnController,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          45.0,
                                                                          15.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            46.0,
                                                                        height:
                                                                            46.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 10.0,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              offset: Offset(
                                                                                0.0,
                                                                                0.0,
                                                                              ),
                                                                              spreadRadius: 10.0,
                                                                            )
                                                                          ],
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0x5CEDF1F7),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('HOME_VERSION5_PAGE_Icon_drj17n20_ON_TAP');
                                                                            logFirebaseEvent('Icon_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Icon_play_sound');
                                                                            _model.soundPlayer2 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer2!.playing) {
                                                                              await _model.soundPlayer2!.stop();
                                                                            }
                                                                            _model.soundPlayer2!.setVolume(0.62);
                                                                            _model.soundPlayer2!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) =>
                                                                                _model.soundPlayer2!.play());

                                                                            logFirebaseEvent('Icon_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: SideNavWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.menu_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
                                                                      ),
                                                                      AnimatedShaderParams(
                                                                          params: ShaderParams(
                                                                              values: {
                                                                                'angle': 14.0,
                                                                                'scale': 1.0,
                                                                                'offset': 0.0,
                                                                                'pixelSize': 5.11,
                                                                                'edgeWidth': 0.35,
                                                                                'scatter': 0.36,
                                                                                'noiseAmount': 0.93,
                                                                                'speed': 0.7
                                                                              }),
                                                                          duration: Duration(
                                                                              milliseconds: (140.0)
                                                                                  .round()),
                                                                          curve: Curves
                                                                              .easeIn,
                                                                          builder: (params, backgroundColor) =>
                                                                              PixelDissolveShaderWrap(
                                                                                params: params,
                                                                                animationMode: ShaderAnimationMode.explicit,
                                                                                animationConfig: ShaderAnimationConfig(duration: Duration(milliseconds: (2400.0).round()), curve: Curves.easeIn, invert: true),
                                                                                child: Hero(
                                                                                  tag: 'logo',
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.asset(
                                                                                      'assets/images/Logo_ESCAPE_White.png',
                                                                                      width: 166.1,
                                                                                      height: 52.8,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                                                                              )),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x5CFFFFFF),
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 8.0,
                                                                                  color: Color(0xB2F0831A),
                                                                                  offset: Offset(
                                                                                    0.0,
                                                                                    2.0,
                                                                                  ),
                                                                                  spreadRadius: 3.0,
                                                                                )
                                                                              ],
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_VERSION5_LottieAnimation_jennylpn_O');
                                                                                logFirebaseEvent('LottieAnimation_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('LottieAnimation_play_sound');
                                                                                _model.soundPlayer3 ??= AudioPlayer();
                                                                                if (_model.soundPlayer3!.playing) {
                                                                                  await _model.soundPlayer3!.stop();
                                                                                }
                                                                                _model.soundPlayer3!.setVolume(0.67);
                                                                                _model.soundPlayer3!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer3!.play());

                                                                                logFirebaseEvent('LottieAnimation_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(context).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: HelpCompWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Lottie.asset(
                                                                                'assets/jsons/question_mark_blue.json',
                                                                                width: 200.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.contain,
                                                                                repeat: false,
                                                                                animate: true,
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['lottieAnimationOnPageLoadAnimation']!),
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            25.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '27og520d' /* Good morning */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                font: GoogleFonts.cormorantSc(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['textOnPageLoadAnimation1']!),
                                                                        AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              currentUserDisplayName,
                                                                              'Escape User',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                ),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        3.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          60.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xADFCFCFC),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                10.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              0.0,
                                                                            ),
                                                                            spreadRadius:
                                                                                3.0,
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Color(0x7DEDF1F7),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => AnimatedDefaultTextStyle(
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          font: GoogleFonts.cormorantSc(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                    duration: Duration(milliseconds: 600),
                                                                                    curve: Curves.easeIn,
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        currentUserDisplayName != '' ? currentUserDisplayName : currentUserEmail,
                                                                                        'Escape User',
                                                                                      ),
                                                                                      overflow: TextOverflow.fade,
                                                                                    ),
                                                                                  ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation3']!),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  '${valueOrDefault<String>(
                                                                                    FFAppState().pointsEarned.toString(),
                                                                                    '0',
                                                                                  )} Coins',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation4']!),
                                                                                GestureDetector(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_VERSION5_Container_gd32i09g_ON_TAP');
                                                                                    logFirebaseEvent('Container_haptic_feedback');
                                                                                    HapticFeedback.selectionClick();
                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                    context.pushNamed(
                                                                                      MarketplaceVersion5Widget.routeName,
                                                                                      extra: <String, dynamic>{
                                                                                        '__transition_info__': TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.fade,
                                                                                          duration: Duration(milliseconds: 2),
                                                                                        ),
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  onPanStart: (details) async {
                                                                                    logFirebaseEvent('HOME_VERSION5_Container_gd32i09g_ON_PAN_');
                                                                                    logFirebaseEvent('Container_haptic_feedback');
                                                                                    HapticFeedback.vibrate();
                                                                                    logFirebaseEvent('Container_play_sound');
                                                                                    _model.soundPlayer4 ??= AudioPlayer();
                                                                                    if (_model.soundPlayer4!.playing) {
                                                                                      await _model.soundPlayer4!.stop();
                                                                                    }
                                                                                    _model.soundPlayer4!.setVolume(1.0);
                                                                                    _model.soundPlayer4!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_0000-1106.wav').then((_) => _model.soundPlayer4!.play());
                                                                                                                                                                    },
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 2.0,
                                                                                    shape: const CircleBorder(),
                                                                                    child: AnimatedContainer(
                                                                                      duration: Duration(milliseconds: 100),
                                                                                      curve: Curves.easeOut,
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        image: DecorationImage(
                                                                                          fit: BoxFit.contain,
                                                                                          image: Image.asset(
                                                                                            'assets/images/coin-growing.gif',
                                                                                          ).image,
                                                                                        ),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        320.0,
                                                                    height:
                                                                        141.5,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .none,
                                                                        image: Image
                                                                            .asset(
                                                                          'assets/images/Container_(6).png',
                                                                        ).image,
                                                                      ),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              10.0,
                                                                          color:
                                                                              Color(0x80EDF1F7),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            0.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (valueOrDefault(currentUserDocument?.currentMood, '') != '') {
                                                                            return ListView(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              children: [
                                                                                Container(
                                                                                  width: 320.0,
                                                                                  height: 120.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x9BEDF1F7),
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.none,
                                                                                      image: Image.asset(
                                                                                        'assets/images/Pi-Slices.gif',
                                                                                      ).image,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'p6hb86r8' /* CONTINUE YOUR JOURNEY */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                      overflow: TextOverflow.fade,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                                          .title(
                                                                                                            (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                          )
                                                                                                          ?.contains((_model.recommendedExercises?.jsonBody ?? '').toString())
                                                                                                          .toString(),
                                                                                                      'Long Sip Breathing',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      (LucilleTherapyExercisesGroup.recommendedExercisesCall.duration(
                                                                                                                    (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                                  ) !=
                                                                                                                  null &&
                                                                                                              (LucilleTherapyExercisesGroup.recommendedExercisesCall.duration(
                                                                                                                (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                              ))!
                                                                                                                  .isNotEmpty)
                                                                                                          .toString(),
                                                                                                      '0:00',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 4.0)),
                                                                                              ),
                                                                                            ),
                                                                                            FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                logFirebaseEvent('HOME_VERSION5_PAGE_CONTINUE_BTN_ON_TAP');
                                                                                                logFirebaseEvent('Button_haptic_feedback');
                                                                                                HapticFeedback.heavyImpact();
                                                                                                logFirebaseEvent('Button_play_sound');
                                                                                                _model.soundPlayer5 ??= AudioPlayer();
                                                                                                if (_model.soundPlayer5!.playing) {
                                                                                                  await _model.soundPlayer5!.stop();
                                                                                                }
                                                                                                _model.soundPlayer5!.setVolume(1.0);
                                                                                                _model.soundPlayer5!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_0000-1106.wav').then((_) => _model.soundPlayer5!.play());

                                                                                                logFirebaseEvent('Button_navigate_to');

                                                                                                context.pushNamed(
                                                                                                  LucilleSuggestionPageWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'exerciseTitle': serializeParam(
                                                                                                      (LucilleTherapyExercisesGroup.recommendedExercisesCall.title(
                                                                                                                    (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                                  ) !=
                                                                                                                  null &&
                                                                                                              (LucilleTherapyExercisesGroup.recommendedExercisesCall.title(
                                                                                                                (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                              ))!
                                                                                                                  .isNotEmpty)
                                                                                                          .toString(),
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'exerciseDescription': serializeParam(
                                                                                                      (LucilleTherapyExercisesGroup.recommendedExercisesCall.description(
                                                                                                                    (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                                  ) !=
                                                                                                                  null &&
                                                                                                              (LucilleTherapyExercisesGroup.recommendedExercisesCall.description(
                                                                                                                (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                              ))!
                                                                                                                  .isNotEmpty)
                                                                                                          .toString(),
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'exerciseDuration': serializeParam(
                                                                                                      LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                                          .duration(
                                                                                                            (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                          )
                                                                                                          ?.firstOrNull
                                                                                                          ?.toDouble(),
                                                                                                      ParamType.double,
                                                                                                    ),
                                                                                                    'exersiseSoundscape': serializeParam(
                                                                                                      LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                                          .recommendations(
                                                                                                            (_model.recommendedExercises?.jsonBody ?? ''),
                                                                                                          )
                                                                                                          ?.firstOrNull
                                                                                                          ?.toString(),
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    '__transition_info__': TransitionInfo(
                                                                                                      hasTransition: true,
                                                                                                      transitionType: PageTransitionType.fade,
                                                                                                      duration: Duration(milliseconds: 9),
                                                                                                    ),
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                '7k0f5unj' /* Continue */,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                height: 34.99,
                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w300,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: Colors.white,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x39D0E3F7),
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 4.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(2.0),
                                                                                            ),
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.6,
                                                                                              height: 4.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                                              ),
                                                                                              child: LinearPercentIndicator(
                                                                                                percent: FFAppState().pointsEarned.toDouble(),
                                                                                                width: 120.0,
                                                                                                lineHeight: 12.0,
                                                                                                animation: true,
                                                                                                animateFromLastPercent: true,
                                                                                                progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                center: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'ojsjxkwn' /* 50% */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 5.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                      ),
                                                                                                  overflow: TextOverflow.fade,
                                                                                                ),
                                                                                                padding: EdgeInsets.zero,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 8.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          } else {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Flexible(
                                                                                    flex: 1,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                flex: 1,
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'hkgkwduq' /* START YOUR DAY */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.w900,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: Color(0xC81C2444),
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w900,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                flex: 1,
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'n2rcgxnj' /* SCAN YOUR MOOD */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                flex: 1,
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'ehlqwtzh' /* Mood Scan Needed For 
Further ... */
                                                                                                    ,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            logFirebaseEvent('HOME_VERSION5_PAGE_BEGIN_BTN_ON_TAP');
                                                                                            logFirebaseEvent('Button_haptic_feedback');
                                                                                            HapticFeedback.mediumImpact();
                                                                                            logFirebaseEvent('Button_play_sound');
                                                                                            _model.soundPlayer6 ??= AudioPlayer();
                                                                                            if (_model.soundPlayer6!.playing) {
                                                                                              await _model.soundPlayer6!.stop();
                                                                                            }
                                                                                            _model.soundPlayer6!.setVolume(1.0);
                                                                                            _model.soundPlayer6!.setAsset('assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav').then((_) => _model.soundPlayer6!.play());

                                                                                            logFirebaseEvent('Button_navigate_to');

                                                                                            context.pushNamed(
                                                                                              MoodScanVersion5Widget.routeName,
                                                                                              extra: <String, dynamic>{
                                                                                                '__transition_info__': TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                  duration: Duration(milliseconds: 9),
                                                                                                ),
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            '588cgmfz' /* Begin */,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 34.99,
                                                                                            padding: EdgeInsets.all(8.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w300,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                            elevation: 2.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x39D0E3F7),
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                            hoverColor: FlutterFlowTheme.of(context).tertiary,
                                                                                            hoverBorderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                            hoverElevation: 3.0,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 8.0)),
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_VERSION5_Container_brmwkxh4_ON_TAP');
                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('Container_play_sound');
                                                                                _model.soundPlayer7 ??= AudioPlayer();
                                                                                if (_model.soundPlayer7!.playing) {
                                                                                  await _model.soundPlayer7!.stop();
                                                                                }
                                                                                _model.soundPlayer7!.setVolume(1.0);
                                                                                _model.soundPlayer7!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer7!.play());

                                                                                logFirebaseEvent('Container_navigate_to');

                                                                                context.pushNamed(
                                                                                  MindPageWidget.routeName,
                                                                                  extra: <String, dynamic>{
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.rightToLeft,
                                                                                      duration: Duration(milliseconds: 1),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                height: 36.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.none,
                                                                                    image: Image.asset(
                                                                                      'assets/images/Button-7.png',
                                                                                    ).image,
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 8.0,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        0.0,
                                                                                      ),
                                                                                      spreadRadius: 3.0,
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'nhgsp43h' /* Mind */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_VERSION5_Container_aar85ucx_ON_TAP');
                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('Container_play_sound');
                                                                                _model.soundPlayer8 ??= AudioPlayer();
                                                                                if (_model.soundPlayer8!.playing) {
                                                                                  await _model.soundPlayer8!.stop();
                                                                                }
                                                                                _model.soundPlayer8!.setVolume(1.0);
                                                                                _model.soundPlayer8!.setAsset('assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav').then((_) => _model.soundPlayer8!.play());

                                                                                logFirebaseEvent('Container_navigate_to');

                                                                                context.pushNamed(
                                                                                  HealthJournalWidget.routeName,
                                                                                  extra: <String, dynamic>{
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.fade,
                                                                                      duration: Duration(milliseconds: 2),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                height: 36.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.none,
                                                                                    image: Image.asset(
                                                                                      'assets/images/Button-6.png',
                                                                                    ).image,
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 8.0,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        2.0,
                                                                                      ),
                                                                                      spreadRadius: 3.0,
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 8.0, 15.0, 8.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'qn4z89eg' /* Journal */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_VERSION5_Container_562cnbmv_ON_TAP');
                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('Container_play_sound');
                                                                                _model.soundPlayer9 ??= AudioPlayer();
                                                                                if (_model.soundPlayer9!.playing) {
                                                                                  await _model.soundPlayer9!.stop();
                                                                                }
                                                                                _model.soundPlayer9!.setVolume(1.0);
                                                                                _model.soundPlayer9!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer9!.play());

                                                                                logFirebaseEvent('Container_navigate_to');

                                                                                context.pushNamed(
                                                                                  AISoundscapesCopyCopyCopyWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'meditationaudio': serializeParam(
                                                                                      '',
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.fade,
                                                                                      duration: Duration(milliseconds: 0),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                height: 36.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.cover,
                                                                                    image: Image.asset(
                                                                                      'assets/images/Reset_All_Tab_(1).png',
                                                                                    ).image,
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 8.0,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        2.0,
                                                                                      ),
                                                                                      spreadRadius: 3.0,
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '6c25oqq8' /* Sounds */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_VERSION5_Container_jzx13ak2_ON_TAP');
                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('Container_play_sound');
                                                                                _model.soundPlayer10 ??= AudioPlayer();
                                                                                if (_model.soundPlayer10!.playing) {
                                                                                  await _model.soundPlayer10!.stop();
                                                                                }
                                                                                _model.soundPlayer10!.setVolume(1.0);
                                                                                _model.soundPlayer10!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer10!.play());

                                                                                logFirebaseEvent('Container_navigate_to');

                                                                                context.pushNamed(
                                                                                  BodyPageVersion5Widget.routeName,
                                                                                  extra: <String, dynamic>{
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.rightToLeft,
                                                                                      duration: Duration(milliseconds: 1),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                height: 36.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.none,
                                                                                    image: Image.asset(
                                                                                      'assets/images/Button-5.png',
                                                                                    ).image,
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 8.0,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        2.0,
                                                                                      ),
                                                                                      spreadRadius: 3.0,
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'wsg5k7lw' /* Body */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                8.0,
                                                                                8.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_VERSION5_Container_k476ktw5_ON_TAP');
                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                HapticFeedback.lightImpact();
                                                                                logFirebaseEvent('Container_play_sound');
                                                                                _model.soundPlayer11 ??= AudioPlayer();
                                                                                if (_model.soundPlayer11!.playing) {
                                                                                  await _model.soundPlayer11!.stop();
                                                                                }
                                                                                _model.soundPlayer11!.setVolume(1.0);
                                                                                _model.soundPlayer11!.setAsset('assets/audios/ES_Ding,_Complex,_Shine_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer11!.play());

                                                                                logFirebaseEvent('Container_navigate_to');

                                                                                context.pushNamed(
                                                                                  ResetPageCopyWidget.routeName,
                                                                                  extra: <String, dynamic>{
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.rightToLeft,
                                                                                      duration: Duration(milliseconds: 1),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                height: 36.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.none,
                                                                                    image: Image.asset(
                                                                                      'assets/images/Button-7.png',
                                                                                    ).image,
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 8.0,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        2.0,
                                                                                      ),
                                                                                      spreadRadius: 3.0,
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'p9axl0bz' /* Reset */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 12.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        209.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image: Image
                                                                            .asset(
                                                                          'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1).gif',
                                                                        ).image,
                                                                      ),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              8.0,
                                                                          color:
                                                                              Color(0x17EDF1F7),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            3.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Color(
                                                                              0xFFE1AAEE),
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary
                                                                        ],
                                                                        stops: [
                                                                          0.2,
                                                                          1.0
                                                                        ],
                                                                        begin: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        end: AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xA5FFFFFF),
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: Image.asset(
                                                                                'assets/images/Container-4.png',
                                                                              ).image,
                                                                            ),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 25.0,
                                                                                color: Color(0x80EDF1F7),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  20.0,
                                                                                ),
                                                                                spreadRadius: 8.0,
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0x71EDF1F7),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                16.0,
                                                                                16.0,
                                                                                16.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  flex: 1,
                                                                                  child: Text(
                                                                                    'Your Path ${dateTimeFormat(
                                                                                      "MMMEd",
                                                                                      getCurrentTimestamp,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.cormorantSc(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                    overflow: TextOverflow.fade,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'hfpfxcj5' /* Lucille suggests starting with... */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('HOME_VERSION5_START_SUGGESTED_SESSION_BT');
                                                                                    logFirebaseEvent('Button_haptic_feedback');
                                                                                    HapticFeedback.lightImpact();
                                                                                    logFirebaseEvent('Button_play_sound');
                                                                                    _model.soundPlayer12 ??= AudioPlayer();
                                                                                    if (_model.soundPlayer12!.playing) {
                                                                                      await _model.soundPlayer12!.stop();
                                                                                    }
                                                                                    _model.soundPlayer12!.setVolume(1.0);
                                                                                    _model.soundPlayer12!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer12!.play());

                                                                                    logFirebaseEvent('Button_navigate_to');

                                                                                    context.pushNamed(
                                                                                      LucilleSuggestionSplashPageWidget.routeName,
                                                                                      extra: <String, dynamic>{
                                                                                        '__transition_info__': TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.fade,
                                                                                          duration: Duration(milliseconds: 0),
                                                                                        ),
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'jlkefbdk' /* Start Suggested Session */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 50.0,
                                                                                    padding: EdgeInsets.all(8.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).accent3,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderRadius: BorderRadius.circular(25.0),
                                                                                  ),
                                                                                ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
                                                                              ].divide(SizedBox(height: 16.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        155.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          child:
                                                                              Image.network(
                                                                            'https://images.unsplash.com/photo-1461468611824-46457c0e11fd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxicmVhdGhpbmd8ZW58MHx8fHwxNzcxMDY0MzAwfDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0x59000000),
                                                                                Color(0xD6000000)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                              end: AlignmentDirectional(0, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              16.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: AnimatedContainer(
                                                                                  duration: Duration(milliseconds: 800),
                                                                                  curve: Curves.easeIn,
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: Image.asset(
                                                                                        'assets/images/fire.gif',
                                                                                      ).image,
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'tv8a2pgb' /* Basic Breathing */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.cormorantSc(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '1181bxrb' /* Begin your day with clarity an... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'xf2x6iu6' /* Free-Form • 15 min */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Flexible(
                                                                                        flex: 1,
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            logFirebaseEvent('HOME_VERSION5_PAGE_START_BTN_ON_TAP');
                                                                                            logFirebaseEvent('Button_haptic_feedback');
                                                                                            HapticFeedback.lightImpact();
                                                                                            logFirebaseEvent('Button_play_sound');
                                                                                            _model.soundPlayer13 ??= AudioPlayer();
                                                                                            if (_model.soundPlayer13!.playing) {
                                                                                              await _model.soundPlayer13!.stop();
                                                                                            }
                                                                                            _model.soundPlayer13!.setVolume(0.62);
                                                                                            _model.soundPlayer13!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer13!.play());

                                                                                            logFirebaseEvent('Button_navigate_to');

                                                                                            context.pushNamed(
                                                                                              BasicBreathingGoalPageWidget.routeName,
                                                                                              extra: <String, dynamic>{
                                                                                                '__transition_info__': TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                  duration: Duration(milliseconds: 2),
                                                                                                ),
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'nl7h1gzt' /* Start */,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 32.0,
                                                                                            padding: EdgeInsets.all(8.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: Colors.white,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(height: 8.0)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Hero(
                                                                  tag: 'logo',
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Logo_ESCAPE_DarkBlue.png',
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          20.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          20.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation1']!),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (FFAppState().isFinishedIntroWalkthrough == false)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.WalkthroughOverlay(
                    width: double.infinity,
                    height: double.infinity,
                    onFinish: () async {
                      logFirebaseEvent(
                          'HOME_VERSION5_Container_aa693ush_CALLBAC');
                      logFirebaseEvent('WalkthroughOverlay_update_app_state');
                      FFAppState().isFinishedIntroWalkthrough = true;
                      FFAppState().hasSeenOnboarding = true;
                      safeSetState(() {});
                      logFirebaseEvent('WalkthroughOverlay_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        hasSeenWalkthrough: true,
                      ));
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
