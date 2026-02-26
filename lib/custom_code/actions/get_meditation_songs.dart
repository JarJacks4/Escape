// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getMeditationSongs(String folderPath) async {
  final storageRef = FirebaseStorage.instance.ref().child(folderPath);

  // List all files in the specified folder.
  final listResult = await storageRef.listAll();
  final items = listResult.items;

  if (items.isEmpty) {
    throw Exception("No songs found in the folder.");
  }

  // Pick a random file from the list.
  final randomIndex = Random().nextInt(items.length);
  final randomFileRef = items[randomIndex];

  // Get and return the download URL for the randomly selected file.
  final downloadUrl = await randomFileRef.getDownloadURL();
  return downloadUrl;
  // Add your function code here!
}
