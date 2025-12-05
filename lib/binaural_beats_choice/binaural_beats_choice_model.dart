import '/components/binaural_beats_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'binaural_beats_choice_widget.dart' show BinauralBeatsChoiceWidget;
import 'package:flutter/material.dart';

class BinauralBeatsChoiceModel
    extends FlutterFlowModel<BinauralBeatsChoiceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BinauralBeatsChoiceComp component.
  late BinauralBeatsChoiceCompModel binauralBeatsChoiceCompModel;

  @override
  void initState(BuildContext context) {
    binauralBeatsChoiceCompModel =
        createModel(context, () => BinauralBeatsChoiceCompModel());
  }

  @override
  void dispose() {
    binauralBeatsChoiceCompModel.dispose();
  }
}
