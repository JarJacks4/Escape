import '/auth/firebase_auth/auth_util.dart';
import '/components/crown_chakra_mood_scan_comp_widget.dart';
import '/components/heart_chakra_bottom_sheet_mood_scan_widget.dart';
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
import 'energy_scan_version5_widget.dart' show EnergyScanVersion5Widget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EnergyScanVersion5Model
    extends FlutterFlowModel<EnergyScanVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
