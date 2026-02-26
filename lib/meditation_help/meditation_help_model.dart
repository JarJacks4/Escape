import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_help_widget.dart' show MeditationHelpWidget;
import 'package:flutter/material.dart';

class MeditationHelpModel extends FlutterFlowModel<MeditationHelpWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MeditationHelpComp component.
  late MeditationHelpCompModel meditationHelpCompModel;

  @override
  void initState(BuildContext context) {
    meditationHelpCompModel =
        createModel(context, () => MeditationHelpCompModel());
  }

  @override
  void dispose() {
    meditationHelpCompModel.dispose();
  }
}
