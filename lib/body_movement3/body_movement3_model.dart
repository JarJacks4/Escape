import '/backend/backend.dart';
import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'body_movement3_widget.dart' show BodyMovement3Widget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class BodyMovement3Model extends FlutterFlowModel<BodyMovement3Widget> {
  ///  Local state fields for this page.

  int? localIndex;

  MoveStructStruct? currentMove;
  void updateCurrentMoveStruct(Function(MoveStructStruct) updateFn) {
    updateFn(currentMove ??= MoveStructStruct());
  }

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
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<BodyRecord>? bodyCollectionQuery;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  BodyRecord? goalDoc;

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
