import '/components/nature_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'nature_mediation_choice_widget.dart' show NatureMediationChoiceWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NatureMediationChoiceModel
    extends FlutterFlowModel<NatureMediationChoiceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NatureChoiceComp component.
  late NatureChoiceCompModel natureChoiceCompModel;

  @override
  void initState(BuildContext context) {
    natureChoiceCompModel = createModel(context, () => NatureChoiceCompModel());
  }

  @override
  void dispose() {
    natureChoiceCompModel.dispose();
  }
}
