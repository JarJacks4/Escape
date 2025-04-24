import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'mood_track_home_copy_widget.dart' show MoodTrackHomeCopyWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoodTrackHomeCopyModel extends FlutterFlowModel<MoodTrackHomeCopyWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? uploadedGeminiImage;

  String responseText = 'Hello!';

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? moodTrackerAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
