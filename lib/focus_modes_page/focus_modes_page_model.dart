import '/components/focus_modes_and_concentration_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'focus_modes_page_widget.dart' show FocusModesPageWidget;
import 'package:flutter/material.dart';

class FocusModesPageModel extends FlutterFlowModel<FocusModesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FocusModesAndConcentration component.
  late FocusModesAndConcentrationModel focusModesAndConcentrationModel;

  @override
  void initState(BuildContext context) {
    focusModesAndConcentrationModel =
        createModel(context, () => FocusModesAndConcentrationModel());
  }

  @override
  void dispose() {
    focusModesAndConcentrationModel.dispose();
  }
}
