import '/flutter_flow/flutter_flow_util.dart';
import 'heart_chakra_energy_guide_comp_widget.dart'
    show HeartChakraEnergyGuideCompWidget;
import 'package:flutter/material.dart';

class HeartChakraEnergyGuideCompModel
    extends FlutterFlowModel<HeartChakraEnergyGuideCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;

  @override
  void initState(BuildContext context) {
    rowController1 = ScrollController();
    rowController2 = ScrollController();
  }

  @override
  void dispose() {
    rowController1?.dispose();
    rowController2?.dispose();
  }
}
