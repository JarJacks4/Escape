import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'soundscapes_home_final_widget.dart' show SoundscapesHomeFinalWidget;
import 'package:flutter/material.dart';

class SoundscapesHomeFinalModel
    extends FlutterFlowModel<SoundscapesHomeFinalWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Partner Token Epidemic Sound)] action in SoundscapesHomeFinal widget.
  ApiCallResponse? partnerToken;
  // Stores action output result for [Backend Call - API (Get Epidemic Tracks)] action in SoundscapesHomeFinal widget.
  ApiCallResponse? epidemicTracks;
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

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController2 = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    timerController.dispose();
    columnController?.dispose();
    listViewController2?.dispose();
    rowController?.dispose();
  }
}
