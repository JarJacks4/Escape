import '/components/anxiety_meditations_comp/anxiety_meditations_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'help_anxiety_widget.dart' show HelpAnxietyWidget;
import 'package:flutter/material.dart';

class HelpAnxietyModel extends FlutterFlowModel<HelpAnxietyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AnxietyMeditationsComp component.
  late AnxietyMeditationsCompModel anxietyMeditationsCompModel;

  @override
  void initState(BuildContext context) {
    anxietyMeditationsCompModel =
        createModel(context, () => AnxietyMeditationsCompModel());
  }

  @override
  void dispose() {
    anxietyMeditationsCompModel.dispose();
  }
}
