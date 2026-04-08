import '/components/meditate_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'meditation_choice_page_widget.dart' show MeditationChoicePageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeditationChoicePageModel
    extends FlutterFlowModel<MeditationChoicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MeditateChoiceComp component.
  late MeditateChoiceCompModel meditateChoiceCompModel;

  @override
  void initState(BuildContext context) {
    meditateChoiceCompModel =
        createModel(context, () => MeditateChoiceCompModel());
  }

  @override
  void dispose() {
    meditateChoiceCompModel.dispose();
  }
}
