import '/components/focus_and_concentration_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'focus_modes_page_widget.dart' show FocusModesPageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FocusModesPageModel extends FlutterFlowModel<FocusModesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FocusAndConcentrationComp component.
  late FocusAndConcentrationCompModel focusAndConcentrationCompModel;

  @override
  void initState(BuildContext context) {
    focusAndConcentrationCompModel =
        createModel(context, () => FocusAndConcentrationCompModel());
  }

  @override
  void dispose() {
    focusAndConcentrationCompModel.dispose();
  }
}
