import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'meditation_help_widget.dart' show MeditationHelpWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeditationHelpModel extends FlutterFlowModel<MeditationHelpWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MeditationHelpComp component.
  late MeditationHelpCompModel meditationHelpCompModel;

  @override
  void initState(BuildContext context) {
    meditationHelpCompModel =
        createModel(context, () => MeditationHelpCompModel());
  }

  @override
  void dispose() {
    meditationHelpCompModel.dispose();
  }
}
