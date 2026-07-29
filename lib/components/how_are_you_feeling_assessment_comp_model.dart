import '/flutter_flow/flutter_flow_util.dart';
import 'how_are_you_feeling_assessment_comp_widget.dart'
    show HowAreYouFeelingAssessmentCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HowAreYouFeelingAssessmentCompModel
    extends FlutterFlowModel<HowAreYouFeelingAssessmentCompWidget> {
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
  // State field(s) for FeelingsScore widget.
  double? feelingsScoreValue;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  // State field(s) for SleepScore widget.
  double? sleepScoreValue;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  // State field(s) for StressScore widget.
  double? stressScoreValue;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;
  AudioPlayer? soundPlayer13;
  // State field(s) for SuppportScore widget.
  double? suppportScoreValue;
  AudioPlayer? soundPlayer14;
  AudioPlayer? soundPlayer15;
  AudioPlayer? soundPlayer16;
  // State field(s) for OverallScore widget.
  double? overallScoreValue;
  AudioPlayer? soundPlayer17;
  AudioPlayer? soundPlayer18;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
