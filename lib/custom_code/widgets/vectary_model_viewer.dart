// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
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
import '/app_events/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:model_viewer_plus/model_viewer_plus.dart';

class VectaryModelViewer extends StatefulWidget {
  const VectaryModelViewer({
    super.key,
    this.width,
    this.height,
    this.assetPath,
  });

  final double? width;
  final double? height;
  final String? assetPath;

  @override
  State<VectaryModelViewer> createState() => _VectaryModelViewerState();
}

class _VectaryModelViewerState extends State<VectaryModelViewer> {
  @override
  Widget build(BuildContext context) {
    // Guard against a page not having set assetPath yet
    if (widget.assetPath == null || widget.assetPath!.isEmpty) {
      return SizedBox(width: widget.width, height: widget.height);
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ModelViewer(
        backgroundColor: Colors.transparent,
        src: widget.assetPath!,
        alt: 'Exercise pose',
        autoPlay: true,
        cameraControls: true,
      ),
    );
  }
}
