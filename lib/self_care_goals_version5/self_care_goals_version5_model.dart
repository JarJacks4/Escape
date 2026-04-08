import '/components/set_goals_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'self_care_goals_version5_widget.dart' show SelfCareGoalsVersion5Widget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelfCareGoalsVersion5Model
    extends FlutterFlowModel<SelfCareGoalsVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for SetGoalsComp component.
  late SetGoalsCompModel setGoalsCompModel;

  @override
  void initState(BuildContext context) {
    setGoalsCompModel = createModel(context, () => SetGoalsCompModel());
  }

  @override
  void dispose() {
    setGoalsCompModel.dispose();
  }
}
