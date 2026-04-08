import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'heart_chakra_energy_guide_comp_widget.dart'
    show HeartChakraEnergyGuideCompWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeartChakraEnergyGuideCompModel
    extends FlutterFlowModel<HeartChakraEnergyGuideCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;

  @override
  void initState(BuildContext context) {
    rowController1 = ScrollController();
    rowController2 = ScrollController();
  }

  @override
  void dispose() {
    rowController1?.dispose();
    rowController2?.dispose();
  }
}
