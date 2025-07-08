import '/components/progress_bar_final_widget.dart';
import '/components/wellness_goals_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blank_sample_widget.dart' show BlankSampleWidget;
import 'package:flutter/material.dart';

class BlankSampleModel extends FlutterFlowModel<BlankSampleWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for progressBarFinal component.
  late ProgressBarFinalModel progressBarFinalModel;
  // Model for WellnessGoalsComp component.
  late WellnessGoalsCompModel wellnessGoalsCompModel;

  @override
  void initState(BuildContext context) {
    progressBarFinalModel = createModel(context, () => ProgressBarFinalModel());
    wellnessGoalsCompModel =
        createModel(context, () => WellnessGoalsCompModel());
  }

  @override
  void dispose() {
    progressBarFinalModel.dispose();
    wellnessGoalsCompModel.dispose();
  }
}
