import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'assessment_bottom_sheet_widget.dart' show AssessmentBottomSheetWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AssessmentBottomSheetModel
    extends FlutterFlowModel<AssessmentBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  // State field(s) for FeelingsScore widget.
  double? feelingsScoreValue;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;

  // State field(s) for SleepScore widget.
  double? sleepScoreValue;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;

  // FIX: moved from FFAppState to local model to avoid global state pollution
  // 0 = none selected, 1-5 = number of stars selected
  int energyScore = 0;

  // State field(s) for StressScore widget.
  double? stressScoreValue;
  AudioPlayer? soundPlayer12;
  AudioPlayer? soundPlayer13;
  AudioPlayer? soundPlayer14;

  // State field(s) for SuppportScore widget.
  double? suppportScoreValue;
  AudioPlayer? soundPlayer15;
  AudioPlayer? soundPlayer16;
  AudioPlayer? soundPlayer17;

  // State field(s) for OverallScore widget.
  double? overallScoreValue;
  AudioPlayer? soundPlayer18;
  AudioPlayer? soundPlayer19;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    soundPlayer1?.dispose();
    soundPlayer2?.dispose();
    soundPlayer3?.dispose();
    soundPlayer4?.dispose();
    soundPlayer5?.dispose();
    soundPlayer6?.dispose();
    soundPlayer7?.dispose();
    soundPlayer8?.dispose();
    soundPlayer9?.dispose();
    soundPlayer10?.dispose();
    soundPlayer11?.dispose();
    soundPlayer12?.dispose();
    soundPlayer13?.dispose();
    soundPlayer14?.dispose();
    soundPlayer15?.dispose();
    soundPlayer16?.dispose();
    soundPlayer17?.dispose();
    soundPlayer18?.dispose();
    soundPlayer19?.dispose();
  }
}