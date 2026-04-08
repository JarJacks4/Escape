import '/auth/firebase_auth/auth_util.dart';
import '/components/lucille_soundscape_suggestion_widget.dart';
import '/components/soundscapes_starter_page_version5_copy_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_audio_player_oo85ab/flutter_flow/nav/serialization_util.dart"
    as that_audio_player_oo85ab_serialization_util;
import '/custom_code/actions/index.dart' as actions;
import 'a_i_soundscapes_copy_copy_copy_widget.dart'
    show AISoundscapesCopyCopyCopyWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:that_audio_player_oo85ab/custom_code/actions/index.dart'
    as that_audio_player_oo85ab_actions;
import 'package:that_audio_player_oo85ab/index.dart'
    as $that_audio_player_oo85ab;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AISoundscapesCopyCopyCopyModel
    extends FlutterFlowModel<AISoundscapesCopyCopyCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  AudioPlayer? soundPlayer1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  AudioPlayer? soundPlayer13;
  AudioPlayer? soundPlayer14;
  // State field(s) for Column widget.
  ScrollController? columnController6;
  AudioPlayer? soundPlayer15;
  AudioPlayer? soundPlayer16;
  AudioPlayer? soundPlayer17;
  AudioPlayer? soundPlayer18;
  // State field(s) for Column widget.
  ScrollController? columnController7;
  AudioPlayer? soundPlayer19;
  AudioPlayer? soundPlayer20;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    columnController5 = ScrollController();
    columnController6 = ScrollController();
    columnController7 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    tabBarController?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
    columnController6?.dispose();
    columnController7?.dispose();
  }
}
