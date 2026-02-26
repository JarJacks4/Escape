import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mood_choice_chips_login_comp_model.dart';
export 'mood_choice_chips_login_comp_model.dart';

class MoodChoiceChipsLoginCompWidget extends StatefulWidget {
  const MoodChoiceChipsLoginCompWidget({super.key});

  @override
  State<MoodChoiceChipsLoginCompWidget> createState() =>
      _MoodChoiceChipsLoginCompWidgetState();
}

class _MoodChoiceChipsLoginCompWidgetState
    extends State<MoodChoiceChipsLoginCompWidget> {
  late MoodChoiceChipsLoginCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodChoiceChipsLoginCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData(FFLocalizations.of(context).getText(
                          'waezyw3x' /* Grounding */,
                        )),
                        ChipData(FFLocalizations.of(context).getText(
                          '53ocjcj2' /* Creator */,
                        )),
                        ChipData(''),
                        ChipData(''),
                        ChipData(''),
                        ChipData(''),
                        ChipData('')
                      ],
                      onChanged: (val) => safeSetState(
                          () => _model.choiceChipsValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: Color(0x848B4513),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        iconColor: FlutterFlowTheme.of(context).info,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Color(0xB6FF8C00),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                        iconColor: FlutterFlowTheme.of(context).primary,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 15.0,
                      rowSpacing: 20.0,
                      multiselect: false,
                      alignment: WrapAlignment.spaceBetween,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                      wrapped: false,
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
