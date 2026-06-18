import '/components/metric_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Model for MetricCard component.
  late MetricCardModel metricCardModel;
  // Model for AvgSleepCard.
  late MetricCardModel avgSleepCardModel;
  // State field(s) for Column widget.
  ScrollController? columnController2;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    metricCardModel = createModel(context, () => MetricCardModel());
    avgSleepCardModel = createModel(context, () => MetricCardModel());
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    metricCardModel.dispose();
    avgSleepCardModel.dispose();
    columnController2?.dispose();
  }
}
