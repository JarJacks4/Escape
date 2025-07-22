// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ActionResponseStruct> tryCatch(
  Future Function() action,
  String? errorMessage,
) async {
  // Add your function code here!
  // The tryCatch function is a wrapper for executing asynchronous functions safely. It ensures that any exceptions are caught, and a structured response (ActionResponseStruct) is returned, indicating success or failure.

  try {
    await action();
    return ActionResponseStruct(success: true);
  } catch (e) {
    return ActionResponseStruct(
        success: false,
        error: '$e',
        errorMsg: errorMessage ?? 'Could not process. Try again later');
  }
}
