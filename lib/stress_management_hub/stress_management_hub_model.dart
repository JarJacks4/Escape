import '/components/button5_widget.dart';
import '/components/rec_card_widget.dart';
import '/components/stress_indicator_widget.dart';
import '/components/stressor_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stress_management_hub_widget.dart' show StressManagementHubWidget;
import 'package:flutter/material.dart';

class StressManagementHubModel
    extends FlutterFlowModel<StressManagementHubWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for StressIndicator.
  late StressIndicatorModel stressIndicatorModel;
  // Model for Button.
  late Button5Model buttonModel1;
  // Model for Button.
  late Button5Model buttonModel2;
  // Model for StressorItem.
  late StressorItemModel stressorItemModel1;
  // Model for StressorItem.
  late StressorItemModel stressorItemModel2;
  // Model for StressorItem.
  late StressorItemModel stressorItemModel3;
  // Model for StressorItem.
  late StressorItemModel stressorItemModel4;
  // Model for RecCard.
  late RecCardModel recCardModel1;
  // Model for RecCard.
  late RecCardModel recCardModel2;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    stressIndicatorModel = createModel(context, () => StressIndicatorModel());
    buttonModel1 = createModel(context, () => Button5Model());
    buttonModel2 = createModel(context, () => Button5Model());
    stressorItemModel1 = createModel(context, () => StressorItemModel());
    stressorItemModel2 = createModel(context, () => StressorItemModel());
    stressorItemModel3 = createModel(context, () => StressorItemModel());
    stressorItemModel4 = createModel(context, () => StressorItemModel());
    recCardModel1 = createModel(context, () => RecCardModel());
    recCardModel2 = createModel(context, () => RecCardModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    stressIndicatorModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    stressorItemModel1.dispose();
    stressorItemModel2.dispose();
    stressorItemModel3.dispose();
    stressorItemModel4.dispose();
    recCardModel1.dispose();
    recCardModel2.dispose();
  }
}
