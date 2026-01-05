import '/components/meditate_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_choice_page_widget.dart' show MeditationChoicePageWidget;
import 'package:flutter/material.dart';

class MeditationChoicePageModel
    extends FlutterFlowModel<MeditationChoicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MeditateChoiceComp component.
  late MeditateChoiceCompModel meditateChoiceCompModel;

  @override
  void initState(BuildContext context) {
    meditateChoiceCompModel =
        createModel(context, () => MeditateChoiceCompModel());
  }

  @override
  void dispose() {
    meditateChoiceCompModel.dispose();
  }
}
