// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

/// Launch a specific Unreal level by name
Future<void> launchUnrealLevel(String levelName) async {
  const MethodChannel _channel = MethodChannel('unreal_bridge');

  try {
    await _channel.invokeMethod('launchUnrealLevel', {
      'levelName': levelName, // Pass any level dynamically
    });
  } on PlatformException catch (e) {
    print('PlatformException launching Unreal: ${e.message}');
  } catch (e) {
    print('Unexpected error launching Unreal scene: $e');
  }
}

/// Stop/close the running Unreal game
Future<void> closeUnrealScene() async {
  const MethodChannel _channel = MethodChannel('unreal_bridge');

  try {
    await _channel.invokeMethod('stopUnreal');
  } on PlatformException catch (e) {
    print('PlatformException closing Unreal: ${e.message}');
  } catch (e) {
    print('Unexpected error closing Unreal scene: $e');
  }
}

/// Optional: Check if Unreal is running
Future<bool> isUnrealRunning() async {
  const MethodChannel _channel = MethodChannel('unreal_bridge');

  try {
    final result = await _channel.invokeMethod('isUnrealRunning');
    return result == true;
  } on PlatformException catch (e) {
    print('PlatformException checking Unreal: ${e.message}');
    return false;
  } catch (e) {
    print('Unexpected error checking Unreal running status: $e');
    return false;
  }
}
