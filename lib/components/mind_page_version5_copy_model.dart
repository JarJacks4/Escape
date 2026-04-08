import '/components/binaural_beats_choice_comp_widget.dart';
import '/components/meditate_choice_comp_widget.dart';
import '/components/mind_dialogue_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'mind_page_version5_copy_widget.dart' show MindPageVersion5CopyWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MindPageVersion5CopyModel
    extends FlutterFlowModel<MindPageVersion5CopyWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  AudioPlayer? soundPlayer2;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;
  AudioPlayer? soundPlayer13;
  AudioPlayer? soundPlayer14;
  AudioPlayer? soundPlayer15;
  AudioPlayer? soundPlayer16;
  AudioPlayer? soundPlayer17;
  AudioPlayer? soundPlayer18;
  AudioPlayer? soundPlayer19;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
  }
}
