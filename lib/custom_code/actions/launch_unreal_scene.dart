// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:chat_u_i_kit_n2m29m/backend/schema/structs/index.dart"
    as chat_u_i_kit_n2m29m_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:chat_u_i_kit_n2m29m/backend/schema/structs/index.dart"
    as chat_u_i_kit_n2m29m_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:chat_u_i_kit_n2m29m/backend/schema/enums/enums.dart"
    as chat_u_i_kit_n2m29m_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future<void> launchUnrealScene(String levelName) async {
  const MethodChannel _channel = MethodChannel('unreal_bridge');

  try {
    await _channel.invokeMethod('launchUnreal', {'level': levelName});
  } catch (e) {
    print('Error launching Unreal scene: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
