import '/components/habits_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'habits_page_version5_widget.dart' show HabitsPageVersion5Widget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HabitsPageVersion5Model
    extends FlutterFlowModel<HabitsPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for habitsVersion5 component.
  late HabitsVersion5Model habitsVersion5Model;

  @override
  void initState(BuildContext context) {
    habitsVersion5Model = createModel(context, () => HabitsVersion5Model());
  }

  @override
  void dispose() {
    habitsVersion5Model.dispose();
  }
}
