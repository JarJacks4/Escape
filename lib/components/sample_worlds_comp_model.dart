import '/flutter_flow/flutter_flow_util.dart';
import 'sample_worlds_comp_widget.dart' show SampleWorldsCompWidget;
import 'package:flutter/material.dart';

class SampleWorldsCompModel extends FlutterFlowModel<SampleWorldsCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  // State field(s) for Row widget.
  ScrollController? rowController3;

  @override
  void initState(BuildContext context) {
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    rowController3 = ScrollController();
  }

  @override
  void dispose() {
    rowController1?.dispose();
    rowController2?.dispose();
    rowController3?.dispose();
  }
}
