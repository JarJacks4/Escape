import '/flutter_flow/flutter_flow_util.dart';
import 'energy_centers_guidance_widget.dart' show EnergyCentersGuidanceWidget;
import 'package:flutter/material.dart';

class EnergyCentersGuidanceModel
    extends FlutterFlowModel<EnergyCentersGuidanceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController1?.dispose();
    rowController2?.dispose();
  }
}
