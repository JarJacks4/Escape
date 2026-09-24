import '/auth/firebase_auth/auth_util.dart';
import '/components/lucille_soundscape_suggestion_widget.dart';
import '/components/mood_category_card_widget.dart';
import '/components/soundscape_card_widget.dart';
import '/components/soundscapes_starter_page_version5_copy_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'a_i_soundscapes_f_i_n_a_l_model.dart';
export 'a_i_soundscapes_f_i_n_a_l_model.dart';

class AISoundscapesFINALWidget extends StatefulWidget {
  const AISoundscapesFINALWidget({
    super.key,
    String? meditationaudio,
  }) : this.meditationaudio = meditationaudio ??
            'https://www.youtube.com/watch?v=u3papaX85MA&list=PLyC3pcUWmqsTfH2-BQQ4PfuS7NjxcFa9v&index=4';

  final String meditationaudio;

  static String routeName = 'AISoundscapesFINAL';
  static String routePath = '/aISoundscapesFINAL';

  @override
  State<AISoundscapesFINALWidget> createState() =>
      _AISoundscapesFINALWidgetState();
}

class _AISoundscapesFINALWidgetState extends State<AISoundscapesFINALWidget>
    with TickerProviderStateMixin {
  late AISoundscapesFINALModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AISoundscapesFINALModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AISoundscapesFINAL'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_I_SOUNDSCAPES_F_I_N_A_L_AISoundscapesF');
      logFirebaseEvent('AISoundscapesFINAL_update_app_state');
      FFAppState().isAllTab = true;
      safeSetState(() {});
      if (FFAppState().isFirstTimeUserSoundscapes) {
        logFirebaseEvent('AISoundscapesFINAL_haptic_feedback');
        HapticFeedback.vibrate();
        logFirebaseEvent('AISoundscapesFINAL_bottom_sheet');
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
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
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
    });
  }

  bool _isValidMediaBannerUrl(String? url) {
    if (url == null) return false;
    final uri = Uri.tryParse(url.trim());
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  Widget _buildMediaBanner(String? url) {
    if (!_isValidMediaBannerUrl(url)) {
      return Container(
        color: const Color(0x4439519F),
        alignment: Alignment.center,
        child: Icon(
          Icons.music_note_rounded,
          color: FlutterFlowTheme.of(context).primary,
          size: 24.0,
        ),
      );
    }

    return CachedNetworkImage(
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      imageUrl: url!.trim(),
      fit: BoxFit.cover,
      alignment: const Alignment(0.0, 0.0),
      errorWidget: (context, error, stackTrace) => Container(
        color: const Color(0x4439519F),
        alignment: Alignment.center,
        child: Icon(
          Icons.music_note_rounded,
          color: FlutterFlowTheme.of(context).primary,
          size: 24.0,
        ),
      ),
    );
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
              controller: _model.columnController,
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
                            child: Image.network(
                              () {
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
                              width: 409.6,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              cacheWidth: (409.6 *
                                      MediaQuery.of(context).devicePixelRatio)
                                  .round(),
                              cacheHeight: (MediaQuery.sizeOf(context).height *
                                      MediaQuery.of(context).devicePixelRatio)
                                  .round(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              Color(0x9CEDF1F7),
                              Color(0x706110A3)
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
                              sigmaX: 5.0,
                              sigmaY: 5.0,
                            ),
                            child: SingleChildScrollView(
                              primary: false,
                              controller: _model.columnScrollController,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 35.0, 0.0, 0.0),
                                            child: Container(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 16.0),
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 30.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'qza8uo1o' /* Good Morning */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .cormorantSc(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        32.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  currentUserDisplayName,
                                                                  'Jane Doe',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                        Container(
                                                          width: 48.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    40.0,
                                                                color: Color(
                                                                    0x90F0831A),
                                                                offset: Offset(
                                                                  0.0,
                                                                  0.0,
                                                                ),
                                                                spreadRadius:
                                                                    8.0,
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'A_I_SOUNDSCAPES_F_I_N_A_L_Image_ljk2bbzp');
                                                              logFirebaseEvent(
                                                                  'Image_haptic_feedback');
                                                              HapticFeedback
                                                                  .selectionClick();
                                                              logFirebaseEvent(
                                                                  'Image_play_sound');
                                                              _model.soundPlayer1 ??=
                                                                  AudioPlayer();
                                                              if (_model
                                                                  .soundPlayer1!
                                                                  .playing) {
                                                                await _model
                                                                    .soundPlayer1!
                                                                    .stop();
                                                              }
                                                              _model
                                                                  .soundPlayer1!
                                                                  .setVolume(
                                                                      1.0);
                                                              _model
                                                                  .soundPlayer1!
                                                                  .setAsset(
                                                                      'assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav')
                                                                  .then((_) => _model
                                                                      .soundPlayer1!
                                                                      .play());

                                                              logFirebaseEvent(
                                                                  'Image_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            LucilleSoundscapeSuggestionWidget(),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/f888a650f73ba5acfa7794b87773e0ae64ac7c72.png',
                                                                width: 200.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'pvu0plkp' /* Quick Access */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .cormorantSc(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 270.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(-1.0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: false,
                        isScrollable: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor: Color(0xA5F0831A),
                        unselectedBackgroundColor: Color(0x5C5A5C60),
                        borderColor: Color(0x63EDF1F7),
                        unselectedBorderColor: Color(0x35EDF1F7),
                        borderWidth: 1.0,
                        borderRadius: 15.0,
                        elevation: 8.0,
                        buttonMargin:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '1xpmpkjw' /*   All   */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'im56dkal' /*    Music Mediations    */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '50yecrsd' /*    Nature    */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'ozhgrlsv' /*    Focus    */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'lw1avqbm' /*    Sleep    */,
                            ),
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {}
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'xpuabfwj' /* Featured for You */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .cormorantSc(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'xfpmrt5x' /* Discover your perfect soundsca... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 2.0)),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Text_haptic_feedback');
                                                  HapticFeedback.heavyImpact();
                                                  logFirebaseEvent(
                                                      'Text_navigate_to');

                                                  context.pushNamed(
                                                    RelaxSoundscapeDetailsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'pageTitle':
                                                          serializeParam(
                                                        'All Soundscapes',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                        duration: Duration(
                                                            milliseconds: 1),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'i72lrpfl' /* See all */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _model.rowScrollController1,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Builder(
                                                builder: (context) {
                                                  final featuredForYou =
                                                      that_audio_player_oo85ab_app_state
                                                              .FFAppState()
                                                          .currentMediaAllTab
                                                          .toList();

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        featuredForYou.length,
                                                        (featuredForYouIndex) {
                                                      final featuredForYouItem =
                                                          featuredForYou[
                                                              featuredForYouIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'A_I_SOUNDSCAPES_F_I_N_A_L_SoundscapeCard');
                                                          logFirebaseEvent(
                                                              'SoundscapeCard_haptic_feedback');
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          logFirebaseEvent(
                                                              'SoundscapeCard_play_sound');
                                                          _model.soundPlayer2 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer2!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer2!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer2!
                                                              .setVolume(1.0);
                                                          _model.soundPlayer2!
                                                              .setAsset(
                                                                  'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                              .then((_) => _model
                                                                  .soundPlayer2!
                                                                  .play());

                                                          logFirebaseEvent(
                                                              'SoundscapeCard_custom_action');
                                                          await that_audio_player_oo85ab_actions
                                                              .initializeThatAudioPlayerForPlaylists(
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaAllTab
                                                                .toList(),
                                                            featuredForYouIndex,
                                                          );
                                                          if (that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .isThatAudioPlayerPlaying) {
                                                            logFirebaseEvent(
                                                                'SoundscapeCard_custom_action');
                                                            await actions
                                                                .pauseAudio();
                                                            logFirebaseEvent(
                                                                'SoundscapeCard_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              featuredForYouIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'SoundscapeCard_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'SoundscapeCard_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'currentSong':
                                                                    that_audio_player_oo85ab_serialization_util
                                                                        .serializeParam(
                                                                  featuredForYouItem,
                                                                  that_audio_player_oo85ab_serialization_util
                                                                      .ParamType
                                                                      .DataStruct,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          2),
                                                                ),
                                                              },
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'SoundscapeCard_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              featuredForYouIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'SoundscapeCard_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'SoundscapeCard_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1),
                                                                ),
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child:
                                                            SoundscapeCardWidget(
                                                          key: Key(
                                                              'Key82c_${featuredForYouIndex}_of_${featuredForYou.length}'),
                                                          genre:
                                                              featuredForYouItem
                                                                  .genre,
                                                          imgDesc:
                                                              featuredForYouItem
                                                                  .mediaBanner,
                                                          moodIcon: Icon(
                                                            Icons
                                                                .water_drop_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 14.0,
                                                          ),
                                                          moodLabel:
                                                              featuredForYouItem
                                                                  .mood,
                                                          title:
                                                              featuredForYouItem
                                                                  .mediaTitle,
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 15.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'zekql33n' /* Find Your Mood */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .cormorantSc(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Text_haptic_feedback');
                                                  HapticFeedback.heavyImpact();
                                                  logFirebaseEvent(
                                                      'Text_navigate_to');

                                                  context.pushNamed(
                                                    RelaxSoundscapeDetailsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'pageTitle':
                                                          serializeParam(
                                                        'All Soundscapes',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                        duration: Duration(
                                                            milliseconds: 1),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'to9yomzv' /* See all */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _model.rowScrollController2,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .moodCategoryCardModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MoodCategoryCardWidget(
                                                      bgColor:
                                                          Color(0xDA1C2444),
                                                      icon: Icon(
                                                        Icons.spa_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        size: 32.0,
                                                      ),
                                                      subtitle:
                                                          'Melodies to unwind',
                                                      title: 'Relax',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .moodCategoryCardModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MoodCategoryCardWidget(
                                                      bgColor:
                                                          Color(0xAA39519F),
                                                      icon: Icon(
                                                        Icons
                                                            .electric_bolt_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 32.0,
                                                      ),
                                                      subtitle:
                                                          'Uplifting rhythms',
                                                      title: 'Energize',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .moodCategoryCardModel3,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MoodCategoryCardWidget(
                                                      bgColor:
                                                          Color(0xFFF09D0C),
                                                      icon: Icon(
                                                        Icons
                                                            .psychology_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 32.0,
                                                      ),
                                                      subtitle:
                                                          'Clear your mind',
                                                      title: 'Focus',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'on5az0bb' /* Lucille's Suggested Soundscape */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.cormorantSc(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 10.0,
                                          sigmaY: 10.0,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0x27FFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 40.0,
                                                color: Color(0xDFEDF1F7),
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 8.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0x2FEDF1F7),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Container(
                                                      width: 56.0,
                                                      height: 56.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: _buildMediaBanner(
                                                        that_audio_player_oo85ab_app_state
                                                                .FFAppState()
                                                            .currentMediaMusicMeditations
                                                            .elementAtOrNull(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaIndex)
                                                            ?.mediaBanner,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaMusicMeditations
                                                                .elementAtOrNull(
                                                                    that_audio_player_oo85ab_app_state
                                                                            .FFAppState()
                                                                        .currentMediaIndex)
                                                                ?.mediaTitle,
                                                            'Title',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaMusicMeditations
                                                                .elementAtOrNull(
                                                                    that_audio_player_oo85ab_app_state
                                                                            .FFAppState()
                                                                        .currentMediaIndex)
                                                                ?.mood,
                                                            'Mood',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 2.0)),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 48.0,
                                                    fillColor:
                                                        Colors.transparent,
                                                    icon: Icon(
                                                      Icons
                                                          .play_circle_filled_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      size: 32.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'A_I_SOUNDSCAPES_F_I_N_A_L_IconButton_ON_');
                                                      logFirebaseEvent(
                                                          'IconButton_haptic_feedback');
                                                      HapticFeedback
                                                          .mediumImpact();
                                                      logFirebaseEvent(
                                                          'IconButton_play_sound');
                                                      _model.soundPlayer3 ??=
                                                          AudioPlayer();
                                                      if (_model.soundPlayer3!
                                                          .playing) {
                                                        await _model
                                                            .soundPlayer3!
                                                            .stop();
                                                      }
                                                      _model.soundPlayer3!
                                                          .setVolume(1.0);
                                                      _model.soundPlayer3!
                                                          .setAsset(
                                                              'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                          .then((_) => _model
                                                              .soundPlayer3!
                                                              .play());

                                                      logFirebaseEvent(
                                                          'IconButton_custom_action');
                                                      await that_audio_player_oo85ab_actions
                                                          .initializeThatAudioPlayerForPlaylists(
                                                        that_audio_player_oo85ab_app_state
                                                                .FFAppState()
                                                            .currentMediaAllTab
                                                            .toList(),
                                                        that_audio_player_oo85ab_app_state
                                                                .FFAppState()
                                                            .currentMediaIndex,
                                                      );
                                                      if (that_audio_player_oo85ab_app_state
                                                              .FFAppState()
                                                          .isThatAudioPlayerPlaying) {
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .pauseAudio();
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .seekAudioToValue(
                                                          0.0,
                                                          that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .currentMediaIndex,
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .playAudio();
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_to');

                                                        context.pushNamed(
                                                          $that_audio_player_oo85ab
                                                              .PlayerPageFINALAllTabWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'currentSong':
                                                                that_audio_player_oo85ab_serialization_util
                                                                    .serializeParam(
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaMusicMeditations
                                                                  .elementAtOrNull(
                                                                      that_audio_player_oo85ab_app_state
                                                                              .FFAppState()
                                                                          .currentMediaIndex),
                                                              that_audio_player_oo85ab_serialization_util
                                                                  .ParamType
                                                                  .DataStruct,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__that_audio_player_oo85ab':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      2),
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .seekAudioToValue(
                                                          0.0,
                                                          that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .currentMediaIndex,
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .playAudio();
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_to');

                                                        context.pushNamed(
                                                          $that_audio_player_oo85ab
                                                              .PlayerPageFINALAllTabWidget
                                                              .routeName,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__that_audio_player_oo85ab':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      1),
                                                            ),
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '9al8ihy0' /* Music Meditations */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .cormorantSc(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'iwoc0b47' /* Discover your perfect soundsca... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 2.0)),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        RelaxSoundscapeDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'pageTitle':
                                                              serializeParam(
                                                            'All Soundscapes',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'clloxibz' /* See all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller:
                                              _model.rowScrollController3,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  child: Builder(
                                                    builder: (context) {
                                                      final featuredForYou =
                                                          that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .currentMediaMusicMeditations
                                                              .toList();

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            featuredForYou
                                                                .length,
                                                            (featuredForYouIndex) {
                                                          final featuredForYouItem =
                                                              featuredForYou[
                                                                  featuredForYouIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'A_I_SOUNDSCAPES_F_I_N_A_L_SoundscapeCard');
                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_haptic_feedback');
                                                              HapticFeedback
                                                                  .mediumImpact();
                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_play_sound');
                                                              _model.soundPlayer4 ??=
                                                                  AudioPlayer();
                                                              if (_model
                                                                  .soundPlayer4!
                                                                  .playing) {
                                                                await _model
                                                                    .soundPlayer4!
                                                                    .stop();
                                                              }
                                                              _model
                                                                  .soundPlayer4!
                                                                  .setVolume(
                                                                      1.0);
                                                              _model
                                                                  .soundPlayer4!
                                                                  .setAsset(
                                                                      'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                                  .then((_) => _model
                                                                      .soundPlayer4!
                                                                      .play());

                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_custom_action');
                                                              await that_audio_player_oo85ab_actions
                                                                  .initializeThatAudioPlayerForPlaylists(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .toList(),
                                                                featuredForYouIndex,
                                                              );
                                                              if (that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .isThatAudioPlayerPlaying) {
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .pauseAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .seekAudioToValue(
                                                                  0.0,
                                                                  featuredForYouIndex,
                                                                );
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .playAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  $that_audio_player_oo85ab
                                                                      .PlayerPageMusicMediationsWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__that_audio_player_oo85ab':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              2),
                                                                    ),
                                                                  },
                                                                );
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .seekAudioToValue(
                                                                  0.0,
                                                                  featuredForYouIndex,
                                                                );
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .playAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  $that_audio_player_oo85ab
                                                                      .PlayerPageFINALAllTabWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__that_audio_player_oo85ab':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1),
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            child:
                                                                SoundscapeCardWidget(
                                                              key: Key(
                                                                  'Keyml7_${featuredForYouIndex}_of_${featuredForYou.length}'),
                                                              genre:
                                                                  featuredForYouItem
                                                                      .genre,
                                                              imgDesc:
                                                                  featuredForYouItem
                                                                      .mediaBanner,
                                                              moodIcon: Icon(
                                                                Icons
                                                                    .water_drop_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 14.0,
                                                              ),
                                                              moodLabel:
                                                                  featuredForYouItem
                                                                      .mood,
                                                              title:
                                                                  featuredForYouItem
                                                                      .mediaTitle,
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 15.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'kjtquxcz' /* Find Your Mood */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .cormorantSc(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller:
                                              _model.rowScrollController4,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel4,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xDA1C2444),
                                                          icon: Icon(
                                                            Icons.spa_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Melodies to unwind',
                                                          title: 'Relax',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel5,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xAA39519F),
                                                          icon: Icon(
                                                            Icons
                                                                .electric_bolt_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Uplifting rhythms',
                                                          title: 'Energize',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel6,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xFFF09D0C),
                                                          icon: Icon(
                                                            Icons
                                                                .psychology_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Clear your mind',
                                                          title: 'Focus',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ewgb31ft' /* Lucille's Suggested Soundscape */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.cormorantSc(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 10.0,
                                              sigmaY: 10.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x27FFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 40.0,
                                                    color: Color(0xDFEDF1F7),
                                                    offset: Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                    spreadRadius: 8.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color(0x2FEDF1F7),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Container(
                                                          width: 56.0,
                                                          height: 56.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: _buildMediaBanner(
                                                        that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaMusicMeditations
                                                                .elementAtOrNull(
                                                                    that_audio_player_oo85ab_app_state
                                                                            .FFAppState()
                                                                        .currentMediaIndex)?.mediaBanner,
                                                      ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .elementAtOrNull(
                                                                        that_audio_player_oo85ab_app_state.FFAppState()
                                                                            .currentMediaIndex)
                                                                    ?.mediaTitle,
                                                                'Title',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .elementAtOrNull(
                                                                        that_audio_player_oo85ab_app_state.FFAppState()
                                                                            .currentMediaIndex)
                                                                    ?.mood,
                                                                'Mood',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 2.0)),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 48.0,
                                                        fillColor:
                                                            Colors.transparent,
                                                        icon: Icon(
                                                          Icons
                                                              .play_circle_filled_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          size: 32.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'A_I_SOUNDSCAPES_F_I_N_A_L_IconButton_ON_');
                                                          logFirebaseEvent(
                                                              'IconButton_haptic_feedback');
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          logFirebaseEvent(
                                                              'IconButton_play_sound');
                                                          _model.soundPlayer5 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer5!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer5!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer5!
                                                              .setVolume(1.0);
                                                          _model.soundPlayer5!
                                                              .setAsset(
                                                                  'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                              .then((_) => _model
                                                                  .soundPlayer5!
                                                                  .play());

                                                          logFirebaseEvent(
                                                              'IconButton_custom_action');
                                                          await that_audio_player_oo85ab_actions
                                                              .initializeThatAudioPlayerForPlaylists(
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaAllTab
                                                                .toList(),
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaIndex,
                                                          );
                                                          if (that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .isThatAudioPlayerPlaying) {
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .pauseAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'currentSong':
                                                                    that_audio_player_oo85ab_serialization_util
                                                                        .serializeParam(
                                                                  that_audio_player_oo85ab_app_state
                                                                          .FFAppState()
                                                                      .currentMediaMusicMeditations
                                                                      .elementAtOrNull(
                                                                          that_audio_player_oo85ab_app_state.FFAppState()
                                                                              .currentMediaIndex),
                                                                  that_audio_player_oo85ab_serialization_util
                                                                      .ParamType
                                                                      .DataStruct,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          2),
                                                                ),
                                                              },
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1),
                                                                ),
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'g8s5yq0h' /* Abundant Nature */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .cormorantSc(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'iiafr5es' /* Discover your perfect soundsca... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 2.0)),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        RelaxSoundscapeDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'pageTitle':
                                                              serializeParam(
                                                            'All Soundscapes',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'enut0wqg' /* See all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller:
                                              _model.rowScrollController5,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  child: Builder(
                                                    builder: (context) {
                                                      final featuredForYou =
                                                          that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .currentMediaNatureTab
                                                              .toList();

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            featuredForYou
                                                                .length,
                                                            (featuredForYouIndex) {
                                                          final featuredForYouItem =
                                                              featuredForYou[
                                                                  featuredForYouIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'A_I_SOUNDSCAPES_F_I_N_A_L_SoundscapeCard');
                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_haptic_feedback');
                                                              HapticFeedback
                                                                  .mediumImpact();
                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_play_sound');
                                                              _model.soundPlayer6 ??=
                                                                  AudioPlayer();
                                                              if (_model
                                                                  .soundPlayer6!
                                                                  .playing) {
                                                                await _model
                                                                    .soundPlayer6!
                                                                    .stop();
                                                              }
                                                              _model
                                                                  .soundPlayer6!
                                                                  .setVolume(
                                                                      1.0);
                                                              _model
                                                                  .soundPlayer6!
                                                                  .setAsset(
                                                                      'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                                  .then((_) => _model
                                                                      .soundPlayer6!
                                                                      .play());

                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_custom_action');
                                                              await that_audio_player_oo85ab_actions
                                                                  .initializeThatAudioPlayerForPlaylists(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaNatureTab
                                                                    .toList(),
                                                                featuredForYouIndex,
                                                              );
                                                              if (that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .isThatAudioPlayerPlaying) {
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .pauseAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .seekAudioToValue(
                                                                  0.0,
                                                                  featuredForYouIndex,
                                                                );
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .playAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  $that_audio_player_oo85ab
                                                                      .PlayerPageFINALAllTabWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'currentSong':
                                                                        that_audio_player_oo85ab_serialization_util
                                                                            .serializeParam(
                                                                      featuredForYouItem,
                                                                      that_audio_player_oo85ab_serialization_util
                                                                          .ParamType
                                                                          .DataStruct,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__that_audio_player_oo85ab':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              2),
                                                                    ),
                                                                  },
                                                                );
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .seekAudioToValue(
                                                                  0.0,
                                                                  featuredForYouIndex,
                                                                );
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .playAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  $that_audio_player_oo85ab
                                                                      .PlayerPageFINALAllTabWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__that_audio_player_oo85ab':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1),
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            child:
                                                                SoundscapeCardWidget(
                                                              key: Key(
                                                                  'Keyvte_${featuredForYouIndex}_of_${featuredForYou.length}'),
                                                              genre:
                                                                  featuredForYouItem
                                                                      .genre,
                                                              imgDesc:
                                                                  featuredForYouItem
                                                                      .mediaBanner,
                                                              moodIcon: Icon(
                                                                Icons
                                                                    .water_drop_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 14.0,
                                                              ),
                                                              moodLabel:
                                                                  featuredForYouItem
                                                                      .mood,
                                                              title:
                                                                  featuredForYouItem
                                                                      .mediaTitle,
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 15.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'a7vmgpsd' /* Find Your Mood */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .cormorantSc(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        RelaxSoundscapeDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'pageTitle':
                                                              serializeParam(
                                                            'All Soundscapes',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'r1naqnfz' /* See all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller:
                                              _model.rowScrollController6,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel7,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xDA1C2444),
                                                          icon: Icon(
                                                            Icons.spa_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Melodies to unwind',
                                                          title: 'Relax',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel8,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xAA39519F),
                                                          icon: Icon(
                                                            Icons
                                                                .electric_bolt_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Uplifting rhythms',
                                                          title: 'Energize',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel9,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xFFF09D0C),
                                                          icon: Icon(
                                                            Icons
                                                                .psychology_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Clear your mind',
                                                          title: 'Focus',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '5mmmok3i' /* Lucille's Suggested Soundscape */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.cormorantSc(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 10.0,
                                              sigmaY: 10.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x27FFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 40.0,
                                                    color: Color(0xDFEDF1F7),
                                                    offset: Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                    spreadRadius: 8.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color(0x2FEDF1F7),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Container(
                                                          width: 56.0,
                                                          height: 56.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: _buildMediaBanner(
                                                        that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaMusicMeditations
                                                                .elementAtOrNull(
                                                                    that_audio_player_oo85ab_app_state
                                                                            .FFAppState()
                                                                        .currentMediaIndex)?.mediaBanner,
                                                      ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .elementAtOrNull(
                                                                        that_audio_player_oo85ab_app_state.FFAppState()
                                                                            .currentMediaIndex)
                                                                    ?.mediaTitle,
                                                                'Title',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .elementAtOrNull(
                                                                        that_audio_player_oo85ab_app_state.FFAppState()
                                                                            .currentMediaIndex)
                                                                    ?.mood,
                                                                'Mood',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 2.0)),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 48.0,
                                                        fillColor:
                                                            Colors.transparent,
                                                        icon: Icon(
                                                          Icons
                                                              .play_circle_filled_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          size: 32.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'A_I_SOUNDSCAPES_F_I_N_A_L_IconButton_ON_');
                                                          logFirebaseEvent(
                                                              'IconButton_haptic_feedback');
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          logFirebaseEvent(
                                                              'IconButton_play_sound');
                                                          _model.soundPlayer7 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer7!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer7!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer7!
                                                              .setVolume(1.0);
                                                          _model.soundPlayer7!
                                                              .setAsset(
                                                                  'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                              .then((_) => _model
                                                                  .soundPlayer7!
                                                                  .play());

                                                          logFirebaseEvent(
                                                              'IconButton_custom_action');
                                                          await that_audio_player_oo85ab_actions
                                                              .initializeThatAudioPlayerForPlaylists(
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaAllTab
                                                                .toList(),
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaIndex,
                                                          );
                                                          if (that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .isThatAudioPlayerPlaying) {
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .pauseAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'currentSong':
                                                                    that_audio_player_oo85ab_serialization_util
                                                                        .serializeParam(
                                                                  that_audio_player_oo85ab_app_state
                                                                          .FFAppState()
                                                                      .currentMediaMusicMeditations
                                                                      .elementAtOrNull(
                                                                          that_audio_player_oo85ab_app_state.FFAppState()
                                                                              .currentMediaIndex),
                                                                  that_audio_player_oo85ab_serialization_util
                                                                      .ParamType
                                                                      .DataStruct,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          2),
                                                                ),
                                                              },
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1),
                                                                ),
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'vyzikwib' /* Inner Focus */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .cormorantSc(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ax6d0tch' /* Discover your perfect soundsca... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 2.0)),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        RelaxSoundscapeDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'pageTitle':
                                                              serializeParam(
                                                            'All Soundscapes',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gmm3bxb9' /* See all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller:
                                              _model.rowScrollController7,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  child: Builder(
                                                    builder: (context) {
                                                      final featuredForYou =
                                                          that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .currentMediaFocus
                                                              .toList();

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            featuredForYou
                                                                .length,
                                                            (featuredForYouIndex) {
                                                          final featuredForYouItem =
                                                              featuredForYou[
                                                                  featuredForYouIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'A_I_SOUNDSCAPES_F_I_N_A_L_SoundscapeCard');
                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_haptic_feedback');
                                                              HapticFeedback
                                                                  .mediumImpact();
                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_play_sound');
                                                              _model.soundPlayer8 ??=
                                                                  AudioPlayer();
                                                              if (_model
                                                                  .soundPlayer8!
                                                                  .playing) {
                                                                await _model
                                                                    .soundPlayer8!
                                                                    .stop();
                                                              }
                                                              _model
                                                                  .soundPlayer8!
                                                                  .setVolume(
                                                                      1.0);
                                                              _model
                                                                  .soundPlayer8!
                                                                  .setAsset(
                                                                      'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                                  .then((_) => _model
                                                                      .soundPlayer8!
                                                                      .play());

                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_custom_action');
                                                              await that_audio_player_oo85ab_actions
                                                                  .initializeThatAudioPlayerForPlaylists(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaFocus
                                                                    .toList(),
                                                                featuredForYouIndex,
                                                              );
                                                              if (that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .isThatAudioPlayerPlaying) {
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .pauseAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .seekAudioToValue(
                                                                  0.0,
                                                                  featuredForYouIndex,
                                                                );
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .playAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  $that_audio_player_oo85ab
                                                                      .PlayerPageFINALAllTabWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'currentSong':
                                                                        that_audio_player_oo85ab_serialization_util
                                                                            .serializeParam(
                                                                      featuredForYouItem,
                                                                      that_audio_player_oo85ab_serialization_util
                                                                          .ParamType
                                                                          .DataStruct,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__that_audio_player_oo85ab':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              2),
                                                                    ),
                                                                  },
                                                                );
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .seekAudioToValue(
                                                                  0.0,
                                                                  featuredForYouIndex,
                                                                );
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .playAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  $that_audio_player_oo85ab
                                                                      .PlayerPageFINALAllTabWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__that_audio_player_oo85ab':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1),
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            child:
                                                                SoundscapeCardWidget(
                                                              key: Key(
                                                                  'Keyob4_${featuredForYouIndex}_of_${featuredForYou.length}'),
                                                              genre:
                                                                  featuredForYouItem
                                                                      .genre,
                                                              imgDesc:
                                                                  featuredForYouItem
                                                                      .mediaBanner,
                                                              moodIcon: Icon(
                                                                Icons
                                                                    .water_drop_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 14.0,
                                                              ),
                                                              moodLabel:
                                                                  featuredForYouItem
                                                                      .mood,
                                                              title:
                                                                  featuredForYouItem
                                                                      .mediaTitle,
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 15.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'vc2dzru4' /* Find Your Mood */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .cormorantSc(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        RelaxSoundscapeDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'pageTitle':
                                                              serializeParam(
                                                            'All Soundscapes',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'w1o4c2mn' /* See all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller:
                                              _model.rowScrollController8,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel10,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xDA1C2444),
                                                          icon: Icon(
                                                            Icons.spa_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Melodies to unwind',
                                                          title: 'Relax',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel11,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xAA39519F),
                                                          icon: Icon(
                                                            Icons
                                                                .electric_bolt_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Uplifting rhythms',
                                                          title: 'Energize',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .moodCategoryCardModel12,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            MoodCategoryCardWidget(
                                                          bgColor:
                                                              Color(0xFFF09D0C),
                                                          icon: Icon(
                                                            Icons
                                                                .psychology_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 32.0,
                                                          ),
                                                          subtitle:
                                                              'Clear your mind',
                                                          title: 'Focus',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'soos74c2' /* Lucille's Suggested Soundscape */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.cormorantSc(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 10.0,
                                              sigmaY: 10.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x27FFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 40.0,
                                                    color: Color(0xDFEDF1F7),
                                                    offset: Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                    spreadRadius: 8.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color(0x2FEDF1F7),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Container(
                                                          width: 56.0,
                                                          height: 56.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: _buildMediaBanner(
                                                        that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaMusicMeditations
                                                                .elementAtOrNull(
                                                                    that_audio_player_oo85ab_app_state
                                                                            .FFAppState()
                                                                        .currentMediaIndex)?.mediaBanner,
                                                      ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .elementAtOrNull(
                                                                        that_audio_player_oo85ab_app_state.FFAppState()
                                                                            .currentMediaIndex)
                                                                    ?.mediaTitle,
                                                                'Title',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .elementAtOrNull(
                                                                        that_audio_player_oo85ab_app_state.FFAppState()
                                                                            .currentMediaIndex)
                                                                    ?.mood,
                                                                'Mood',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 2.0)),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 48.0,
                                                        fillColor:
                                                            Colors.transparent,
                                                        icon: Icon(
                                                          Icons
                                                              .play_circle_filled_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          size: 32.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'A_I_SOUNDSCAPES_F_I_N_A_L_IconButton_ON_');
                                                          logFirebaseEvent(
                                                              'IconButton_haptic_feedback');
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          logFirebaseEvent(
                                                              'IconButton_play_sound');
                                                          _model.soundPlayer9 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer9!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer9!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer9!
                                                              .setVolume(1.0);
                                                          _model.soundPlayer9!
                                                              .setAsset(
                                                                  'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                              .then((_) => _model
                                                                  .soundPlayer9!
                                                                  .play());

                                                          logFirebaseEvent(
                                                              'IconButton_custom_action');
                                                          await that_audio_player_oo85ab_actions
                                                              .initializeThatAudioPlayerForPlaylists(
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaAllTab
                                                                .toList(),
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaIndex,
                                                          );
                                                          if (that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .isThatAudioPlayerPlaying) {
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .pauseAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'currentSong':
                                                                    that_audio_player_oo85ab_serialization_util
                                                                        .serializeParam(
                                                                  that_audio_player_oo85ab_app_state
                                                                          .FFAppState()
                                                                      .currentMediaMusicMeditations
                                                                      .elementAtOrNull(
                                                                          that_audio_player_oo85ab_app_state.FFAppState()
                                                                              .currentMediaIndex),
                                                                  that_audio_player_oo85ab_serialization_util
                                                                      .ParamType
                                                                      .DataStruct,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          2),
                                                                ),
                                                              },
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1),
                                                                ),
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'nu4fkvxp' /* Rest and Recharge */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .cormorantSc(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'fv5tfi2n' /* Discover your perfect soundsca... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 2.0)),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        SoundscapesDetailsWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'p071mw35' /* See all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller:
                                              _model.rowScrollController9,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  child: Builder(
                                                    builder: (context) {
                                                      final featuredForYou =
                                                          that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .currentMediaSleepTab
                                                              .toList();

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            featuredForYou
                                                                .length,
                                                            (featuredForYouIndex) {
                                                          final featuredForYouItem =
                                                              featuredForYou[
                                                                  featuredForYouIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'A_I_SOUNDSCAPES_F_I_N_A_L_SoundscapeCard');
                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_haptic_feedback');
                                                              HapticFeedback
                                                                  .mediumImpact();
                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_play_sound');
                                                              _model.soundPlayer10 ??=
                                                                  AudioPlayer();
                                                              if (_model
                                                                  .soundPlayer10!
                                                                  .playing) {
                                                                await _model
                                                                    .soundPlayer10!
                                                                    .stop();
                                                              }
                                                              _model
                                                                  .soundPlayer10!
                                                                  .setVolume(
                                                                      1.0);
                                                              _model
                                                                  .soundPlayer10!
                                                                  .setAsset(
                                                                      'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                                  .then((_) => _model
                                                                      .soundPlayer10!
                                                                      .play());

                                                              logFirebaseEvent(
                                                                  'SoundscapeCard_custom_action');
                                                              await that_audio_player_oo85ab_actions
                                                                  .initializeThatAudioPlayerForPlaylists(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaSleepTab
                                                                    .toList(),
                                                                featuredForYouIndex,
                                                              );
                                                              if (that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .isThatAudioPlayerPlaying) {
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .pauseAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .seekAudioToValue(
                                                                  0.0,
                                                                  featuredForYouIndex,
                                                                );
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .playAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  $that_audio_player_oo85ab
                                                                      .PlayerPageFINALAllTabWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'currentSong':
                                                                        that_audio_player_oo85ab_serialization_util
                                                                            .serializeParam(
                                                                      featuredForYouItem,
                                                                      that_audio_player_oo85ab_serialization_util
                                                                          .ParamType
                                                                          .DataStruct,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__that_audio_player_oo85ab':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              2),
                                                                    ),
                                                                  },
                                                                );
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .seekAudioToValue(
                                                                  0.0,
                                                                  featuredForYouIndex,
                                                                );
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_custom_action');
                                                                await actions
                                                                    .playAudio();
                                                                logFirebaseEvent(
                                                                    'SoundscapeCard_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  $that_audio_player_oo85ab
                                                                      .PlayerPageFINALAllTabWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__that_audio_player_oo85ab':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1),
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            child:
                                                                SoundscapeCardWidget(
                                                              key: Key(
                                                                  'Keyojl_${featuredForYouIndex}_of_${featuredForYou.length}'),
                                                              genre:
                                                                  featuredForYouItem
                                                                      .genre,
                                                              imgDesc:
                                                                  featuredForYouItem
                                                                      .mediaBanner,
                                                              moodIcon: Icon(
                                                                Icons
                                                                    .water_drop_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 14.0,
                                                              ),
                                                              moodLabel:
                                                                  featuredForYouItem
                                                                      .mood,
                                                              title:
                                                                  featuredForYouItem
                                                                      .mediaTitle,
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 15.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'f7ele4mb' /* Find Your Mood */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .cormorantSc(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'A_I_SOUNDSCAPES_F_I_N_A_L_Text_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        SoundscapesDetailsWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1uwyjyo6' /* See all */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller:
                                              _model.rowScrollController10,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'A_I_SOUNDSCAPES_F_I_N_A_L_MoodCategoryCa');
                                                          logFirebaseEvent(
                                                              'MoodCategoryCard_haptic_feedback');
                                                          HapticFeedback
                                                              .heavyImpact();
                                                          logFirebaseEvent(
                                                              'MoodCategoryCard_navigate_to');

                                                          context.pushNamed(
                                                            RelaxSoundscapeDetailsWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'pageTitle':
                                                                  serializeParam(
                                                                'Relax Soundscapes',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .moodCategoryCardModel13,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              MoodCategoryCardWidget(
                                                            bgColor: Color(
                                                                0xDA1C2444),
                                                            icon: Icon(
                                                              Icons.spa_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              size: 32.0,
                                                            ),
                                                            subtitle:
                                                                'Melodies to unwind',
                                                            title: 'Relax',
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'A_I_SOUNDSCAPES_F_I_N_A_L_MoodCategoryCa');
                                                          logFirebaseEvent(
                                                              'MoodCategoryCard_haptic_feedback');
                                                          HapticFeedback
                                                              .heavyImpact();
                                                          logFirebaseEvent(
                                                              'MoodCategoryCard_navigate_to');

                                                          context.pushNamed(
                                                            RelaxSoundscapeDetailsWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'pageTitle':
                                                                  serializeParam(
                                                                'Energize Soundscapes',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .moodCategoryCardModel14,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              MoodCategoryCardWidget(
                                                            bgColor: Color(
                                                                0xAA39519F),
                                                            icon: Icon(
                                                              Icons
                                                                  .electric_bolt_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 32.0,
                                                            ),
                                                            subtitle:
                                                                'Uplifting rhythms',
                                                            title: 'Energize',
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'A_I_SOUNDSCAPES_F_I_N_A_L_MoodCategoryCa');
                                                          logFirebaseEvent(
                                                              'MoodCategoryCard_haptic_feedback');
                                                          HapticFeedback
                                                              .heavyImpact();
                                                          logFirebaseEvent(
                                                              'MoodCategoryCard_navigate_to');

                                                          context.pushNamed(
                                                            RelaxSoundscapeDetailsWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'pageTitle':
                                                                  serializeParam(
                                                                'Focus Soundscapes',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .moodCategoryCardModel15,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              MoodCategoryCardWidget(
                                                            bgColor: Color(
                                                                0xFFF09D0C),
                                                            icon: Icon(
                                                              Icons
                                                                  .psychology_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              size: 32.0,
                                                            ),
                                                            subtitle:
                                                                'Clear your mind',
                                                            title: 'Focus',
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
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '11pk80ij' /* Lucille's Suggested Soundscape */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.cormorantSc(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 10.0,
                                              sigmaY: 10.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x27FFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 40.0,
                                                    color: Color(0xDFEDF1F7),
                                                    offset: Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                    spreadRadius: 8.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color(0x2FEDF1F7),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Container(
                                                          width: 56.0,
                                                          height: 56.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: _buildMediaBanner(
                                                        that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaMusicMeditations
                                                                .elementAtOrNull(
                                                                    that_audio_player_oo85ab_app_state
                                                                            .FFAppState()
                                                                        .currentMediaIndex)?.mediaBanner,
                                                      ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .elementAtOrNull(
                                                                        that_audio_player_oo85ab_app_state.FFAppState()
                                                                            .currentMediaIndex)
                                                                    ?.mediaTitle,
                                                                'Title',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                that_audio_player_oo85ab_app_state
                                                                        .FFAppState()
                                                                    .currentMediaMusicMeditations
                                                                    .elementAtOrNull(
                                                                        that_audio_player_oo85ab_app_state.FFAppState()
                                                                            .currentMediaIndex)
                                                                    ?.mood,
                                                                'Mood',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 2.0)),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 48.0,
                                                        fillColor:
                                                            Colors.transparent,
                                                        icon: Icon(
                                                          Icons
                                                              .play_circle_filled_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          size: 32.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'A_I_SOUNDSCAPES_F_I_N_A_L_IconButton_ON_');
                                                          logFirebaseEvent(
                                                              'IconButton_haptic_feedback');
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          logFirebaseEvent(
                                                              'IconButton_play_sound');
                                                          _model.soundPlayer11 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer11!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer11!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer11!
                                                              .setVolume(1.0);
                                                          _model.soundPlayer11!
                                                              .setAsset(
                                                                  'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                              .then((_) => _model
                                                                  .soundPlayer11!
                                                                  .play());

                                                          logFirebaseEvent(
                                                              'IconButton_custom_action');
                                                          await that_audio_player_oo85ab_actions
                                                              .initializeThatAudioPlayerForPlaylists(
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaAllTab
                                                                .toList(),
                                                            that_audio_player_oo85ab_app_state
                                                                    .FFAppState()
                                                                .currentMediaIndex,
                                                          );
                                                          if (that_audio_player_oo85ab_app_state
                                                                  .FFAppState()
                                                              .isThatAudioPlayerPlaying) {
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .pauseAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'currentSong':
                                                                    that_audio_player_oo85ab_serialization_util
                                                                        .serializeParam(
                                                                  that_audio_player_oo85ab_app_state
                                                                          .FFAppState()
                                                                      .currentMediaMusicMeditations
                                                                      .elementAtOrNull(
                                                                          that_audio_player_oo85ab_app_state.FFAppState()
                                                                              .currentMediaIndex),
                                                                  that_audio_player_oo85ab_serialization_util
                                                                      .ParamType
                                                                      .DataStruct,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          2),
                                                                ),
                                                              },
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .seekAudioToValue(
                                                              0.0,
                                                              that_audio_player_oo85ab_app_state
                                                                      .FFAppState()
                                                                  .currentMediaIndex,
                                                            );
                                                            logFirebaseEvent(
                                                                'IconButton_custom_action');
                                                            await actions
                                                                .playAudio();
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              $that_audio_player_oo85ab
                                                                  .PlayerPageFINALAllTabWidget
                                                                  .routeName,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__that_audio_player_oo85ab':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1),
                                                                ),
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}