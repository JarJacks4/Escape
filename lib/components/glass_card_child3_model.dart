import '/components/sleep_stat_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'glass_card_child3_widget.dart' show GlassCardChild3Widget;
import 'package:flutter/material.dart';

class GlassCardChild3Model extends FlutterFlowModel<GlassCardChild3Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for SleepStatRow.
  late SleepStatRowModel sleepStatRowModel1;
  // Model for SleepStatRow.
  late SleepStatRowModel sleepStatRowModel2;
  // Model for SleepStatRow.
  late SleepStatRowModel sleepStatRowModel3;
  // Model for SleepStatRow.
  late SleepStatRowModel sleepStatRowModel4;

  @override
  void initState(BuildContext context) {
    sleepStatRowModel1 = createModel(context, () => SleepStatRowModel());
    sleepStatRowModel2 = createModel(context, () => SleepStatRowModel());
    sleepStatRowModel3 = createModel(context, () => SleepStatRowModel());
    sleepStatRowModel4 = createModel(context, () => SleepStatRowModel());
  }

  @override
  void dispose() {
    sleepStatRowModel1.dispose();
    sleepStatRowModel2.dispose();
    sleepStatRowModel3.dispose();
    sleepStatRowModel4.dispose();
  }
}
