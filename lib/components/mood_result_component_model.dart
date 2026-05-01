import '/flutter_flow/flutter_flow_util.dart';
import 'mood_result_component_widget.dart' show MoodResultComponentWidget;
import 'package:flutter/material.dart';

class MoodResultComponentModel
    extends FlutterFlowModel<MoodResultComponentWidget> {
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
