import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_palette/material_palette.dart';
import 'body_movement3_model.dart';
export 'body_movement3_model.dart';

class BodyMovement3Widget extends StatefulWidget {
  const BodyMovement3Widget({
    super.key,
    this.moves,
    this.currentIndex,
    required this.sessionStartTime,
  });

  final MoveStructStruct? moves;
  final int? currentIndex;
  final DateTime? sessionStartTime;

  static String routeName = 'BodyMovement3';
  static String routePath = '/bodyMovement3';

  @override
  State<BodyMovement3Widget> createState() => _BodyMovement3WidgetState();
}

class _BodyMovement3WidgetState extends State<BodyMovement3Widget> {
  late BodyMovement3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyMovement3Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BodyMovement3'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: Color(0xFF111729),
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: LayoutBuilder(
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
                      'color3': Color(0x00808080),
                      'color4': Color(0x00808080),
                      'color5': Color(0x00808080),
                      'color6': Color(0x00808080),
                      'color7': Color(0x00808080),
                      'color8': Color(0x00808080),
                      'color9': Color(0x00808080),
                      'color0': FlutterFlowTheme.of(context).accent3,
                      'color1': FlutterFlowTheme.of(context).tertiary,
                      'color2': Color(0x441C2444)
                    }),
                    animationMode: ShaderAnimationMode.continuous,
                    cache: false,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(isCompact ? 16.0 : 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          isCompact ? 12.0 : 30.0,
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
                                'BODY_MOVEMENT3_PAGE_Container_ON_TAP');
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
                            logFirebaseEvent('BODY_MOVEMENT3_PAGE_Icon_ON_TAP');
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
                              width: isCompact ? 170.0 : 220.0,
                              height: isCompact ? 170.0 : 220.0,
                              decoration: BoxDecoration(
                                color: Color(0x1AABA0E6),
                                borderRadius: BorderRadius.circular(9999.0),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: isCompact ? 190.0 : 271.23,
                          height: isCompact ? 200.0 : 250.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9999.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0x33ABA0E6),
                              width: 1.0,
                            ),
                          ),
                        ),
                        Container(
                          width: isCompact ? 175.0 : 211.6,
                          height: isCompact ? 195.0 : 228.05,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 40.0,
                                color: Color(0xFF988DD8),
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                spreadRadius: 40.0,
                              )
                            ],
                            gradient: RadialGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Color(0xFFC0B6F1)
                              ],
                              stops: [0.0, 1.0],
                              center: Alignment(0.0, 0.0),
                              radius: 0.5,
                            ),
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
                          'Plank',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.cormorantSc(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: isCompact ? 26.0 : 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              lineHeight: 1.5,
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
                                'Soften your gaze. Breathe steady and let your core simply hold you.',
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
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
                      FlutterFlowTimer(
                        initialTime: valueOrDefault<int>(
                          widget.moves?.durationSeconds,
                          00,
                        ),
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
                                  color: FlutterFlowTheme.of(context).accent4,
                                  fontSize: isCompact ? 32.0 : 42.0,
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
                          'kjoslk2n' /* Seconds */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                  Spacer(),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('BODY_MOVEMENT3_PAGE_Button_ON_TAP');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.heavyImpact();
                      logFirebaseEvent('Button_update_page_state');
                      _model.localIndex = widget.currentIndex;
                      _model.currentMove = widget.moves;
                      safeSetState(() {});
                      logFirebaseEvent('Button_timer');
                      _model.timerController.onStopTimer();
                      logFirebaseEvent('Button_firestore_query');
                      try {
                        _model.bodyCollectionQuery = await queryBodyRecordOnce(
                          parent: currentUserReference,
                          singleRecord: true,
                        );
                        _model.goalDoc = _model.bodyCollectionQuery?.firstOrNull;
                        final goalData = createBodyRecordData(
                          currentWeekCount: functions.getUpdatedWeekCount(
                              _model.goalDoc?.weekStartDate, _model.goalDoc?.currentWeekCount),
                          weekStartDate: functions.getUpdatedWeekStartDate(
                              _model.goalDoc?.weekStartDate, _model.goalDoc?.currentWeekCount),
                          streakCount: functions.getUpdatedStreak(
                              _model.goalDoc?.lastCompletedDate, _model.goalDoc?.streakCount),
                          lastCompletedDate: getCurrentTimestamp,
                        );
                        if (_model.goalDoc != null) {
                          await _model.goalDoc!.reference.update(goalData);
                        } else if (currentUserReference != null) {
                          await BodyRecord.createDoc(currentUserReference!).set({
          ...goalData,
          ...createBodyRecordData(weeklyTarget: 5),
        });
                        }
                      } catch (_) {
                        // Never block the user from reaching the completion page.
                      }
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        BodyMovementSessionCompletionWidget.routeName,
                        queryParameters: {
                          'movesCompleted': serializeParam(
                            widget.moves?.durationSeconds,
                            ParamType.int,
                          ),
                          'elapsedMinutes': serializeParam(
                            functions.getMinutesSinceDateTimeLastActivity(
                                widget.sessionStartTime),
                            ParamType.int,
                          ),
                          'sessionLabel': serializeParam(
                            valueOrDefault(
                                currentUserDocument?.currentMood, ''),
                            ParamType.String,
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

                      safeSetState(() {});
                    },
                    child: wrapWithModel(
                      model: _model.buttonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: Button7Widget(
                        icon: false,
                        iconPresent: false,
                        iconEnd: false,
                        iconEndPresent: false,
                        content: 'Finish Session',
                        variant: 'primary',
                        size: 'large',
                        fullWidth: true,
                        loading: false,
                        disabled: false,
                      ),
                    ),
                  ),
                  Container(
                    height: isCompact ? 8.0 : 16.0,
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
