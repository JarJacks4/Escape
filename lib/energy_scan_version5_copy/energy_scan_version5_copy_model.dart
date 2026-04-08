import '/auth/firebase_auth/auth_util.dart';
import '/components/crown_chakra_mood_scan_comp_widget.dart';
import '/components/energy_scan_dialogue_comp_copy_widget.dart';
import '/components/heart_chakra_bottom_sheet_mood_scan_widget.dart';
import '/components/lucille_help_comp_widget.dart';
import '/components/root_chakra_comp_mood_scanner_widget.dart';
import '/components/sacral_chakra_mood_comp_widget.dart';
import '/components/solar_plexus_chakra_mood_scanner_comp_widget.dart';
import '/components/third_eye_chakra_mood_scan_widget.dart';
import '/components/throat_chakra_mood_scan_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'energy_scan_version5_copy_widget.dart'
    show EnergyScanVersion5CopyWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EnergyScanVersion5CopyModel
    extends FlutterFlowModel<EnergyScanVersion5CopyWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  // State field(s) for Column widget.
  ScrollController? columnController4;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
  }
}
