import '/components/focus_and_concentration_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'focus_modes_page_widget.dart' show FocusModesPageWidget;
import 'package:flutter/material.dart';

class FocusModesPageModel extends FlutterFlowModel<FocusModesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FocusAndConcentrationComp component.
  late FocusAndConcentrationCompModel focusAndConcentrationCompModel;

  @override
  void initState(BuildContext context) {
    focusAndConcentrationCompModel =
        createModel(context, () => FocusAndConcentrationCompModel());
  }

  @override
  void dispose() {
    focusAndConcentrationCompModel.dispose();
  }
}
