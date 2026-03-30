import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/help_comp_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/intro_walkthrough.dart';
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
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_version5_model.dart';
export 'home_version5_model.dart';

class HomeVersion5Widget extends StatefulWidget {
  const HomeVersion5Widget({super.key});

  static String routeName = 'HomeVersion5';
  static String routePath = 'homeVersion5';

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
      _model.createSession =
          await TheoryOfMindSessionManagementGroup.createIDCall.call();

      logFirebaseEvent('HomeVersion5_backend_call');
      _model.usersCompleteProfile =
          await TheoryOfMindOnboardingGroup.userCompleteProfileCall.call(
        userID: currentUserUid,
      );

      if (FFAppState().hasSeenOnboarding == false) {
        logFirebaseEvent('HomeVersion5_start_walkthrough');
        safeSetState(() =>
            _model.introWalkthroughController = createPageWalkthrough(context));
        _model.introWalkthroughController?.show(context: context);
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

      logFirebaseEvent('HomeVersion5_update_app_state');
      FFAppState().isFinishedIntroWalkthrough = true;
      FFAppState().chatSessionId = FFAppState().chatSessionId;
      FFAppState().update(() {});
      logFirebaseEvent('HomeVersion5_backend_call');

      await currentUserReference!.update(createUsersRecordData(
        hasSeenWalkthrough: false,
      ));
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
            child: wrapWithModel(
              model: _model.sideNavModel,
              updateCallback: () => safeSetState(() {}),
              child: SideNavWidget(),
            ),
          ),
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Stack(
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
                                      borderRadius: BorderRadius.circular(8.0),
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
                                        height: 1268.82,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x78D0E3F7),
                                              Color(0x53D0E3F7),
                                              Color(0x75FFFFFF)
                                            ],
                                            stops: [0.0, 0.5, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 20.0,
                                              sigmaY: 20.0,
                                            ),
                                            child: Container(
                                              width: 100.0,
                                              height: 381.6,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0x25EDF1F7),
                                                    Color(0x35D0E3F7),
                                                    Color(0x86FCC462)
                                                  ],
                                                  stops: [0.0, 0.5, 1.0],
                                                  begin: AlignmentDirectional(
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
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                                    width: 46.0,
                                                                    height:
                                                                        46.0,
                                                                    decoration:
                                                                        BoxDecoration(
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
                                                                              10.0,
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0x5CEDF1F7),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_VERSION5_PAGE_Icon_2pwkeyu5_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Icon_haptic_feedback');
                                                                        HapticFeedback
                                                                            .lightImpact();
                                                                        logFirebaseEvent(
                                                                            'Icon_play_sound');
                                                                        _model.soundPlayer2 ??=
                                                                            AudioPlayer();
                                                                        if (_model
                                                                            .soundPlayer2!
                                                                            .playing) {
                                                                          await _model
                                                                              .soundPlayer2!
                                                                              .stop();
                                                                        }
                                                                        _model
                                                                            .soundPlayer2!
                                                                            .setVolume(0.62);
                                                                        _model
                                                                            .soundPlayer2!
                                                                            .setAsset(
                                                                                'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                                            .then((_) =>
                                                                                _model.soundPlayer2!.play());

                                                                        logFirebaseEvent(
                                                                            'Icon_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: SideNavWidget(),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .menu_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['iconOnPageLoadAnimation']!),
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
                                                                        'assets/images/Logo_ESCAPE_White.png',
                                                                        width:
                                                                            166.1,
                                                                        height:
                                                                            52.8,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  )
                                                                      .addWalkthrough(
                                                                        image3wdxkp0v,
                                                                        _model
                                                                            .introWalkthroughController,
                                                                      )
                                                                      .animateOnPageLoad(
                                                                          animationsMap[
                                                                              'imageOnPageLoadAnimation2']!),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x5CFFFFFF),
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
                                                                          shape:
                                                                              BoxShape.circle,
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
                                                                            logFirebaseEvent('HOME_VERSION5_LottieAnimation_oiibrsns_O');
                                                                            logFirebaseEvent('LottieAnimation_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('LottieAnimation_play_sound');
                                                                            _model.soundPlayer3 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer3!.playing) {
                                                                              await _model.soundPlayer3!.stop();
                                                                            }
                                                                            _model.soundPlayer3!.setVolume(0.67);
                                                                            _model.soundPlayer3!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) =>
                                                                                _model.soundPlayer3!.play());

                                                                            logFirebaseEvent('LottieAnimation_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: HelpCompWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Lottie.asset(
                                                                            'assets/jsons/question_mark_blue.json',
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            repeat:
                                                                                false,
                                                                            animate:
                                                                                true,
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['lottieAnimationOnPageLoadAnimation']!),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        25.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'vqq0k5jr' /* Find out */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'The Seasons',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'textOnPageLoadAnimation1']!),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '0rba0up5' /* Who You Are */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'The Seasons',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'textOnPageLoadAnimation2']!),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 3.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xADFCFCFC),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            10.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
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
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0x7DEDF1F7),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                AnimatedDefaultTextStyle(
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'The Seasons',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                              duration: Duration(milliseconds: 600),
                                                                              curve: Curves.easeIn,
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  currentUserDisplayName,
                                                                                  'Escape',
                                                                                ),
                                                                                overflow: TextOverflow.fade,
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation3']!),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              '${valueOrDefault<String>(
                                                                                FFAppState().pointsEarned.toString(),
                                                                                '0',
                                                                              )} Coins',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'WorkSans',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation4']!),
                                                                            GestureDetector(
                                                                              onPanStart: (details) async {
                                                                                logFirebaseEvent('HOME_VERSION5_Container_3pfz0dsz_ON_PAN_');
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
                                                                                child: Container(
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
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 320.0,
                                                                height: 141.5,
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
                                                                      color: Color(
                                                                          0x80EDF1F7),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        0.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (valueOrDefault(currentUserDocument?.currentMood, '') !=
                                                                              '') {
                                                                        return ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.horizontal,
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
                                                                                                    'rjeksks8' /* CONTINUE YOUR JOURNEY */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: 'WorkSans',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                  overflow: TextOverflow.fade,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'npijvxvu' /* Learning Self-Care Basics */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      fontFamily: 'WorkSans',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'v8ch5p2z' /* No Time Limit */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      fontFamily: 'WorkSans',
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      letterSpacing: 0.0,
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
                                                                                              LucilleSuggestionsWidget.routeName,
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
                                                                                            '4cdgnog0' /* Continue */,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 34.99,
                                                                                            padding: EdgeInsets.all(8.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'WorkSans',
                                                                                                  color: Colors.white,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w300,
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
                                                                                                'fasprqx4' /* 50% */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    fontFamily: 'WorkSans',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 5.0,
                                                                                                    letterSpacing: 0.0,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              16.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
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
                                                                                                  '8w64lojl' /* START YOUR DAY */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: 'WorkSans',
                                                                                                      color: Color(0xC81C2444),
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w900,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex: 1,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '5qkkfkxt' /* SCAN YOUR MOOD */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'WorkSans',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex: 1,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'xq4vzcxl' /* Mood Scan Needed For 
Further ... */
                                                                                                ,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    fontFamily: 'WorkSans',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    letterSpacing: 0.0,
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
                                                                                        'ur840jdh' /* Begin */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 34.99,
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'WorkSans',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w300,
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
                                                                                ).addWalkthrough(
                                                                                  rowCrlyk2v5,
                                                                                  _model.introWalkthroughController,
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
                                                                controller: _model
                                                                    .rowController,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
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
                                                                            logFirebaseEvent('HOME_VERSION5_Container_4744k5ao_ON_TAP');
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_play_sound');
                                                                            _model.soundPlayer7 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer7!.playing) {
                                                                              await _model.soundPlayer7!.stop();
                                                                            }
                                                                            _model.soundPlayer7!.setVolume(1.0);
                                                                            _model.soundPlayer7!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) =>
                                                                                _model.soundPlayer7!.play());

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
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                36.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'y0lns6ms' /* Mind */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
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
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
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
                                                                            logFirebaseEvent('HOME_VERSION5_Container_qxoadm15_ON_TAP');
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_play_sound');
                                                                            _model.soundPlayer8 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer8!.playing) {
                                                                              await _model.soundPlayer8!.stop();
                                                                            }
                                                                            _model.soundPlayer8!.setVolume(1.0);
                                                                            _model.soundPlayer8!.setAsset('assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav').then((_) =>
                                                                                _model.soundPlayer8!.play());

                                                                            logFirebaseEvent('Container_navigate_to');

                                                                            context.pushNamed(
                                                                              JournalPageVersion5Widget.routeName,
                                                                              extra: <String, dynamic>{
                                                                                '__transition_info__': TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.rightToLeft,
                                                                                  duration: Duration(milliseconds: 2),
                                                                                ),
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                36.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 8.0, 15.0, 8.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'gx17oj58' /* Journal */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
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
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
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
                                                                            logFirebaseEvent('HOME_VERSION5_Container_42rk8lms_ON_TAP');
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_play_sound');
                                                                            _model.soundPlayer9 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer9!.playing) {
                                                                              await _model.soundPlayer9!.stop();
                                                                            }
                                                                            _model.soundPlayer9!.setVolume(1.0);
                                                                            _model.soundPlayer9!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) =>
                                                                                _model.soundPlayer9!.play());

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
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                36.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '7bt0wd1x' /* Sounds */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
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
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
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
                                                                            logFirebaseEvent('HOME_VERSION5_Container_maodsc05_ON_TAP');
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_play_sound');
                                                                            _model.soundPlayer10 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer10!.playing) {
                                                                              await _model.soundPlayer10!.stop();
                                                                            }
                                                                            _model.soundPlayer10!.setVolume(1.0);
                                                                            _model.soundPlayer10!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) =>
                                                                                _model.soundPlayer10!.play());

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
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                36.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ziauem40' /* Body */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
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
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
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
                                                                            logFirebaseEvent('HOME_VERSION5_Container_2stka764_ON_TAP');
                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Container_play_sound');
                                                                            _model.soundPlayer11 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer11!.playing) {
                                                                              await _model.soundPlayer11!.stop();
                                                                            }
                                                                            _model.soundPlayer11!.setVolume(1.0);
                                                                            _model.soundPlayer11!.setAsset('assets/audios/ES_Ding,_Complex,_Shine_-_Epidemic_Sound.mp3').then((_) =>
                                                                                _model.soundPlayer11!.play());

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
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                36.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'y3du6f80' /* Reset */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ).addWalkthrough(
                                                                rowWy6kwc96,
                                                                _model
                                                                    .introWalkthroughController,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 209.0,
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
                                                                      color: Color(
                                                                          0x17EDF1F7),
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
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary
                                                                    ],
                                                                    stops: [
                                                                      0.2,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        -1.0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xA5FFFFFF),
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.asset(
                                                                            'assets/images/Container-4.png',
                                                                          ).image,
                                                                        ),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                25.0,
                                                                            color:
                                                                                Color(0x80EDF1F7),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              20.0,
                                                                            ),
                                                                            spreadRadius:
                                                                                8.0,
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Color(0x71EDF1F7),
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
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'lgl1rbvv' /* Your Path Today */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                    fontFamily: 'WorkSans',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'l0r0is0x' /* Lucille suggests starting with... */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'WorkSans',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
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
                                                                                'xzdc284i' /* Start Suggested Session */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 50.0,
                                                                                padding: EdgeInsets.all(8.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(25.0),
                                                                              ),
                                                                            )
                                                                                .addWalkthrough(
                                                                                  buttonUkofocq2,
                                                                                  _model.introWalkthroughController,
                                                                                )
                                                                                .animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
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
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 155.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      child: Image
                                                                          .network(
                                                                        'https://images.unsplash.com/photo-1461468611824-46457c0e11fd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxicmVhdGhpbmd8ZW58MHx8fHwxNzcxMDY0MzAwfDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
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
                                                                          begin: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          end: AlignmentDirectional(
                                                                              0,
                                                                              1.0),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                    ).addWalkthrough(
                                                                      containerI9znmkfb,
                                                                      _model
                                                                          .introWalkthroughController,
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
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                AnimatedContainer(
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'l5emvdl2' /* Basic Breathing */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '4wxhx1g4' /* Begin your day with clarity an... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '38ig3w2o' /* Free-Form • 15 min */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'WorkSans',
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
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
                                                                                        'e5vi0aj4' /* Start */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 32.0,
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: Colors.white,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'WorkSans',
                                                                                              letterSpacing: 0.0,
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
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x80FFFFFF),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        8.0,
                                                                    color: Color(
                                                                        0x3CEDF1F7),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      3.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0x96EDF1F7),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '4fkxo7oo' /* Recent Activity */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.contain,
                                                                                  image: Image.asset(
                                                                                    'assets/images/morning.gif',
                                                                                  ).image,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'n7wn139l' /* Morning Meditation */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'WorkSans',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ypr02yjf' /* 15 min */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'WorkSans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(width: 12.0)),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ygf8rc4w' /* View Insight */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                              child: Icon(
                                                                                Icons.edit,
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'bq6o7te9' /* Daily Journal */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'WorkSans',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'b8mautco' /* Yesterday */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'WorkSans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(width: 12.0)),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'zm1udeyd' /* View Insight */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ).addWalkthrough(
                                                              container54qb5m7w,
                                                              _model
                                                                  .introWalkthroughController,
                                                            ),
                                                            Hero(
                                                              tag: 'logo',
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Logo_ESCAPE_DarkBlue.png',
                                                                  width: 200.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 20.0))
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
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.introWalkthroughController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
