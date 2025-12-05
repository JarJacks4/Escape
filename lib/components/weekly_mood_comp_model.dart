import '/flutter_flow/flutter_flow_util.dart';
import 'weekly_mood_comp_widget.dart' show WeeklyMoodCompWidget;
import 'package:flutter/material.dart';

class WeeklyMoodCompModel extends FlutterFlowModel<WeeklyMoodCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    rowController = ScrollController();
  }

  @override
  void dispose() {
    rowController?.dispose();
  }
}
