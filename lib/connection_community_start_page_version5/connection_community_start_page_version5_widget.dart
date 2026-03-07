import '/auth/firebase_auth/auth_util.dart';
import '/components/influencer_ambassador_program_button_widget.dart';
import '/components/lucille_help_comp_widget.dart';
import '/components/marketplace_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import "package:that_audio_player_oo85ab/flutter_flow/nav/serialization_util.dart"
    as that_audio_player_oo85ab_serialization_util;
import '/custom_code/actions/index.dart' as actions;
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
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'connection_community_start_page_version5_model.dart';
export 'connection_community_start_page_version5_model.dart';

class ConnectionCommunityStartPageVersion5Widget extends StatefulWidget {
  const ConnectionCommunityStartPageVersion5Widget({super.key});

  static String routeName = 'ConnectionCommunityStartPageVersion5';
  static String routePath = 'connectionCommunityStartPageVersion5';

  @override
  State<ConnectionCommunityStartPageVersion5Widget> createState() =>
      _ConnectionCommunityStartPageVersion5WidgetState();
}

class _ConnectionCommunityStartPageVersion5WidgetState
    extends State<ConnectionCommunityStartPageVersion5Widget>
    with TickerProviderStateMixin {
  late ConnectionCommunityStartPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ConnectionCommunityStartPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConnectionCommunityStartPageVersion5'});
    _model.tabBarController1 = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController1!.indexIsChanging) {
          return;
        }

        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_TabB');
        logFirebaseEvent('TabBar_haptic_feedback');
        HapticFeedback.lightImpact();
        logFirebaseEvent('TabBar_play_sound');
        _model.soundPlayer1 ??= AudioPlayer();
        if (_model.soundPlayer1!.playing) {
          await _model.soundPlayer1!.stop();
        }
        _model.soundPlayer1!.setVolume(0.68);
        _model.soundPlayer1!
            .setAsset(
                'assets/audios/ES_Pops,_Wobble,_Bloop,_Pops_-_Epidemic_Sound.mp3')
            .then((_) => _model.soundPlayer1!.play());
      });

    _model.tabBarController2 = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController2!.indexIsChanging) {
          return;
        }

        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_TabB');
        logFirebaseEvent('TabBar_haptic_feedback');
        HapticFeedback.lightImpact();
        logFirebaseEvent('TabBar_play_sound');
        _model.soundPlayer3 ??= AudioPlayer();
        if (_model.soundPlayer3!.playing) {
          await _model.soundPlayer3!.stop();
        }
        _model.soundPlayer3!.setVolume(0.73);
        _model.soundPlayer3!
            .setAsset(
                'assets/audios/ES_Futuristic_Technology,_UI_Confirm_Tone,_Bright_02_-_Epidemic_Sound_-_3410-4218.wav')
            .then((_) => _model.soundPlayer3!.play());
      });

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 10.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 10.0.ms,
            duration: 1580.0.ms,
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 875.09,
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
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 874.61,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1).gif',
                            ).image,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xD2FFFFFF),
                                            Color(0xC3D0E3F7)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 50.0, 0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment(0.0, 0),
                                                  child: TabBar(
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    labelPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .override(
                                                      fontFamily: 'WorkSans',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      shadows: [
                                                        Shadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          offset:
                                                              Offset(15.0, 2.0),
                                                          blurRadius: 8.0,
                                                        )
                                                      ],
                                                    ),
                                                    unselectedLabelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.5,
                                                            ),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    indicatorWeight: 5.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(50.0, 0.0,
                                                                50.0, 0.0),
                                                    tabs: [
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'bs8kxrz1' /* For You */,
                                                        ),
                                                        iconMargin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'fj9969do' /* Breathing */,
                                                        ),
                                                        iconMargin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'pakyaq75' /* Soundscapes */,
                                                        ),
                                                        iconMargin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'a2ddepb8' /* Body */,
                                                        ),
                                                      ),
                                                    ],
                                                    controller: _model
                                                        .tabBarController1,
                                                    onTap: (i) async {
                                                      [
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
                                                    controller: _model
                                                        .tabBarController1,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.82,
                                                            child:
                                                                tiktokfeed_wz8en7_custom_widgets
                                                                    .ChewieWidget(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.82,
                                                              userID:
                                                                  currentUserUid,
                                                              data: tiktokfeed_wz8en7_app_state
                                                                      .FFAppState()
                                                                  .meditationTikToks,
                                                              likerebuidpage:
                                                                  () async {},
                                                              bookedrebuidpage:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.9,
                                                            child:
                                                                tiktokfeed_wz8en7_custom_widgets
                                                                    .ChewieWidget(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.9,
                                                              userID:
                                                                  currentUserUid,
                                                              data: tiktokfeed_wz8en7_app_state
                                                                      .FFAppState()
                                                                  .BreathingTikTok,
                                                              likerebuidpage:
                                                                  () async {},
                                                              bookedrebuidpage:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Stack(
                                                        children: [
                                                          SingleChildScrollView(
                                                            controller: _model
                                                                .columnController1,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Opacity(
                                                                      opacity:
                                                                          0.5,
                                                                      child:
                                                                          Hero(
                                                                        tag: valueOrDefault<
                                                                            String>(
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
                                                                          'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)%20(2).gif?alt=media&token=373daaa0-a029-49d1-9c24-b59c6d69e0d9',
                                                                        ),
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 1700),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 1700),
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
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
                                                                              'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)%20(2).gif?alt=media&token=373daaa0-a029-49d1-9c24-b59c6d69e0d9',
                                                                            ),
                                                                            width:
                                                                                409.6,
                                                                            height:
                                                                                876.8,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['imageOnPageLoadAnimation1']!),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          877.6,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0x21673AB7),
                                                                            Color(0x3F39519F),
                                                                            Color(0x87673AB7)
                                                                          ],
                                                                          stops: [
                                                                            0.0,
                                                                            0.5,
                                                                            1.0
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              1.0,
                                                                              -0.98),
                                                                          end: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.98),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                5.0,
                                                                            sigmaY:
                                                                                5.0,
                                                                          ),
                                                                          child:
                                                                              Stack(
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
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
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
                                                                                                  'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)%20(2).gif?alt=media&token=373daaa0-a029-49d1-9c24-b59c6d69e0d9',
                                                                                                ),
                                                                                                width: 409.6,
                                                                                                height: 924.8,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                                                                                          ),
                                                                                          Stack(
                                                                                            alignment: AlignmentDirectional(0.0, 1.0),
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 1.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 872.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      gradient: LinearGradient(
                                                                                                        colors: [
                                                                                                          Color(0x43D0E3F7),
                                                                                                          FlutterFlowTheme.of(context).primaryBackground
                                                                                                        ],
                                                                                                        stops: [0.0, 1.0],
                                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsets.all(25.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'p6zq7n47' /* Good Morning */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                                              fontFamily: 'The Seasons',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      AuthUserStreamWidget(
                                                                                                                        builder: (context) => Text(
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
                                                                                                                    color: Colors.transparent,
                                                                                                                    elevation: 5.0,
                                                                                                                    shape: const CircleBorder(),
                                                                                                                    child: Container(
                                                                                                                      width: 48.0,
                                                                                                                      height: 48.0,
                                                                                                                      decoration: BoxDecoration(
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
                                                                                                                        gradient: LinearGradient(
                                                                                                                          colors: [
                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                            FlutterFlowTheme.of(context).accent1
                                                                                                                          ],
                                                                                                                          stops: [0.0, 1.0],
                                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                                        ),
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Imag');
                                                                                                                          logFirebaseEvent('Image_haptic_feedback');
                                                                                                                          HapticFeedback.selectionClick();
                                                                                                                          logFirebaseEvent('Image_play_sound');
                                                                                                                          _model.soundPlayer2 ??= AudioPlayer();
                                                                                                                          if (_model.soundPlayer2!.playing) {
                                                                                                                            await _model.soundPlayer2!.stop();
                                                                                                                          }
                                                                                                                          _model.soundPlayer2!.setVolume(1.0);
                                                                                                                          _model.soundPlayer2!.setAsset('assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav').then((_) => _model.soundPlayer2!.play());

                                                                                                                          logFirebaseEvent('Image_bottom_sheet');
                                                                                                                          await showModalBottomSheet(
                                                                                                                            isScrollControlled: true,
                                                                                                                            backgroundColor: Colors.transparent,
                                                                                                                            enableDrag: false,
                                                                                                                            context: context,
                                                                                                                            builder: (context) {
                                                                                                                              return GestureDetector(
                                                                                                                                onTap: () {
                                                                                                                                  FocusScope.of(context).unfocus();
                                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                },
                                                                                                                                child: Padding(
                                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                  child: LucilleHelpCompWidget(),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                                        },
                                                                                                                        child: ClipRRect(
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          child: Image.asset(
                                                                                                                            'assets/images/f888a650f73ba5acfa7794b87773e0ae64ac7c72.png',
                                                                                                                            width: 200.0,
                                                                                                                            height: 200.0,
                                                                                                                            fit: BoxFit.cover,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '8r3qseig' /* Quick Access */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          fontFamily: 'The Seasons',
                                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                          fontSize: 22.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(height: 12.0)),
                                                                                                            ),
                                                                                                            Flexible(
                                                                                                              flex: 1,
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                                child: Column(
                                                                                                                  children: [
                                                                                                                    Align(
                                                                                                                      alignment: Alignment(-1.0, 0),
                                                                                                                      child: FlutterFlowButtonTabBar(
                                                                                                                        useToggleButtonStyle: false,
                                                                                                                        isScrollable: true,
                                                                                                                        labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                              fontFamily: 'The Seasons',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                        unselectedLabelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                              fontFamily: 'WorkSans',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                        labelColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        unselectedBackgroundColor: Color(0xB3FFFFFF),
                                                                                                                        borderWidth: 2.0,
                                                                                                                        borderRadius: 30.0,
                                                                                                                        elevation: 0.0,
                                                                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                                                                                                                        buttonMargin: EdgeInsets.all(10.0),
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 35.0, 0.0),
                                                                                                                        tabs: [
                                                                                                                          Tab(
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              'jz0beswi' /* All */,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Tab(
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              'b6gzoan7' /* Music Mediations */,
                                                                                                                            ),
                                                                                                                          ).animateOnPageLoad(animationsMap['tabOnPageLoadAnimation']!),
                                                                                                                          Tab(
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              '5yev19xy' /* Nature */,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Tab(
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              'n9rjp9ky' /* Focus */,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Tab(
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              'noqw8xu1' /* Sleep */,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                        controller: _model.tabBarController2,
                                                                                                                        onTap: (i) async {
                                                                                                                          [
                                                                                                                            () async {},
                                                                                                                            () async {
                                                                                                                              logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Tab_');
                                                                                                                              logFirebaseEvent('Tab_update_app_state');
                                                                                                                              FFAppState().isMusicMeditationsTab = !(FFAppState().isMusicMeditationsTab ?? true);
                                                                                                                              FFAppState().update(() {});
                                                                                                                            },
                                                                                                                            () async {
                                                                                                                              logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Tab_');
                                                                                                                              logFirebaseEvent('Tab_update_app_state');
                                                                                                                              FFAppState().isNatureTab = !(FFAppState().isNatureTab ?? true);
                                                                                                                              FFAppState().update(() {});
                                                                                                                            },
                                                                                                                            () async {
                                                                                                                              logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Tab_');
                                                                                                                              logFirebaseEvent('Tab_update_app_state');
                                                                                                                              FFAppState().isFocusTab = !(FFAppState().isFocusTab ?? true);
                                                                                                                              FFAppState().update(() {});
                                                                                                                            },
                                                                                                                            () async {
                                                                                                                              logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Tab_');
                                                                                                                              logFirebaseEvent('Tab_update_app_state');
                                                                                                                              FFAppState().isSleepTab = !(FFAppState().isSleepTab ?? true);
                                                                                                                              FFAppState().update(() {});
                                                                                                                            }
                                                                                                                          ][i]();
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Expanded(
                                                                                                                      child: TabBarView(
                                                                                                                        controller: _model.tabBarController2,
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
                                                                                                                                                    'gepu1v85' /* Featured for You */,
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
                                                                                                                                                    '5lnvzolx' /* Discover your perfect soundsca... */,
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
                                                                                                                                                '1ztn09wh' /* See all */,
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
                                                                                                                                                                logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                                HapticFeedback.mediumImpact();
                                                                                                                                                                logFirebaseEvent('Container_play_sound');
                                                                                                                                                                _model.soundPlayer4 ??= AudioPlayer();
                                                                                                                                                                if (_model.soundPlayer4!.playing) {
                                                                                                                                                                  await _model.soundPlayer4!.stop();
                                                                                                                                                                }
                                                                                                                                                                _model.soundPlayer4!.setVolume(1.0);
                                                                                                                                                                _model.soundPlayer4!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer4!.play());

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
                                                                                                                                                        '1etyx07a' /* Find Your Mood */,
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
                                                                                                                                                      logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Text');
                                                                                                                                                      logFirebaseEvent('Text_haptic_feedback');
                                                                                                                                                      HapticFeedback.lightImpact();
                                                                                                                                                      logFirebaseEvent('Text_play_sound');
                                                                                                                                                      _model.soundPlayer5 ??= AudioPlayer();
                                                                                                                                                      if (_model.soundPlayer5!.playing) {
                                                                                                                                                        await _model.soundPlayer5!.stop();
                                                                                                                                                      }
                                                                                                                                                      _model.soundPlayer5!.setVolume(1.0);
                                                                                                                                                      _model.soundPlayer5!.setAsset('assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav').then((_) => _model.soundPlayer5!.play());

                                                                                                                                                      logFirebaseEvent('Text_navigate_to');

                                                                                                                                                      context.pushNamed(
                                                                                                                                                        $that_audio_player_oo85ab.PlayerPageAllWidget.routeName,
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
                                                                                                                                                        'kx9a70is' /* See all */,
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
                                                                                                                                                child: Column(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  children: [
                                                                                                                                                    InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
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
                                                                                                                                                                width: 351.4,
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
                                                                                                                                                                            'z4nfo0sz' /* Relax */,
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
                                                                                                                                                                                '6iz17cus' /* Melt away stress with calming ... */,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
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
                                                                                                                                                                'assets/images/Container_(9).png',
                                                                                                                                                                width: 350.19,
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
                                                                                                                                                                            '1unlu5j6' /* Focus */,
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
                                                                                                                                                                                'jcbolaa6' /* Enhance concentration with 
am... */
                                                                                                                                                                                ,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
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
                                                                                                                                                                            '6jai734j' /* Energize */,
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
                                                                                                                                                                                'rwsadwg0' /* Uplift your spirit with vibran... */,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                        HapticFeedback.lightImpact();
                                                                                                                                                        logFirebaseEvent('Container_play_sound');
                                                                                                                                                        _model.soundPlayer9 ??= AudioPlayer();
                                                                                                                                                        if (_model.soundPlayer9!.playing) {
                                                                                                                                                          await _model.soundPlayer9!.stop();
                                                                                                                                                        }
                                                                                                                                                        _model.soundPlayer9!.setVolume(1.0);
                                                                                                                                                        _model.soundPlayer9!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer9!.play());

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
                                                                                                                                                                'assets/images/Container_(11).png',
                                                                                                                                                                width: 351.39,
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
                                                                                                                                                                            'g1rlh36f' /* Sleep */,
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
                                                                                                                                                                                'oc5ocgpk' /* Drift into peaceful slumber wi... */,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                    '5uf6o1yo' /* Music For You */,
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
                                                                                                                                                    'gr6vdnzc' /* Discover your perfect soundsca... */,
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
                                                                                                                                                'jj1tpekk' /* See all */,
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
                                                                                                                                                                logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                                HapticFeedback.mediumImpact();
                                                                                                                                                                logFirebaseEvent('Container_play_sound');
                                                                                                                                                                _model.soundPlayer10 ??= AudioPlayer();
                                                                                                                                                                if (_model.soundPlayer10!.playing) {
                                                                                                                                                                  await _model.soundPlayer10!.stop();
                                                                                                                                                                }
                                                                                                                                                                _model.soundPlayer10!.setVolume(1.0);
                                                                                                                                                                _model.soundPlayer10!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer10!.play());

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
                                                                                                                                          controller: _model.columnController4,
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
                                                                                                                                                        'rqmz8rlb' /* Find Your Mood */,
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
                                                                                                                                                      'xn541fd1' /* See all */,
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
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
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
                                                                                                                                                                            'y4u1rffm' /* Relax */,
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
                                                                                                                                                                                '1jl34e2d' /* Melt away stress with calming ... */,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                        HapticFeedback.lightImpact();
                                                                                                                                                        logFirebaseEvent('Container_play_sound');
                                                                                                                                                        _model.soundPlayer12 ??= AudioPlayer();
                                                                                                                                                        if (_model.soundPlayer12!.playing) {
                                                                                                                                                          await _model.soundPlayer12!.stop();
                                                                                                                                                        }
                                                                                                                                                        _model.soundPlayer12!.setVolume(1.0);
                                                                                                                                                        _model.soundPlayer12!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer12!.play());

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
                                                                                                                                                                            '72gmqjnt' /* Energize */,
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
                                                                                                                                                                                '3xjobojj' /* Uplift your spirit with vibran... */,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                    'w26v2zlr' /* Nature Sounds */,
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
                                                                                                                                                    'njimf991' /* Discover your perfect soundsca... */,
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
                                                                                                                                                '1rsq9u19' /* See all */,
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
                                                                                                                                                                logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                                HapticFeedback.mediumImpact();
                                                                                                                                                                logFirebaseEvent('Container_play_sound');
                                                                                                                                                                _model.soundPlayer13 ??= AudioPlayer();
                                                                                                                                                                if (_model.soundPlayer13!.playing) {
                                                                                                                                                                  await _model.soundPlayer13!.stop();
                                                                                                                                                                }
                                                                                                                                                                _model.soundPlayer13!.setVolume(1.0);
                                                                                                                                                                _model.soundPlayer13!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer13!.play());

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
                                                                                                                                                        'fs7dcvgi' /* Find Your Mood */,
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
                                                                                                                                                      'qt778tew' /* See all */,
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
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                        HapticFeedback.lightImpact();
                                                                                                                                                        logFirebaseEvent('Container_play_sound');
                                                                                                                                                        _model.soundPlayer14 ??= AudioPlayer();
                                                                                                                                                        if (_model.soundPlayer14!.playing) {
                                                                                                                                                          await _model.soundPlayer14!.stop();
                                                                                                                                                        }
                                                                                                                                                        _model.soundPlayer14!.setVolume(1.0);
                                                                                                                                                        _model.soundPlayer14!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer14!.play());

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
                                                                                                                                                                            'uhi93zsu' /* Energize */,
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
                                                                                                                                                                                '7t0dw4v7' /* Uplift your spirit with vibran... */,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                    '48fjkhrh' /* Concentration Flow */,
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
                                                                                                                                                    'fyu4tzkf' /* Discover your perfect soundsca... */,
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
                                                                                                                                                '6vkzua0i' /* See all */,
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
                                                                                                                                                                logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                                logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                                HapticFeedback.mediumImpact();
                                                                                                                                                                logFirebaseEvent('Container_play_sound');
                                                                                                                                                                _model.soundPlayer15 ??= AudioPlayer();
                                                                                                                                                                if (_model.soundPlayer15!.playing) {
                                                                                                                                                                  await _model.soundPlayer15!.stop();
                                                                                                                                                                }
                                                                                                                                                                _model.soundPlayer15!.setVolume(1.0);
                                                                                                                                                                _model.soundPlayer15!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer15!.play());

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
                                                                                                                                          controller: _model.columnController6,
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
                                                                                                                                                          '65xbd00j' /* Find Your Mood */,
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
                                                                                                                                                        '7zma4z4s' /* See all */,
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
                                                                                                                                                      logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
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
                                                                                                                                                                            'dd10hamj' /* Relax */,
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
                                                                                                                                                                              'w137rq82' /* Melt away stress with calming ... */,
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
                                                                                                                                                                      colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                      logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                      logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                      HapticFeedback.lightImpact();
                                                                                                                                                      logFirebaseEvent('Container_play_sound');
                                                                                                                                                      _model.soundPlayer17 ??= AudioPlayer();
                                                                                                                                                      if (_model.soundPlayer17!.playing) {
                                                                                                                                                        await _model.soundPlayer17!.stop();
                                                                                                                                                      }
                                                                                                                                                      _model.soundPlayer17!.setVolume(1.0);
                                                                                                                                                      _model.soundPlayer17!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer17!.play());

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
                                                                                                                                                                            'abkdjuhh' /* Energize */,
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
                                                                                                                                                                              'qinnq3a1' /* Uplift your spirit with vibran... */,
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
                                                                                                                                                                      colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                    'jga0sai5' /* Sleep Soundscapes */,
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
                                                                                                                                                    'wjdm5gv5' /* Discover your perfect soundsca... */,
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
                                                                                                                                                logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Text');
                                                                                                                                                logFirebaseEvent('Text_haptic_feedback');
                                                                                                                                                HapticFeedback.lightImpact();
                                                                                                                                                logFirebaseEvent('Text_play_sound');
                                                                                                                                                _model.soundPlayer18 ??= AudioPlayer();
                                                                                                                                                if (_model.soundPlayer18!.playing) {
                                                                                                                                                  await _model.soundPlayer18!.stop();
                                                                                                                                                }
                                                                                                                                                _model.soundPlayer18!.setVolume(1.0);
                                                                                                                                                _model.soundPlayer18!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer18!.play());

                                                                                                                                                logFirebaseEvent('Text_navigate_to');

                                                                                                                                                context.pushNamed(
                                                                                                                                                  $that_audio_player_oo85ab.PlayerPageAllWidget.routeName,
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
                                                                                                                                                  'r2mjh4g2' /* See all */,
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
                                                                                                                                                                logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
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
                                                                                                                                          controller: _model.columnController7,
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
                                                                                                                                                        'ho8yfwql' /* Find Your Mood */,
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
                                                                                                                                                      'or7apxjo' /* See all */,
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
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                        HapticFeedback.mediumImpact();
                                                                                                                                                        logFirebaseEvent('Container_play_sound');
                                                                                                                                                        _model.soundPlayer20 ??= AudioPlayer();
                                                                                                                                                        if (_model.soundPlayer20!.playing) {
                                                                                                                                                          await _model.soundPlayer20!.stop();
                                                                                                                                                        }
                                                                                                                                                        _model.soundPlayer20!.setVolume(1.0);
                                                                                                                                                        _model.soundPlayer20!.setAsset('assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav').then((_) => _model.soundPlayer20!.play());

                                                                                                                                                        logFirebaseEvent('Container_custom_action');
                                                                                                                                                        await that_audio_player_oo85ab_actions.initializeThatAudioPlayerForPlaylists(
                                                                                                                                                          that_audio_player_oo85ab_app_state.FFAppState().currentMediaSleepTab.toList(),
                                                                                                                                                          _model.tabBarCurrentIndex2,
                                                                                                                                                        );
                                                                                                                                                        if (that_audio_player_oo85ab_app_state.FFAppState().isThatAudioPlayerPlaying) {
                                                                                                                                                          logFirebaseEvent('Container_custom_action');
                                                                                                                                                          await actions.pauseAudio();
                                                                                                                                                          logFirebaseEvent('Container_custom_action');
                                                                                                                                                          await that_audio_player_oo85ab_actions.seekAudioToValue(
                                                                                                                                                            0.0,
                                                                                                                                                            _model.tabBarCurrentIndex2,
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
                                                                                                                                                            _model.tabBarCurrentIndex2,
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
                                                                                                                                                                            'qukz7yws' /* Relax */,
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
                                                                                                                                                                                'u8tfs1ha' /* Melt away stress with calming ... */,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                                                        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_Cont');
                                                                                                                                                        logFirebaseEvent('Container_haptic_feedback');
                                                                                                                                                        HapticFeedback.lightImpact();
                                                                                                                                                        logFirebaseEvent('Container_play_sound');
                                                                                                                                                        _model.soundPlayer21 ??= AudioPlayer();
                                                                                                                                                        if (_model.soundPlayer21!.playing) {
                                                                                                                                                          await _model.soundPlayer21!.stop();
                                                                                                                                                        }
                                                                                                                                                        _model.soundPlayer21!.setVolume(1.0);
                                                                                                                                                        _model.soundPlayer21!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer21!.play());

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
                                                                                                                                                                            'nlbdprwt' /* Energize */,
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
                                                                                                                                                                                '63i1ilg3' /* Uplift your spirit with vibran... */,
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
                                                                                                                                                                        colors: [FlutterFlowTheme.of(context).primary, FlutterFlowTheme.of(context).secondary],
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
                                                                                                                ).animateOnPageLoad(animationsMap['tabBarOnPageLoadAnimation']!),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(SizedBox(height: 24.0)),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
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
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.9,
                                                            child:
                                                                tiktokfeed_wz8en7_custom_widgets
                                                                    .ChewieWidget(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.9,
                                                              userID:
                                                                  currentUserUid,
                                                              data: tiktokfeed_wz8en7_app_state
                                                                      .FFAppState()
                                                                  .BodyTikToks,
                                                              likerebuidpage:
                                                                  () async {},
                                                              bookedrebuidpage:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 0.0, 3.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .marketplaceButtonModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MarketplaceButtonWidget(),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .influencerAmbassadorProgramButtonModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        InfluencerAmbassadorProgramButtonWidget(),
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
                            ),
                          ],
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
