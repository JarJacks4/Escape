import '/components/button_widget.dart';
import '/components/glass_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sleep_tracking_widget.dart' show SleepTrackingWidget;
import 'package:flutter/material.dart';

class SleepTrackingModel extends FlutterFlowModel<SleepTrackingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for GlassCard.
  late GlassCardModel glassCardModel1;
  // Model for GlassCard.
  late GlassCardModel glassCardModel2;
  // Model for GlassCard.
  late GlassCardModel glassCardModel3;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    glassCardModel1 = createModel(context, () => GlassCardModel());
    glassCardModel2 = createModel(context, () => GlassCardModel());
    glassCardModel3 = createModel(context, () => GlassCardModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    glassCardModel1.dispose();
    glassCardModel2.dispose();
    glassCardModel3.dispose();
    buttonModel.dispose();
  }
}
