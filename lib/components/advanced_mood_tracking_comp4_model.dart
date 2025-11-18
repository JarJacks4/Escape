import '/flutter_flow/flutter_flow_util.dart';
import 'advanced_mood_tracking_comp4_widget.dart'
    show AdvancedMoodTrackingComp4Widget;
import 'package:flutter/material.dart';

class AdvancedMoodTrackingComp4Model
    extends FlutterFlowModel<AdvancedMoodTrackingComp4Widget> {
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
