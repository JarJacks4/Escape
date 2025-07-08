import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'select_soundscape_duration_comp_model.dart';
export 'select_soundscape_duration_comp_model.dart';

class SelectSoundscapeDurationCompWidget extends StatefulWidget {
  const SelectSoundscapeDurationCompWidget({super.key});

  @override
  State<SelectSoundscapeDurationCompWidget> createState() =>
      _SelectSoundscapeDurationCompWidgetState();
}

class _SelectSoundscapeDurationCompWidgetState
    extends State<SelectSoundscapeDurationCompWidget>
    with TickerProviderStateMixin {
  late SelectSoundscapeDurationCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectSoundscapeDurationCompModel());

    animationsMap.addAll({
      'choiceChipsOnPageLoadAnimation': AnimationInfo(
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
      'buttonOnPageLoadAnimation1': AnimationInfo(
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
      'buttonOnPageLoadAnimation2': AnimationInfo(
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: FlutterFlowTheme.of(context).secondary,
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'a4zhtmab' /* Select Soundscape Duration */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'The Seasons',
                          color: FlutterFlowTheme.of(context).accent1,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: GradientText(
                      FFLocalizations.of(context).getText(
                        '8um9olke' /* Choose how long you'd like you... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).secondary,
                            letterSpacing: 0.0,
                          ),
                      colors: [
                        FlutterFlowTheme.of(context).secondary,
                        FlutterFlowTheme.of(context).primary
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData(FFLocalizations.of(context).getText(
                        '7yphlkr6' /* 5 min */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '1nhazcck' /* 10 min */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '43ig88jb' /* 15 min */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'caz16b7l' /* 30 min */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'h4o1m4so' /* 1 hour */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'vzr33f82' /* 2 hours */,
                      ))
                    ],
                    onChanged: (val) => safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).accent1,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'The Seasons',
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                      iconColor: FlutterFlowTheme.of(context).primary,
                      iconSize: 18.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Color(0xC3D0E3F7),
                      textStyle: FlutterFlowTheme.of(context)
                          .bodySmall
                          .override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                      iconColor: FlutterFlowTheme.of(context).alternate,
                      iconSize: 18.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    chipSpacing: 15.0,
                    rowSpacing: 12.0,
                    multiselect: false,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    wrapped: true,
                  ).animateOnPageLoad(
                      animationsMap['choiceChipsOnPageLoadAnimation']!),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SELECT_SOUNDSCAPE_DURATION_CANCEL_BTN_ON');
                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'eu68iv0k' /* Cancel */,
                          ),
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 50.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['buttonOnPageLoadAnimation1']!),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SELECT_SOUNDSCAPE_DURATION_CONTINUE_BTN_');
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().SoundscapeDuration =
                                _model.choiceChipsValue!;
                            safeSetState(() {});
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Duration recieved! Now please wait for me to get your song ready. Scroll below for the music player!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              AISoundscapesWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 2),
                                ),
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '5kz3xrhj' /* Continue */,
                          ),
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 50.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['buttonOnPageLoadAnimation2']!),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
