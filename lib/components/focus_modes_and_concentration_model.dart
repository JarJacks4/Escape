import '/flutter_flow/flutter_flow_util.dart';
import 'focus_modes_and_concentration_widget.dart'
    show FocusModesAndConcentrationWidget;
import 'package:flutter/material.dart';

class FocusModesAndConcentrationModel
    extends FlutterFlowModel<FocusModesAndConcentrationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
