import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'mood_choice_chips_login_comp_widget.dart'
    show MoodChoiceChipsLoginCompWidget;
import 'package:flutter/material.dart';

class MoodChoiceChipsLoginCompModel
    extends FlutterFlowModel<MoodChoiceChipsLoginCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
