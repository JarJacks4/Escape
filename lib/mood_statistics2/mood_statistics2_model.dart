import '/components/button6_widget.dart';
import '/components/mood_trend_item_widget.dart';
import '/components/stat_card3_widget.dart';
import '/components/tab_group_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_statistics2_widget.dart' show MoodStatistics2Widget;
import 'package:flutter/material.dart';

class MoodStatistics2Model extends FlutterFlowModel<MoodStatistics2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for TabGroup.
  late TabGroupModel tabGroupModel;
  // Model for StatCard.
  late StatCard3Model statCardModel1;
  // Model for StatCard.
  late StatCard3Model statCardModel2;
  // Model for MoodTrendItem.
  late MoodTrendItemModel moodTrendItemModel1;
  // Model for MoodTrendItem.
  late MoodTrendItemModel moodTrendItemModel2;
  // Model for MoodTrendItem.
  late MoodTrendItemModel moodTrendItemModel3;
  // Model for MoodTrendItem.
  late MoodTrendItemModel moodTrendItemModel4;
  // Model for Button.
  late Button6Model buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    tabGroupModel = createModel(context, () => TabGroupModel());
    statCardModel1 = createModel(context, () => StatCard3Model());
    statCardModel2 = createModel(context, () => StatCard3Model());
    moodTrendItemModel1 = createModel(context, () => MoodTrendItemModel());
    moodTrendItemModel2 = createModel(context, () => MoodTrendItemModel());
    moodTrendItemModel3 = createModel(context, () => MoodTrendItemModel());
    moodTrendItemModel4 = createModel(context, () => MoodTrendItemModel());
    buttonModel = createModel(context, () => Button6Model());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    tabGroupModel.dispose();
    statCardModel1.dispose();
    statCardModel2.dispose();
    moodTrendItemModel1.dispose();
    moodTrendItemModel2.dispose();
    moodTrendItemModel3.dispose();
    moodTrendItemModel4.dispose();
    buttonModel.dispose();
  }
}
