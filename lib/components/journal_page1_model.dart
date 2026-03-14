import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_page1_widget.dart' show JournalPage1Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

class JournalPage1Model extends FlutterFlowModel<JournalPage1Widget> {
  ///  Local state fields for this component.

  String? voiceNote;

  String? voiceNoteText;

  FFUploadedFile? voiceNoteFile;

  List<String> transcriptWords = [];
  void addToTranscriptWords(String item) => transcriptWords.add(item);
  void removeFromTranscriptWords(String item) => transcriptWords.remove(item);
  void removeAtIndexFromTranscriptWords(int index) =>
      transcriptWords.removeAt(index);
  void insertAtIndexInTranscriptWords(int index, String item) =>
      transcriptWords.insert(index, item);
  void updateTranscriptWordsAtIndex(int index, Function(String) updateFn) =>
      transcriptWords[index] = updateFn(transcriptWords[index]);

  int? currentWordIndex = 0;

  double? wordOpacity = 1.0;

  double? fadeStartIndex;

  String? visibleText;

  double? characterIndex = 0.0;

  bool? isTyping = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer;
  AudioRecorder? audioRecorder;
  String? audioJournalRecording;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  // Stores action output result for [Backend Call - API (Escape AudioScript)] action in LottieAnimation widget.
  ApiCallResponse? gorqTranscriptionResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
