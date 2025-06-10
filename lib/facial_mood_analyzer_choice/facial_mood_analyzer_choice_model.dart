import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'facial_mood_analyzer_choice_widget.dart'
    show FacialMoodAnalyzerChoiceWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FacialMoodAnalyzerChoiceModel
    extends FlutterFlowModel<FacialMoodAnalyzerChoiceWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadMoodAction1 = false;
  FFUploadedFile uploadedLocalFile_uploadMoodAction1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
