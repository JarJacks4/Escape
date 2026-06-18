import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'goals_checklist_onboarding_model.dart';
export 'goals_checklist_onboarding_model.dart';

class GoalsChecklistOnboardingWidget extends StatefulWidget {
  const GoalsChecklistOnboardingWidget({
    super.key,
    this.titles,
  });

  final List<String>? titles;

  @override
  State<GoalsChecklistOnboardingWidget> createState() =>
      _GoalsChecklistOnboardingWidgetState();
}

class _GoalsChecklistOnboardingWidgetState
    extends State<GoalsChecklistOnboardingWidget> {
  late GoalsChecklistOnboardingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalsChecklistOnboardingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 359.09,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0xABEDF1F7),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 80.0,
              color: Color(0xE2EDF1F7),
              offset: Offset(
                0.0,
                2.0,
              ),
              spreadRadius: 10.0,
            )
          ],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
          controller: _model.columnController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    FlutterFlowCheckboxGroup(
                      options: [
                        FFAppConstants.OnboardingGoalsTitle.firstOrNull!
                      ],
                      onChanged: (val) =>
                          safeSetState(() => _model.checkboxGroupValues = val),
                      controller: _model.checkboxGroupValueController ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                      activeColor: FlutterFlowTheme.of(context).success,
                      checkColor: FlutterFlowTheme.of(context).primary,
                      checkboxBorderColor: Color(0xC1EDF1F7),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      unselectedTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                                lineHeight: 1.5,
                              ),
                      checkboxBorderRadius: BorderRadius.circular(4.0),
                      initialized: _model.checkboxGroupValues != null,
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
