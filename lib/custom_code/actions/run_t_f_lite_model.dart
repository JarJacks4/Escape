// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/backend/schema/structs/index.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:tflite/tflite.dart';
import 'dart:convert';
import 'dart:typed_data';

Future<String> runTFLiteModel(String base64Image) async {
  // Convert base64 string to Uint8List
  Uint8List imageBytes = base64Decode(base64Image);

  // Load the TFLite model
  await Tflite.loadModel(
    model: "assets/model.tflite",
  );

  // Run model on image
  var recognitions = await Tflite.runModelOnBinary(
    binary: imageBytes,
    numResults: 1,
    threshold: 0.1,
  );

  // Return top prediction
  return recognitions != null && recognitions.isNotEmpty
      ? recognitions[0]['label']
      : "No prediction";
}
