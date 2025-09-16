import '/auth/firebase_auth/auth_util.dart';
import '/components/sesson_timeout_warning_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_app_state.dart';
import '/index.dart';
import 'package:music_player_library_jwsrtr/custom_code/widgets/index.dart'
    as music_player_library_jwsrtr_custom_widgets;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'music_player_model.dart';
export 'music_player_model.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({
    super.key,
    this.musicList,
  });

  final List<String>? musicList;

  static String routeName = 'MusicPlayer';
  static String routePath = 'musicPlayer';

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget>
    with TickerProviderStateMixin {
  late MusicPlayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicPlayerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MusicPlayer'});
    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
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
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ii8g6ji5' /* Now Playing */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'The Seasons',
                                        color: Colors.black,
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                                Opacity(
                                  opacity: 0.0,
                                  child: FlutterFlowTimer(
                                    initialTime: _model.timerInitialTimeMs,
                                    getDisplayTime: (value) =>
                                        StopWatchTimer.getDisplayTime(
                                      value,
                                      hours: false,
                                      milliSecond: false,
                                    ),
                                    controller: _model.timerController,
                                    updateStateInterval:
                                        Duration(milliseconds: 900),
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.timerMilliseconds = value;
                                      _model.timerValue = displayTime;
                                      if (shouldUpdate) safeSetState(() {});
                                    },
                                    onEnded: () async {
                                      logFirebaseEvent(
                                          'MUSIC_PLAYER_Timer_4utp47kd_ON_TIMER_END');
                                      if ((functions
                                                  .getMinutesSinceDateTimelastActivity(
                                                      FFAppState().lastActivity)
                                                  .toString() ==
                                              '30') &&
                                          valueOrDefault<bool>(
                                            FFAppState().showTimeoutWarning,
                                            true,
                                          )) {
                                        logFirebaseEvent(
                                            'Timer_update_app_state');
                                        FFAppState().showTimeoutWarning = true;
                                        FFAppState().update(() {});
                                        logFirebaseEvent('Timer_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    SessonTimeoutWarningWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        return;
                                      }

                                      if (functions
                                              .getMinutesSinceDateTimelastActivity(
                                                  FFAppState().lastActivity)
                                              .toString() ==
                                          '29') {
                                        logFirebaseEvent('Timer_auth');
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();
                                      } else {
                                        return;
                                      }

                                      context.goNamedAuth(
                                          SplashScreenVersion4Widget.routeName,
                                          context.mounted);
                                    },
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'WorkSans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MUSIC_PLAYER_PAGE_Image_mq1vig8d_ON_TAP');
                                        logFirebaseEvent('Image_navigate_to');

                                        context.pushNamed(
                                            HomeVersion4Widget.routeName);
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Rectangle_1.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'imageOnPageLoadAnimation']!),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    background: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                    titlePadding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                  ),
                  elevation: 0.0,
                ),
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  child: music_player_library_jwsrtr_custom_widgets
                      .AdvanceMusicPlayer(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.9,
                    initialUrl: '',
                    sliderActiveColor: FlutterFlowTheme.of(context).accent1,
                    sliderInactiveColor: FlutterFlowTheme.of(context).alternate,
                    backwardIconPath: FaIcon(
                      FontAwesomeIcons.backward,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 22.0,
                    ),
                    forwardIconPath: Icon(
                      FFIcons.kfastForward,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 22.0,
                    ),
                    backwardIconColor: FlutterFlowTheme.of(context).accent1,
                    forwardIconColor: FlutterFlowTheme.of(context).accent1,
                    pauseIconPath: Icon(
                      Icons.pause,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 22.0,
                    ),
                    playIconPath: Icon(
                      Icons.play_circle_outline,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 22.0,
                    ),
                    pauseIconColor: FlutterFlowTheme.of(context).accent1,
                    playIconColor: FlutterFlowTheme.of(context).accent1,
                    loopIconPath: Icon(
                      Icons.loop_outlined,
                    ),
                    loopIconColor: FlutterFlowTheme.of(context).alternate,
                    shuffleIconPath: Icon(
                      FFIcons.kshuffle1,
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                    shuffleIconColor: FlutterFlowTheme.of(context).tertiary,
                    playbackDurationTextColor:
                        FlutterFlowTheme.of(context).accent1,
                    previousIconPath: Icon(
                      Icons.skip_previous,
                    ),
                    nextIconPath: Icon(
                      Icons.skip_next_sharp,
                    ),
                    previousIconColor: FlutterFlowTheme.of(context).accent1,
                    nextIconColor: FlutterFlowTheme.of(context).accent1,
                    loopIconPressedPath: Icon(
                      Icons.loop_sharp,
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                    shuffleIconPressedPath: Icon(
                      Icons.shuffle_on_rounded,
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                    speakerOnIconPath: Icon(
                      Icons.speaker_phone,
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                    speakerOffIconPath: Icon(
                      Icons.speaker_sharp,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    speakerOnIconColor: FlutterFlowTheme.of(context).tertiary,
                    speakerOffIconColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    dropdownTextColor: FlutterFlowTheme.of(context).alternate,
                    timerIcon: Icon(
                      Icons.timer,
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 22.0,
                    ),
                    musicUrls: widget.musicList!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
