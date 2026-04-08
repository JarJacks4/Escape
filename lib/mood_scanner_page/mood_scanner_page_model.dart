import '/components/mood_scanner_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'mood_scanner_page_widget.dart' show MoodScannerPageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoodScannerPageModel extends FlutterFlowModel<MoodScannerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoodScannerComponent component.
  late MoodScannerComponentModel moodScannerComponentModel;

  @override
  void initState(BuildContext context) {
    moodScannerComponentModel =
        createModel(context, () => MoodScannerComponentModel());
  }

  @override
  void dispose() {
    moodScannerComponentModel.dispose();
  }
}
