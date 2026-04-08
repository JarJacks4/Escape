import '/components/starting_realm_comp_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'starting_realm_widget.dart' show StartingRealmWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartingRealmModel extends FlutterFlowModel<StartingRealmWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StartingRealmCompVersion5 component.
  late StartingRealmCompVersion5Model startingRealmCompVersion5Model;

  @override
  void initState(BuildContext context) {
    startingRealmCompVersion5Model =
        createModel(context, () => StartingRealmCompVersion5Model());
  }

  @override
  void dispose() {
    startingRealmCompVersion5Model.dispose();
  }
}
