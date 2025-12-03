import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'music_player_widget.dart' show MusicPlayerWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class MusicPlayerModel extends FlutterFlowModel<MusicPlayerWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Epidemic Tracks)] action in MusicPlayer widget.
  ApiCallResponse? getTracks;
  // Stores action output result for [Backend Call - API (Epidemic Stream URL)] action in MusicPlayer widget.
  ApiCallResponse? streamUrl;
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

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    timerController.dispose();
    columnController?.dispose();
    rowController?.dispose();
  }
}
