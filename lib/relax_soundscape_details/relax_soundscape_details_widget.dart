import '/components/music_detail_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import "package:that_audio_player_oo85ab/flutter_flow/nav/serialization_util.dart"
    as that_audio_player_oo85ab_serialization_util;
import '/custom_code/actions/index.dart' as actions;
import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'relax_soundscape_details_model.dart';
export 'relax_soundscape_details_model.dart';

class RelaxSoundscapeDetailsWidget extends StatefulWidget {
  const RelaxSoundscapeDetailsWidget({
    super.key,
    this.pageTitle,
    this.songNumber,
  });

  final String? pageTitle;
  final int? songNumber;

  static String routeName = 'RelaxSoundscapeDetails';
  static String routePath = '/relaxSoundscapeDetails';

  @override
  State<RelaxSoundscapeDetailsWidget> createState() =>
      _RelaxSoundscapeDetailsWidgetState();
}

class _RelaxSoundscapeDetailsWidgetState
    extends State<RelaxSoundscapeDetailsWidget> {
  late RelaxSoundscapeDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelaxSoundscapeDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RelaxSoundscapeDetails'});
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/bf96634860de987cbec653483b4500e6.gif',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 30.0,
                  sigmaY: 30.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x2DEDF1F7),
                        Color(0x4DD0E3F7),
                        FlutterFlowTheme.of(context).alternate
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: SingleChildScrollView(
                  controller: _model.columnController1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 30.0, 24.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Color(0x3DD0E3F7),
                                  borderRadius: 12.0,
                                  buttonSize:
                                      MediaQuery.sizeOf(context).width * 0.1,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'RELAX_SOUNDSCAPE_DETAILS_keyboard_arrow_');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.safePop();
                                  },
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'bwx74nqe' /* Soundscape Details */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.cormorantSc(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Color(0x1FD0E3F7),
                                  borderRadius: 12.0,
                                  buttonSize:
                                      MediaQuery.sizeOf(context).width * 0.1,
                                  icon: Icon(
                                    Icons.help,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final carousel =
                                  that_audio_player_oo85ab_app_state
                                          .FFAppState()
                                      .currentMediaAllTab
                                      .toList();

                              return Container(
                                width: double.infinity,
                                height: 250.0,
                                child: CarouselSlider.builder(
                                  itemCount: carousel.length,
                                  itemBuilder: (context, carouselIndex, _) {
                                    final carouselItem =
                                        carousel[carouselIndex];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.network(
                                        carouselItem.mediaBanner,
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselSliderController(),
                                  options: CarouselOptions(
                                    initialPage:
                                        max(0, min(1, carousel.length - 1)),
                                    viewportFraction: 0.7,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.25,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex = index,
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.kmusicNote,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 20.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'jc5105tw' /* 12 Songs */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '2b4ohvfq' /* 1 hr 32 min */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 15.0, 25.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderRadius: 30.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.skip_next,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderRadius: 30.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.skip_next,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 50.0,
                                  buttonSize: 70.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  icon: Icon(
                                    Icons.play_circle,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 36.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'RELAX_SOUNDSCAPE_DETAILS_play_circle_ICN');
                                    logFirebaseEvent(
                                        'IconButton_haptic_feedback');
                                    HapticFeedback.heavyImpact();
                                    logFirebaseEvent('IconButton_play_sound');
                                    _model.soundPlayer1 ??= AudioPlayer();
                                    if (_model.soundPlayer1!.playing) {
                                      await _model.soundPlayer1!.stop();
                                    }
                                    _model.soundPlayer1!.setVolume(0.51);
                                    _model.soundPlayer1!
                                        .setAsset(
                                            'assets/audios/universfield-interface-soft-click-131438.mp3')
                                        .then(
                                            (_) => _model.soundPlayer1!.play());

                                    logFirebaseEvent(
                                        'IconButton_custom_action');
                                    await that_audio_player_oo85ab_actions
                                        .initializeThatAudioPlayerForPlaylists(
                                      that_audio_player_oo85ab_app_state
                                              .FFAppState()
                                          .currentMediaAllTab
                                          .toList(),
                                      _model.carouselCurrentIndex,
                                    );
                                    if (that_audio_player_oo85ab_app_state
                                            .FFAppState()
                                        .isThatAudioPlayerPlaying) {
                                      logFirebaseEvent(
                                          'IconButton_custom_action');
                                      await actions.pauseAudio();
                                      logFirebaseEvent(
                                          'IconButton_custom_action');
                                      await actions.seekAudioToValue(
                                        0.0,
                                        _model.carouselCurrentIndex,
                                      );
                                      logFirebaseEvent(
                                          'IconButton_custom_action');
                                      await actions.playAudio();
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
                                                .currentMediaAllTab
                                                .elementAtOrNull(_model
                                                    .carouselCurrentIndex),
                                            that_audio_player_oo85ab_serialization_util
                                                .ParamType.DataStruct,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          '__transition_info__that_audio_player_oo85ab':
                                              TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                            duration: Duration(milliseconds: 2),
                                          ),
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent(
                                          'IconButton_custom_action');
                                      await actions.seekAudioToValue(
                                        0.0,
                                        _model.carouselCurrentIndex,
                                      );
                                      logFirebaseEvent(
                                          'IconButton_custom_action');
                                      await actions.playAudio();
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed(
                                        $that_audio_player_oo85ab
                                            .PlayerPageFINALAllTabWidget
                                            .routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__that_audio_player_oo85ab':
                                              TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                            duration: Duration(milliseconds: 1),
                                          ),
                                        },
                                      );
                                    }
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderRadius: 30.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.skip_next,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderRadius: 30.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.skip_next,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ]
                                  .divide(SizedBox(width: 5.0))
                                  .around(SizedBox(width: 5.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                      SingleChildScrollView(
                        controller: _model.columnController2,
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '6clbftrb' /* Recommended Music */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final recommendedMusic =
                                    that_audio_player_oo85ab_app_state
                                            .FFAppState()
                                        .currentMediaAllTab
                                        .toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: recommendedMusic.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 15.0),
                                  itemBuilder:
                                      (context, recommendedMusicIndex) {
                                    final recommendedMusicItem =
                                        recommendedMusic[recommendedMusicIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'RELAX_SOUNDSCAPE_DETAILS_Container_rzv01');
                                        logFirebaseEvent(
                                            'MusicDetailCard_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        logFirebaseEvent(
                                            'MusicDetailCard_play_sound');
                                        _model.soundPlayer2 ??= AudioPlayer();
                                        if (_model.soundPlayer2!.playing) {
                                          await _model.soundPlayer2!.stop();
                                        }
                                        _model.soundPlayer2!.setVolume(0.51);
                                        _model.soundPlayer2!
                                            .setAsset(
                                                'assets/audios/universfield-interface-soft-click-131438.mp3')
                                            .then((_) =>
                                                _model.soundPlayer2!.play());

                                        logFirebaseEvent(
                                            'MusicDetailCard_custom_action');
                                        await that_audio_player_oo85ab_actions
                                            .initializeThatAudioPlayerForPlaylists(
                                          that_audio_player_oo85ab_app_state
                                                  .FFAppState()
                                              .currentMediaAllTab
                                              .toList(),
                                          _model.carouselCurrentIndex,
                                        );
                                        if (that_audio_player_oo85ab_app_state
                                                .FFAppState()
                                            .isThatAudioPlayerPlaying) {
                                          logFirebaseEvent(
                                              'MusicDetailCard_custom_action');
                                          await actions.pauseAudio();
                                          logFirebaseEvent(
                                              'MusicDetailCard_custom_action');
                                          await actions.seekAudioToValue(
                                            0.0,
                                            _model.carouselCurrentIndex,
                                          );
                                          logFirebaseEvent(
                                              'MusicDetailCard_custom_action');
                                          await actions.playAudio();
                                          logFirebaseEvent(
                                              'MusicDetailCard_navigate_to');

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
                                                    .currentMediaAllTab
                                                    .elementAtOrNull(_model
                                                        .carouselCurrentIndex),
                                                that_audio_player_oo85ab_serialization_util
                                                    .ParamType.DataStruct,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              '__transition_info__that_audio_player_oo85ab':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                                duration:
                                                    Duration(milliseconds: 2),
                                              ),
                                            },
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'MusicDetailCard_custom_action');
                                          await actions.seekAudioToValue(
                                            0.0,
                                            _model.carouselCurrentIndex,
                                          );
                                          logFirebaseEvent(
                                              'MusicDetailCard_custom_action');
                                          await actions.playAudio();
                                          logFirebaseEvent(
                                              'MusicDetailCard_navigate_to');

                                          context.pushNamed(
                                            $that_audio_player_oo85ab
                                                .PlayerPageFINALAllTabWidget
                                                .routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__that_audio_player_oo85ab':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                                duration:
                                                    Duration(milliseconds: 1),
                                              ),
                                            },
                                          );
                                        }
                                      },
                                      child: MusicDetailCardWidget(
                                        key: Key(
                                            'Keyrzv_${recommendedMusicIndex}_of_${recommendedMusic.length}'),
                                        musicName:
                                            recommendedMusicItem.mediaTitle,
                                        artName:
                                            recommendedMusicItem.mediaArtist,
                                        image: recommendedMusicItem.mediaBanner,
                                        select: _model.select,
                                        action: (musicName) async {},
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 24.0))
                        .addToStart(SizedBox(height: 24.0))
                        .addToEnd(SizedBox(height: 24.0)),
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
