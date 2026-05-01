import '/flutter_flow/flutter_flow_util.dart';
import 'solar_plexus_chakra_mood_scanner_comp_widget.dart'
    show SolarPlexusChakraMoodScannerCompWidget;
import 'package:flutter/material.dart';

class SolarPlexusChakraMoodScannerCompModel
    extends FlutterFlowModel<SolarPlexusChakraMoodScannerCompWidget> {
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
