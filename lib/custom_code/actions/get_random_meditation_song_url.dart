// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math'; // Required for Random()
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getRandomMeditationSongUrl(String folderPath) async {
  if (folderPath == null || folderPath.isEmpty) {
    print('Error: folderPath parameter cannot be null or empty.');
    return ''; // Return empty string if the path is invalid
  }

  // Initialize Firebase Storage instance
  final storage = FirebaseStorage.instance;

  try {
    // Get a reference to the folder using the provided folderPath parameter
    final storageRef = storage.ref().child(folderPath);

    // List all items (files) within the folder
    final ListResult result = await storageRef.listAll();
    final List<Reference> allFiles = result.items;

    // Check if the folder is empty
    if (allFiles.isEmpty) {
      // Use the provided folderPath in the error message
      print('Error: No files found in the folder "$folderPath"');
      return ''; // Return empty string if no files are found
    }

    // Select a random file reference from the list
    final random = Random();
    final randomIndex = random.nextInt(allFiles.length);
    final Reference randomFileRef = allFiles[randomIndex];

    // Get the download URL for the randomly selected file
    final String downloadUrl = await randomFileRef.getDownloadURL();

    // Return the download URL string
    return downloadUrl;
  } catch (e) {
    // Handle potential errors (e.g., permissions, network issues, folder not found)
    print('Error getting random song URL from folder "$folderPath": $e');
    return ''; // Return empty string on error
  }
  // Add your function code here!
}
