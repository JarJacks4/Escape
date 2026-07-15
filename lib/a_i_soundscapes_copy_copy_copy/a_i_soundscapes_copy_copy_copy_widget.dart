import '/auth/firebase_auth/auth_util.dart';
import '/components/lucille_soundscape_suggestion_widget.dart';
import '/components/soundscapes_starter_page_version5_copy_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import "package:that_audio_player_oo85ab/flutter_flow/nav/serialization_util.dart"
    as that_audio_player_oo85ab_serialization_util;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:that_audio_player_oo85ab/custom_code/actions/index.dart'
    as that_audio_player_oo85ab_actions;
import 'package:that_audio_player_oo85ab/index.dart'
    as $that_audio_player_oo85ab;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'a_i_soundscapes_copy_copy_copy_model.dart';
export 'a_i_soundscapes_copy_copy_copy_model.dart';

class AISoundscapesCopyCopyCopyWidget extends StatefulWidget {
  const AISoundscapesCopyCopyCopyWidget({
    super.key,
    String? meditationaudio,
  }) : this.meditationaudio = meditationaudio ??
            'https://www.youtube.com/watch?v=u3papaX85MA&list=PLyC3pcUWmqsTfH2-BQQ4PfuS7NjxcFa9v&index=4';

  final String meditationaudio;

  static String routeName = 'AISoundscapesCopyCopyCopy';
  static String routePath = '/aISoundscapesCopyCopyCopy';

  @override
  State<AISoundscapesCopyCopyCopyWidget> createState() =>
      _AISoundscapesCopyCopyCopyWidgetState();
}

class _AISoundscapesCopyCopyCopyWidgetState
    extends State<AISoundscapesCopyCopyCopyWidget>
    with TickerProviderStateMixin {
  late AISoundscapesCopyCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AISoundscapesCopyCopyCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AISoundscapesCopyCopyCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_AISoundsc');
      logFirebaseEvent('AISoundscapesCopyCopyCopy_update_app_sta');
      FFAppState().isAllTab = true;
      safeSetState(() {});
      if (FFAppState().isFirstTimeUserSoundscapes) {
        logFirebaseEvent('AISoundscapesCopyCopyCopy_haptic_feedbac');
        HapticFeedback.vibrate();
        logFirebaseEvent('AISoundscapesCopyCopyCopy_bottom_sheet');
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
                  child: SoundscapesStarterPageVersion5CopyCopyWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      } else {
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController!.indexIsChanging) {
          return;
        }

        logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_TabBar_l2');
        logFirebaseEvent('TabBar_haptic_feedback');
        HapticFeedback.lightImpact();
        logFirebaseEvent('TabBar_play_sound');
        _model.soundPlayer2 ??= AudioPlayer();
        if (_model.soundPlayer2!.playing) {
          await _model.soundPlayer2!.stop();
        }
        _model.soundPlayer2!.setVolume(0.73);
        _model.soundPlayer2!
            .setAsset(
                'assets/audios/ES_Futuristic_Technology,_UI_Confirm_Tone,_Bright_02_-_Epidemic_Sound_-_3410-4218.wav')
            .then((_) => _model.soundPlayer2!.play());
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
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 190.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 190.0.ms,
            duration: 1740.0.ms,
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
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1710.0.ms,
            color: FlutterFlowTheme.of(context).primary,
            angle: 0.524,
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 990.0.ms,
            duration: 1240.0.ms,
            begin: 0.06,
            end: 1.11,
          ),
        ],
      ),
      'tabBarOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 850.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 990.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'tabOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 220.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 220.0.ms,
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
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _model.columnController1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Hero(
                          tag: () {
                            if (FFAppState().isAllTab) {
                              return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)%20(2).gif?alt=media&token=373daaa0-a029-49d1-9c24-b59c6d69e0d9';
                            } else if (FFAppState().isMusicMeditationsTab) {
                              return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2Fe085865feb0fb5cd989c30fa6b384526.gif?alt=media&token=adf4bee7-8bca-4508-b01a-9dfe15967736';
                            } else if (FFAppState().isNatureTab) {
                              return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2Fdownload_(26)%20(1).gif?alt=media&token=77372ba9-5080-46ce-95fd-dbc17982ec56';
                            } else if (FFAppState().isFocusTab) {
                              return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2Fe085865feb0fb5cd989c30fa6b384526.gif?alt=media&token=adf4bee7-8bca-4508-b01a-9dfe15967736';
                            } else if (FFAppState().isSleepTab) {
                              return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F90ac6093fb40e1d7398371b1d61a4e4a.gif?alt=media&token=3351172e-47e6-40e2-9ed4-fb4d549c64f5';
                            } else {
                              return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F89779ebdad6cda0831f05a306eebf7cd.gif?alt=media&token=fd2b83e9-a9a0-48a0-80e1-ddb769e137ee';
                            }
                          }(),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 2000),
                              fadeOutDuration: Duration(milliseconds: 2000),
                              imageUrl: () {
                                if (FFAppState().isAllTab) {
                                  return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)%20(2).gif?alt=media&token=373daaa0-a029-49d1-9c24-b59c6d69e0d9';
                                } else if (FFAppState().isMusicMeditationsTab) {
                                  return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2Fe085865feb0fb5cd989c30fa6b384526.gif?alt=media&token=adf4bee7-8bca-4508-b01a-9dfe15967736';
                                } else if (FFAppState().isNatureTab) {
                                  return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2Fdownload_(26)%20(1).gif?alt=media&token=77372ba9-5080-46ce-95fd-dbc17982ec56';
                                } else if (FFAppState().isFocusTab) {
                                  return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2Fe085865feb0fb5cd989c30fa6b384526.gif?alt=media&token=adf4bee7-8bca-4508-b01a-9dfe15967736';
                                } else if (FFAppState().isSleepTab) {
                                  return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F90ac6093fb40e1d7398371b1d61a4e4a.gif?alt=media&token=3351172e-47e6-40e2-9ed4-fb4d549c64f5';
                                } else {
                                  return 'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F89779ebdad6cda0831f05a306eebf7cd.gif?alt=media&token=fd2b83e9-a9a0-48a0-80e1-ddb769e137ee';
                                }
                              }(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation1']!),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1165.6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xF4673AB7),
                              Color(0x8A39519F),
                              Color(0x87673AB7)
                            ],
                            stops: [0.0, 0.5, 1.0],
                            begin: AlignmentDirectional(1.0, -0.98),
                            end: AlignmentDirectional(-1.0, 0.98),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 40.0,
                              sigmaY: 40.0,
                            ),
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  controller: _model.columnController2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Stack(
                                          children: [
                                            Opacity(
                                              opacity: 0.5,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/89779ebdad6cda0831f05a306eebf7cd_(1).gif',
                                                  width: double.infinity,
                                                  height: 1165.6,
                                                  fit: BoxFit.cover,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'imageOnPageLoadAnimation2']!),
                                            ),
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 30.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(context).height,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0x43D0E3F7),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 25.0, 5.0, 25.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            25.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'u5sztrh8' /* Good Morning */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineLarge
                                                                              .override(
                                                                                fontFamily: 'The Seasons',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            currentUserDisplayName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'WorkSans',
                                                                                  color: Colors.black,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          5.0,
                                                                      shape:
                                                                          const CircleBorder(),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            48.0,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 8.0,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              offset: Offset(
                                                                                0.0,
                                                                                2.0,
                                                                              ),
                                                                              spreadRadius: 8.0,
                                                                            )
                                                                          ],
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              FlutterFlowTheme.of(context).primary,
                                                                              FlutterFlowTheme.of(context).accent1
                                                                            ],
                                                                            stops: [
                                                                              0.0,
                                                                              1.0
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            end:
                                                                                AlignmentDirectional(0, 1.0),
                                                                          ),
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
                                                                            logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Image_pxw');
                                                                            logFirebaseEvent('Image_haptic_feedback');
                                                                            HapticFeedback.selectionClick();
                                                                            logFirebaseEvent('Image_play_sound');
                                                                            _model.soundPlayer1 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer1!.playing) {
                                                                              await _model.soundPlayer1!.stop();
                                                                            }
                                                                            _model.soundPlayer1!.setVolume(1.0);
                                                                            _model.soundPlayer1!.setAsset('assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav').then((_) =>
                                                                                _model.soundPlayer1!.play());

                                                                            logFirebaseEvent('Image_bottom_sheet');
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
                                                                                      child: LucilleSoundscapeSuggestionWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/f888a650f73ba5acfa7794b87773e0ae64ac7c72.png',
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation2']!),
                                                                  ],
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'qbw4mzxt' /* Quick Access */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'The Seasons',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            fontSize:
                                                                                22.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                              Flexible(
                                                                flex: 1,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    children: [
                                                                      Align(
                                                                        alignment: Alignment(
                                                                            -1.0,
                                                                            0),
                                                                        child:
                                                                            FlutterFlowButtonTabBar(
                                                                          useToggleButtonStyle:
                                                                              false,
                                                                          isScrollable:
                                                                              true,
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'The Seasons',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                          unselectedLabelStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                          labelColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          unselectedLabelColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          unselectedBackgroundColor:
                                                                              Color(0xB3FFFFFF),
                                                                          borderWidth:
                                                                              2.0,
                                                                          borderRadius:
                                                                              30.0,
                                                                          elevation:
                                                                              0.0,
                                                                          labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              30.0,
                                                                              0.0),
                                                                          buttonMargin:
                                                                              EdgeInsets.all(10.0),
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              35.0,
                                                                              0.0),
                                                                          tabs: [
                                                                            Tab(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'ywom71he' /* All */,
                                                                              ),
                                                                            ),
                                                                            Tab(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '3yt0fr83' /* Music Mediations */,
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['tabOnPageLoadAnimation']!),
                                                                            Tab(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'isao3dwe' /* Nature */,
                                                                              ),
                                                                            ),
                                                                            Tab(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'bib0oifv' /* Focus */,
                                                                              ),
                                                                            ),
                                                                            Tab(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '0mfn942i' /* Sleep */,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                          controller:
                                                                              _model.tabBarController,
                                                                          onTap:
                                                                              (i) async {
                                                                            [
                                                                              () async {},
                                                                              () async {
                                                                                logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Tab_vt119');
                                                                                logFirebaseEvent('Tab_update_app_state');
                                                                                FFAppState().isMusicMeditationsTab = !(FFAppState().isMusicMeditationsTab ?? true);
                                                                                FFAppState().update(() {});
                                                                              },
                                                                              () async {
                                                                                logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Tab_7qme1');
                                                                                logFirebaseEvent('Tab_update_app_state');
                                                                                FFAppState().isNatureTab = !(FFAppState().isNatureTab ?? true);
                                                                                FFAppState().update(() {});
                                                                              },
                                                                              () async {
                                                                                logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Tab_5fy1y');
                                                                                logFirebaseEvent('Tab_update_app_state');
                                                                                FFAppState().isFocusTab = !(FFAppState().isFocusTab ?? true);
                                                                                FFAppState().update(() {});
                                                                              },
                                                                              () async {
                                                                                logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Tab_3ql81');
                                                                                logFirebaseEvent('Tab_update_app_state');
                                                                                FFAppState().isSleepTab = !(FFAppState().isSleepTab ?? true);
                                                                                FFAppState().update(() {});
                                                                              }
                                                                            ][i]();
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            TabBarView(
                                                                          controller:
                                                                              _model.tabBarController,
                                                                          children: [
                                                                            KeepAliveWidgetWrapper(
                                                                              builder: (context) => Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 1,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'b8tdt1kx' /* Featured for You */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                          fontFamily: 'The Seasons',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '33dga6mz' /* Discover your perfect soundsca... */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'WorkSans',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'iu9uynwo' /* See all */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'WorkSans',
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final all = that_audio_player_oo85ab_app_state.FFAppState().currentMediaAllTab.toList();

                                                                                              return ListView.separated(
                                                                                                padding: EdgeInsets.zero,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: all.length,
                                                                                                separatorBuilder: (_, __) => SizedBox(width: 25.0),
                                                                                                itemBuilder: (context, allIndex) {
                                                                                                  final allItem = all[allIndex];
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Container(
                                                                                                          width: 150.37,
                                                                                                          height: 163.1,
                                                                                                          decoration: BoxDecoration(
                                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                                  logFirebaseEvent('Container_haptic_feedback');
                                                                                                                  HapticFeedback.mediumImpact();
                                                                                                                  logFirebaseEvent('Container_play_sound');
                                                                                                                  _model.soundPlayer3 ??= AudioPlayer();
                                                                                                                  if (_model.soundPlayer3!.playing) {
                                                                                                                    await _model.soundPlayer3!.stop();
                                                                                                                  }
                                                                                                                  _model.soundPlayer3!.setVolume(1.0);
                                                                                                                  _model.soundPlayer3!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer3!.play());

                                                                                                                  logFirebaseEvent('Container_custom_action');
                                                                                                                  await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                                    that_audio_player_oo85ab_app_state.FFAppState().currentMediaAllTab.toList(),
                                                                                                                    allIndex,
                                                                                                                  );
                                                                                                                  if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.pauseAudio();
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      allIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageFINALAllTabWidget.routeName,
                                                                                                                      queryParameters: {
                                                                                                                        'currentSong': that_audio_player_oo85ab_serialization_util.serializeParam(
                                                                                                                          allItem,
                                                                                                                          that_audio_player_oo85ab_serialization_util.ParamType.DataStruct,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 2),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      allIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageFINALAllTabWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 1),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                                child: AnimatedContainer(
                                                                                                                  duration: Duration(milliseconds: 220),
                                                                                                                  curve: Curves.easeIn,
                                                                                                                  width: 163.3,
                                                                                                                  height: 180.7,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    image: DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: Image.network(
                                                                                                                        allItem.mediaBanner,
                                                                                                                      ).image,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                  child: Container(
                                                                                                                    height: 37.5,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0x9139519F),
                                                                                                                      boxShadow: [
                                                                                                                        BoxShadow(
                                                                                                                          blurRadius: 20.0,
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          offset: Offset(
                                                                                                                            0.0,
                                                                                                                            0.0,
                                                                                                                          ),
                                                                                                                          spreadRadius: 20.0,
                                                                                                                        )
                                                                                                                      ],
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            Icons.mood,
                                                                                                                            color: FlutterFlowTheme.of(context).accent3,
                                                                                                                            size: 16.0,
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            flex: 1,
                                                                                                                            child: Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                allItem.mood,
                                                                                                                                'Mood',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            allItem.mediaTitle,
                                                                                                            'Title',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'The Seasons',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            allItem.genre,
                                                                                                            'Genre',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'WorkSans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: SingleChildScrollView(
                                                                                            primary: false,
                                                                                            controller: _model.columnController3,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                      child: Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'kbq8ia5g' /* Find Your Mood */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                              fontFamily: 'The Seasons',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Text_zkw5');
                                                                                                        logFirebaseEvent('Text_haptic_feedback');
                                                                                                        HapticFeedback.lightImpact();
                                                                                                        logFirebaseEvent('Text_play_sound');
                                                                                                        _model.soundPlayer4 ??= AudioPlayer();
                                                                                                        if (_model.soundPlayer4!.playing) {
                                                                                                          await _model.soundPlayer4!.stop();
                                                                                                        }
                                                                                                        _model.soundPlayer4!.setVolume(1.0);
                                                                                                        _model.soundPlayer4!.setAsset('assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav').then((_) => _model.soundPlayer4!.play());

                                                                                                        logFirebaseEvent('Text_navigate_to');

                                                                                                        context.pushNamed(
                                                                                                          $that_audio_player_oo85ab.PlayerPageFINALAllTabWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'currentSong': that_audio_player_oo85ab_serialization_util.serializeParam(
                                                                                                              that_audio_player_oo85ab_app_state.FFAppState().currentMediaAllTab.firstOrNull,
                                                                                                              that_audio_player_oo85ab_serialization_util.ParamType.DataStruct,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                              hasTransition: true,
                                                                                                              transitionType: PageTransitionType.fade,
                                                                                                              duration: Duration(milliseconds: 9),
                                                                                                            ),
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                      child: Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'rkacti81' /* See all */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'WorkSans',
                                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Flexible(
                                                                                                  flex: 1,
                                                                                                  child: SingleChildScrollView(
                                                                                                    primary: false,
                                                                                                    controller: _model.columnController4,
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                                                            HapticFeedback.lightImpact();
                                                                                                            logFirebaseEvent('Container_play_sound');
                                                                                                            _model.soundPlayer5 ??= AudioPlayer();
                                                                                                            if (_model.soundPlayer5!.playing) {
                                                                                                              await _model.soundPlayer5!.stop();
                                                                                                            }
                                                                                                            _model.soundPlayer5!.setVolume(1.0);
                                                                                                            _model.soundPlayer5!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer5!.play());

                                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                                            context.pushNamed(
                                                                                                              $that_audio_player_oo85ab.PlayerPageSleepWidget.routeName,
                                                                                                              extra: <String, dynamic>{
                                                                                                                '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                                  duration: Duration(milliseconds: 9),
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 355.3,
                                                                                                            height: 153.6,
                                                                                                            decoration: BoxDecoration(
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.asset(
                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                            ),
                                                                                                            child: Stack(
                                                                                                              children: [
                                                                                                                ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/Container_(4).png',
                                                                                                                    width: 350.6,
                                                                                                                    height: 200.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Flexible(
                                                                                                                        flex: 1,
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'a551yc7e' /* Relax */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 24.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Flexible(
                                                                                                                              flex: 1,
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                    'ptdfgl7d' /* Melt away stress with calming ... */,
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                        font: GoogleFonts.inter(
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                        ),
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        fontSize: 14.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: 48.3,
                                                                                                                        height: 48.3,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          gradient: LinearGradient(
                                                                                                                            colors: [
                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                            ],
                                                                                                                            stops: [0.0, 1.0],
                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                          ),
                                                                                                                          shape: BoxShape.circle,
                                                                                                                        ),
                                                                                                                        child: Icon(
                                                                                                                          Icons.chevron_right,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                                                            HapticFeedback.lightImpact();
                                                                                                            logFirebaseEvent('Container_play_sound');
                                                                                                            _model.soundPlayer6 ??= AudioPlayer();
                                                                                                            if (_model.soundPlayer6!.playing) {
                                                                                                              await _model.soundPlayer6!.stop();
                                                                                                            }
                                                                                                            _model.soundPlayer6!.setVolume(1.0);
                                                                                                            _model.soundPlayer6!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer6!.play());

                                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                                            await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                              that_audio_player_oo85ab_app_state.FFAppState().currentMediaMusicMeditations.toList(),
                                                                                                              0,
                                                                                                            );
                                                                                                            if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                              await actions.pauseAudio();
                                                                                                              await actions.seekAudioToValue(0.0, 0);
                                                                                                            }
                                                                                                            await actions.playAudio();
                                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                                            context.pushNamed(
                                                                                                              $that_audio_player_oo85ab.PlayerPageMusicMediationsWidget.routeName,
                                                                                                              extra: <String, dynamic>{
                                                                                                                '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                                  duration: Duration(milliseconds: 9),
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 355.3,
                                                                                                            height: 153.6,
                                                                                                            decoration: BoxDecoration(
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.asset(
                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                            ),
                                                                                                            child: Stack(
                                                                                                              children: [
                                                                                                                ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/Container_(10).png',
                                                                                                                    width: 352.7,
                                                                                                                    height: 200.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Flexible(
                                                                                                                        flex: 1,
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                '999jy87j' /* Energize */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 24.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Flexible(
                                                                                                                              flex: 1,
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                    'aecwbc9r' /* Uplift your spirit with vibran... */,
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                        font: GoogleFonts.inter(
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                        ),
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        fontSize: 14.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: 48.33,
                                                                                                                        height: 48.33,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          gradient: LinearGradient(
                                                                                                                            colors: [
                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                            ],
                                                                                                                            stops: [0.0, 1.0],
                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                          ),
                                                                                                                          shape: BoxShape.circle,
                                                                                                                        ),
                                                                                                                        child: Icon(
                                                                                                                          Icons.chevron_right,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
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

                                                                                                            await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                              that_audio_player_oo85ab_app_state.FFAppState().currentMediaNatureTab.toList(),
                                                                                                              0,
                                                                                                            );
                                                                                                            if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                              await actions.pauseAudio();
                                                                                                              await actions.seekAudioToValue(0.0, 0);
                                                                                                            }
                                                                                                            await actions.playAudio();
                                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                                            context.pushNamed(
                                                                                                              $that_audio_player_oo85ab.PlayerPageMusicMediationsWidget.routeName,
                                                                                                              extra: <String, dynamic>{
                                                                                                                '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                                  duration: Duration(milliseconds: 9),
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 355.3,
                                                                                                            height: 153.6,
                                                                                                            decoration: BoxDecoration(
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.asset(
                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                            ),
                                                                                                            child: Stack(
                                                                                                              children: [
                                                                                                                ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/Container_(10).png',
                                                                                                                    width: 348.98,
                                                                                                                    height: 200.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Flexible(
                                                                                                                        flex: 1,
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                '2xatdqq3' /* Energize */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 24.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Flexible(
                                                                                                                              flex: 1,
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                    '4o6g68vn' /* Uplift your spirit with vibran... */,
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        fontSize: 14.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: 48.33,
                                                                                                                        height: 48.33,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          gradient: LinearGradient(
                                                                                                                            colors: [
                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                            ],
                                                                                                                            stops: [0.0, 1.0],
                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                          ),
                                                                                                                          shape: BoxShape.circle,
                                                                                                                        ),
                                                                                                                        child: Icon(
                                                                                                                          Icons.chevron_right,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                            logFirebaseEvent('Container_haptic_feedback');
                                                                                                            HapticFeedback.lightImpact();
                                                                                                            logFirebaseEvent('Container_play_sound');
                                                                                                            _model.soundPlayer8 ??= AudioPlayer();
                                                                                                            if (_model.soundPlayer8!.playing) {
                                                                                                              await _model.soundPlayer8!.stop();
                                                                                                            }
                                                                                                            _model.soundPlayer8!.setVolume(1.0);
                                                                                                            _model.soundPlayer8!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer8!.play());

                                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                                            await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                              that_audio_player_oo85ab_app_state.FFAppState().currentMediaNatureTab.toList(),
                                                                                                              0,
                                                                                                            );
                                                                                                            if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                              await actions.pauseAudio();
                                                                                                              await actions.seekAudioToValue(0.0, 0);
                                                                                                            }
                                                                                                            await actions.playAudio();
                                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                                            context.pushNamed(
                                                                                                              $that_audio_player_oo85ab.PlayerPageMusicMediationsWidget.routeName,
                                                                                                              extra: <String, dynamic>{
                                                                                                                '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                                  duration: Duration(milliseconds: 9),
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 355.3,
                                                                                                            height: 153.6,
                                                                                                            decoration: BoxDecoration(
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.asset(
                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                            ),
                                                                                                            child: Stack(
                                                                                                              children: [
                                                                                                                ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/Container_(10).png',
                                                                                                                    width: 352.7,
                                                                                                                    height: 200.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Flexible(
                                                                                                                        flex: 1,
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'df4o2y5m' /* Energize */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 24.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Flexible(
                                                                                                                              flex: 1,
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                    'wm63fv8u' /* Uplift your spirit with vibran... */,
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                        font: GoogleFonts.inter(
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                        ),
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        fontSize: 14.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: 48.33,
                                                                                                                        height: 48.33,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          gradient: LinearGradient(
                                                                                                                            colors: [
                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                            ],
                                                                                                                            stops: [0.0, 1.0],
                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                          ),
                                                                                                                          shape: BoxShape.circle,
                                                                                                                        ),
                                                                                                                        child: Icon(
                                                                                                                          Icons.chevron_right,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 16.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            KeepAliveWidgetWrapper(
                                                                              builder: (context) => Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    flex: 1,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'dcqjsm6m' /* Music For You */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                          fontFamily: 'The Seasons',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'acv98dgd' /* Discover your perfect soundsca... */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'WorkSans',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '30s3xdcy' /* See all */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'WorkSans',
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final musicTab = that_audio_player_oo85ab_app_state.FFAppState().currentMediaMusicMeditations.toList();

                                                                                              return ListView.separated(
                                                                                                padding: EdgeInsets.zero,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: musicTab.length,
                                                                                                separatorBuilder: (_, __) => SizedBox(width: 25.0),
                                                                                                itemBuilder: (context, musicTabIndex) {
                                                                                                  final musicTabItem = musicTab[musicTabIndex];
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Container(
                                                                                                          width: 150.37,
                                                                                                          height: 163.1,
                                                                                                          decoration: BoxDecoration(
                                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                                  logFirebaseEvent('Container_haptic_feedback');
                                                                                                                  HapticFeedback.mediumImpact();
                                                                                                                  logFirebaseEvent('Container_play_sound');
                                                                                                                  _model.soundPlayer9 ??= AudioPlayer();
                                                                                                                  if (_model.soundPlayer9!.playing) {
                                                                                                                    await _model.soundPlayer9!.stop();
                                                                                                                  }
                                                                                                                  _model.soundPlayer9!.setVolume(1.0);
                                                                                                                  _model.soundPlayer9!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer9!.play());

                                                                                                                  logFirebaseEvent('Container_custom_action');
                                                                                                                  await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                                    that_audio_player_oo85ab_app_state.FFAppState().currentMediaMusicMeditations.toList(),
                                                                                                                    musicTabIndex,
                                                                                                                  );
                                                                                                                  if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.pauseAudio();
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      musicTabIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageMusicMediationsWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 2),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      musicTabIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageMusicMediationsWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 1),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                  width: 163.3,
                                                                                                                  height: 180.7,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    image: DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: Image.network(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          musicTabItem.mediaBanner,
                                                                                                                          'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F9c1b5219f5cd92286d0785010da2ecea.gif?alt=media&token=066bb81f-888a-4707-9061-d467c4af0674',
                                                                                                                        ),
                                                                                                                      ).image,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                  child: Container(
                                                                                                                    height: 37.5,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0xCC1C2444),
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            Icons.mood,
                                                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                                                            size: 16.0,
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              musicTabItem.mood,
                                                                                                                              'Mood',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            musicTabItem.mediaTitle,
                                                                                                            'Title',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'The Seasons',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            musicTabItem.genre,
                                                                                                            'Genre',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'WorkSans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: SingleChildScrollView(
                                                                                            primary: false,
                                                                                            controller: _model.columnController5,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                      child: Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'pygu7odw' /* Find Your Mood */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                              fontFamily: 'The Seasons',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'tewm13rr' /* See all */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'WorkSans',
                                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Expanded(
                                                                                                  flex: 1,
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                          logFirebaseEvent('Container_haptic_feedback');
                                                                                                          HapticFeedback.lightImpact();
                                                                                                          logFirebaseEvent('Container_play_sound');
                                                                                                          _model.soundPlayer10 ??= AudioPlayer();
                                                                                                          if (_model.soundPlayer10!.playing) {
                                                                                                            await _model.soundPlayer10!.stop();
                                                                                                          }
                                                                                                          _model.soundPlayer10!.setVolume(1.0);
                                                                                                          _model.soundPlayer10!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer10!.play());

                                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                                          context.pushNamed(
                                                                                                            $that_audio_player_oo85ab.PlayerPageSleepWidget.routeName,
                                                                                                            extra: <String, dynamic>{
                                                                                                              '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                hasTransition: true,
                                                                                                                transitionType: PageTransitionType.fade,
                                                                                                                duration: Duration(milliseconds: 9),
                                                                                                              ),
                                                                                                            },
                                                                                                          );
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 355.3,
                                                                                                          height: 153.6,
                                                                                                          decoration: BoxDecoration(
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: Image.asset(
                                                                                                                'assets/images/Container_(4).png',
                                                                                                              ).image,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.asset(
                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                  width: 350.63,
                                                                                                                  height: 200.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsets.all(25.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Flexible(
                                                                                                                      flex: 1,
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Flexible(
                                                                                                                            flex: 1,
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'mcefxhod' /* Relax */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 24.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            flex: 1,
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  'isbc27ek' /* Melt away stress with calming ... */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 48.3,
                                                                                                                      height: 48.3,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        gradient: LinearGradient(
                                                                                                                          colors: [
                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                            FlutterFlowTheme.of(context).secondary
                                                                                                                          ],
                                                                                                                          stops: [0.0, 1.0],
                                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                                        ),
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Icon(
                                                                                                                        Icons.chevron_right,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 20.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                          logFirebaseEvent('Container_haptic_feedback');
                                                                                                          HapticFeedback.lightImpact();
                                                                                                          logFirebaseEvent('Container_play_sound');
                                                                                                          _model.soundPlayer11 ??= AudioPlayer();
                                                                                                          if (_model.soundPlayer11!.playing) {
                                                                                                            await _model.soundPlayer11!.stop();
                                                                                                          }
                                                                                                          _model.soundPlayer11!.setVolume(1.0);
                                                                                                          _model.soundPlayer11!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer11!.play());

                                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                                          await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                            that_audio_player_oo85ab_app_state.FFAppState().currentMediaMusicMeditations.toList(),
                                                                                                            0,
                                                                                                          );
                                                                                                          if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                            await actions.pauseAudio();
                                                                                                            await actions.seekAudioToValue(0.0, 0);
                                                                                                          }
                                                                                                          await actions.playAudio();
                                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                                          context.pushNamed(
                                                                                                            $that_audio_player_oo85ab.PlayerPageFocusWidget.routeName,
                                                                                                            extra: <String, dynamic>{
                                                                                                              '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                hasTransition: true,
                                                                                                                transitionType: PageTransitionType.fade,
                                                                                                                duration: Duration(milliseconds: 9),
                                                                                                              ),
                                                                                                            },
                                                                                                          );
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 355.3,
                                                                                                          height: 153.6,
                                                                                                          decoration: BoxDecoration(
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: Image.asset(
                                                                                                                'assets/images/Container_(4).png',
                                                                                                              ).image,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.asset(
                                                                                                                  'assets/images/Container_(10).png',
                                                                                                                  width: 352.7,
                                                                                                                  height: 200.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsets.all(25.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Flexible(
                                                                                                                      flex: 1,
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Flexible(
                                                                                                                            flex: 1,
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'ozv6f7n7' /* Energize */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 24.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            flex: 1,
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  'rz11oej3' /* Uplift your spirit with vibran... */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 48.33,
                                                                                                                      height: 48.33,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        gradient: LinearGradient(
                                                                                                                          colors: [
                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                            FlutterFlowTheme.of(context).secondary
                                                                                                                          ],
                                                                                                                          stops: [0.0, 1.0],
                                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                                        ),
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Icon(
                                                                                                                        Icons.chevron_right,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 20.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 12.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 16.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            KeepAliveWidgetWrapper(
                                                                              builder: (context) => Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    flex: 1,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '9dvnyfxh' /* Nature Sounds */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                          fontFamily: 'The Seasons',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '4hdsfbdg' /* Discover your perfect soundsca... */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'WorkSans',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '5h2xik38' /* See all */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'WorkSans',
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final allTab = that_audio_player_oo85ab_app_state.FFAppState().currentMediaNatureTab.toList();

                                                                                              return ListView.separated(
                                                                                                padding: EdgeInsets.zero,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: allTab.length,
                                                                                                separatorBuilder: (_, __) => SizedBox(width: 25.0),
                                                                                                itemBuilder: (context, allTabIndex) {
                                                                                                  final allTabItem = allTab[allTabIndex];
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Container(
                                                                                                          width: 150.37,
                                                                                                          height: 163.1,
                                                                                                          decoration: BoxDecoration(
                                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                                  logFirebaseEvent('Container_haptic_feedback');
                                                                                                                  HapticFeedback.mediumImpact();
                                                                                                                  logFirebaseEvent('Container_play_sound');
                                                                                                                  _model.soundPlayer12 ??= AudioPlayer();
                                                                                                                  if (_model.soundPlayer12!.playing) {
                                                                                                                    await _model.soundPlayer12!.stop();
                                                                                                                  }
                                                                                                                  _model.soundPlayer12!.setVolume(1.0);
                                                                                                                  _model.soundPlayer12!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer12!.play());

                                                                                                                  logFirebaseEvent('Container_custom_action');
                                                                                                                  await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                                    that_audio_player_oo85ab_app_state.FFAppState().currentMediaNatureTab.toList(),
                                                                                                                    allTabIndex,
                                                                                                                  );
                                                                                                                  if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.pauseAudio();
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      allTabIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageNatureWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 2),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      allTabIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageNatureWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 1),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                  width: 163.3,
                                                                                                                  height: 180.7,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    image: DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: Image.network(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          allTabItem.mediaBanner,
                                                                                                                          'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2Fd62729e5768b9c70b89d9ffeb8856152.gif?alt=media&token=049f3c8d-db47-439d-9c2f-0e36d82b51f0',
                                                                                                                        ),
                                                                                                                      ).image,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                  child: Container(
                                                                                                                    height: 37.5,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0x9339519F),
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            Icons.mood,
                                                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                                                            size: 16.0,
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              allTabItem.mood,
                                                                                                                              'Mood',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            allTabItem.mediaTitle,
                                                                                                            'Title',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'The Seasons',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            allTabItem.genre,
                                                                                                            'Genre',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'WorkSans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: SingleChildScrollView(
                                                                                            primary: false,
                                                                                            controller: _model.columnController6,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                      child: Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'dztcxhqm' /* Find Your Mood */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                              fontFamily: 'The Seasons',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'nxzxy2b5' /* See all */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'WorkSans',
                                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Flexible(
                                                                                                  flex: 1,
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                          logFirebaseEvent('Container_haptic_feedback');
                                                                                                          HapticFeedback.lightImpact();
                                                                                                          logFirebaseEvent('Container_play_sound');
                                                                                                          _model.soundPlayer13 ??= AudioPlayer();
                                                                                                          if (_model.soundPlayer13!.playing) {
                                                                                                            await _model.soundPlayer13!.stop();
                                                                                                          }
                                                                                                          _model.soundPlayer13!.setVolume(1.0);
                                                                                                          _model.soundPlayer13!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer13!.play());

                                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                                          context.pushNamed(
                                                                                                            $that_audio_player_oo85ab.PlayerPageMusicMediationsWidget.routeName,
                                                                                                            extra: <String, dynamic>{
                                                                                                              '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                hasTransition: true,
                                                                                                                transitionType: PageTransitionType.fade,
                                                                                                                duration: Duration(milliseconds: 9),
                                                                                                              ),
                                                                                                            },
                                                                                                          );
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 355.3,
                                                                                                          height: 153.6,
                                                                                                          decoration: BoxDecoration(
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: Image.asset(
                                                                                                                'assets/images/Container_(4).png',
                                                                                                              ).image,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.asset(
                                                                                                                  'assets/images/Container_(10).png',
                                                                                                                  width: 352.7,
                                                                                                                  height: 200.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsets.all(25.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Flexible(
                                                                                                                      flex: 1,
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'df4o2y5m' /* Energize */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 24.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            flex: 1,
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  'wm63fv8u' /* Uplift your spirit with vibran... */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 48.33,
                                                                                                                      height: 48.33,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        gradient: LinearGradient(
                                                                                                                          colors: [
                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                            FlutterFlowTheme.of(context).secondary
                                                                                                                          ],
                                                                                                                          stops: [0.0, 1.0],
                                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                                        ),
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Icon(
                                                                                                                        Icons.chevron_right,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 20.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 12.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 16.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            KeepAliveWidgetWrapper(
                                                                              builder: (context) => Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    flex: 1,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'obfxsz2d' /* Concentration Flow */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                          fontFamily: 'The Seasons',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '5phk2liz' /* Discover your perfect soundsca... */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'WorkSans',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'p19tdm31' /* See all */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'WorkSans',
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final allTab = that_audio_player_oo85ab_app_state.FFAppState().currentMediaFocus.toList();

                                                                                              return ListView.separated(
                                                                                                padding: EdgeInsets.zero,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: allTab.length,
                                                                                                separatorBuilder: (_, __) => SizedBox(width: 25.0),
                                                                                                itemBuilder: (context, allTabIndex) {
                                                                                                  final allTabItem = allTab[allTabIndex];
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Container(
                                                                                                          width: 150.37,
                                                                                                          height: 163.1,
                                                                                                          decoration: BoxDecoration(
                                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                                  logFirebaseEvent('Container_haptic_feedback');
                                                                                                                  HapticFeedback.mediumImpact();
                                                                                                                  logFirebaseEvent('Container_play_sound');
                                                                                                                  _model.soundPlayer14 ??= AudioPlayer();
                                                                                                                  if (_model.soundPlayer14!.playing) {
                                                                                                                    await _model.soundPlayer14!.stop();
                                                                                                                  }
                                                                                                                  _model.soundPlayer14!.setVolume(1.0);
                                                                                                                  _model.soundPlayer14!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer14!.play());

                                                                                                                  logFirebaseEvent('Container_custom_action');
                                                                                                                  await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                                    that_audio_player_oo85ab_app_state.FFAppState().currentMediaFocus.toList(),
                                                                                                                    allTabIndex,
                                                                                                                  );
                                                                                                                  if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.pauseAudio();
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      allTabIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageFocusWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 2),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      allTabIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageFocusWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 1),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                  width: 163.3,
                                                                                                                  height: 180.7,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    image: DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: Image.network(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          allTabItem.mediaBanner,
                                                                                                                          'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2Fe085865feb0fb5cd989c30fa6b384526.gif?alt=media&token=adf4bee7-8bca-4508-b01a-9dfe15967736',
                                                                                                                        ),
                                                                                                                      ).image,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                  child: Container(
                                                                                                                    height: 37.5,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0xCC1C2444),
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            Icons.play_arrow,
                                                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                                                            size: 16.0,
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              allTabItem.mood,
                                                                                                                              'Mood',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            allTabItem.mediaTitle,
                                                                                                            'Title',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'The Seasons',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            allTabItem.genre,
                                                                                                            'Genre',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'WorkSans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: SingleChildScrollView(
                                                                                            primary: false,
                                                                                            controller: _model.columnController7,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  flex: 1,
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'dooiuabu' /* Find Your Mood */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                fontFamily: 'The Seasons',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '3yag61by' /* See all */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'WorkSans',
                                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                                        HapticFeedback.lightImpact();
                                                                                                        logFirebaseEvent('Container_play_sound');
                                                                                                        _model.soundPlayer15 ??= AudioPlayer();
                                                                                                        if (_model.soundPlayer15!.playing) {
                                                                                                          await _model.soundPlayer15!.stop();
                                                                                                        }
                                                                                                        _model.soundPlayer15!.setVolume(1.0);
                                                                                                        _model.soundPlayer15!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer15!.play());

                                                                                                        logFirebaseEvent('Container_navigate_to');

                                                                                                        context.pushNamed(
                                                                                                          $that_audio_player_oo85ab.PlayerPageSleepWidget.routeName,
                                                                                                          extra: <String, dynamic>{
                                                                                                            '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                              hasTransition: true,
                                                                                                              transitionType: PageTransitionType.fade,
                                                                                                              duration: Duration(milliseconds: 9),
                                                                                                            ),
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 355.3,
                                                                                                        height: 153.6,
                                                                                                        decoration: BoxDecoration(
                                                                                                          image: DecorationImage(
                                                                                                            fit: BoxFit.cover,
                                                                                                            image: Image.asset(
                                                                                                              'assets/images/Container_(4).png',
                                                                                                            ).image,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                                        ),
                                                                                                        child: Stack(
                                                                                                          children: [
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/Container_(4).png',
                                                                                                                width: 350.63,
                                                                                                                height: 200.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsets.all(25.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Flexible(
                                                                                                                    flex: 1,
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Flexible(
                                                                                                                          flex: 1,
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'mcefxhod' /* Relax */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 24.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Flexible(
                                                                                                                          flex: 1,
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'isbc27ek' /* Melt away stress with calming ... */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 48.3,
                                                                                                                    height: 48.3,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      gradient: LinearGradient(
                                                                                                                        colors: [
                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                          FlutterFlowTheme.of(context).secondary
                                                                                                                        ],
                                                                                                                        stops: [0.0, 1.0],
                                                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                                                      ),
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: Icon(
                                                                                                                      Icons.chevron_right,
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      size: 20.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                                        HapticFeedback.lightImpact();
                                                                                                        logFirebaseEvent('Container_play_sound');
                                                                                                        _model.soundPlayer16 ??= AudioPlayer();
                                                                                                        if (_model.soundPlayer16!.playing) {
                                                                                                          await _model.soundPlayer16!.stop();
                                                                                                        }
                                                                                                        _model.soundPlayer16!.setVolume(1.0);
                                                                                                        _model.soundPlayer16!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer16!.play());

                                                                                                        logFirebaseEvent('Container_navigate_to');

                                                                                                        await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                          that_audio_player_oo85ab_app_state.FFAppState().currentMediaMusicMeditations.toList(),
                                                                                                          0,
                                                                                                        );
                                                                                                        if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                          await actions.pauseAudio();
                                                                                                          await actions.seekAudioToValue(0.0, 0);
                                                                                                        }
                                                                                                        await actions.playAudio();
                                                                                                        logFirebaseEvent('Container_navigate_to');

                                                                                                        context.pushNamed(
                                                                                                          $that_audio_player_oo85ab.PlayerPageFocusWidget.routeName,
                                                                                                          extra: <String, dynamic>{
                                                                                                            '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                              hasTransition: true,
                                                                                                              transitionType: PageTransitionType.fade,
                                                                                                              duration: Duration(milliseconds: 9),
                                                                                                            ),
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 355.3,
                                                                                                        height: 153.6,
                                                                                                        decoration: BoxDecoration(
                                                                                                          image: DecorationImage(
                                                                                                            fit: BoxFit.cover,
                                                                                                            image: Image.asset(
                                                                                                              'assets/images/Container_(4).png',
                                                                                                            ).image,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                                        ),
                                                                                                        child: Stack(
                                                                                                          children: [
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/Container_(10).png',
                                                                                                                width: 352.7,
                                                                                                                height: 200.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsets.all(25.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Flexible(
                                                                                                                    flex: 1,
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Flexible(
                                                                                                                          flex: 1,
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'ozv6f7n7' /* Energize */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 24.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Flexible(
                                                                                                                          flex: 1,
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'rz11oej3' /* Uplift your spirit with vibran... */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 48.33,
                                                                                                                    height: 48.33,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      gradient: LinearGradient(
                                                                                                                        colors: [
                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                          FlutterFlowTheme.of(context).secondary
                                                                                                                        ],
                                                                                                                        stops: [0.0, 1.0],
                                                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                                                      ),
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: Icon(
                                                                                                                      Icons.chevron_right,
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      size: 20.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 12.0)),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 16.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            KeepAliveWidgetWrapper(
                                                                              builder: (context) => Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    flex: 1,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '0u4gh00u' /* Sleep Soundscapes */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                          fontFamily: 'The Seasons',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'go09ohhk' /* Discover your perfect soundsca... */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'WorkSans',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Text_1os2');
                                                                                                  logFirebaseEvent('Text_haptic_feedback');
                                                                                                  HapticFeedback.lightImpact();
                                                                                                  logFirebaseEvent('Text_play_sound');
                                                                                                  _model.soundPlayer17 ??= AudioPlayer();
                                                                                                  if (_model.soundPlayer17!.playing) {
                                                                                                    await _model.soundPlayer17!.stop();
                                                                                                  }
                                                                                                  _model.soundPlayer17!.setVolume(1.0);
                                                                                                  _model.soundPlayer17!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer17!.play());

                                                                                                  logFirebaseEvent('Text_navigate_to');

                                                                                                  context.pushNamed(
                                                                                                    $that_audio_player_oo85ab.PlayerPageFINALAllTabWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'currentSong': that_audio_player_oo85ab_serialization_util.serializeParam(
                                                                                                        that_audio_player_oo85ab_app_state.FFAppState().currentMediaAllTab.firstOrNull,
                                                                                                        that_audio_player_oo85ab_serialization_util.ParamType.DataStruct,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                        hasTransition: true,
                                                                                                        transitionType: PageTransitionType.fade,
                                                                                                        duration: Duration(milliseconds: 9),
                                                                                                      ),
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '0vz0cifo' /* See all */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'WorkSans',
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final allTab = that_audio_player_oo85ab_app_state.FFAppState().currentMediaSleepTab.toList();

                                                                                              return ListView.separated(
                                                                                                padding: EdgeInsets.zero,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: allTab.length,
                                                                                                separatorBuilder: (_, __) => SizedBox(width: 25.0),
                                                                                                itemBuilder: (context, allTabIndex) {
                                                                                                  final allTabItem = allTab[allTabIndex];
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Container(
                                                                                                          width: 150.37,
                                                                                                          height: 163.1,
                                                                                                          decoration: BoxDecoration(
                                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                                  logFirebaseEvent('Container_haptic_feedback');
                                                                                                                  HapticFeedback.mediumImpact();
                                                                                                                  logFirebaseEvent('Container_play_sound');
                                                                                                                  _model.soundPlayer18 ??= AudioPlayer();
                                                                                                                  if (_model.soundPlayer18!.playing) {
                                                                                                                    await _model.soundPlayer18!.stop();
                                                                                                                  }
                                                                                                                  _model.soundPlayer18!.setVolume(1.0);
                                                                                                                  _model.soundPlayer18!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer18!.play());

                                                                                                                  logFirebaseEvent('Container_custom_action');
                                                                                                                  await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                                    that_audio_player_oo85ab_app_state.FFAppState().currentMediaSleepTab.toList(),
                                                                                                                    allTabIndex,
                                                                                                                  );
                                                                                                                  if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.pauseAudio();
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      allTabIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageSleepWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 2),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                      0.0,
                                                                                                                      allTabIndex,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Container_custom_action');
                                                                                                                    await actions.playAudio();
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      $that_audio_player_oo85ab.PlayerPageSleepWidget.routeName,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                          hasTransition: true,
                                                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                                                          duration: Duration(milliseconds: 1),
                                                                                                                        ),
                                                                                                                      },
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                  width: 163.3,
                                                                                                                  height: 180.7,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    image: DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: Image.network(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          allTabItem.mediaBanner,
                                                                                                                          'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F90ac6093fb40e1d7398371b1d61a4e4a.gif?alt=media&token=3351172e-47e6-40e2-9ed4-fb4d549c64f5',
                                                                                                                        ),
                                                                                                                      ).image,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                  child: Container(
                                                                                                                    height: 37.5,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0x9139519F),
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            Icons.play_arrow,
                                                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                                                            size: 16.0,
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              allTabItem.mood,
                                                                                                                              'Duration',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            allTabItem.mediaTitle,
                                                                                                            'Title',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'The Seasons',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            allTabItem.genre,
                                                                                                            'Genre',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'WorkSans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: SingleChildScrollView(
                                                                                            primary: false,
                                                                                            controller: _model.columnController8,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                      child: Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'bmves0zy' /* Find Your Mood */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                              fontFamily: 'The Seasons',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'ok9bp74l' /* See all */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'WorkSans',
                                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Expanded(
                                                                                                  flex: 1,
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                          logFirebaseEvent('Container_haptic_feedback');
                                                                                                          HapticFeedback.mediumImpact();
                                                                                                          logFirebaseEvent('Container_play_sound');
                                                                                                          _model.soundPlayer19 ??= AudioPlayer();
                                                                                                          if (_model.soundPlayer19!.playing) {
                                                                                                            await _model.soundPlayer19!.stop();
                                                                                                          }
                                                                                                          _model.soundPlayer19!.setVolume(1.0);
                                                                                                          _model.soundPlayer19!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer19!.play());

                                                                                                          logFirebaseEvent('Container_custom_action');
                                                                                                          await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                            that_audio_player_oo85ab_app_state.FFAppState().currentMediaSleepTab.toList(),
                                                                                                            _model.tabBarCurrentIndex,
                                                                                                          );
                                                                                                          if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                            logFirebaseEvent('Container_custom_action');
                                                                                                            await actions.pauseAudio();
                                                                                                            logFirebaseEvent('Container_custom_action');
                                                                                                            await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                              0.0,
                                                                                                              _model.tabBarCurrentIndex,
                                                                                                            );
                                                                                                            logFirebaseEvent('Container_custom_action');
                                                                                                            await actions.playAudio();
                                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                                            context.pushNamed(
                                                                                                              $that_audio_player_oo85ab.PlayerPageSleepWidget.routeName,
                                                                                                              extra: <String, dynamic>{
                                                                                                                '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.bottomToTop,
                                                                                                                  duration: Duration(milliseconds: 2),
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          } else {
                                                                                                            logFirebaseEvent('Container_custom_action');
                                                                                                            await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                              0.0,
                                                                                                              _model.tabBarCurrentIndex,
                                                                                                            );
                                                                                                            logFirebaseEvent('Container_custom_action');
                                                                                                            await actions.playAudio();
                                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                                            context.pushNamed(
                                                                                                              $that_audio_player_oo85ab.PlayerPageSleepWidget.routeName,
                                                                                                              extra: <String, dynamic>{
                                                                                                                '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.bottomToTop,
                                                                                                                  duration: Duration(milliseconds: 1),
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 355.3,
                                                                                                          height: 153.6,
                                                                                                          decoration: BoxDecoration(
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: Image.asset(
                                                                                                                'assets/images/Container_(4).png',
                                                                                                              ).image,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.asset(
                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                  width: 350.6,
                                                                                                                  height: 200.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsets.all(25.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Flexible(
                                                                                                                      flex: 1,
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'zm14bood' /* Relax */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 24.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            flex: 1,
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  'dbatgaj6' /* Melt away stress with calming ... */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 48.3,
                                                                                                                      height: 48.3,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        gradient: LinearGradient(
                                                                                                                          colors: [
                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                            FlutterFlowTheme.of(context).secondary
                                                                                                                          ],
                                                                                                                          stops: [0.0, 1.0],
                                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                                        ),
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Icon(
                                                                                                                        Icons.chevron_right,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 20.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('A_I_SOUNDSCAPES_COPY_COPY_COPY_Container');
                                                                                                          logFirebaseEvent('Container_haptic_feedback');
                                                                                                          HapticFeedback.lightImpact();
                                                                                                          logFirebaseEvent('Container_play_sound');
                                                                                                          _model.soundPlayer20 ??= AudioPlayer();
                                                                                                          if (_model.soundPlayer20!.playing) {
                                                                                                            await _model.soundPlayer20!.stop();
                                                                                                          }
                                                                                                          _model.soundPlayer20!.setVolume(1.0);
                                                                                                          _model.soundPlayer20!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer20!.play());

                                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                                          await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                            that_audio_player_oo85ab_app_state.FFAppState().currentMediaMusicMeditations.toList(),
                                                                                                            0,
                                                                                                          );
                                                                                                          if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                            await actions.pauseAudio();
                                                                                                            await actions.seekAudioToValue(0.0, 0);
                                                                                                          }
                                                                                                          await actions.playAudio();
                                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                                          context.pushNamed(
                                                                                                            $that_audio_player_oo85ab.PlayerPageFocusWidget.routeName,
                                                                                                            extra: <String, dynamic>{
                                                                                                              '__transition_info__that_audio_player_oo85ab': TransitionInfo(
                                                                                                                hasTransition: true,
                                                                                                                transitionType: PageTransitionType.fade,
                                                                                                                duration: Duration(milliseconds: 9),
                                                                                                              ),
                                                                                                            },
                                                                                                          );
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 355.3,
                                                                                                          height: 153.6,
                                                                                                          decoration: BoxDecoration(
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: Image.asset(
                                                                                                                'assets/images/Container_(4).png',
                                                                                                              ).image,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.asset(
                                                                                                                  'assets/images/Container_(10).png',
                                                                                                                  width: 352.7,
                                                                                                                  height: 200.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsets.all(25.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Flexible(
                                                                                                                      flex: 1,
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'w9f0dsv3' /* Energize */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 24.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            flex: 1,
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  '8e2loo6x' /* Uplift your spirit with vibran... */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 48.33,
                                                                                                                      height: 48.33,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        gradient: LinearGradient(
                                                                                                                          colors: [
                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                            FlutterFlowTheme.of(context).secondary
                                                                                                                          ],
                                                                                                                          stops: [0.0, 1.0],
                                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                                        ),
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Icon(
                                                                                                                        Icons.chevron_right,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 20.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 12.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 16.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'tabBarOnPageLoadAnimation']!),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 24.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation1']!),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}