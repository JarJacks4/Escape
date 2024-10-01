import '/components/using_vibrationsounds_comp/using_vibrationsounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'increase_focus_widget.dart' show IncreaseFocusWidget;
import 'package:flutter/material.dart';

class IncreaseFocusModel extends FlutterFlowModel<IncreaseFocusWidget> {
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
