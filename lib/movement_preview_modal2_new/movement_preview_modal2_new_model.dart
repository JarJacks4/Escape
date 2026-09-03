import '/components/movement_stat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'movement_preview_modal2_new_widget.dart'
    show MovementPreviewModal2NewWidget;
import 'package:flutter/material.dart';

class MovementPreviewModal2NewModel
    extends FlutterFlowModel<MovementPreviewModal2NewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for MovementStat.
  late MovementStatModel movementStatModel1;
  // Model for MovementStat.
  late MovementStatModel movementStatModel2;
  // Model for MovementStat.
  late MovementStatModel movementStatModel3;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    movementStatModel1 = createModel(context, () => MovementStatModel());
    movementStatModel2 = createModel(context, () => MovementStatModel());
    movementStatModel3 = createModel(context, () => MovementStatModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    movementStatModel1.dispose();
    movementStatModel2.dispose();
    movementStatModel3.dispose();
  }
}
