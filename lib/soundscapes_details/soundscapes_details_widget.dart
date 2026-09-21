import '/auth/firebase_auth/auth_util.dart';
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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'soundscapes_details_model.dart';
export 'soundscapes_details_model.dart';

class SoundscapesDetailsWidget extends StatefulWidget {
  const SoundscapesDetailsWidget({super.key});

  static String routeName = 'SoundscapesDetails';
  static String routePath = '/soundscapesDetails';

  @override
  State<SoundscapesDetailsWidget> createState() =>
      _SoundscapesDetailsWidgetState();
}

class _SoundscapesDetailsWidgetState extends State<SoundscapesDetailsWidget> {
  late SoundscapesDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoundscapesDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SoundscapesDetails'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/3a99d3e8fc4d93bab2e76d8ddd504b23.jpg',
                  ).image,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY: 20.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x1FEDF1F7),
                          FlutterFlowTheme.of(context).accent3
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 60.0, 16.0, 32.0),
                      child: SingleChildScrollView(
                        controller: _model.columnController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 32.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SOUNDSCAPES_DETAILS_Icon_i7lemxwx_ON_TAP');
                                      logFirebaseEvent('Icon_navigate_back');
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.chevron_left,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      size: 36.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'zouj7rw0' /* Discover  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.cormorantSc(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x79D0E3F7),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50.0),
                                          topRight: Radius.circular(50.0),
                                          bottomLeft: Radius.circular(50.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 48.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50.0),
                                                topRight: Radius.circular(50.0),
                                                bottomLeft:
                                                    Radius.circular(50.0),
                                                bottomRight:
                                                    Radius.circular(50.0),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.search,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    alignLabelWithHint: true,
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'x6uq1s45' /* Search */,
                                                    ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 14.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
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
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '1qnae0js' /* Perfect for you */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.cormorantSc(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Builder(
                                builder: (context) {
                                  final images =
                                      that_audio_player_oo85ab_app_state
                                              .FFAppState()
                                          .currentMediaNatureTab
                                          .unique((e) => e.mood)
                                          .toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _model.rowController1,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(images.length,
                                          (imagesIndex) {
                                        final imagesItem = images[imagesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SOUNDSCAPES_DETAILS_Container_8374rgye_O');
                                            logFirebaseEvent(
                                                'Container_haptic_feedback');
                                            HapticFeedback.heavyImpact();
                                            logFirebaseEvent(
                                                'Container_play_sound');
                                            _model.soundPlayer1 ??=
                                                AudioPlayer();
                                            if (_model.soundPlayer1!.playing) {
                                              await _model.soundPlayer1!.stop();
                                            }
                                            _model.soundPlayer1!
                                                .setVolume(0.51);
                                            _model.soundPlayer1!
                                                .setAsset(
                                                    'assets/audios/universfield-interface-soft-click-131438.mp3')
                                                .then((_) => _model
                                                    .soundPlayer1!
                                                    .play());

                                            logFirebaseEvent(
                                                'Container_custom_action');
                                            await that_audio_player_oo85ab_actions
                                                .initializeThatAudioPlayerForPlaylists(
                                              that_audio_player_oo85ab_app_state
                                                      .FFAppState()
                                                  .currentMediaAllTab
                                                  .toList(),
                                              imagesIndex,
                                            );
                                            if (that_audio_player_oo85ab_app_state
                                                    .FFAppState()
                                                .isThatAudioPlayerPlaying) {
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.pauseAudio();
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.seekAudioToValue(
                                                0.0,
                                                imagesIndex,
                                              );
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.playAudio();
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

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
                                                        .elementAtOrNull(
                                                            imagesIndex),
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
                                                    duration: Duration(
                                                        milliseconds: 2),
                                                  ),
                                                },
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.seekAudioToValue(
                                                0.0,
                                                imagesIndex,
                                              );
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.playAudio();
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

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
                                                    duration: Duration(
                                                        milliseconds: 1),
                                                  ),
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 119.0,
                                            height: 167.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      width: 121.37,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            imagesItem
                                                                .mediaBanner,
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Text(
                                                            imagesItem
                                                                .mediaTitle,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final image2 =
                                      that_audio_player_oo85ab_app_state
                                              .FFAppState()
                                          .currentMediaSleepTab
                                          .where((e) =>
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.currentMood,
                                                  '') ==
                                              '')
                                          .toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _model.rowController2,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(image2.length,
                                          (image2Index) {
                                        final image2Item = image2[image2Index];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SOUNDSCAPES_DETAILS_Container_wh1diqcz_O');
                                            logFirebaseEvent(
                                                'Container_haptic_feedback');
                                            HapticFeedback.heavyImpact();
                                            logFirebaseEvent(
                                                'Container_play_sound');
                                            _model.soundPlayer2 ??=
                                                AudioPlayer();
                                            if (_model.soundPlayer2!.playing) {
                                              await _model.soundPlayer2!.stop();
                                            }
                                            _model.soundPlayer2!
                                                .setVolume(0.51);
                                            _model.soundPlayer2!
                                                .setAsset(
                                                    'assets/audios/universfield-interface-soft-click-131438.mp3')
                                                .then((_) => _model
                                                    .soundPlayer2!
                                                    .play());

                                            logFirebaseEvent(
                                                'Container_custom_action');
                                            await that_audio_player_oo85ab_actions
                                                .initializeThatAudioPlayerForPlaylists(
                                              that_audio_player_oo85ab_app_state
                                                      .FFAppState()
                                                  .currentMediaAllTab
                                                  .toList(),
                                              image2Index,
                                            );
                                            if (that_audio_player_oo85ab_app_state
                                                    .FFAppState()
                                                .isThatAudioPlayerPlaying) {
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.pauseAudio();
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.seekAudioToValue(
                                                0.0,
                                                image2Index,
                                              );
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.playAudio();
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

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
                                                        .elementAtOrNull(
                                                            image2Index),
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
                                                    duration: Duration(
                                                        milliseconds: 2),
                                                  ),
                                                },
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.seekAudioToValue(
                                                0.0,
                                                image2Index,
                                              );
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.playAudio();
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

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
                                                    duration: Duration(
                                                        milliseconds: 1),
                                                  ),
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 119.0,
                                            height: 167.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      width: 116.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            image2Item
                                                                .mediaBanner,
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Text(
                                                            image2Item
                                                                .mediaTitle,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '22hmowqt' /* Top Moods */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.cormorantSc(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final albums =
                                    that_audio_player_oo85ab_app_state
                                            .FFAppState()
                                        .currentMediaAllTab
                                        .toList();

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _model.rowController3,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(albums.length,
                                        (albumsIndex) {
                                      final albumsItem = albums[albumsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SOUNDSCAPES_DETAILS_Container_h6y2x9d2_O');
                                          logFirebaseEvent(
                                              'Container_haptic_feedback');
                                          HapticFeedback.heavyImpact();
                                          logFirebaseEvent(
                                              'Container_play_sound');
                                          _model.soundPlayer3 ??= AudioPlayer();
                                          if (_model.soundPlayer3!.playing) {
                                            await _model.soundPlayer3!.stop();
                                          }
                                          _model.soundPlayer3!.setVolume(0.51);
                                          _model.soundPlayer3!
                                              .setAsset(
                                                  'assets/audios/universfield-interface-soft-click-131438.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer3!.play());

                                          logFirebaseEvent(
                                              'Container_custom_action');
                                          await that_audio_player_oo85ab_actions
                                              .initializeThatAudioPlayerForPlaylists(
                                            that_audio_player_oo85ab_app_state
                                                    .FFAppState()
                                                .currentMediaAllTab
                                                .toList(),
                                            albumsIndex,
                                          );
                                          if (that_audio_player_oo85ab_app_state
                                                  .FFAppState()
                                              .isThatAudioPlayerPlaying) {
                                            logFirebaseEvent(
                                                'Container_custom_action');
                                            await actions.pauseAudio();
                                            logFirebaseEvent(
                                                'Container_custom_action');
                                            await actions.seekAudioToValue(
                                              0.0,
                                              albumsIndex,
                                            );
                                            logFirebaseEvent(
                                                'Container_custom_action');
                                            await actions.playAudio();
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              $that_audio_player_oo85ab
                                                  .PlayerPageFINALAllTabWidget
                                                  .routeName,
                                              queryParameters: {
                                                'currentSong':
                                                    that_audio_player_oo85ab_serialization_util
                                                        .serializeParam(
                                                  albumsItem,
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
                                                'Container_custom_action');
                                            await that_audio_player_oo85ab_actions
                                                .seekAudioToValue(
                                              0.0,
                                              albumsIndex,
                                            );
                                            logFirebaseEvent(
                                                'Container_custom_action');
                                            await actions.playAudio();
                                            logFirebaseEvent(
                                                'Container_navigate_to');

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
                                        child: Container(
                                          width: 152.0,
                                          height: 211.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 171.0,
                                                  height: 140.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        albumsItem.mediaBanner,
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                      bottomLeft:
                                                          Radius.circular(10.0),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        albumsItem.mood,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xr3nsst5' /* Fragments of Time */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'z8yz1kno' /* Top daily Motivation */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.cormorantSc(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Builder(
                                builder: (context) {
                                  final dailyMotivation =
                                      that_audio_player_oo85ab_app_state
                                              .FFAppState()
                                          .currentMediaFocus
                                          .toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _model.rowController4,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children:
                                          List.generate(dailyMotivation.length,
                                              (dailyMotivationIndex) {
                                        final dailyMotivationItem =
                                            dailyMotivation[
                                                dailyMotivationIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SOUNDSCAPES_DETAILS_Container_25gudj6j_O');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Container_play_sound');
                                              _model.soundPlayer4 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer4!.playing) {
                                                await _model.soundPlayer4!
                                                    .stop();
                                              }
                                              _model.soundPlayer4!
                                                  .setVolume(0.51);
                                              _model.soundPlayer4!
                                                  .setAsset(
                                                      'assets/audios/universfield-interface-soft-click-131438.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer4!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await that_audio_player_oo85ab_actions
                                                  .initializeThatAudioPlayerForPlaylists(
                                                that_audio_player_oo85ab_app_state
                                                        .FFAppState()
                                                    .currentMediaFocus
                                                    .toList(),
                                                dailyMotivationIndex,
                                              );
                                              if (that_audio_player_oo85ab_app_state
                                                      .FFAppState()
                                                  .isThatAudioPlayerPlaying) {
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.pauseAudio();
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.seekAudioToValue(
                                                  0.0,
                                                  dailyMotivationIndex,
                                                );
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.playAudio();
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

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
                                                          .elementAtOrNull(
                                                              dailyMotivationIndex),
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
                                                      duration: Duration(
                                                          milliseconds: 2),
                                                    ),
                                                  },
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.seekAudioToValue(
                                                  0.0,
                                                  dailyMotivationIndex,
                                                );
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.playAudio();
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

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
                                                      duration: Duration(
                                                          milliseconds: 1),
                                                    ),
                                                  },
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: 265.0,
                                              height: 134.13,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF77A46E),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      width: 116.0,
                                                      height: 144.01,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            dailyMotivationItem
                                                                .mediaBanner,
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    16.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dailyMotivationItem
                                                                            .mediaTitle,
                                                                        'Title',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Flexible(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dailyMotivationItem
                                                                          .mood,
                                                                      'Mood',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Builder(
                                builder: (context) {
                                  final image4 =
                                      that_audio_player_oo85ab_app_state
                                              .FFAppState()
                                          .currentMediaMusicMeditations
                                          .toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _model.rowController5,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: List.generate(image4.length,
                                          (image4Index) {
                                        final image4Item = image4[image4Index];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SOUNDSCAPES_DETAILS_Container_fvkeqasv_O');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Container_play_sound');
                                              _model.soundPlayer5 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer5!.playing) {
                                                await _model.soundPlayer5!
                                                    .stop();
                                              }
                                              _model.soundPlayer5!
                                                  .setVolume(0.51);
                                              _model.soundPlayer5!
                                                  .setAsset(
                                                      'assets/audios/universfield-interface-soft-click-131438.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer5!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await that_audio_player_oo85ab_actions
                                                  .initializeThatAudioPlayerForPlaylists(
                                                that_audio_player_oo85ab_app_state
                                                        .FFAppState()
                                                    .currentMediaAllTab
                                                    .toList(),
                                                image4Index,
                                              );
                                              if (that_audio_player_oo85ab_app_state
                                                      .FFAppState()
                                                  .isThatAudioPlayerPlaying) {
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.pauseAudio();
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.seekAudioToValue(
                                                  0.0,
                                                  image4Index,
                                                );
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.playAudio();
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

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
                                                          .elementAtOrNull(
                                                              image4Index),
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
                                                      duration: Duration(
                                                          milliseconds: 2),
                                                    ),
                                                  },
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.seekAudioToValue(
                                                  0.0,
                                                  image4Index,
                                                );
                                                logFirebaseEvent(
                                                    'Container_custom_action');
                                                await actions.playAudio();
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

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
                                                      duration: Duration(
                                                          milliseconds: 1),
                                                    ),
                                                  },
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: 265.0,
                                              height: 115.93,
                                              decoration: BoxDecoration(
                                                color: Color(0xBDD0E3F7),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                ),
                                                border: Border.all(
                                                  color: Color(0x1BEDF1F7),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      width: 116.0,
                                                      height: 126.79,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            image4Item
                                                                .mediaBanner,
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    16.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        image4Item
                                                                            .mediaTitle,
                                                                        'Title',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      image4Item
                                                                          .genre,
                                                                      'Genre',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
