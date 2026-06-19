import '/components/mood_breakdown_item_widget.dart';
import '/components/pie_chart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detailed_mood_breakdown_widget.dart' show DetailedMoodBreakdownWidget;
import 'package:flutter/material.dart';

class DetailedMoodBreakdownModel
    extends FlutterFlowModel<DetailedMoodBreakdownWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for PieChart.
  late PieChartModel pieChartModel;
  // Model for MoodBreakdownItem.
  late MoodBreakdownItemModel moodBreakdownItemModel1;
  // Model for MoodBreakdownItem.
  late MoodBreakdownItemModel moodBreakdownItemModel2;
  // Model for MoodBreakdownItem.
  late MoodBreakdownItemModel moodBreakdownItemModel3;
  // Model for MoodBreakdownItem.
  late MoodBreakdownItemModel moodBreakdownItemModel4;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    pieChartModel = createModel(context, () => PieChartModel());
    moodBreakdownItemModel1 =
        createModel(context, () => MoodBreakdownItemModel());
    moodBreakdownItemModel2 =
        createModel(context, () => MoodBreakdownItemModel());
    moodBreakdownItemModel3 =
        createModel(context, () => MoodBreakdownItemModel());
    moodBreakdownItemModel4 =
        createModel(context, () => MoodBreakdownItemModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    pieChartModel.dispose();
    moodBreakdownItemModel1.dispose();
    moodBreakdownItemModel2.dispose();
    moodBreakdownItemModel3.dispose();
    moodBreakdownItemModel4.dispose();
  }
}
