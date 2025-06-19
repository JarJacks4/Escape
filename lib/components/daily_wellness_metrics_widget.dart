import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'daily_wellness_metrics_model.dart';
export 'daily_wellness_metrics_model.dart';

class DailyWellnessMetricsWidget extends StatefulWidget {
  const DailyWellnessMetricsWidget({super.key});

  @override
  State<DailyWellnessMetricsWidget> createState() =>
      _DailyWellnessMetricsWidgetState();
}

class _DailyWellnessMetricsWidgetState extends State<DailyWellnessMetricsWidget>
    with TickerProviderStateMixin {
  late DailyWellnessMetricsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailyWellnessMetricsModel());

    animationsMap.addAll({
      'sliderOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'sliderOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'sliderOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'sliderOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x1A000000),
              offset: Offset(
                0.0,
                2.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '8ubgpdsq' /* Daily Wellness Metrics */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'WorkSans',
                      color: FlutterFlowTheme.of(context).secondary,
                      letterSpacing: 0.0,
                    ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'mc5qpi5d' /* Sleep Quality */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'c4t1hyi6' /* 7.5 hrs */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: Slider(
                          activeColor: FlutterFlowTheme.of(context).primary,
                          inactiveColor: Color(0x4D4B39EF),
                          min: 0.0,
                          max: 10.0,
                          value: _model.sliderValue1 ??= 7.5,
                          onChanged: (newValue) {
                            newValue =
                                double.parse(newValue.toStringAsFixed(4));
                            safeSetState(() => _model.sliderValue1 = newValue);
                          },
                        ),
                      ).animateOnPageLoad(
                          animationsMap['sliderOnPageLoadAnimation1']!),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '4529lfkq' /* Stress Level */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'ylocf9ie' /* Low */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: Slider(
                          activeColor: FlutterFlowTheme.of(context).secondary,
                          inactiveColor: Color(0x4D39D2C0),
                          min: 0.0,
                          max: 10.0,
                          value: _model.sliderValue2 ??= 3.0,
                          onChanged: (newValue) {
                            newValue =
                                double.parse(newValue.toStringAsFixed(4));
                            safeSetState(() => _model.sliderValue2 = newValue);
                          },
                        ),
                      ).animateOnPageLoad(
                          animationsMap['sliderOnPageLoadAnimation2']!),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'wlk037zp' /* Energy Level */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'hurtokra' /* High */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: Slider(
                          activeColor: FlutterFlowTheme.of(context).tertiary,
                          inactiveColor: Color(0x4DEE8B60),
                          min: 0.0,
                          max: 10.0,
                          value: _model.sliderValue3 ??= 8.0,
                          onChanged: (newValue) {
                            newValue =
                                double.parse(newValue.toStringAsFixed(4));
                            safeSetState(() => _model.sliderValue3 = newValue);
                          },
                        ),
                      ).animateOnPageLoad(
                          animationsMap['sliderOnPageLoadAnimation3']!),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'ardruij2' /* Water Intake */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'cyea1krh' /* 2.5L */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: Slider(
                          activeColor: FlutterFlowTheme.of(context).primary,
                          inactiveColor: Color(0x4D4B39EF),
                          min: 0.0,
                          max: 4.0,
                          value: _model.sliderValue4 ??= 2.5,
                          onChanged: (newValue) {
                            newValue =
                                double.parse(newValue.toStringAsFixed(4));
                            safeSetState(() => _model.sliderValue4 = newValue);
                          },
                        ),
                      ).animateOnPageLoad(
                          animationsMap['sliderOnPageLoadAnimation4']!),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  'jvpg2anq' /* Save Today's Metrics */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).accent1,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'WorkSans',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
