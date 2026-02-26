import '/flutter_flow/flutter_flow_util.dart';
import 'crown_chakra_mood_scan_comp_widget.dart'
    show CrownChakraMoodScanCompWidget;
import 'package:flutter/material.dart';

class CrownChakraMoodScanCompModel
    extends FlutterFlowModel<CrownChakraMoodScanCompWidget> {
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
