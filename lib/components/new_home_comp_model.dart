import '/auth/firebase_auth/auth_util.dart';
import '/components/help_comp_widget.dart';
import '/components/lucille_first_recommendation_comp_copy_widget.dart';
import '/components/lucille_help_comp_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'new_home_comp_widget.dart' show NewHomeCompWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewHomeCompModel extends FlutterFlowModel<NewHomeCompWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer1;
  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  // Model for LucilleFirstRecommendationCompCopy component.
  late LucilleFirstRecommendationCompCopyModel
      lucilleFirstRecommendationCompCopyModel;
  // State field(s) for Row widget.
  ScrollController? rowController;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    lucilleFirstRecommendationCompCopyModel =
        createModel(context, () => LucilleFirstRecommendationCompCopyModel());
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    lucilleFirstRecommendationCompCopyModel.dispose();
    rowController?.dispose();
  }
}
