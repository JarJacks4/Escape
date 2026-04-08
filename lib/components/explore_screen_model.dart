import '/components/help_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'explore_screen_widget.dart' show ExploreScreenWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ExploreScreenModel extends FlutterFlowModel<ExploreScreenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  // State field(s) for Row widget.
  ScrollController? rowController;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;
  AudioPlayer? soundPlayer13;
  AudioPlayer? soundPlayer14;
  AudioPlayer? soundPlayer15;
  AudioPlayer? soundPlayer16;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController?.dispose();
  }
}
