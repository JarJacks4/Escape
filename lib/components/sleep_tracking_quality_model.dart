import '/flutter_flow/flutter_flow_util.dart';
import 'sleep_tracking_quality_widget.dart' show SleepTrackingQualityWidget;
import 'package:flutter/material.dart';

class SleepTrackingQualityModel
    extends FlutterFlowModel<SleepTrackingQualityWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
