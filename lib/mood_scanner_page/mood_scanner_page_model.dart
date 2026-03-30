import '/components/mood_scanner_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_scanner_page_widget.dart' show MoodScannerPageWidget;
import 'package:flutter/material.dart';

class MoodScannerPageModel extends FlutterFlowModel<MoodScannerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoodScannerComponent component.
  late MoodScannerComponentModel moodScannerComponentModel;

  @override
  void initState(BuildContext context) {
    moodScannerComponentModel =
        createModel(context, () => MoodScannerComponentModel());
  }

  @override
  void dispose() {
    moodScannerComponentModel.dispose();
  }
}
