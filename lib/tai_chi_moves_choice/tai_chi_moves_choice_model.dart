import '/components/breathing_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tai_chi_moves_choice_widget.dart' show TaiChiMovesChoiceWidget;
import 'package:flutter/material.dart';

class TaiChiMovesChoiceModel extends FlutterFlowModel<TaiChiMovesChoiceWidget> {
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
