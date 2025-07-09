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
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';

Future<dynamic> getRandomSongAndTitle(String folderPath) async {
  if (folderPath == null || folderPath.isEmpty) {
    print('Error: folderPath cannot be null or empty.');
    return {'url': '', 'title': 'No Title'};
  }

  final storage = FirebaseStorage.instance;

  try {
    final storageRef = storage.ref().child(folderPath);
    final ListResult result = await storageRef.listAll();
    final List<Reference> allFiles = result.items;

    if (allFiles.isEmpty) {
      print('Error: No files found in the folder "$folderPath"');
      return {'url': '', 'title': 'No Title'};
    }

    final random = Random();
    final randomIndex = random.nextInt(allFiles.length);
    final Reference randomFileRef = allFiles[randomIndex];

    final String downloadUrl = await randomFileRef.getDownloadURL();
    final FullMetadata metadata = await randomFileRef.getMetadata();
    final String title = metadata.customMetadata?['title'] ??
        _getTitleFromFilename(
            randomFileRef.name); // Fallback to filename if no metadata

    print(
        'Selected random song: ${randomFileRef.name} from folder $folderPath');
    print('Download URL: $downloadUrl');
    print('Title: $title');

    return {'url': downloadUrl, 'title': title};
  } catch (e) {
    print(
        'Error getting random song URL and metadata from folder "$folderPath": $e');
    return {'url': '', 'title': 'Error'};
  }

  // Add your function code here!
}

String _getTitleFromFilename(String filenameWithExtension) {
  String filenameWithoutExtension = filenameWithExtension.split('.').first;
  return filenameWithoutExtension.replaceAll('_', ' ').replaceAll('-', ' ');
}
