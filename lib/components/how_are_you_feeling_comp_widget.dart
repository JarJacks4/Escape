import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'how_are_you_feeling_comp_model.dart';
export 'how_are_you_feeling_comp_model.dart';

class HowAreYouFeelingCompWidget extends StatefulWidget {
  const HowAreYouFeelingCompWidget({super.key});

  @override
  State<HowAreYouFeelingCompWidget> createState() =>
      _HowAreYouFeelingCompWidgetState();
}

class _HowAreYouFeelingCompWidgetState extends State<HowAreYouFeelingCompWidget>
    with TickerProviderStateMixin {
  late HowAreYouFeelingCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HowAreYouFeelingCompModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
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
                  'ax2aox6r' /* How are you feeling? */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'WorkSans',
                      color: FlutterFlowTheme.of(context).accent1,
                      letterSpacing: 0.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 60.0,
                    fillColor: Color(0xFFFFF8E1),
                    icon: Icon(
                      Icons.sentiment_very_satisfied,
                      color: Color(0xFFFFD600),
                      size: 32.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 60.0,
                    fillColor: Color(0xFFE3F2FD),
                    icon: Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.blue,
                      size: 32.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 60.0,
                    fillColor: Color(0xFFF5F5F5),
                    icon: Icon(
                      Icons.sentiment_neutral,
                      color: Color(0xFF9E9E9E),
                      size: 32.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 60.0,
                    fillColor: Color(0xFFFFF3E0),
                    icon: Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.orange,
                      size: 32.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 60.0,
                    fillColor: Color(0xFFFFEBEE),
                    icon: Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                      size: 32.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '6eqsl6t1' /* Intensity */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).secondary,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Slider(
                      activeColor: FlutterFlowTheme.of(context).primary,
                      inactiveColor: Color(0x33000000),
                      min: 1.0,
                      max: 10.0,
                      value: _model.sliderValue ??= 5.0,
                      onChanged: (newValue) {
                        newValue = double.parse(newValue.toStringAsFixed(4));
                        safeSetState(() => _model.sliderValue = newValue);
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'nb5kfxto' /* Notes */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).accent1,
                          letterSpacing: 0.0,
                        ),
                  ),
                  TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: FFLocalizations.of(context).getText(
                        'nw1nf3ho' /* Add any context about your moo... */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'WorkSans',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          letterSpacing: 0.0,
                        ),
                    maxLines: 5,
                    minLines: 3,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'o73h39o7' /* Tags */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  FlutterFlowChoiceChips(
                    options: [
                      ChipData(FFLocalizations.of(context).getText(
                        'i66lb239' /* Work */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'uce7gmt7' /* Exercise */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'eacdn3x4' /* Social */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'zr68yc5q' /* Family */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'hoh5tb7g' /* Sleep */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'kl0axu0q' /* Food */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'jywqj8hm' /* Health */,
                      ))
                    ],
                    onChanged: (val) => safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).accent1,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                      iconColor: FlutterFlowTheme.of(context).primaryText,
                      iconSize: 18.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Color(0xCDD0E3F7),
                      textStyle: FlutterFlowTheme.of(context)
                          .bodySmall
                          .override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                      iconColor: FlutterFlowTheme.of(context).primaryText,
                      iconSize: 18.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    chipSpacing: 8.0,
                    rowSpacing: 8.0,
                    multiselect: false,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    wrapped: true,
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
