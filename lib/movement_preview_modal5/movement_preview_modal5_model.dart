import '/components/move_card_widget.dart';
import '/components/movement_bottom_sheet1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'movement_preview_modal5_widget.dart' show MovementPreviewModal5Widget;
import 'package:flutter/material.dart';

class MovementPreviewModal5Model
    extends FlutterFlowModel<MovementPreviewModal5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoveCard.
  late MoveCardModel moveCardModel1;
  // Model for MoveCard.
  late MoveCardModel moveCardModel2;
  // Model for MovementBottomSheet1 component.
  late MovementBottomSheet1Model movementBottomSheet1Model;

  @override
  void initState(BuildContext context) {
    moveCardModel1 = createModel(context, () => MoveCardModel());
    moveCardModel2 = createModel(context, () => MoveCardModel());
    movementBottomSheet1Model =
        createModel(context, () => MovementBottomSheet1Model());
  }

  @override
  void dispose() {
    moveCardModel1.dispose();
    moveCardModel2.dispose();
    movementBottomSheet1Model.dispose();
  }
}
