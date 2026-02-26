import '/components/energy_centers_guide_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'energy_centers_guidance_widget.dart' show EnergyCentersGuidanceWidget;
import 'package:flutter/material.dart';

class EnergyCentersGuidanceModel
    extends FlutterFlowModel<EnergyCentersGuidanceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EnergyCentersGuideComp component.
  late EnergyCentersGuideCompModel energyCentersGuideCompModel;

  @override
  void initState(BuildContext context) {
    energyCentersGuideCompModel =
        createModel(context, () => EnergyCentersGuideCompModel());
  }

  @override
  void dispose() {
    energyCentersGuideCompModel.dispose();
  }
}
