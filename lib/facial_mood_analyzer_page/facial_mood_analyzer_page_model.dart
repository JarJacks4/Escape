import '/components/mood_analyzer_success_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'facial_mood_analyzer_page_widget.dart'
    show FacialMoodAnalyzerPageWidget;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FacialMoodAnalyzerPageModel
    extends FlutterFlowModel<FacialMoodAnalyzerPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_reUploadData8rj = false;
  FFUploadedFile uploadedLocalFile_reUploadData8rj =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
