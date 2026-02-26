import '/flutter_flow/flutter_flow_util.dart';
import 'focus_and_concentration_comp_widget.dart'
    show FocusAndConcentrationCompWidget;
import 'package:flutter/material.dart';

class FocusAndConcentrationCompModel
    extends FlutterFlowModel<FocusAndConcentrationCompWidget> {
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
