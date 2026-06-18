import '/components/pie_chart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'glass_card_child_widget.dart' show GlassCardChildWidget;
import 'package:flutter/material.dart';

class GlassCardChildModel extends FlutterFlowModel<GlassCardChildWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PieChart.
  late PieChartModel pieChartModel;

  @override
  void initState(BuildContext context) {
    pieChartModel = createModel(context, () => PieChartModel());
  }

  @override
  void dispose() {
    pieChartModel.dispose();
  }
}
