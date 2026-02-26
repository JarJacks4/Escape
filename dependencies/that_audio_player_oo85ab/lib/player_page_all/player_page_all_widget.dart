import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_page_all_model.dart';
export 'player_page_all_model.dart';

class PlayerPageAllWidget extends StatefulWidget {
  const PlayerPageAllWidget({super.key});

  static String routeName = 'PlayerPageAll';
  static String routePath = '/playerPageAll';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<PlayerPageAllWidget> createState() => _PlayerPageAllWidgetState();
}

class _PlayerPageAllWidgetState extends State<PlayerPageAllWidget> {
  late PlayerPageAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerPageAllModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          height: 845.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'packages/that_audio_player_oo85ab/assets/images/Create_Tab_Bar_Page_(1).png',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 45.0, 24.0, 24.0),
            child: SingleChildScrollView(
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
                      context.safePop();
                    },
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32.0),
                    child: Image.network(
                      FFAppState().currentMedia.mediaBanner,
                      width: double.infinity,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFAppState().currentMedia.mediaTitle,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: Color(0xFF1C2444),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          FFAppState().currentMedia.mediaArtist,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 25.0,
                    child: custom_widgets.ThatCustomAudioSliderWidget(
                      width: double.infinity,
                      height: 25.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          functions.formatSecondsToMinutes(
                              FFAppState().currentPositionOfAudioInSeconds,
                              'MM:SS'),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF1C2444),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          functions.formatSecondsToMinutes(
                              FFAppState().totalDurationOfAudioInSeconds,
                              'MM:SS'),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF1C2444),
                                    fontSize: 10.0,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (FFAppState().isThatAudioPlayerShuffling)
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 54.0,
                              icon: Icon(
                                Icons.shuffle_on_rounded,
                                color: Color(0xFF1C2444),
                                size: 36.0,
                              ),
                              onPressed: () async {
                                await actions.toggleShuffle();
                              },
                            ),
                          if (!FFAppState().isThatAudioPlayerShuffling)
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 54.0,
                              icon: Icon(
                                Icons.shuffle_rounded,
                                color: Color(0xFF1C2444),
                                size: 36.0,
                              ),
                              onPressed: () async {
                                await actions.toggleShuffle();
                              },
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 54.0,
                                icon: Icon(
                                  Icons.skip_previous_rounded,
                                  color: Color(0xFF1C2444),
                                  size: 36.0,
                                ),
                                onPressed: () async {
                                  HapticFeedback.lightImpact();
                                  await actions.playPreviousTrack();
                                },
                              ),
                              if (!FFAppState().isThatAudioPlayerPlaying)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 54.0,
                                  icon: Icon(
                                    Icons.play_circle_rounded,
                                    color: Color(0xFF1C2444),
                                    size: 36.0,
                                  ),
                                  onPressed: () async {
                                    HapticFeedback.lightImpact();
                                    await actions.playAudio();
                                  },
                                ),
                              if (FFAppState().isThatAudioPlayerPlaying)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 54.0,
                                  icon: Icon(
                                    Icons.pause_circle_rounded,
                                    color: Color(0xFF1C2444),
                                    size: 36.0,
                                  ),
                                  onPressed: () async {
                                    HapticFeedback.lightImpact();
                                    await actions.pauseAudio();
                                  },
                                ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 54.0,
                                icon: Icon(
                                  Icons.skip_next_rounded,
                                  color: Color(0xFF1C2444),
                                  size: 36.0,
                                ),
                                onPressed: () async {
                                  HapticFeedback.lightImpact();
                                  await actions.playNextTrack();
                                },
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          if (FFAppState().loopMode == 'off')
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 54.0,
                              icon: Icon(
                                Icons.repeat_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32.0,
                              ),
                              onPressed: () async {
                                await actions.setLoopMode(
                                  'all',
                                );
                              },
                            ),
                          if (FFAppState().loopMode == 'all')
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 54.0,
                              icon: Icon(
                                Icons.repeat_on_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32.0,
                              ),
                              onPressed: () async {
                                await actions.setLoopMode(
                                  'one',
                                );
                              },
                            ),
                          if (FFAppState().loopMode == 'one')
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 54.0,
                              icon: Icon(
                                Icons.repeat_one_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32.0,
                              ),
                              onPressed: () async {
                                await actions.setLoopMode(
                                  'off',
                                );
                              },
                            ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final mediaItems =
                          FFAppState().currentMediaAllTab.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: mediaItems.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, mediaItemsIndex) {
                          final mediaItemsItem = mediaItems[mediaItemsIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().isThatAudioPlayerPlaying) {
                                await actions.pauseAudio();
                                await actions.seekAudioToValue(
                                  0.0,
                                  mediaItemsIndex,
                                );
                                await actions.playAudio();
                              } else {
                                await actions.seekAudioToValue(
                                  0.0,
                                  mediaItemsIndex,
                                );
                                await actions.playAudio();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            mediaItemsItem.mediaBanner,
                                            width: 32.0,
                                            height: 32.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mediaItemsItem.mediaTitle,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                            ),
                                            Text(
                                              mediaItemsItem.mediaArtist,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                                .secondaryText,
                                                        fontSize: 12.0,
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
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                    if (mediaItemsIndex ==
                                        FFAppState().currentMediaIndex)
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
    );
  }
}
