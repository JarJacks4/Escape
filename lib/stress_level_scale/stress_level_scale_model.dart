import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stress_level_scale_widget.dart' show StressLevelScaleWidget;
import 'package:flutter/material.dart';

class StressLevelScaleModel extends FlutterFlowModel<StressLevelScaleWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
