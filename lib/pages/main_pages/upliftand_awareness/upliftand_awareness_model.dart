import '/components/uplift_and_awareness_sounds_comp/uplift_and_awareness_sounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'upliftand_awareness_widget.dart' show UpliftandAwarenessWidget;
import 'package:flutter/material.dart';

class UpliftandAwarenessModel
    extends FlutterFlowModel<UpliftandAwarenessWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UpliftAndAwarenessSoundsComp component.
  late UpliftAndAwarenessSoundsCompModel upliftAndAwarenessSoundsCompModel;

  @override
  void initState(BuildContext context) {
    upliftAndAwarenessSoundsCompModel =
        createModel(context, () => UpliftAndAwarenessSoundsCompModel());
  }

  @override
  void dispose() {
    upliftAndAwarenessSoundsCompModel.dispose();
  }
}
