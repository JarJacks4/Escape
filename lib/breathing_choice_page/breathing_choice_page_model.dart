import '/components/breathing_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'breathing_choice_page_widget.dart' show BreathingChoicePageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BreathingChoicePageModel
    extends FlutterFlowModel<BreathingChoicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BreathingChoiceComp component.
  late BreathingChoiceCompModel breathingChoiceCompModel;

  @override
  void initState(BuildContext context) {
    breathingChoiceCompModel =
        createModel(context, () => BreathingChoiceCompModel());
  }

  @override
  void dispose() {
    breathingChoiceCompModel.dispose();
  }
}
