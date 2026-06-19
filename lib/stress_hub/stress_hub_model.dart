import '/components/stress_stat_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stress_hub_widget.dart' show StressHubWidget;
import 'package:flutter/material.dart';

class StressHubModel extends FlutterFlowModel<StressHubWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for StressStatCard.
  late StressStatCardModel stressStatCardModel1;
  // Model for StressStatCard.
  late StressStatCardModel stressStatCardModel2;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    stressStatCardModel1 = createModel(context, () => StressStatCardModel());
    stressStatCardModel2 = createModel(context, () => StressStatCardModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    stressStatCardModel1.dispose();
    stressStatCardModel2.dispose();
  }
}
