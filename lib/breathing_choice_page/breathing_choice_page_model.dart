import '/components/breathing_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'breathing_choice_page_widget.dart' show BreathingChoicePageWidget;
import 'package:flutter/material.dart';

class BreathingChoicePageModel
    extends FlutterFlowModel<BreathingChoicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BreathingChoiceComp component.
  late BreathingChoiceCompModel breathingChoiceCompModel;

  @override
  void initState(BuildContext context) {
    breathingChoiceCompModel =
        createModel(context, () => BreathingChoiceCompModel());
  }

  @override
  void dispose() {
    breathingChoiceCompModel.dispose();
  }
}
