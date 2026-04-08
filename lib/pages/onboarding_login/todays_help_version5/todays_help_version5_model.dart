import '/components/todays_help_version5_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'todays_help_version5_widget.dart' show TodaysHelpVersion5Widget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TodaysHelpVersion5Model
    extends FlutterFlowModel<TodaysHelpVersion5Widget> {
  ///  Local state fields for this page.

  String? profilePicture;

  bool interests = false;

  ///  State fields for stateful widgets in this page.

  // Model for TodaysHelpVersion5Comp component.
  late TodaysHelpVersion5CompModel todaysHelpVersion5CompModel;

  @override
  void initState(BuildContext context) {
    todaysHelpVersion5CompModel =
        createModel(context, () => TodaysHelpVersion5CompModel());
  }

  @override
  void dispose() {
    todaysHelpVersion5CompModel.dispose();
  }
}
