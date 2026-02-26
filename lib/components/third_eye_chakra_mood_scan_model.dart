import '/flutter_flow/flutter_flow_util.dart';
import 'third_eye_chakra_mood_scan_widget.dart'
    show ThirdEyeChakraMoodScanWidget;
import 'package:flutter/material.dart';

class ThirdEyeChakraMoodScanModel
    extends FlutterFlowModel<ThirdEyeChakraMoodScanWidget> {
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
