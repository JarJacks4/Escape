import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'micrcosmic_meditation_goal_page_widget.dart'
    show MicrcosmicMeditationGoalPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class MicrcosmicMeditationGoalPageModel
    extends FlutterFlowModel<MicrcosmicMeditationGoalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 7;
  int timerMilliseconds = 7;
  String timerValue = StopWatchTimer.getDisplayTime(
    7,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
