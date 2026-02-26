import '/flutter_flow/flutter_flow_util.dart';
import 'throat_chakra_mood_scan_widget.dart' show ThroatChakraMoodScanWidget;
import 'package:flutter/material.dart';

class ThroatChakraMoodScanModel
    extends FlutterFlowModel<ThroatChakraMoodScanWidget> {
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
