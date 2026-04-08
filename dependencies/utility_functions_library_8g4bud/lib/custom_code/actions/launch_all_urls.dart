// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

Future launchAllUrls(List<String>? urlList) async {
  // Check if urlList is null or empty
  if (urlList == null || urlList.isEmpty) {
    print('URL list is null or empty');
    return;
  }

  // Filter out null and empty URLs, then trim whitespace
  List<String> validUrls = urlList
      .where((url) => url != null && url.trim().isNotEmpty)
      .map((url) => url.trim())
      .toList();

  // Check if we have any valid URLs after filtering
  if (validUrls.isEmpty) {
    print('No valid URLs found in the list');
    return;
  }

  // Create a list of Future tasks for launching URLs
  List<Future<void>> launchTasks = validUrls.map((url) async {
    try {
      // Add protocol if missing
      String formattedUrl = url;
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        formattedUrl = 'https://$url';
      }

      // Parse and validate the URL
      final Uri uri = Uri.parse(formattedUrl);

      // Check if the URL can be launched
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        print('Successfully opened: $formattedUrl');
      } else {
        print('Cannot launch URL: $formattedUrl');
      }
    } catch (e) {
      print('Error launching URL "$url": $e');
    }
  }).toList();

  // Launch all URLs simultaneously
  try {
    await Future.wait(launchTasks);
    print('Finished launching ${validUrls.length} URLs');
  } catch (e) {
    print('Error during batch URL launch: $e');
  }
}
