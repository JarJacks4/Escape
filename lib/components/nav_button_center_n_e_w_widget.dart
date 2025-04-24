import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_button_center_n_e_w_model.dart';
export 'nav_button_center_n_e_w_model.dart';

class NavButtonCenterNEWWidget extends StatefulWidget {
  const NavButtonCenterNEWWidget({super.key});

  @override
  State<NavButtonCenterNEWWidget> createState() =>
      _NavButtonCenterNEWWidgetState();
}

class _NavButtonCenterNEWWidgetState extends State<NavButtonCenterNEWWidget>
    with TickerProviderStateMixin {
  late NavButtonCenterNEWModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavButtonCenterNEWModel());

    animationsMap.addAll({
      'columnOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 30.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.85, 0.85),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 30.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.85, 0.85),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 30.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.85, 0.85),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 30.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.85, 0.85),
            end: Offset(1.0, 1.0),
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              color: Color(0x0F000000),
              offset: Offset(
                0.0,
                4.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 14.0, 5.0, 14.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAV_BUTTON_CENTER_N_E_W_Column_b3ggukqh_');
                    logFirebaseEvent('Column_update_component_state');
                    _model.number = 0;
                    safeSetState(() {});
                    logFirebaseEvent('Column_widget_animation');
                    if (animationsMap['columnOnActionTriggerAnimation1'] !=
                        null) {
                      await animationsMap['columnOnActionTriggerAnimation1']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('Column_navigate_to');

                    context.pushNamed(
                      HomeVersion2Widget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 7),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_sharp,
                        color: valueOrDefault<Color>(
                          _model.number == 0
                              ? FlutterFlowTheme.of(context).accent1
                              : FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        size: 28.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'nsrt2bix' /* Home */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'The Seasons',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ).animateOnActionTrigger(
                  animationsMap['columnOnActionTriggerAnimation1']!,
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAV_BUTTON_CENTER_N_E_W_Column_7j53fvm2_');
                    logFirebaseEvent('Column_update_component_state');
                    _model.number = 1;
                    safeSetState(() {});
                    logFirebaseEvent('Column_widget_animation');
                    if (animationsMap['columnOnActionTriggerAnimation2'] !=
                        null) {
                      await animationsMap['columnOnActionTriggerAnimation2']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('Column_navigate_to');

                    context.pushNamed(
                      AISoundscapesWidget.routeName,
                      queryParameters: {
                        'meditationaudio': serializeParam(
                          '',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 7),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.surround_sound,
                        color: valueOrDefault<Color>(
                          _model.number == 1
                              ? FlutterFlowTheme.of(context).accent1
                              : FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        size: 28.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'fw5jxwyz' /* Sounds */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'The Seasons',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ).animateOnActionTrigger(
                  animationsMap['columnOnActionTriggerAnimation2']!,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).secondary,
                                FlutterFlowTheme.of(context).accent1
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(1.0, 0.87),
                              end: AlignmentDirectional(-1.0, -0.87),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 47.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/Icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAV_BUTTON_CENTER_N_E_W_Column_h3m870rc_');
                    logFirebaseEvent('Column_update_component_state');
                    _model.number = 2;
                    safeSetState(() {});
                    logFirebaseEvent('Column_widget_animation');
                    if (animationsMap['columnOnActionTriggerAnimation3'] !=
                        null) {
                      await animationsMap['columnOnActionTriggerAnimation3']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('Column_navigate_to');

                    context.pushNamed(
                      CommunityHomeWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 7),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_alt_sharp,
                        color: valueOrDefault<Color>(
                          _model.number == 2
                              ? FlutterFlowTheme.of(context).accent1
                              : FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        size: 28.0,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'k8awfje3' /* Providers */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animateOnActionTrigger(
                  animationsMap['columnOnActionTriggerAnimation3']!,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'NAV_BUTTON_CENTER_N_E_W_Column_v4kjbqj3_');
                      logFirebaseEvent('Column_update_component_state');
                      _model.number = 3;
                      safeSetState(() {});
                      logFirebaseEvent('Column_widget_animation');
                      if (animationsMap['columnOnActionTriggerAnimation4'] !=
                          null) {
                        await animationsMap['columnOnActionTriggerAnimation4']!
                            .controller
                            .forward(from: 0.0);
                      }
                      logFirebaseEvent('Column_navigate_to');

                      context.pushNamed(
                        ProfileFINALWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 7),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: valueOrDefault<Color>(
                            _model.number == 3
                                ? FlutterFlowTheme.of(context).accent1
                                : FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          size: 28.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '03skaxkb' /* Profile */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['columnOnActionTriggerAnimation4']!,
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
