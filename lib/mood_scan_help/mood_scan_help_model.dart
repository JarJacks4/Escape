import '/components/mood_scan_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_scan_help_widget.dart' show MoodScanHelpWidget;
import 'package:flutter/material.dart';

class MoodScanHelpModel extends FlutterFlowModel<MoodScanHelpWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoodScanHelpComp component.
  late MoodScanHelpCompModel moodScanHelpCompModel;

  @override
  void initState(BuildContext context) {
    moodScanHelpCompModel = createModel(context, () => MoodScanHelpCompModel());
  }

  @override
  void dispose() {
    moodScanHelpCompModel.dispose();
  }
}
