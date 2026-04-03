import '/flutter_flow/flutter_flow_util.dart';
import 'assessment_bottom_sheet_widget.dart' show AssessmentBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AssessmentBottomSheetModel
    extends FlutterFlowModel<AssessmentBottomSheetWidget> {
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
  // State field(s) for FeelingsScore widget.
  double? feelingsScoreValue;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  // State field(s) for SleepScore widget.
  double? sleepScoreValue;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  // State field(s) for StressScore widget.
  double? stressScoreValue;
  AudioPlayer? soundPlayer12;
  AudioPlayer? soundPlayer13;
  AudioPlayer? soundPlayer14;
  // State field(s) for SuppportScore widget.
  double? suppportScoreValue;
  AudioPlayer? soundPlayer15;
  AudioPlayer? soundPlayer16;
  AudioPlayer? soundPlayer17;
  // State field(s) for OverallScore widget.
  double? overallScoreValue;
  AudioPlayer? soundPlayer18;
  AudioPlayer? soundPlayer19;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
