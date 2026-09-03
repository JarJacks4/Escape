import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'active_session_reps1_widget.dart' show ActiveSessionReps1Widget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ActiveSessionReps1Model
    extends FlutterFlowModel<ActiveSessionReps1Widget> {
  ///  Local state fields for this page.

  int? localIndex;

  MoveStructStruct? currentMove;
  void updateCurrentMoveStruct(Function(MoveStructStruct) updateFn) {
    updateFn(currentMove ??= MoveStructStruct());
  }

  DateTime? sessionStartTime;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  AudioPlayer? soundPlayer1;
  // Model for Button.
  late Button7Model buttonModel;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => Button7Model());
  }

  @override
  void dispose() {
    timerController.dispose();
    buttonModel.dispose();
  }
}
