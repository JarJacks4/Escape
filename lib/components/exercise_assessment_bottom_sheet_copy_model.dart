import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercise_assessment_bottom_sheet_copy_widget.dart'
    show ExerciseAssessmentBottomSheetCopyWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ExerciseAssessmentBottomSheetCopyModel
    extends FlutterFlowModel<ExerciseAssessmentBottomSheetCopyWidget> {
  ///  Local state fields for this component.

  int? effectivenessScore;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  // State field(s) for SleepScore widget.
  double? sleepScoreValue1;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  // State field(s) for SleepScore widget.
  double? sleepScoreValue2;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  // Stores action output result for [Backend Call - API (Exercise Feedback)] action in Container widget.
  ApiCallResponse? exerciseFeedback;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
