// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../widgets/that_audio_player.dart';

Future<void> initializeThatAudioPlayerForPlaylists(
    List<MediaStruct> playlistUrls, int? index) async {
  final audioState = ThatAudioPlayerState();

  if (playlistUrls.isNotEmpty) {
    audioState.initializeAudio(playlist: playlistUrls, initialIndex: index);
  } else {
    print(
        "That Audio Player : audio urls seems to be empty. Please add atleast 1 audio to play something");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
