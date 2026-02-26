import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'select_timed_scenario_comp_model.dart';
export 'select_timed_scenario_comp_model.dart';

class SelectTimedScenarioCompWidget extends StatefulWidget {
  const SelectTimedScenarioCompWidget({super.key});

  @override
  State<SelectTimedScenarioCompWidget> createState() =>
      _SelectTimedScenarioCompWidgetState();
}

class _SelectTimedScenarioCompWidgetState
    extends State<SelectTimedScenarioCompWidget> with TickerProviderStateMixin {
  late SelectTimedScenarioCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectTimedScenarioCompModel());

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'mmj1eg35' /* Select Soundscape Scenario */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'The Seasons',
                        color: FlutterFlowTheme.of(context).accent1,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: GradientText(
                    FFLocalizations.of(context).getText(
                      'fk2e3ha4' /* Choose which environment you w... */,
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
                Flexible(
                  flex: 1,
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData(FFLocalizations.of(context).getText(
                        'bbs8y1ut' /* Binaural Beats */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'trzymcgl' /* General */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'hf8jxtr3' /* Forest */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        's7ucdckz' /* Morning */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'jgnwqg73' /* Study */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'o94qtq44' /* Relaxation */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'heaquj93' /* Meditation */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '4rvc4zjk' /* Breathing */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'vuwh7n1n' /* Peace */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '6na0em79' /* Vaporwave */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '1pcxenvr' /* Vibration */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'ahodr457' /* Root Chakra */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '6f4xryfl' /* Sacral Chakra */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'e64cwse3' /* Solar Plexus Chakra */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '2vedpkl1' /* Love */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '650m1u66' /* ASMR */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '9tuhy5wh' /* Empowerment */,
                      ))
                    ],
                    onChanged: (val) =>
                        safeSetState(() => _model.choiceChipsValues = val),
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
                    multiselect: true,
                    initialized: _model.choiceChipsValues != null,
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
                                'SELECT_TIMED_SCENARIO_DISMISS_BTN_ON_TAP');
                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'y68rb0ye' /* Dismiss */,
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
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'vah0vnwa' /* Continue */,
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
                        ),
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
