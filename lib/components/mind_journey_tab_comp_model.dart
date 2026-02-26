import '/flutter_flow/flutter_flow_util.dart';
import 'mind_journey_tab_comp_widget.dart' show MindJourneyTabCompWidget;
import 'package:flutter/material.dart';

class MindJourneyTabCompModel
    extends FlutterFlowModel<MindJourneyTabCompWidget> {
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
