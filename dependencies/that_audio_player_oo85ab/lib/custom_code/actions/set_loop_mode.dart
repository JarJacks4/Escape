// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';

import '../widgets/that_audio_player.dart';

Future<void> setLoopMode(String loopMode) async {
  final audioState = ThatAudioPlayerState();

  audioState.setLoopMode(loopMode == "off"
      ? LoopMode.off
      : loopMode == "all"
          ? LoopMode.all
          : LoopMode.one);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
