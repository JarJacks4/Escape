// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;
import '/app_events/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/*
import 'package:flutter_flow/flutter_flow_util.dart';

/// Fallback: return empty if no path exists return ''; } Fallback: return
/// empty if no path exists return ''; } Fallback: return empty if no path
/// exists return ''; }
Future<String> audioPathFromUploadedFile(FFUploadedFile file) async {
// If the file has a local path, return it
  if (file.path != null && file.path!.isNotEmpty) {
    return file.path!;
  }

// Fallback: return empty if no path exists
  return '';
}
*/
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

Future<String> audioPathFromUploadedFile(FFUploadedFile file) async {
  if (kIsWeb) return '';
  if (file.bytes == null || file.bytes!.isEmpty) return '';

  try {
    final tempDir = await getTemporaryDirectory();

    final fileName = (file.name != null && file.name!.isNotEmpty)
        ? file.name!
        : 'recorded_audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

    final tempFile = io.File('${tempDir.path}/$fileName');
    await tempFile.writeAsBytes(file.bytes!);

    return tempFile.path;
  } catch (e) {
    debugPrint('audioPathFromUploadedFile error: $e');
    return '';
  }
}

/// Fallback: return empty if no path exists return ''; } Fallback: return
/// empty if no path exists return ''; } Fallback: return empty if no path
/// exists return ''; }

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
