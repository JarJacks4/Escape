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

import 'package:camera/camera.dart';

Future<int> switchCamera(int currentIndex) async {
  final cameras = await availableCameras();
  if (cameras.length < 2) return currentIndex; // No second camera to switch

  int newIndex = (currentIndex + 1) % cameras.length;
  return newIndex;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
