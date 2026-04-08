import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/index.dart';
import 'journal_page1_widget.dart' show JournalPage1Widget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:that_audio_player_oo85ab/backend/api_requests/api_calls.dart'
    as that_audio_player_oo85ab_api_calls_util;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
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
