import '/flutter_flow/flutter_flow_util.dart';
import 'intro_walkthrough3_version5_widget.dart'
    show IntroWalkthrough3Version5Widget;
import 'package:flutter/material.dart';

class IntroWalkthrough3Version5Model
    extends FlutterFlowModel<IntroWalkthrough3Version5Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    rowController = ScrollController();
  }

  @override
  void dispose() {
    rowController?.dispose();
  }
}
