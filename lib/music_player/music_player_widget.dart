import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:that_audio_player_5bjqer/custom_code/actions/index.dart'
    as that_audio_player_5bjqer_actions;
import 'package:that_audio_player_5bjqer/custom_code/widgets/index.dart'
    as that_audio_player_5bjqer_custom_widgets;
import 'package:that_audio_player_5bjqer/flutter_flow/custom_functions.dart'
    as that_audio_player_5bjqer_functions;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'music_player_model.dart';
export 'music_player_model.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({
    super.key,
    this.initialSong,
    this.tracks,
    this.trackAlbumArt,
    this.trackTime,
  });

  final String? initialSong;
  final List<String>? tracks;
  final List<String>? trackAlbumArt;
  final List<int>? trackTime;

  static String routeName = 'MusicPlayer';
  static String routePath = 'musicPlayer';

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  late MusicPlayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicPlayerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MusicPlayer'});
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
    context.watch<that_audio_player_5bjqer_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 45.0, 24.0, 24.0),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.stylus,
                      PointerDeviceKind.unknown,
                    },
                  ),
                  child: Scrollbar(
                    controller: _model.columnController,
                    child: SingleChildScrollView(
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MUSIC_PLAYER_keyboard_arrow_down_rounded');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.safePop();
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              width: 234.7,
                              height: 261.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(32.0),
                                child: Image.network(
                                  '',
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.763,
                                  height: 359.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'zcjcyiih' /*  */,
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '',
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 54.0,
                                icon: Icon(
                                  Icons.repeat_on_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MUSIC_PLAYER_repeat_on_rounded_ICN_ON_TA');
                                  logFirebaseEvent('IconButton_custom_action');
                                  await that_audio_player_5bjqer_actions
                                      .setLoopMode(
                                    'One',
                                  );
                                },
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 118.6,
                                icon: Icon(
                                  Icons.play_circle_rounded,
                                  color: FlutterFlowTheme.of(context).accent1,
                                  size: 80.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MUSIC_PLAYER_play_circle_rounded_ICN_ON_');
                                  logFirebaseEvent(
                                      'IconButton_haptic_feedback');
                                  HapticFeedback.lightImpact();
                                  logFirebaseEvent('IconButton_custom_action');
                                  await that_audio_player_5bjqer_actions
                                      .playAudio();
                                },
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 54.0,
                                icon: Icon(
                                  Icons.repeat_one_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MUSIC_PLAYER_repeat_one_rounded_ICN_ON_T');
                                  logFirebaseEvent('IconButton_custom_action');
                                  await that_audio_player_5bjqer_actions
                                      .setLoopMode(
                                    'off',
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: ScrollConfiguration(
                                  behavior:
                                      ScrollConfiguration.of(context).copyWith(
                                    scrollbars: false,
                                    dragDevices: {
                                      PointerDeviceKind.mouse,
                                      PointerDeviceKind.touch,
                                      PointerDeviceKind.stylus,
                                      PointerDeviceKind.unknown,
                                    },
                                  ),
                                  child: Scrollbar(
                                    controller: _model.rowController,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _model.rowController,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 54.0,
                                            icon: Icon(
                                              Icons.shuffle_on_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 36.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'MUSIC_PLAYER_shuffle_on_rounded_ICN_ON_T');
                                              logFirebaseEvent(
                                                  'IconButton_custom_action');
                                              await that_audio_player_5bjqer_actions
                                                  .toggleShuffle();
                                            },
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 54.0,
                                                icon: Icon(
                                                  Icons.skip_previous_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 36.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'MUSIC_PLAYER_skip_previous_rounded_ICN_O');
                                                  logFirebaseEvent(
                                                      'IconButton_haptic_feedback');
                                                  HapticFeedback.lightImpact();
                                                  logFirebaseEvent(
                                                      'IconButton_custom_action');
                                                  await that_audio_player_5bjqer_actions
                                                      .playPreviousTrack();
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 54.0,
                                                icon: Icon(
                                                  Icons.pause_circle_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 36.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'MUSIC_PLAYER_pause_circle_rounded_ICN_ON');
                                                  logFirebaseEvent(
                                                      'IconButton_haptic_feedback');
                                                  HapticFeedback.lightImpact();
                                                  logFirebaseEvent(
                                                      'IconButton_custom_action');
                                                  await that_audio_player_5bjqer_actions
                                                      .pauseAudio();
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 54.0,
                                                icon: Icon(
                                                  Icons.skip_next_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 36.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'MUSIC_PLAYER_skip_next_rounded_ICN_ON_TA');
                                                  logFirebaseEvent(
                                                      'IconButton_haptic_feedback');
                                                  HapticFeedback.lightImpact();
                                                  logFirebaseEvent(
                                                      'IconButton_custom_action');
                                                  await that_audio_player_5bjqer_actions
                                                      .playNextTrack();
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 54.0,
                                                icon: Icon(
                                                  Icons.shuffle_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 36.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'MUSIC_PLAYER_shuffle_rounded_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_custom_action');
                                                  await that_audio_player_5bjqer_actions
                                                      .toggleShuffle();
                                                },
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 54.0,
                                            icon: Icon(
                                              Icons.repeat_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 32.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'MUSIC_PLAYER_repeat_rounded_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_custom_action');
                                              await that_audio_player_5bjqer_actions
                                                  .setLoopMode(
                                                'All',
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 25.0,
                                child: that_audio_player_5bjqer_custom_widgets
                                    .ThatAudioSlider(
                                  width: double.infinity,
                                  height: 25.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  that_audio_player_5bjqer_functions
                                      .formatSecondsToMinutes(
                                          that_audio_player_5bjqer_app_state
                                                  .FFAppState()
                                              .currentPositionOfAudioInSeconds,
                                          'MM:SS'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  that_audio_player_5bjqer_functions
                                      .formatSecondsToMinutes(
                                          that_audio_player_5bjqer_app_state
                                                  .FFAppState()
                                              .totalDurationOfAudioInSeconds,
                                          'MM:SS'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final mediaItems = widget.tracks?.toList() ?? [];

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: mediaItems.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder: (context, mediaItemsIndex) {
                                  final mediaItemsItem =
                                      mediaItems[mediaItemsIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MUSIC_PLAYER_Container_v7ebgscx_ON_TAP');
                                      if (that_audio_player_5bjqer_app_state
                                              .FFAppState()
                                          .isThatAudioPlayerPlaying) {
                                        logFirebaseEvent(
                                            'Container_custom_action');
                                        await that_audio_player_5bjqer_actions
                                            .pauseAudio();
                                        logFirebaseEvent(
                                            'Container_custom_action');
                                        await that_audio_player_5bjqer_actions
                                            .seekAudioToValue(
                                          0.0,
                                          mediaItemsIndex,
                                        );
                                        logFirebaseEvent(
                                            'Container_custom_action');
                                        await that_audio_player_5bjqer_actions
                                            .playAudio();
                                      } else {
                                        logFirebaseEvent(
                                            'Container_custom_action');
                                        await that_audio_player_5bjqer_actions
                                            .seekAudioToValue(
                                          0.0,
                                          mediaItemsIndex,
                                        );
                                        logFirebaseEvent(
                                            'Container_custom_action');
                                        await that_audio_player_5bjqer_actions
                                            .playAudio();
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x8DD0E3F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    'https://picsum.photos/seed/163/600',
                                                    width: 32.0,
                                                    height: 32.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2v23dete' /*  */,
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'WorkSans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      '',
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Icon(
                                              Icons.play_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 45.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('MUSIC_PLAYER_PAGE_arrow_back_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
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
