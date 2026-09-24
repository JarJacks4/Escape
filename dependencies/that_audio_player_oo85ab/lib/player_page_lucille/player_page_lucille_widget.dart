import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/music_bottom_sheet_all_tab_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_page_lucille_model.dart';
export 'player_page_lucille_model.dart';

class PlayerPageLucilleWidget extends StatefulWidget {
  const PlayerPageLucilleWidget({
    super.key,
    this.currentSong,
    this.lucilleAudioUrl,
    this.soundscapeTitle,
    this.soundscapeID,
    this.soundscapeCategory,
    this.sessionID,
  });

  final MediaStruct? currentSong;
  final String? lucilleAudioUrl;
  final String? soundscapeTitle;
  final String? soundscapeID;
  final String? soundscapeCategory;
  final String? sessionID;

  static String routeName = 'PlayerPageLucille';
  static String routePath = '/playerPageLucille';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<PlayerPageLucilleWidget> createState() =>
      _PlayerPageLucilleWidgetState();
}

class _PlayerPageLucilleWidgetState extends State<PlayerPageLucilleWidget>
    with TickerProviderStateMixin {
  late PlayerPageLucilleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerPageLucilleModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1670.0.ms,
            color: Color(0xA3F0831A),
            angle: 0.524,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1210.0.ms,
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

    final screenSize = MediaQuery.sizeOf(context);
    final isCompactHeight = screenSize.height < 720.0;
    final artworkSize = min(
      screenSize.width - 48.0,
      isCompactHeight ? screenSize.height * 0.34 : 300.0,
    );

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
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'packages/that_audio_player_oo85ab/assets/images/Create_Tab_Bar_Page_(1).png',
              ).image,
            ),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'packages/that_audio_player_oo85ab/assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xD4EE8B60),
                      Color(0x4DD0E3F7),
                      Color(0xF7FFFFFF)
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
                      sigmaX: 30.0,
                      sigmaY: 30.0,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        24.0,
                        isCompactHeight ? 20.0 : 45.0,
                        24.0,
                        isCompactHeight ? 16.0 : 24.0,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                15.0,
                                isCompactHeight ? 4.0 : 15.0,
                                15.0,
                                0.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 46.0,
                                    height: 46.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8.0,
                                          color: Color(0x66D0E3F7),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                          spreadRadius: 3.0,
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0x5CEDF1F7),
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.lightImpact();
                                        context.safePop();
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 46.0,
                                        height: 46.0,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10.0,
                                              color: Color(0xCAF9B058),
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                              spreadRadius: 10.0,
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0x5CEDF1F7),
                                          ),
                                        ),
                                        child: Hero(
                                          tag: 'lucille',
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'packages/that_audio_player_oo85ab/assets/images/f888a650f73ba5acfa7794b87773e0ae64ac7c72.png',
                                              width: 204.8,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'imageOnPageLoadAnimation1']!),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: SizedBox(
                                width: artworkSize,
                                height: artworkSize,
                                child: Hero(
                                  tag: 'backgroundGif',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(32.0),
                                    child: Image.asset(
                                      'packages/that_audio_player_oo85ab/assets/images/download_(26)_(1).gif',
                                      width: artworkSize,
                                      height: artworkSize,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation2']!),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.soundscapeTitle,
                                      'Title',
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.workSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.soundscapeCategory,
                                      'Category',
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.workSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                activeTrackColor: Color(0xFFFCC462),
                                inactiveTrackColor: Color(0xFF5A5C60),
                                thumbColor: Color(0xFF1C2444),
                                overlayColor: Color(0x63D0E3F7),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    functions.formatSecondsToMinutes(
                                        FFAppState()
                                            .currentPositionOfAudioInSeconds,
                                        'MM:SS'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.workSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xD41D2428),
                                          fontSize: 10.0,
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
                                  Text(
                                    functions.formatSecondsToMinutes(
                                        FFAppState()
                                            .totalDurationOfAudioInSeconds,
                                        'MM:SS'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.workSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xD41D2428),
                                          fontSize: 10.0,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (FFAppState()
                                          .isThatAudioPlayerShuffling)
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 54.0,
                                          icon: Icon(
                                            Icons.shuffle_on_rounded,
                                            color: Color(0xA4FFFFFF),
                                            size: 36.0,
                                          ),
                                          onPressed: () async {
                                            await actions.toggleShuffle();
                                          },
                                        ),
                                      if (!FFAppState()
                                          .isThatAudioPlayerShuffling)
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 54.0,
                                          icon: Icon(
                                            Icons.shuffle_on_rounded,
                                            color: Color(0xA4FFFFFF),
                                            size: 36.0,
                                          ),
                                          onPressed: () async {
                                            await actions.toggleShuffle();
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
                                              Icons.skip_previous,
                                              color: Color(0xA4FFFFFF),
                                              size: 36.0,
                                            ),
                                            onPressed: () async {
                                              HapticFeedback.lightImpact();
                                              await actions.playPreviousTrack();
                                            },
                                          ),
                                          if (!FFAppState()
                                              .isThatAudioPlayerPlaying)
                                            FlutterFlowIconButton(
                                              borderRadius: 50.0,
                                              buttonSize: 54.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.play_circle_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 36.0,
                                              ),
                                              onPressed: () async {
                                                HapticFeedback.lightImpact();
                                                _model.apiResultcqi =
                                                    await LucilleSoundscapesGroup
                                                        .startSoundCall
                                                        .call(
                                                  soundscapeId:
                                                      widget!.soundscapeID,
                                                );

                                                safeSetState(() {});
                                              },
                                            ),
                                          if (FFAppState()
                                              .isThatAudioPlayerPlaying)
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 54.0,
                                              icon: Icon(
                                                Icons.pause_circle_rounded,
                                                color: Color(0xA4FFFFFF),
                                                size: 36.0,
                                              ),
                                              onPressed: () async {
                                                HapticFeedback.lightImpact();
                                                _model.apiResultt1a =
                                                    await LucilleSoundscapesGroup
                                                        .stopSoundCall
                                                        .call(
                                                  sessionId: widget!.sessionID,
                                                );

                                                safeSetState(() {});
                                              },
                                            ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 54.0,
                                            icon: Icon(
                                              Icons.skip_next,
                                              color: Color(0xA4FFFFFF),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child:
                                                MusicBottomSheetAllTabWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Divider(
                                    thickness: 3.0,
                                    indent: 60.0,
                                    endIndent: 60.0,
                                    color: Color(0xD7FFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(
                            height: isCompactHeight ? 16.0 : 45.0,
                          )),
                        ),
                      ),
                    ),
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
