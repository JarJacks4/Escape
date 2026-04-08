import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'energy_scan_dialogue_comp_copy_model.dart';
export 'energy_scan_dialogue_comp_copy_model.dart';

/// New Component Gen
class EnergyScanDialogueCompCopyWidget extends StatefulWidget {
  const EnergyScanDialogueCompCopyWidget({super.key});

  @override
  State<EnergyScanDialogueCompCopyWidget> createState() =>
      _EnergyScanDialogueCompCopyWidgetState();
}

class _EnergyScanDialogueCompCopyWidgetState
    extends State<EnergyScanDialogueCompCopyWidget>
    with TickerProviderStateMixin {
  late EnergyScanDialogueCompCopyModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnergyScanDialogueCompCopyModel());

    animationsMap.addAll({
      'pageViewOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 1480.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          height: 510.4,
          decoration: BoxDecoration(),
          child: Container(
            width: double.infinity,
            height: 545.4,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: PageView(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.543,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/970b1c1805358254790eff7cd9ea1fdd.gif',
                                    ).image,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(1.0, 1.0),
                                    end: AlignmentDirectional(-1.0, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: Color(0x75EDF1F7),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                      width: 117.6,
                                      height: 137.4,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 80.0,
                                            color: Color(0x75EDF1F7),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                            spreadRadius: 20.0,
                                          )
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x3CAE7EF6),
                                            Color(0x5039519F),
                                            Color(0x811C2444)
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0x33FFFFFF),
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ENERGY_SCAN_DIALOGUE_COPY_close_rounded_');
                                                    logFirebaseEvent(
                                                        'IconButton_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zvirtuih' /* Welcome to Your Energy Center ... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'cikycjbf' /* This AI-powered tool analyzes ... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jxlkamg6' /* 1 of 7 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            Color(0xCCFFFFFF),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_Text_veaa34rn_');
                                                        logFirebaseEvent(
                                                            'Text_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Text_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '1ylb9952' /* Next */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.511,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/970b1c1805358254790eff7cd9ea1fdd.gif',
                                    ).image,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(1.0, 1.0),
                                    end: AlignmentDirectional(-1.0, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: Color(0x75EDF1F7),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 40.0,
                                      sigmaY: 40.0,
                                    ),
                                    child: Container(
                                      width: 117.6,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 80.0,
                                            color: Color(0x75EDF1F7),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                            spreadRadius: 20.0,
                                          )
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x3CAE7EF6),
                                            Color(0x5039519F),
                                            Color(0x811C2444)
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0x33FFFFFF),
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ENERGY_SCAN_DIALOGUE_COPY_close_rounded_');
                                                    logFirebaseEvent(
                                                        'IconButton_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'pp5hjyf5' /* Your Daily Scan */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ajgzjqhy' /* This shows your personalized e... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AnimatedDefaultTextStyle(
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  duration: Duration(
                                                      milliseconds: 465),
                                                  curve: Curves.easeIn,
                                                  child: Text(
                                                    '${_model.pageViewCurrentIndex.toString()} of 7',
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(120.0,
                                                                0.0, 0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_BACK_BTN_ON_TA');
                                                        logFirebaseEvent(
                                                            'Button_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Button_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.previousPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'c5f89mki' /* Back */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 44.0,
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xAEF0831A),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x3AEDF1F7),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_Text_hi4t5vmg_');
                                                        logFirebaseEvent(
                                                            'Text_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Text_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '5qvz9kj0' /* Next */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.451,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/970b1c1805358254790eff7cd9ea1fdd.gif',
                                ).image,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(1.0, 1.0),
                                end: AlignmentDirectional(-1.0, -1.0),
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                color: Color(0x75EDF1F7),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 40.0,
                                  sigmaY: 40.0,
                                ),
                                child: Container(
                                  width: 117.6,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 80.0,
                                        color: Color(0x75EDF1F7),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                        spreadRadius: 20.0,
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0x3CAE7EF6),
                                        Color(0x5039519F),
                                        Color(0x811C2444)
                                      ],
                                      stops: [0.0, 0.5, 1.0],
                                      begin: AlignmentDirectional(1.0, -0.64),
                                      end: AlignmentDirectional(-1.0, 0.64),
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 24.0, 24.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              buttonSize: 40.0,
                                              fillColor: Color(0x33FFFFFF),
                                              icon: Icon(
                                                Icons.close_rounded,
                                                color: Colors.white,
                                                size: 20.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'ENERGY_SCAN_DIALOGUE_COPY_close_rounded_');
                                                logFirebaseEvent(
                                                    'IconButton_haptic_feedback');
                                                HapticFeedback.lightImpact();
                                                logFirebaseEvent(
                                                    'IconButton_bottom_sheet');
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wjsnduvs' /* Overall State Indicator */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5v0xawdc' /* This badge shows your current ... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            AnimatedDefaultTextStyle(
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              duration:
                                                  Duration(milliseconds: 465),
                                              curve: Curves.easeIn,
                                              child: Text(
                                                '${_model.pageViewCurrentIndex.toString()} of 7',
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        120.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ENERGY_SCAN_DIALOGUE_COPY_BACK_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'Button_page_view');
                                                    await _model
                                                        .pageViewController
                                                        ?.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'bobsgddq' /* Back */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 44.0,
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xAEF0831A),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Color(0x3AEDF1F7),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'ENERGY_SCAN_DIALOGUE_COPY_Text_d02cm8ig_');
                                                    logFirebaseEvent(
                                                        'Text_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'Text_page_view');
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6lmrco6c' /* Next */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: Colors.white,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: Colors.white,
                                                  size: 20.0,
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.546,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/970b1c1805358254790eff7cd9ea1fdd.gif',
                                    ).image,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(1.0, 1.0),
                                    end: AlignmentDirectional(-1.0, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: Color(0x75EDF1F7),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 40.0,
                                      sigmaY: 40.0,
                                    ),
                                    child: Container(
                                      width: 117.6,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 80.0,
                                            color: Color(0x75EDF1F7),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                            spreadRadius: 20.0,
                                          )
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x3CAE7EF6),
                                            Color(0x5039519F),
                                            Color(0x811C2444)
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0x33FFFFFF),
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ENERGY_SCAN_DIALOGUE_COPY_close_rounded_');
                                                    logFirebaseEvent(
                                                        'IconButton_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mu6eklhm' /* Energy Center Visualization */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'pjitlfzp' /* These glowing orbs represent y... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AnimatedDefaultTextStyle(
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  duration: Duration(
                                                      milliseconds: 465),
                                                  curve: Curves.easeIn,
                                                  child: Text(
                                                    '${_model.pageViewCurrentIndex.toString()} of 7',
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(120.0,
                                                                0.0, 0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_BACK_BTN_ON_TA');
                                                        logFirebaseEvent(
                                                            'Button_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Button_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.previousPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'mgz5j2zc' /* Back */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 44.0,
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xAEF0831A),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x3AEDF1F7),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_Text_f1z6d1x5_');
                                                        logFirebaseEvent(
                                                            'Text_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Text_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'gcsji1c7' /* Next */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.512,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/970b1c1805358254790eff7cd9ea1fdd.gif',
                                    ).image,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(1.0, 1.0),
                                    end: AlignmentDirectional(-1.0, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: Color(0x75EDF1F7),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 40.0,
                                      sigmaY: 40.0,
                                    ),
                                    child: Container(
                                      width: 117.6,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 80.0,
                                            color: Color(0x75EDF1F7),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                            spreadRadius: 20.0,
                                          )
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x3CAE7EF6),
                                            Color(0x5039519F),
                                            Color(0x811C2444)
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0x33FFFFFF),
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ENERGY_SCAN_DIALOGUE_COPY_close_rounded_');
                                                    logFirebaseEvent(
                                                        'IconButton_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'kgbqq0ys' /* Energy Center Details */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nv0zbk68' /* Each card provides detailed in... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AnimatedDefaultTextStyle(
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  duration: Duration(
                                                      milliseconds: 465),
                                                  curve: Curves.easeIn,
                                                  child: Text(
                                                    '${_model.pageViewCurrentIndex.toString()} of 7',
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(120.0,
                                                                0.0, 0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_BACK_BTN_ON_TA');
                                                        logFirebaseEvent(
                                                            'Button_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Button_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.previousPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rzku5aft' /* Back */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 44.0,
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xAEF0831A),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x3AEDF1F7),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_Text_z768hfh3_');
                                                        logFirebaseEvent(
                                                            'Text_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Text_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'wfr8fpl8' /* Next */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.51,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/970b1c1805358254790eff7cd9ea1fdd.gif',
                                    ).image,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(1.0, 1.0),
                                    end: AlignmentDirectional(-1.0, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: Color(0x75EDF1F7),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 40.0,
                                      sigmaY: 40.0,
                                    ),
                                    child: Container(
                                      width: 117.6,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 80.0,
                                            color: Color(0x75EDF1F7),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                            spreadRadius: 20.0,
                                          )
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x3CAE7EF6),
                                            Color(0x5039519F),
                                            Color(0x811C2444)
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0x33FFFFFF),
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ENERGY_SCAN_DIALOGUE_COPY_close_rounded_');
                                                    logFirebaseEvent(
                                                        'IconButton_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'lll5gvi2' /* Energy Level Bars */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'culu6lgv' /* The colored bars show the curr... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AnimatedDefaultTextStyle(
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  duration: Duration(
                                                      milliseconds: 465),
                                                  curve: Curves.easeIn,
                                                  child: Text(
                                                    '${_model.pageViewCurrentIndex.toString()} of 7',
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(120.0,
                                                                0.0, 0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_BACK_BTN_ON_TA');
                                                        logFirebaseEvent(
                                                            'Button_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Button_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.previousPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'kewb743w' /* Back */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 44.0,
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xAEF0831A),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x3AEDF1F7),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_Text_4okea8ac_');
                                                        logFirebaseEvent(
                                                            'Text_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Text_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'z0uid4mg' /* Next */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.511,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/970b1c1805358254790eff7cd9ea1fdd.gif',
                                    ).image,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(1.0, 1.0),
                                    end: AlignmentDirectional(-1.0, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: Color(0x75EDF1F7),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 40.0,
                                      sigmaY: 40.0,
                                    ),
                                    child: Container(
                                      width: 117.6,
                                      height: 134.66,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 80.0,
                                            color: Color(0x75EDF1F7),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                            spreadRadius: 20.0,
                                          )
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x3CAE7EF6),
                                            Color(0x5039519F),
                                            Color(0x811C2444)
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0x33FFFFFF),
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ENERGY_SCAN_DIALOGUE_COPY_close_rounded_');
                                                    logFirebaseEvent(
                                                        'IconButton_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dsi4s2x2' /* You're All Set! */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'a1gf9dzh' /* You're ready to explore your e... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AnimatedDefaultTextStyle(
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  duration: Duration(
                                                      milliseconds: 465),
                                                  curve: Curves.easeIn,
                                                  child: Text(
                                                    '${_model.pageViewCurrentIndex.toString()} of 7',
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(100.0,
                                                                0.0, 0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_BACK_BTN_ON_TA');
                                                        logFirebaseEvent(
                                                            'Button_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Button_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.previousPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'a5e54ksu' /* Back */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 44.0,
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xAEF0831A),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x3AEDF1F7),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'ENERGY_SCAN_DIALOGUE_COPY_Text_m3szpgw1_');
                                                        logFirebaseEvent(
                                                            'Text_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                        logFirebaseEvent(
                                                            'Text_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          's3kdg8pz' /* Finish */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      count: 7,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        safeSetState(() {});
                      },
                      effect: smooth_page_indicator.SlideEffect(
                        spacing: 8.0,
                        radius: 8.0,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        dotColor: Color(0x3BD0E3F7),
                        activeDotColor: FlutterFlowTheme.of(context).accent1,
                        paintStyle: PaintingStyle.stroke,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animateOnActionTrigger(
            animationsMap['pageViewOnActionTriggerAnimation']!,
          ),
        ),
      ),
    );
  }
}
