import '/components/scan_mood_laoding_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'scan_mood_laoding_page_widget.dart' show ScanMoodLaodingPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanMoodLaodingPageModel
    extends FlutterFlowModel<ScanMoodLaodingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ScanMoodLaodingComponent component.
  late ScanMoodLaodingComponentModel scanMoodLaodingComponentModel;

  @override
  void initState(BuildContext context) {
    scanMoodLaodingComponentModel =
        createModel(context, () => ScanMoodLaodingComponentModel());
  }

  @override
  void dispose() {
    scanMoodLaodingComponentModel.dispose();
  }
}
