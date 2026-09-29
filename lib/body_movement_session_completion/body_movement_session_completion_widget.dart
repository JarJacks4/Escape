import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/stat_pill_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:material_palette/material_palette.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'body_movement_session_completion_model.dart';
export 'body_movement_session_completion_model.dart';

class BodyMovementSessionCompletionWidget extends StatefulWidget {
  const BodyMovementSessionCompletionWidget({
    super.key,
    this.movesCompleted,
    this.elapsedMinutes,
    this.sessionLabel,
  });

  final int? movesCompleted;
  final int? elapsedMinutes;
  final String? sessionLabel;

  static String routeName = 'BodyMovementSessionCompletion';
  static String routePath = '/bodyMovementSessionCompletion';

  @override
  State<BodyMovementSessionCompletionWidget> createState() =>
      _BodyMovementSessionCompletionWidgetState();
}

class _BodyMovementSessionCompletionWidgetState
    extends State<BodyMovementSessionCompletionWidget> {
  late BodyMovementSessionCompletionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyMovementSessionCompletionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BodyMovementSessionCompletion'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BODY_MOVEMENT_SESSION_COMPLETION_BodyMov');
      logFirebaseEvent('BodyMovementSessionCompletion_firestore_');
      _model.streakData = await queryBodyRecordOnce(
        parent: currentUserReference,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  int _weeklyTarget() {
    final t = _model.streakData?.weeklyTarget ?? 0;
    return t > 0 ? t : 5;
  }

  int _remainingThisWeek() {
    final left = _weeklyTarget() - (_model.streakData?.currentWeekCount ?? 0);
    return left > 0 ? left : 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0C0F19),
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return FbmGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: constraints.maxHeight.isFinite
                      ? constraints.maxHeight
                      : 200.0,
                  params: ShaderParams(values: {
                    'gradientAngle': 123.64,
                    'gradientScale': 1.27,
                    'gradientOffset': 0.19,
                    'noiseIntensity': 0.81,
                    'ditherStrength': 0.0,
                    'ditherScale': 1.0,
                    'animSpeed': 0.33,
                    'octaves': 6.06,
                    'lacunarity': 2.35,
                    'persistence': 0.5,
                    'noiseScale': 4.5,
                    'colorCount': 3.0,
                    'softness': 1.0,
                    'exposure': 1.0,
                    'contrast': 1.0,
                    'bumpStrength': 0.1,
                    'lightDirX': 0.5,
                    'lightDirY': 0.6,
                    'lightDirZ': 0.9,
                    'lightIntensity': 0.89,
                    'ambient': 0.29,
                    'specular': 0.16,
                    'shininess': 3.06,
                    'metallic': 0.0,
                    'roughness': 0.49,
                    'edgeFade': 0.0,
                    'edgeFadeMode': 1.0
                  }, colors: {
                    'color2': Color(0x00808080),
                    'color3': Color(0x00808080),
                    'color4': Color(0x00808080),
                    'color5': Color(0x00808080),
                    'color6': Color(0x00808080),
                    'color7': Color(0x00808080),
                    'color8': Color(0x00808080),
                    'color9': Color(0x00808080),
                    'color0': FlutterFlowTheme.of(context).accent3,
                    'color1': FlutterFlowTheme.of(context).tertiary
                  }),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            SingleChildScrollView(
              primary: false,
              controller: _model.columnScrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 40.0,
                          ),
                          Container(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Container(
                                  width: 200.0,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9999.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0x0D141A2D),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 160.0,
                                  height: 160.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9999.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0x1A141A2D),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9999.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0x33141A2D),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 30.0,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                    gradient: RadialGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).secondary,
                                        FlutterFlowTheme.of(context).success
                                      ],
                                      stops: [0.0, 1.0],
                                      center: Alignment(0.0, 0.0),
                                      radius: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(9999.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 32.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'a3g5fsn1' /* You showed up for yourself */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                      lineHeight: 1.25,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '6hu3k1h8' /* That's a small, kind thing you... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                          Container(
                            height: 17.6,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: wrapWithModel(
                                  model: _model.statPillModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: StatPillWidget(
                                    label: 'MOVES',
                                    value: widget.movesCompleted.toString(),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: wrapWithModel(
                                  model: _model.statPillModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: StatPillWidget(
                                    label: 'TIME',
                                    value: widget.elapsedMinutes?.toString(),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: wrapWithModel(
                                  model: _model.statPillModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: StatPillWidget(
                                    label: 'ENERGY',
                                    value: widget.sessionLabel,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                          Container(
                            height: 24.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0x1AFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 40.0,
                                  color: Color(0x69D0E3F7),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(32.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0x1AD1D5E8),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 32.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x33E8C39E),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/fire.gif',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        9999.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color(0x37EDF1F7),
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${(_model.streakData?.streakCount ?? 0).toString()} - Day Streak',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                        lineHeight: 1.3,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dvojckgu' /* Weekly goal */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                        Text(
                                          '${(_model.streakData?.currentWeekCount ?? 0).toString()}/${_weeklyTarget().toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Spacer(),
                                        Spacer(),
                                        Spacer(),
                                        Spacer(),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 38.63,
                                          decoration: BoxDecoration(
                                            color: Color(0xADFCFCFC),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 3.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            border: Border.all(
                                              color: Color(0x7DEDF1F7),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          LinearPercentIndicator(
                                                        percent: ((_model.streakData?.streakCount ?? 0) / 7).clamp(0.0, 1.0).toDouble(),
                                                        width: 250.0,
                                                        lineHeight: 20.0,
                                                        animation: true,
                                                        animateFromLastPercent:
                                                            true,
                                                        progressColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        backgroundColor:
                                                            Color(0x741C2444),
                                                        center: Text(
                                                          '${(((_model.streakData?.streakCount ?? 0) / 7).clamp(0.0, 1.0) * 100).round()}%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                        barRadius:
                                                            Radius.circular(
                                                                50.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Just ${_remainingThisWeek()} more to reach this week\'s goal — a calmer you is closer than you think.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 20.8,
                          ),
                          Container(
                            height: 20.0,
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BODY_MOVEMENT_SESSION_COMPLETION_COMPLET');
                              logFirebaseEvent('Button_haptic_feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent('Button_play_sound');
                              _model.soundPlayer ??= AudioPlayer();
                              if (_model.soundPlayer!.playing) {
                                await _model.soundPlayer!.stop();
                              }
                              _model.soundPlayer!.setVolume(0.31);
                              _model.soundPlayer!
                                  .setAsset(
                                      'assets/audios/lucadialessandro-calm-ambient-intro-490646.mp3')
                                  .then((_) => _model.soundPlayer!.play());

                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().pointsEarnedPercentage =
                                  FFAppState().pointsEarnedPercentage + 100.0;
                              FFAppState().pointsEarned =
                                  FFAppState().pointsEarned + 100;
                              safeSetState(() {});
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                BodySessionCompleteBackToHomeWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 9),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'h9j21n3n' /* Complete Exercise */,
                            ),
                            options: FFButtonOptions(
                              height: 52.83,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).accent3,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ],
                      ),
                    ),
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
