import '/components/sleep_stage_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detailed_sleep_analytics_widget.dart' show DetailedSleepAnalyticsWidget;
import 'package:flutter/material.dart';

class DetailedSleepAnalyticsModel
    extends FlutterFlowModel<DetailedSleepAnalyticsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for SleepStageRow.
  late SleepStageRowModel sleepStageRowModel1;
  // Model for SleepStageRow.
  late SleepStageRowModel sleepStageRowModel2;
  // Model for SleepStageRow.
  late SleepStageRowModel sleepStageRowModel3;
  // Model for SleepStageRow.
  late SleepStageRowModel sleepStageRowModel4;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    sleepStageRowModel1 = createModel(context, () => SleepStageRowModel());
    sleepStageRowModel2 = createModel(context, () => SleepStageRowModel());
    sleepStageRowModel3 = createModel(context, () => SleepStageRowModel());
    sleepStageRowModel4 = createModel(context, () => SleepStageRowModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    sleepStageRowModel1.dispose();
    sleepStageRowModel2.dispose();
    sleepStageRowModel3.dispose();
    sleepStageRowModel4.dispose();
  }
}
