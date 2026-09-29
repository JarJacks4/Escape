import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_palette/material_palette.dart';
import 'active_session_timer2_model.dart';
export 'active_session_timer2_model.dart';

class ActiveSessionTimer2Widget extends StatefulWidget {
  const ActiveSessionTimer2Widget({
    super.key,
    this.moves,
    this.currentIndex,
    this.sessionStartTime,
  });

  final MoveStructStruct? moves;
  final int? currentIndex;
  final DateTime? sessionStartTime;

  static String routeName = 'ActiveSessionTimer2';
  static String routePath = '/activeSessionTimer2';

  @override
  State<ActiveSessionTimer2Widget> createState() =>
      _ActiveSessionTimer2WidgetState();
}

class _ActiveSessionTimer2WidgetState extends State<ActiveSessionTimer2Widget> {
  late ActiveSessionTimer2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveSessionTimer2Model());
    _model.localIndex = widget.currentIndex ?? 0;

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ActiveSessionTimer2'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => _model.timerController.onStartTimer());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).height < 720.0;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0D1117),
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
              padding: EdgeInsets.all(isCompact ? 16.0 : 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: isCompact ? 6.0 : 16.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          isCompact ? 8.0 : 15.0,
                          0.0,
                          0.0,
                        ),
                    child: Row(
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
                                'ACTIVE_SESSION_TIMER2_Container_ON_TAP');
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
                                'ACTIVE_SESSION_TIMER2_PAGE_Icon_ON_TAP');
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
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        ClipRect(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 40.0,
                              sigmaY: 40.0,
                            ),
                            child: Container(
                              width: isCompact ? 180.0 : 240.0,
                              height: isCompact ? 180.0 : 240.0,
                              decoration: BoxDecoration(
                                color: Color(0x0DA3D2D2),
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
                              width: isCompact ? 155.0 : 200.0,
                              height: isCompact ? 155.0 : 200.0,
                              decoration: BoxDecoration(
                                color: Color(0x1AA3D2D2),
                                borderRadius: BorderRadius.circular(9999.0),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: isCompact ? 190.0 : 270.26,
                          height: isCompact ? 205.0 : 263.9,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 40.0,
                                color: Color(0xF6D0E3F7),
                                offset: Offset(
                                  0.0,
                                  2.0,
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
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.moves?.name,
                          'Gentle Burpee',
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.cormorantSc(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                              lineHeight: 1.25,
                            ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Container(
                            child: Text(
                              valueOrDefault<String>(
                                widget.moves?.cueText,
                                'Move at your own tempo. Rise and fold like a slow, steady wave.',
                              ),
                              textAlign: TextAlign.center,
                              maxLines: isCompact ? 3 : 5,
                              overflow: TextOverflow.ellipsis,
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                  Container(
                    height: isCompact ? 12.0 : 32.0,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowTimer(
                            initialTime: widget.moves!.durationSeconds * 1000,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
                              value,
                              hours: false,
                              minute: false,
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).accent3,
                                  fontSize: isCompact ? 30.0 : 36.0,
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
                            FFLocalizations.of(context).getText(
                              'k2aw8pww' /* reps */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFA3D2D2),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                  lineHeight: 1.3,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '4anuzl7c' /* Count along at your own pace */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                  lineHeight: 1.3,
                                ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                  Spacer(),
                  Container(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            0.0,
                            0.0,
                            isCompact ? 12.0 : 24.0,
                          ),
                      child: Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'ACTIVE_SESSION_TIMER2_PAGE_Button_ON_TAP');
                            logFirebaseEvent('Button_haptic_feedback');
                            HapticFeedback.heavyImpact();
                            logFirebaseEvent('Button_update_page_state');
                            _model.currentMove = widget.moves;
                            _model.localIndex = (_model.localIndex ?? 0) + 1;
                            safeSetState(() {});
                            { // always advance to the next move
                              logFirebaseEvent('Button_timer');
                              _model.timerController.onStartTimer();
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                BodyMovement3Widget.routeName,
                                queryParameters: {
                                  'moves': serializeParam(
                                    widget.moves,
                                    ParamType.DataStruct,
                                  ),
                                  'currentIndex': serializeParam(
                                    widget.currentIndex,
                                    ParamType.int,
                                  ),
                                  'sessionStartTime': serializeParam(
                                    widget.sessionStartTime,
                                    ParamType.DateTime,
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
