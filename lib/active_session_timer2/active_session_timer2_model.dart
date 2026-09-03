import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'active_session_timer2_widget.dart' show ActiveSessionTimer2Widget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ActiveSessionTimer2Model
    extends FlutterFlowModel<ActiveSessionTimer2Widget> {
  ///  Local state fields for this page.

  MoveStructStruct? currentMove;
  void updateCurrentMoveStruct(Function(MoveStructStruct) updateFn) {
    updateFn(currentMove ??= MoveStructStruct());
  }

  int? localIndex;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for Button.
  late Button7Model buttonModel;

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
