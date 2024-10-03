import '/components/using_vibrationsounds_comp/using_vibrationsounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'using_vibration_widget.dart' show UsingVibrationWidget;
import 'package:flutter/material.dart';

class UsingVibrationModel extends FlutterFlowModel<UsingVibrationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UsingVibrationsoundsComp component.
  late UsingVibrationsoundsCompModel usingVibrationsoundsCompModel;

  @override
  void initState(BuildContext context) {
    usingVibrationsoundsCompModel =
        createModel(context, () => UsingVibrationsoundsCompModel());
  }

  @override
  void dispose() {
    usingVibrationsoundsCompModel.dispose();
  }
}
