import '/components/button7_widget.dart';
import '/components/move_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'today_s_moves_overview_widget.dart' show TodaySMovesOverviewWidget;
import 'package:flutter/material.dart';

class TodaySMovesOverviewModel
    extends FlutterFlowModel<TodaySMovesOverviewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for MoveCard.
  late MoveCardModel moveCardModel1;
  // Model for MoveCard.
  late MoveCardModel moveCardModel2;
  // Model for MoveCard.
  late MoveCardModel moveCardModel3;
  // Model for Button.
  late Button7Model buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    moveCardModel1 = createModel(context, () => MoveCardModel());
    moveCardModel2 = createModel(context, () => MoveCardModel());
    moveCardModel3 = createModel(context, () => MoveCardModel());
    buttonModel = createModel(context, () => Button7Model());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    moveCardModel1.dispose();
    moveCardModel2.dispose();
    moveCardModel3.dispose();
    buttonModel.dispose();
  }
}
