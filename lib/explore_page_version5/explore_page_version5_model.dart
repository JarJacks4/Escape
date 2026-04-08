import '/components/explore_screen_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'explore_page_version5_widget.dart' show ExplorePageVersion5Widget;
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
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ExplorePageVersion5Model
    extends FlutterFlowModel<ExplorePageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for ExploreScreen component.
  late ExploreScreenModel exploreScreenModel;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    exploreScreenModel = createModel(context, () => ExploreScreenModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    exploreScreenModel.dispose();
    sideNavModel.dispose();
  }
}
