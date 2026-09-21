import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:material_palette/material_palette.dart';
import 'active_session_reps1_model.dart';
export 'active_session_reps1_model.dart';

class ActiveSessionReps1Widget extends StatefulWidget {
  const ActiveSessionReps1Widget({
    super.key,
    this.moves,
    int? currentIndex,
    this.sessionStartTime,
  }) : this.currentIndex = currentIndex ?? 0;

  final MoveStructStruct? moves;
  final int currentIndex;
  final DateTime? sessionStartTime;

  static String routeName = 'ActiveSessionReps1';
  static String routePath = '/activeSessionReps1';

  @override
  State<ActiveSessionReps1Widget> createState() =>
      _ActiveSessionReps1WidgetState();
}

class _ActiveSessionReps1WidgetState extends State<ActiveSessionReps1Widget> {
  late ActiveSessionReps1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveSessionReps1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ActiveSessionReps1'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ACTIVE_SESSION_REPS1_ActiveSessionReps1_');
      logFirebaseEvent('ActiveSessionReps1_update_page_state');
      _model.localIndex = widget.currentIndex;
      safeSetState(() {});
      logFirebaseEvent('ActiveSessionReps1_update_page_state');
      _model.currentMove = widget.moves;
      _model.sessionStartTime = getCurrentTimestamp;
      safeSetState(() {});
      if (widget.moves?.repCount != _model.currentMove?.repCount) {
        logFirebaseEvent('ActiveSessionReps1_timer');
        _model.timerController.onStartTimer();
      }
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF111729),
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return FbmGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: double.infinity,
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
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      height: 16.0,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ACTIVE_SESSION_REPS1_Container_ON_TAP');
                          logFirebaseEvent('Container_navigate_back');
                          context.safePop();
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: FlutterFlowTheme.of(context).primary,
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(9999.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0x1A141A2D),
                              width: 1.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.chevron_left_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ACTIVE_SESSION_REPS1_PAGE_Icon_ON_TAP');
                          logFirebaseEvent('Icon_navigate_to');

                          context.pushNamed(
                            HomeVersion5Widget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 2),
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.home,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 36.0,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999999999.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 240.0,
                      height: 240.0,
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Container(
                            width: 240.0,
                            height: 240.0,
                            decoration: BoxDecoration(
                              color: Color(0x05D3B3C2),
                              borderRadius: BorderRadius.circular(9999.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0x0DD3B3C2),
                                width: 1.0,
                              ),
                            ),
                          ),
                          ClipRect(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 40.0,
                                sigmaY: 40.0,
                              ),
                              child: Container(
                                width: 236.6,
                                height: 245.41,
                                decoration: BoxDecoration(
                                  color: Color(0x26D3B3C2),
                                  borderRadius: BorderRadius.circular(9999.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ),
                          ClipRect(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 20.0,
                                sigmaY: 20.0,
                              ),
                              child: Container(
                                width: 254.8,
                                height: 296.63,
                                decoration: BoxDecoration(
                                  color: Color(0x4DD3B3C2),
                                  borderRadius: BorderRadius.circular(9999.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 236.3,
                            height: 294.53,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5E6E8),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 40.0,
                                  color: Color(0xFFD3B3C2),
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  spreadRadius: 40.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(9999.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.VectaryModelViewer(
                                width: double.infinity,
                                height: double.infinity,
                                assetPath: widget.moves?.modelUrl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.moves?.name,
                          'Wu-Chi Yang Style',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                      Container(
                        width: 260.0,
                        child: Text(
                          valueOrDefault<String>(
                            widget.moves?.cueText,
                            'Let everything go heavy. This is yours — just breathe and arrive.',
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
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                                lineHeight: 1.4,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                  Spacer(),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowTimer(
                      initialTime: _model.timerInitialTimeMs,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      controller: _model.timerController,
                      updateStateInterval: Duration(milliseconds: 1000),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) safeSetState(() {});
                      },
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).accent3,
                                fontSize: 36.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 50.0,
                          buttonSize: 76.93,
                          fillColor: FlutterFlowTheme.of(context).accent4,
                          icon: Icon(
                            Icons.pause_circle,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 48.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'ACTIVE_SESSION_REPS1_pause_circle_ICN_ON');
                            logFirebaseEvent('IconButton_haptic_feedback');
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
                                .then((_) => _model.soundPlayer1!.play());

                            logFirebaseEvent('IconButton_timer');
                            _model.timerController.onStopTimer();
                          },
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                  Spacer(),
                  if (_model.localIndex! <
                      valueOrDefault<int>(
                        widget.moves?.durationSeconds,
                        -1,
                      ))
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'ACTIVE_SESSION_REPS1_PAGE_Button_ON_TAP');
                        logFirebaseEvent('Button_haptic_feedback');
                        HapticFeedback.heavyImpact();
                        logFirebaseEvent('Button_play_sound');
                        _model.soundPlayer2 ??= AudioPlayer();
                        if (_model.soundPlayer2!.playing) {
                          await _model.soundPlayer2!.stop();
                        }
                        _model.soundPlayer2!.setVolume(0.48);
                        _model.soundPlayer2!
                            .setAsset(
                                'assets/audios/universfield-interface-soft-click-131438.mp3')
                            .then((_) => _model.soundPlayer2!.play());

                        logFirebaseEvent('Button_update_page_state');
                        _model.localIndex = _model.localIndex! + 1;
                        safeSetState(() {});
                        if (widget.moves != _model.currentMove) {
                          logFirebaseEvent('Button_timer');
                          _model.timerController.onStartTimer();
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            ActiveSessionTimer2Widget.routeName,
                            queryParameters: {
                              'moves': serializeParam(
                                _model.currentMove,
                                ParamType.DataStruct,
                              ),
                              'sessionStartTime': serializeParam(
                                _model.sessionStartTime,
                                ParamType.DateTime,
                              ),
                              'currentIndex': serializeParam(
                                _model.localIndex,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 2),
                              ),
                            },
                          );
                        }
                      },
                      child: wrapWithModel(
                        model: _model.buttonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: Button7Widget(
                          icon: false,
                          iconPresent: false,
                          iconEnd: false,
                          iconEndPresent: false,
                          content: 'Next Move',
                          variant: 'primary',
                          size: 'large',
                          fullWidth: true,
                          loading: false,
                          disabled: false,
                        ),
                      ),
                    ),
                  Container(
                    height: 24.0,
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
