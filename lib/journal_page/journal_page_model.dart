import '/components/todays_reflection_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'journal_page_widget.dart' show JournalPageWidget;
import 'package:flutter/material.dart';

class JournalPageModel extends FlutterFlowModel<JournalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TodaysReflectionComp component.
  late TodaysReflectionCompModel todaysReflectionCompModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    todaysReflectionCompModel =
        createModel(context, () => TodaysReflectionCompModel());
  }

  @override
  void dispose() {
    todaysReflectionCompModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
