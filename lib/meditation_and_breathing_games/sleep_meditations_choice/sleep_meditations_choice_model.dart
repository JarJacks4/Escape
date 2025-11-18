import '/components/sleep_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sleep_meditations_choice_widget.dart' show SleepMeditationsChoiceWidget;
import 'package:flutter/material.dart';

class SleepMeditationsChoiceModel
    extends FlutterFlowModel<SleepMeditationsChoiceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SleepChoiceComp component.
  late SleepChoiceCompModel sleepChoiceCompModel;

  @override
  void initState(BuildContext context) {
    sleepChoiceCompModel = createModel(context, () => SleepChoiceCompModel());
  }

  @override
  void dispose() {
    sleepChoiceCompModel.dispose();
  }
}
