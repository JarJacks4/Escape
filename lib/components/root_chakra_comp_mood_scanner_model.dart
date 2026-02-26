import '/flutter_flow/flutter_flow_util.dart';
import 'root_chakra_comp_mood_scanner_widget.dart'
    show RootChakraCompMoodScannerWidget;
import 'package:flutter/material.dart';

class RootChakraCompMoodScannerModel
    extends FlutterFlowModel<RootChakraCompMoodScannerWidget> {
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
