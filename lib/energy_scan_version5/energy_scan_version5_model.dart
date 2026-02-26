import '/flutter_flow/flutter_flow_util.dart';
import 'energy_scan_version5_widget.dart' show EnergyScanVersion5Widget;
import 'package:flutter/material.dart';

class EnergyScanVersion5Model
    extends FlutterFlowModel<EnergyScanVersion5Widget> {
  ///  State fields for stateful widgets in this page.

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
