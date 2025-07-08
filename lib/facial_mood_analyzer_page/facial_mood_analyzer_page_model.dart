import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'facial_mood_analyzer_page_widget.dart'
    show FacialMoodAnalyzerPageWidget;
import 'package:flutter/material.dart';

class FacialMoodAnalyzerPageModel
    extends FlutterFlowModel<FacialMoodAnalyzerPageWidget> {
  ///  Local state fields for this page.

  String? moodPhoto;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_reUploadData8rj = false;
  FFUploadedFile uploadedLocalFile_reUploadData8rj =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_reUploadData8rj = '';

  bool isDataUploading_aIUploadMoodPhoto = false;
  FFUploadedFile uploadedLocalFile_aIUploadMoodPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_aIUploadMoodPhoto = '';

  // Stores action output result for [AI Agent - Send Message to LucilleMoodAnalyzerAgent] action in Button widget.
  String? aIMoodAnalyzeAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
