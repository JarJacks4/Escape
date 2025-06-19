import '/components/mood_analyzer_success_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_analyzer_success_widget.dart' show MoodAnalyzerSuccessWidget;
import 'package:flutter/material.dart';

class MoodAnalyzerSuccessModel
    extends FlutterFlowModel<MoodAnalyzerSuccessWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoodAnalyzerSuccessComp component.
  late MoodAnalyzerSuccessCompModel moodAnalyzerSuccessCompModel;

  @override
  void initState(BuildContext context) {
    moodAnalyzerSuccessCompModel =
        createModel(context, () => MoodAnalyzerSuccessCompModel());
  }

  @override
  void dispose() {
    moodAnalyzerSuccessCompModel.dispose();
  }
}
