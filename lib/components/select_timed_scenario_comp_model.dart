import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'select_timed_scenario_comp_widget.dart'
    show SelectTimedScenarioCompWidget;
import 'package:flutter/material.dart';

class SelectTimedScenarioCompModel
    extends FlutterFlowModel<SelectTimedScenarioCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
