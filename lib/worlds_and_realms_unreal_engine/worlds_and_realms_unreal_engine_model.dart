import '/components/worlds_realms_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'worlds_and_realms_unreal_engine_widget.dart'
    show WorldsAndRealmsUnrealEngineWidget;
import 'package:flutter/material.dart';

class WorldsAndRealmsUnrealEngineModel
    extends FlutterFlowModel<WorldsAndRealmsUnrealEngineWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WorldsRealms component.
  late WorldsRealmsModel worldsRealmsModel;
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

  @override
  void initState(BuildContext context) {
    worldsRealmsModel = createModel(context, () => WorldsRealmsModel());
  }

  @override
  void dispose() {
    worldsRealmsModel.dispose();
    timerController.dispose();
  }
}
