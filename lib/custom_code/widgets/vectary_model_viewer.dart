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
    final path = widget.assetPath ?? '';
    if (!path.startsWith('http') && !path.startsWith('assets/')) {
      // No GLB for this move yet: say so instead of leaving a blank box.
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: _NoModelPlaceholder(),
      );
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

/// Shown where the 3D pose would be when the move has no model link yet.
class _NoModelPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: theme.primary.withValues(alpha: 0.12)),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.accessibility_new_rounded,
              size: 48.0, color: theme.primary.withValues(alpha: 0.55)),
          const SizedBox(height: 8.0),
          Text(
            '3D pose coming soon',
            textAlign: TextAlign.center,
            style: theme.bodyMedium.override(
              fontFamily: 'Inter',
              color: theme.secondaryText,
              letterSpacing: 0.0,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            'Follow the steps below for now.',
            textAlign: TextAlign.center,
            style: theme.bodySmall.override(
              fontFamily: 'Inter',
              color: theme.secondaryText,
              letterSpacing: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}
