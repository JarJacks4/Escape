import '/flutter_flow/flutter_flow_util.dart';
import 'daily_mood_face_check_in_page_widget.dart'
    show DailyMoodFaceCheckInPageWidget;
import 'package:flutter/material.dart';

class DailyMoodFaceCheckInPageModel
    extends FlutterFlowModel<DailyMoodFaceCheckInPageWidget> {
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
