import '/backend/backend.dart';
import '/components/stat_pill_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'body_movement_session_completion_widget.dart'
    show BodyMovementSessionCompletionWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class BodyMovementSessionCompletionModel
    extends FlutterFlowModel<BodyMovementSessionCompletionWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in BodyMovementSessionCompletion widget.
  BodyRecord? streakData;
  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for StatPill.
  late StatPillModel statPillModel1;
  // Model for StatPill.
  late StatPillModel statPillModel2;
  // Model for StatPill.
  late StatPillModel statPillModel3;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    statPillModel1 = createModel(context, () => StatPillModel());
    statPillModel2 = createModel(context, () => StatPillModel());
    statPillModel3 = createModel(context, () => StatPillModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    statPillModel1.dispose();
    statPillModel2.dispose();
    statPillModel3.dispose();
  }
}
