import '/components/activity_card_widget.dart';
import '/components/pie_chart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mindful_resources_hub_widget.dart' show MindfulResourcesHubWidget;
import 'package:flutter/material.dart';

class MindfulResourcesHubModel
    extends FlutterFlowModel<MindfulResourcesHubWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for PieChart.
  late PieChartModel pieChartModel;
  // Model for ActivityCard.
  late ActivityCardModel activityCardModel1;
  // Model for ActivityCard.
  late ActivityCardModel activityCardModel2;
  // Model for ActivityCard.
  late ActivityCardModel activityCardModel3;
  // Model for ActivityCard.
  late ActivityCardModel activityCardModel4;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    pieChartModel = createModel(context, () => PieChartModel());
    activityCardModel1 = createModel(context, () => ActivityCardModel());
    activityCardModel2 = createModel(context, () => ActivityCardModel());
    activityCardModel3 = createModel(context, () => ActivityCardModel());
    activityCardModel4 = createModel(context, () => ActivityCardModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    pieChartModel.dispose();
    activityCardModel1.dispose();
    activityCardModel2.dispose();
    activityCardModel3.dispose();
    activityCardModel4.dispose();
  }
}
