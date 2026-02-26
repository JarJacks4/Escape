import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'interests_page_model.dart';
export 'interests_page_model.dart';

class InterestsPageWidget extends StatefulWidget {
  const InterestsPageWidget({super.key});

  static String routeName = 'InterestsPage';
  static String routePath = 'interestsPage';

  @override
  State<InterestsPageWidget> createState() => _InterestsPageWidgetState();
}

class _InterestsPageWidgetState extends State<InterestsPageWidget>
    with TickerProviderStateMixin {
  late InterestsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InterestsPage'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
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
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 3600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 3600.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.7,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Clean_and_organic_AI_interface_by_milkinside.gif',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.9,
                child: Align(
                  alignment: AlignmentDirectional(0.0, -0.98),
                  child: Container(
                    width: double.infinity,
                    height: 939.71,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 50.0,
                          color: Colors.transparent,
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 10.0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xAFD0E3F7),
                          FlutterFlowTheme.of(context).tertiary
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 670.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 50.0, 12.0, 0.0),
                                child: SingleChildScrollView(
                                  controller: _model.columnController,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 32.0, 0.0, 8.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '0zdkl67a' /* Pick Your Interests */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily: 'The Seasons',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                letterSpacing: 0.0,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation']!),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 12.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '176c8g0x' /* Your interests will be used th... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: FlutterFlowCheckboxGroup(
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dfhkcnzc' /* Pilates */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9gueolqz' /* Yoga */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'c5fo5j3n' /* Escape Innerverse */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'b33ppehl' /* Peace */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'b8pz562k' /* Tai Chi */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'o1afr5fd' /* Meditation */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bi8yvquk' /* Breathing */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1r2zq5jn' /* Restting Bad Moods */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                    .checkboxGroupValues = val),
                                            controller: _model
                                                    .checkboxGroupValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              List.from([
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1v6l1fsz' /* Escape Innerverse */,
                                                    )
                                                  ] ??
                                                  []),
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            checkboxBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            unselectedTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      lineHeight: 1.5,
                                                    ),
                                            checkboxBorderRadius:
                                                BorderRadius.circular(4.0),
                                            initialized:
                                                _model.checkboxGroupValues !=
                                                    null,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 235.0, 0.0, 0.0),
                                          child: Hero(
                                            tag: 'onboarding',
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Logo_ESCAPE_White.png',
                                                width: 200.0,
                                                height: 102.08,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'imageOnPageLoadAnimation']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (!(isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 24.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'INTERESTS_CONTINUE_TO_SELF_CARE_GOALS_BT');
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().interests = _model
                                        .checkboxGroupValues!
                                        .toList()
                                        .cast<String>();
                                    FFAppState().update(() {});
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      SelfCareGoalsWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '8yabk1sm' /* Continue to Self Care Goals */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 4.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                    hoverColor:
                                        FlutterFlowTheme.of(context).primary,
                                    hoverTextColor:
                                        FlutterFlowTheme.of(context).accent1,
                                  ),
                                ),
                              ),
                          ],
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
