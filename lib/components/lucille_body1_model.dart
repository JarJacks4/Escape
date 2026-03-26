import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_body1_widget.dart' show LucilleBody1Widget;
import 'package:flutter/material.dart';

class LucilleBody1Model extends FlutterFlowModel<LucilleBody1Widget> {
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
