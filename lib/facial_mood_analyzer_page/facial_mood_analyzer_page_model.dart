import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/index.dart';
import 'facial_mood_analyzer_page_widget.dart'
    show FacialMoodAnalyzerPageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FacialMoodAnalyzerPageModel
    extends FlutterFlowModel<FacialMoodAnalyzerPageWidget> {
  ///  Local state fields for this page.

  String? moodPhoto;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_aIUploadMoodPhoto3 = false;
  FFUploadedFile uploadedLocalFile_aIUploadMoodPhoto3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_aIUploadMoodPhoto3 = '';

  // Stores action output result for [AI Agent - Send Message to LucilleMoodAnalyzerAgent] action in Button widget.
  String? aIMoodAnalyzeAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
