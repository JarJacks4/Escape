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
import 'soundscapes_see_all_page_nature_model.dart';
export 'soundscapes_see_all_page_nature_model.dart';

class SoundscapesSeeAllPageNatureWidget extends StatefulWidget {
  const SoundscapesSeeAllPageNatureWidget({
    super.key,
    this.songUrl,
    this.albumArt,
    this.songTitle,
    this.songNumber,
  });

  final String? songUrl;
  final String? albumArt;
  final String? songTitle;
  final int? songNumber;

  static String routeName = 'SoundscapesSeeAllPageNature';
  static String routePath = '/soundscapesSeeAllPageNature';

  @override
  State<SoundscapesSeeAllPageNatureWidget> createState() =>
      _SoundscapesSeeAllPageNatureWidgetState();
}

class _SoundscapesSeeAllPageNatureWidgetState
    extends State<SoundscapesSeeAllPageNatureWidget> {
  late SoundscapesSeeAllPageNatureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoundscapesSeeAllPageNatureModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SoundscapesSeeAllPageNature'});
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
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Untitled_design_(1).png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 4.0,
                        sigmaY: 4.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xB21D2428),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      controller: _model.columnController1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 36.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SOUNDSCAPES_SEE_ALL_NATURE_arrow_back_IC');
                                      logFirebaseEvent(
                                          'IconButton_haptic_feedback');
                                      HapticFeedback.heavyImpact();
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.safePop();
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      55.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ez4qvrth' /* Nature */,
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
                                          fontSize: 36.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 24.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedDefaultTextStyle(
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
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeIn,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'jnki948c' /* All Self Care Songs */,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final songs =
                                      FFAppState().SoundscapesAllTab.toList();

                                  return Container(
                                    width: double.infinity,
                                    height: 250.0,
                                    child: CarouselSlider.builder(
                                      itemCount: songs.length,
                                      itemBuilder: (context, songsIndex, _) {
                                        final songsItem = songs[songsIndex];
                                        return Hero(
                                          tag: widget.albumArt!,
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              widget.albumArt!,
                                              width: 231.1,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselSliderController(),
                                      options: CarouselOptions(
                                        initialPage:
                                            max(0, min(1, songs.length - 1)),
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
                                    25.0, 15.0, 25.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderRadius: 30.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.skip_next,
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 36.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'SOUNDSCAPES_SEE_ALL_NATURE_play_circle_I');
                                        logFirebaseEvent(
                                            'IconButton_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        logFirebaseEvent(
                                            'IconButton_play_sound');
                                        _model.soundPlayer ??= AudioPlayer();
                                        if (_model.soundPlayer!.playing) {
                                          await _model.soundPlayer!.stop();
                                        }
                                        _model.soundPlayer!.setVolume(0.51);
                                        _model.soundPlayer!
                                            .setAsset(
                                                'assets/audios/universfield-interface-soft-click-131438.mp3')
                                            .then((_) =>
                                                _model.soundPlayer!.play());

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
                                                    .currentMediaNatureTab
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
                                                    .currentMediaNatureTab
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
                                                    Duration(milliseconds: 1),
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
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.music_note,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 20.0,
                                        ),
                                        Text(
                                          '${widget.songNumber.toString()} Songs',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                      valueOrDefault<String>(
                                        widget.songTitle,
                                        'SongTitle',
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
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(height: 24.0)),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Logo_ESCAPE_White.png',
                              width: 200.0,
                              height: 148.8,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SingleChildScrollView(
                            controller: _model.columnController2,
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
                                        'nc9zbxlw' /* Recommended Music */,
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
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
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
