// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:that_audio_player_5bjqer/backend/schema/structs/index.dart"
    as that_audio_player_5bjqer_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:that_audio_player_5bjqer/backend/schema/structs/index.dart"
    as that_audio_player_5bjqer_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:speech_to_text/speech_to_text.dart' as stt;

Future<String?> startListening() async {
  final stt.SpeechToText speech = stt.SpeechToText();
  bool available = await speech.initialize();

  if (!available) {
    throw Exception('Speech recognition not available');
  }

  String recognizedText = '';

  await speech.listen(onResult: (result) {
    recognizedText = result.recognizedWords;
  });

  // Listen for 5 seconds
  await Future.delayed(const Duration(seconds: 5));
  await speech.stop();

  return recognizedText.isEmpty ? null : recognizedText;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
