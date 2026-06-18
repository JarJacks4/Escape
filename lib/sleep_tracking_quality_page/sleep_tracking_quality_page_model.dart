import '/components/sleep_tracking_quality_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sleep_tracking_quality_page_widget.dart'
    show SleepTrackingQualityPageWidget;
import 'package:flutter/material.dart';

class SleepTrackingQualityPageModel
    extends FlutterFlowModel<SleepTrackingQualityPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SleepTrackingQuality component.
  late SleepTrackingQualityModel sleepTrackingQualityModel;

  @override
  void initState(BuildContext context) {
    sleepTrackingQualityModel =
        createModel(context, () => SleepTrackingQualityModel());
  }

  @override
  void dispose() {
    sleepTrackingQualityModel.dispose();
  }
}
