import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'response_assessment_comp_widget.dart' show ResponseAssessmentCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ResponseAssessmentCompModel
    extends FlutterFlowModel<ResponseAssessmentCompWidget> {
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
  // State field(s) for HelpfulnessScore widget.
  double? helpfulnessScoreValue;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  // State field(s) for MoodFeedback widget.
  double? moodFeedbackValue;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  // Stores action output result for [Backend Call - API (Get Chat History)] action in Container widget.
  ApiCallResponse? getChatHistory;
  // Stores action output result for [Backend Call - API (Response Feedback)] action in Container widget.
  ApiCallResponse? responseFeedback;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
