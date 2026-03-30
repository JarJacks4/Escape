import '/components/scan_mood_laoding_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_mood_laoding_page_widget.dart' show ScanMoodLaodingPageWidget;
import 'package:flutter/material.dart';

class ScanMoodLaodingPageModel
    extends FlutterFlowModel<ScanMoodLaodingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ScanMoodLaodingComponent component.
  late ScanMoodLaodingComponentModel scanMoodLaodingComponentModel;

  @override
  void initState(BuildContext context) {
    scanMoodLaodingComponentModel =
        createModel(context, () => ScanMoodLaodingComponentModel());
  }

  @override
  void dispose() {
    scanMoodLaodingComponentModel.dispose();
  }
}
