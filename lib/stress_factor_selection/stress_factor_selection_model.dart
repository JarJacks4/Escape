import '/components/button_widget.dart';
import '/components/stressor_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stress_factor_selection_widget.dart' show StressFactorSelectionWidget;
import 'package:flutter/material.dart';

class StressFactorSelectionModel
    extends FlutterFlowModel<StressFactorSelectionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for StressorCard.
  late StressorCardModel stressorCardModel1;
  // Model for StressorCard.
  late StressorCardModel stressorCardModel2;
  // Model for StressorCard.
  late StressorCardModel stressorCardModel3;
  // Model for StressorCard.
  late StressorCardModel stressorCardModel4;
  // Model for StressorCard.
  late StressorCardModel stressorCardModel5;
  // Model for StressorCard.
  late StressorCardModel stressorCardModel6;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    stressorCardModel1 = createModel(context, () => StressorCardModel());
    stressorCardModel2 = createModel(context, () => StressorCardModel());
    stressorCardModel3 = createModel(context, () => StressorCardModel());
    stressorCardModel4 = createModel(context, () => StressorCardModel());
    stressorCardModel5 = createModel(context, () => StressorCardModel());
    stressorCardModel6 = createModel(context, () => StressorCardModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    stressorCardModel1.dispose();
    stressorCardModel2.dispose();
    stressorCardModel3.dispose();
    stressorCardModel4.dispose();
    stressorCardModel5.dispose();
    stressorCardModel6.dispose();
    buttonModel.dispose();
  }
}
