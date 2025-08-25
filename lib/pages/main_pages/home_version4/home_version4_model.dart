import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_version4_widget.dart' show HomeVersion4Widget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class HomeVersion4Model extends FlutterFlowModel<HomeVersion4Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [AI Agent - Send Message to Lucille Generate Quote] action in HomeVersion4 widget.
  String? lucilleGenerateQuote;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 900;
  int timerMilliseconds = 900;
  String timerValue = StopWatchTimer.getDisplayTime(
    900,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for TodaysSelfCareActivitiesComp component.
  late TodaysSelfCareActivitiesCompModel todaysSelfCareActivitiesCompModel;

  @override
  void initState(BuildContext context) {
    todaysSelfCareActivitiesCompModel =
        createModel(context, () => TodaysSelfCareActivitiesCompModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    todaysSelfCareActivitiesCompModel.dispose();
  }
}
