import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'active_voice_journaling_widget.dart' show ActiveVoiceJournalingWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

class ActiveVoiceJournalingModel
    extends FlutterFlowModel<ActiveVoiceJournalingWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
  AudioRecorder? audioRecorder;
  String? audioJournalRecording;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  // Stores action output result for [Backend Call - API (Escape AudioScript)] action in Container widget.
  ApiCallResponse? gorqTranscriptionResult;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Stores action output result for [Backend Call - API (Lucille Chat Main)] action in IconButton widget.
  ApiCallResponse? transcribedMood;
  // Stores action output result for [Backend Call - API (Lucille Chat Main)] action in IconButton widget.
  ApiCallResponse? transcriptionTitle;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
