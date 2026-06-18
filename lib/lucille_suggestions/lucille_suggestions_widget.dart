import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/lucille_suggestion_description_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:swipe_button_e4yciw/custom_code/widgets/index.dart'
    as swipe_button_e4yciw_custom_widgets;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lucille_suggestions_model.dart';
export 'lucille_suggestions_model.dart';

class LucilleSuggestionsWidget extends StatefulWidget {
  const LucilleSuggestionsWidget({super.key});

  static String routeName = 'LucilleSuggestions';
  static String routePath = '/lucilleSuggestions';

  @override
  State<LucilleSuggestionsWidget> createState() =>
      _LucilleSuggestionsWidgetState();
}

class _LucilleSuggestionsWidgetState extends State<LucilleSuggestionsWidget>
    with TickerProviderStateMixin {
  late LucilleSuggestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleSuggestionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LucilleSuggestions'});
    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 150.0.ms,
            duration: 120.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'blurOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 210.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 310.0.ms,
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
            delay: 0.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
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
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1370.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1550.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 150.0.ms,
            duration: 120.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'blurOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 210.0.ms,
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
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
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
      'containerOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1370.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1550.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 150.0.ms,
            duration: 120.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'blurOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 210.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation13': AnimationInfo(
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
      'containerOnPageLoadAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1370.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation15': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1550.0.ms,
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: Stack(
                  children: [
                    PageView(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      onPageChanged: (_) => safeSetState(() {}),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 173.6,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Image.network(
                                'https://images.unsplash.com/photo-1713428856219-20e151269843?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxjYWxtJTIwYnJlYXRoaW5nfGVufDB8fHx8MTc3NDI5NTIzOXww&ixlib=rb-4.1.0&q=80&w=1080',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment(0.0, 0.0),
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation1']!),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 1.0,
                                      sigmaY: 1.0,
                                    ),
                                    child: Container(
                                      width: 109.6,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            Color(0x88D0E3F7),
                                            FlutterFlowTheme.of(context)
                                                .alternate
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Container(
                                              width: 370.4,
                                              height: 129.5,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 50.0,
                                                          15.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.111,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x33FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0x59EDF1F7),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      12.0,
                                                                      20.0,
                                                                      12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'uht3aerj' /* Good morning ✨ */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.cormorantSc(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'textOnPageLoadAnimation1']!),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        6.0)),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'acfhvhmu' /* Your Suggested Exercise: */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'textOnPageLoadAnimation2']!),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
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
                                                              'LUCILLE_SUGGESTIONS_Container_dg6joi7d_O');
                                                          logFirebaseEvent(
                                                              'Container_haptic_feedback');
                                                          HapticFeedback
                                                              .heavyImpact();
                                                          logFirebaseEvent(
                                                              'Container_play_sound');
                                                          _model.soundPlayer1 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer1!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer1!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer1!
                                                              .setVolume(1.0);
                                                          _model.soundPlayer1!
                                                              .setAsset(
                                                                  'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                              .then((_) => _model
                                                                  .soundPlayer1!
                                                                  .play());

                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            HomeVersion5Widget
                                                                .routeName,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .topToBottom,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        3),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 44.0,
                                                          height: 44.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x33FFFFFF),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    20.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                offset: Offset(
                                                                  0.0,
                                                                  0.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        22.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color:
                                                                  Colors.white,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation2']!),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              curve: Curves.easeOut,
                                              decoration: BoxDecoration(
                                                color: Color(0x8039519F),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 40.0,
                                                    color: Color(0x60FCC462),
                                                    offset: Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                    spreadRadius: 5.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                border: Border.all(
                                                  color: Color(0x56EDF1F7),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 16.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 32.0,
                                                        height: 32.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: Image.asset(
                                                              'assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png',
                                                            ).image,
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 20.0,
                                                              color: Color(
                                                                  0xFFD0E3F7),
                                                              offset: Offset(
                                                                0.0,
                                                                0.0,
                                                              ),
                                                              spreadRadius:
                                                                  10.0,
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ajnk2arx' /* Lucille's Pick For You */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .cormorantSc(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation3']!),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 220.0, 0.0, 0.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: FFAppState()
                                                      .lucilleSuggestedExercises(
                                                    requestFn: () =>
                                                        LucilleTherapyExercisesGroup
                                                            .recommendedExercisesCall
                                                            .call(
                                                      limit: 3,
                                                      userID: currentUserUid,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          child: SpinKitWave(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            size: 100.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final columnRecommendedExercisesResponse =
                                                        snapshot.data!;

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.27,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x7939519F),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0x6DEDF1F7),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          15.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x33FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              6.0,
                                                                              10.0,
                                                                              6.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                  .modality(
                                                                                    columnRecommendedExercisesResponse.jsonBody,
                                                                                  )
                                                                                  ?.firstOrNull,
                                                                              'Mind',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      LucilleTherapyExercisesGroup
                                                                          .recommendedExercisesCall
                                                                          .title(
                                                                            columnRecommendedExercisesResponse.jsonBody,
                                                                          )
                                                                          ?.firstOrNull,
                                                                      'Calm Breathing',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.cormorantSc(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        LucilleTherapyExercisesGroup
                                                                            .recommendedExercisesCall
                                                                            .description(
                                                                              columnRecommendedExercisesResponse.jsonBody,
                                                                            )
                                                                            ?.firstOrNull,
                                                                        'A gentle breathing exercise to help focus your mind and body.',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFFEEEEFF),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .fade,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x33FFFFFF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0x6ED0E3F7),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          6.0,
                                                                          12.0,
                                                                          6.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.access_time_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                  .duration(
                                                                                    columnRecommendedExercisesResponse.jsonBody,
                                                                                  )
                                                                                  ?.firstOrNull
                                                                                  ?.toString(),
                                                                              'None',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation4']!),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x33FFFFFF),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        20.0,
                                                                    color: Color(
                                                                        0xFFD0E3F7),
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
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        16.0,
                                                                        20.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'uw5atc2i' /* Why this session? */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                    ),
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
                                                                            'LUCILLE_SUGGESTIONS_Icon_qztgqkvu_ON_TAP');
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
                                                                            return WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.4,
                                                                                    child: LucilleSuggestionDescriptionCompWidget(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_up_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation5']!),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
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
                                                                  'LUCILLE_SUGGESTIONS_Container_pc8w76t4_O');
                                                              var _shouldSetState =
                                                                  false;
                                                              logFirebaseEvent(
                                                                  'Swipeable_haptic_feedback');
                                                              HapticFeedback
                                                                  .heavyImpact();
                                                              logFirebaseEvent(
                                                                  'Swipeable_play_sound');
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
                                                                  .setVolume(
                                                                      1.0);
                                                              await _model
                                                                  .soundPlayer2!
                                                                  .setAsset(
                                                                      'assets/audios/universfield-interface-soft-click-131438.mp3')
                                                                  .then((_) => _model
                                                                      .soundPlayer2!
                                                                      .play());

                                                              logFirebaseEvent(
                                                                  'Swipeable_backend_call');
                                                              _model.recommendedSoundscapes =
                                                                  await LucilleSoundscapesGroup
                                                                      .recommendedSoundscapesCall
                                                                      .call(
                                                                emotion: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.currentMood,
                                                                    ''),
                                                                exerciseID:
                                                                    FFAppState()
                                                                        .activeExerciseSessionID,
                                                                userID:
                                                                    currentUserUid,
                                                              );

                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .recommendedSoundscapes
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                logFirebaseEvent(
                                                                    'Swipeable_backend_call');
                                                                _model.getSoundscape =
                                                                    await LucilleSoundscapesGroup
                                                                        .getSoundscapeCall
                                                                        .call();

                                                                _shouldSetState =
                                                                    true;
                                                              } else {
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              logFirebaseEvent(
                                                                  'Swipeable_navigate_to');

                                                              context.pushNamed(
                                                                LucilleSuggestionPageWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'exerciseTitle':
                                                                      serializeParam(
                                                                    LucilleTherapyExercisesGroup
                                                                        .recommendedExercisesCall
                                                                        .title(
                                                                          columnRecommendedExercisesResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.firstOrNull,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'exerciseDescription':
                                                                      serializeParam(
                                                                    LucilleTherapyExercisesGroup
                                                                        .recommendedExercisesCall
                                                                        .description(
                                                                          columnRecommendedExercisesResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.firstOrNull,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'exerciseDuration':
                                                                      serializeParam(
                                                                    LucilleTherapyExercisesGroup
                                                                        .recommendedExercisesCall
                                                                        .duration(
                                                                          columnRecommendedExercisesResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.firstOrNull
                                                                        ?.toDouble(),
                                                                    ParamType
                                                                        .double,
                                                                  ),
                                                                  'exersiseSoundscape':
                                                                      serializeParam(
                                                                    LucilleSoundscapesGroup
                                                                        .getSoundscapeCall
                                                                        .audioUrl(
                                                                          (_model.getSoundscape?.jsonBody ??
                                                                              ''),
                                                                        )
                                                                        ?.firstOrNull,
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
                                                                            .rightToLeft,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            2),
                                                                  ),
                                                                },
                                                              );

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.1,
                                                              child:
                                                                  swipe_button_e4yciw_custom_widgets
                                                                      .Swipeable(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation1']!),
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['blurOnPageLoadAnimation1']!),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 874.4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/bf96634860de987cbec653483b4500e6.gif',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    alignment: Alignment(0.0, 0.0),
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation2']!),
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 1.0,
                                          sigmaY: 1.0,
                                        ),
                                        child: Container(
                                          width: 109.6,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                Color(0x88D0E3F7),
                                                FlutterFlowTheme.of(context)
                                                    .alternate
                                              ],
                                              stops: [0.0, 0.5, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -0.64),
                                              end: AlignmentDirectional(
                                                  -1.0, 0.64),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Container(
                                                  width: 370.4,
                                                  height: 129.5,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  50.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.111,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x33FFFFFF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0x59EDF1F7),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          12.0,
                                                                          20.0,
                                                                          12.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '4lrm84op' /* Good morning ✨ */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'The Seasons',
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'textOnPageLoadAnimation3']!),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'jkhnkmdh' /* Your Suggested Exercise: */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'textOnPageLoadAnimation4']!),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
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
                                                                  'LUCILLE_SUGGESTIONS_Container_j9bxaruc_O');
                                                              logFirebaseEvent(
                                                                  'Container_haptic_feedback');
                                                              HapticFeedback
                                                                  .mediumImpact();
                                                              logFirebaseEvent(
                                                                  'Container_play_sound');
                                                              _model.soundPlayer3 ??=
                                                                  AudioPlayer();
                                                              if (_model
                                                                  .soundPlayer3!
                                                                  .playing) {
                                                                await _model
                                                                    .soundPlayer3!
                                                                    .stop();
                                                              }
                                                              _model
                                                                  .soundPlayer3!
                                                                  .setVolume(
                                                                      1.0);
                                                              _model
                                                                  .soundPlayer3!
                                                                  .setAsset(
                                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                                  .then((_) => _model
                                                                      .soundPlayer3!
                                                                      .play());

                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                HomeVersion5Widget
                                                                    .routeName,
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
                                                                            3),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x33FFFFFF),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        20.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
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
                                                                            22.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation7']!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.easeOut,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x8039519F),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 40.0,
                                                        color:
                                                            Color(0x60FCC462),
                                                        offset: Offset(
                                                          0.0,
                                                          0.0,
                                                        ),
                                                        spreadRadius: 5.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    border: Border.all(
                                                      color: Color(0x56EDF1F7),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png',
                                                                ).image,
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      20.0,
                                                                  color: Color(
                                                                      0xFFD0E3F7),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    0.0,
                                                                  ),
                                                                  spreadRadius:
                                                                      10.0,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'sodcx31d' /* Lucille's Pick For You */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation8']!),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                220.0,
                                                                0.0,
                                                                0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: _model
                                                          .suggestionCache(
                                                        requestFn: () =>
                                                            LucilleTherapyExercisesGroup
                                                                .recommendedExercisesCall
                                                                .call(
                                                          limit: 3,
                                                          userID:
                                                              currentUserUid,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              child:
                                                                  SpinKitWave(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                size: 100.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final columnRecommendedExercisesResponse =
                                                            snapshot.data!;

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          15.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.27,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x59D0E3F7),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0x6DEDF1F7),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Flexible(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x33FFFFFF),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    LucilleTherapyExercisesGroup.recommendedExercisesCall.detectedIntent(
                                                                                      columnRecommendedExercisesResponse.jsonBody,
                                                                                    ),
                                                                                    'Mind',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          LucilleTherapyExercisesGroup
                                                                              .recommendedExercisesCall
                                                                              .title(
                                                                                columnRecommendedExercisesResponse.jsonBody,
                                                                              )
                                                                              ?.elementAtOrNull(5),
                                                                          'Calm Breathing',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Flexible(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                .description(
                                                                                  columnRecommendedExercisesResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(5),
                                                                            'A gentle breathing exercise to help focus your mind and body.',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFFEEEEFF),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.fade,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x33FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0x6ED0E3F7),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              6.0,
                                                                              12.0,
                                                                              6.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.access_time_rounded,
                                                                                color: Colors.white,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                      .reason(
                                                                                        columnRecommendedExercisesResponse.jsonBody,
                                                                                      )
                                                                                      ?.sortedList(
                                                                                          keyOf: (e) => LucilleTherapyExercisesGroup.recommendedExercisesCall.detectedEmotion(
                                                                                                columnRecommendedExercisesResponse.jsonBody,
                                                                                              )!,
                                                                                          desc: true)
                                                                                      .elementAtOrNull(3),
                                                                                  'Reason',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation9']!),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x33FFFFFF),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            20.0,
                                                                        color: Color(
                                                                            0xFFD0E3F7),
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
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            16.0,
                                                                            20.0,
                                                                            16.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'kgn6w9ex' /* Why this session? */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
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
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('LUCILLE_SUGGESTIONS_Icon_j61wizad_ON_TAP');
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
                                                                                      child: Container(
                                                                                        height: MediaQuery.sizeOf(context).height * 0.4,
                                                                                        child: LucilleSuggestionDescriptionCompWidget(),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_up_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation10']!),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'LUCILLE_SUGGESTIONS_Container_zkufhx3b_O');
                                                                  var _shouldSetState =
                                                                      false;
                                                                  logFirebaseEvent(
                                                                      'Swipeable_haptic_feedback');
                                                                  HapticFeedback
                                                                      .heavyImpact();
                                                                  logFirebaseEvent(
                                                                      'Swipeable_play_sound');
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
                                                                  await _model
                                                                      .soundPlayer4!
                                                                      .setAsset(
                                                                          'assets/audios/universfield-interface-soft-click-131438.mp3')
                                                                      .then((_) => _model
                                                                          .soundPlayer4!
                                                                          .play());

                                                                  logFirebaseEvent(
                                                                      'Swipeable_backend_call');
                                                                  _model.recommendedSoundscapes62 =
                                                                      await LucilleSoundscapesGroup
                                                                          .recommendedSoundscapesCall
                                                                          .call(
                                                                    emotion: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.currentMood,
                                                                        ''),
                                                                    exerciseID:
                                                                        FFAppState()
                                                                            .activeExerciseSessionID,
                                                                    userID:
                                                                        currentUserUid,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .recommendedSoundscapes
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'Swipeable_backend_call');
                                                                    _model.getSoundscape3 =
                                                                        await LucilleSoundscapesGroup
                                                                            .getSoundscapeCall
                                                                            .call();

                                                                    _shouldSetState =
                                                                        true;
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'Swipeable_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    LucilleSuggestionPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'exerciseTitle':
                                                                          serializeParam(
                                                                        LucilleTherapyExercisesGroup
                                                                            .recommendedExercisesCall
                                                                            .title(
                                                                              columnRecommendedExercisesResponse.jsonBody,
                                                                            )
                                                                            ?.elementAtOrNull(2),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'exerciseDescription':
                                                                          serializeParam(
                                                                        LucilleTherapyExercisesGroup
                                                                            .recommendedExercisesCall
                                                                            .description(
                                                                              columnRecommendedExercisesResponse.jsonBody,
                                                                            )
                                                                            ?.elementAtOrNull(1),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'exerciseDuration':
                                                                          serializeParam(
                                                                        (LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                .duration(
                                                                                  columnRecommendedExercisesResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(2))
                                                                            ?.toDouble(),
                                                                        ParamType
                                                                            .double,
                                                                      ),
                                                                      'exersiseSoundscape':
                                                                          serializeParam(
                                                                        LucilleSoundscapesGroup
                                                                            .getSoundscapeCall
                                                                            .audioUrl(
                                                                              (_model.getSoundscape?.jsonBody ?? ''),
                                                                            )
                                                                            ?.firstOrNull,
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
                                                                            PageTransitionType.rightToLeft,
                                                                        duration:
                                                                            Duration(milliseconds: 2),
                                                                      ),
                                                                    },
                                                                  );

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.1,
                                                                  child: swipe_button_e4yciw_custom_widgets
                                                                      .Swipeable(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.1,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation6']!),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'blurOnPageLoadAnimation2']!),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 876.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/dbc134076bdc297451e61e49a8caec19.gif',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    alignment: Alignment(0.0, 0.0),
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation3']!),
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 1.0,
                                          sigmaY: 1.0,
                                        ),
                                        child: Container(
                                          width: 109.6,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                Color(0x88D0E3F7),
                                                FlutterFlowTheme.of(context)
                                                    .alternate
                                              ],
                                              stops: [0.0, 0.5, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -0.64),
                                              end: AlignmentDirectional(
                                                  -1.0, 0.64),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Container(
                                                  width: 370.4,
                                                  height: 129.5,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  50.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.111,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x33FFFFFF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0x59EDF1F7),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          12.0,
                                                                          20.0,
                                                                          12.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'fwez2cfm' /* Good morning ✨ */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'The Seasons',
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'textOnPageLoadAnimation5']!),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'xq4yqiuq' /* Your Suggested Exercise: */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'textOnPageLoadAnimation6']!),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
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
                                                                  'LUCILLE_SUGGESTIONS_Container_bruqrwo7_O');
                                                              logFirebaseEvent(
                                                                  'Container_haptic_feedback');
                                                              HapticFeedback
                                                                  .heavyImpact();
                                                              logFirebaseEvent(
                                                                  'Container_play_sound');
                                                              _model.soundPlayer5 ??=
                                                                  AudioPlayer();
                                                              if (_model
                                                                  .soundPlayer5!
                                                                  .playing) {
                                                                await _model
                                                                    .soundPlayer5!
                                                                    .stop();
                                                              }
                                                              _model
                                                                  .soundPlayer5!
                                                                  .setVolume(
                                                                      1.0);
                                                              _model
                                                                  .soundPlayer5!
                                                                  .setAsset(
                                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                                  .then((_) => _model
                                                                      .soundPlayer5!
                                                                      .play());

                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                HomeVersion5Widget
                                                                    .routeName,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  '__transition_info__':
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .topToBottom,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x33FFFFFF),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        20.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
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
                                                                            22.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation12']!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.easeOut,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x8039519F),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 40.0,
                                                        color:
                                                            Color(0x60FCC462),
                                                        offset: Offset(
                                                          0.0,
                                                          0.0,
                                                        ),
                                                        spreadRadius: 5.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    border: Border.all(
                                                      color: Color(0x56EDF1F7),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png',
                                                                ).image,
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      20.0,
                                                                  color: Color(
                                                                      0xFFD0E3F7),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    0.0,
                                                                  ),
                                                                  spreadRadius:
                                                                      10.0,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '7gn3b274' /* Lucille's Pick For You */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation13']!),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                220.0,
                                                                0.0,
                                                                0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: _model
                                                          .suggestionCache(
                                                        requestFn: () =>
                                                            LucilleTherapyExercisesGroup
                                                                .recommendedExercisesCall
                                                                .call(
                                                          limit: 3,
                                                          userID:
                                                              currentUserUid,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              child:
                                                                  SpinKitWave(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                size: 100.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final columnRecommendedExercisesResponse =
                                                            snapshot.data!;

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          15.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.27,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x7939519F),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0x6DEDF1F7),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Flexible(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x33FFFFFF),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    LucilleTherapyExercisesGroup.recommendedExercisesCall.detectedIntent(
                                                                                      columnRecommendedExercisesResponse.jsonBody,
                                                                                    ),
                                                                                    'Mind',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                  overflow: TextOverflow.fade,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          LucilleTherapyExercisesGroup
                                                                              .recommendedExercisesCall
                                                                              .title(
                                                                                columnRecommendedExercisesResponse.jsonBody,
                                                                              )
                                                                              ?.elementAtOrNull(3),
                                                                          'Calm Breathing',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                            ),
                                                                        overflow:
                                                                            TextOverflow.fade,
                                                                      ),
                                                                      Flexible(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                .description(
                                                                                  columnRecommendedExercisesResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(3),
                                                                            'A gentle breathing exercise to help focus your mind and body.',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFFEEEEFF),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.fade,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x33FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0x6ED0E3F7),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              6.0,
                                                                              12.0,
                                                                              6.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.access_time_rounded,
                                                                                color: Colors.white,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  (LucilleTherapyExercisesGroup.recommendedExercisesCall.reason(
                                                                                                columnRecommendedExercisesResponse.jsonBody,
                                                                                              ) !=
                                                                                              null &&
                                                                                          (LucilleTherapyExercisesGroup.recommendedExercisesCall.reason(
                                                                                            columnRecommendedExercisesResponse.jsonBody,
                                                                                          ))!
                                                                                              .isNotEmpty)
                                                                                      .toString(),
                                                                                  'Reason',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation14']!),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x33FFFFFF),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            20.0,
                                                                        color: Color(
                                                                            0xFFD0E3F7),
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
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            16.0,
                                                                            20.0,
                                                                            16.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '4etpq4ye' /* Why this session? */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
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
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('LUCILLE_SUGGESTIONS_Icon_yrk5ahwe_ON_TAP');
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
                                                                                      child: Container(
                                                                                        height: MediaQuery.sizeOf(context).height * 0.4,
                                                                                        child: LucilleSuggestionDescriptionCompWidget(),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_up_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation15']!),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'LUCILLE_SUGGESTIONS_Container_nsykr12v_O');
                                                                  var _shouldSetState =
                                                                      false;
                                                                  logFirebaseEvent(
                                                                      'Swipeable_haptic_feedback');
                                                                  HapticFeedback
                                                                      .heavyImpact();
                                                                  logFirebaseEvent(
                                                                      'Swipeable_play_sound');
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
                                                                  await _model
                                                                      .soundPlayer6!
                                                                      .setAsset(
                                                                          'assets/audios/universfield-interface-soft-click-131438.mp3')
                                                                      .then((_) => _model
                                                                          .soundPlayer6!
                                                                          .play());

                                                                  logFirebaseEvent(
                                                                      'Swipeable_backend_call');
                                                                  _model.recommendedSoundscapes4 =
                                                                      await LucilleSoundscapesGroup
                                                                          .recommendedSoundscapesCall
                                                                          .call(
                                                                    emotion: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.currentMood,
                                                                        ''),
                                                                    exerciseID:
                                                                        FFAppState()
                                                                            .activeExerciseSessionID,
                                                                    userID:
                                                                        currentUserUid,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .recommendedSoundscapes
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'Swipeable_backend_call');
                                                                    _model.getSoundscape2 =
                                                                        await LucilleSoundscapesGroup
                                                                            .getSoundscapeCall
                                                                            .call();

                                                                    _shouldSetState =
                                                                        true;
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'Swipeable_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    LucilleSuggestionPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'exerciseTitle':
                                                                          serializeParam(
                                                                        LucilleTherapyExercisesGroup
                                                                            .recommendedExercisesCall
                                                                            .title(
                                                                              columnRecommendedExercisesResponse.jsonBody,
                                                                            )
                                                                            ?.elementAtOrNull(1),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'exerciseDescription':
                                                                          serializeParam(
                                                                        LucilleTherapyExercisesGroup
                                                                            .recommendedExercisesCall
                                                                            .description(
                                                                              columnRecommendedExercisesResponse.jsonBody,
                                                                            )
                                                                            ?.elementAtOrNull(1),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'exerciseDuration':
                                                                          serializeParam(
                                                                        (LucilleTherapyExercisesGroup.recommendedExercisesCall
                                                                                .duration(
                                                                                  columnRecommendedExercisesResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(1))
                                                                            ?.toDouble(),
                                                                        ParamType
                                                                            .double,
                                                                      ),
                                                                      'exersiseSoundscape':
                                                                          serializeParam(
                                                                        LucilleSoundscapesGroup
                                                                            .getSoundscapeCall
                                                                            .audioUrl(
                                                                              (_model.getSoundscape?.jsonBody ?? ''),
                                                                            )
                                                                            ?.firstOrNull,
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
                                                                            PageTransitionType.rightToLeft,
                                                                        duration:
                                                                            Duration(milliseconds: 2),
                                                                      ),
                                                                    },
                                                                  );

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.1,
                                                                  child: swipe_button_e4yciw_custom_widgets
                                                                      .Swipeable(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.1,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation11']!),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'blurOnPageLoadAnimation3']!),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            5.0, 10.0, 5.0, 175.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 3,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 8.0,
                            radius: 8.0,
                            dotWidth: 8.0,
                            dotHeight: 8.0,
                            dotColor: FlutterFlowTheme.of(context).secondary,
                            activeDotColor:
                                FlutterFlowTheme.of(context).accent3,
                            paintStyle: PaintingStyle.stroke,
                          ),
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
