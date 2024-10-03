import '/components/eliminate_depression_comp_sounds/eliminate_depression_comp_sounds_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'eliminate_depression_widget.dart' show EliminateDepressionWidget;
import 'package:flutter/material.dart';

class EliminateDepressionModel
    extends FlutterFlowModel<EliminateDepressionWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EliminateDepressionCompSounds component.
  late EliminateDepressionCompSoundsModel eliminateDepressionCompSoundsModel;

  @override
  void initState(BuildContext context) {
    eliminateDepressionCompSoundsModel =
        createModel(context, () => EliminateDepressionCompSoundsModel());
  }

  @override
  void dispose() {
    eliminateDepressionCompSoundsModel.dispose();
  }
}
