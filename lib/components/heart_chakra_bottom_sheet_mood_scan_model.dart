import '/flutter_flow/flutter_flow_util.dart';
import 'heart_chakra_bottom_sheet_mood_scan_widget.dart'
    show HeartChakraBottomSheetMoodScanWidget;
import 'package:flutter/material.dart';

class HeartChakraBottomSheetMoodScanModel
    extends FlutterFlowModel<HeartChakraBottomSheetMoodScanWidget> {
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
