import '/components/accordion_widget.dart';
import '/components/button_widget.dart';
import '/components/pie_chart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_statistics_widget.dart' show MoodStatisticsWidget;
import 'package:flutter/material.dart';

class MoodStatisticsModel extends FlutterFlowModel<MoodStatisticsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for PieChart.
  late PieChartModel pieChartModel;
  // Model for Accordion.
  late AccordionModel accordionModel;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    pieChartModel = createModel(context, () => PieChartModel());
    accordionModel = createModel(context, () => AccordionModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    pieChartModel.dispose();
    accordionModel.dispose();
    buttonModel.dispose();
  }
}
