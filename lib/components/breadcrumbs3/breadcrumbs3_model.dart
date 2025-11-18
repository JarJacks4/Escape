import '/flutter_flow/flutter_flow_util.dart';
import 'breadcrumbs3_widget.dart' show Breadcrumbs3Widget;
import 'package:flutter/material.dart';

class Breadcrumbs3Model extends FlutterFlowModel<Breadcrumbs3Widget> {
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
