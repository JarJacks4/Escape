import '/components/chart_legend_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pie_chart_widget.dart' show PieChartWidget;
import 'package:flutter/material.dart';

class PieChartModel extends FlutterFlowModel<PieChartWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ChartLegend.
  late ChartLegendModel chartLegendModel1;
  // Model for ChartLegend.
  late ChartLegendModel chartLegendModel2;

  @override
  void initState(BuildContext context) {
    chartLegendModel1 = createModel(context, () => ChartLegendModel());
    chartLegendModel2 = createModel(context, () => ChartLegendModel());
  }

  @override
  void dispose() {
    chartLegendModel1.dispose();
    chartLegendModel2.dispose();
  }
}
