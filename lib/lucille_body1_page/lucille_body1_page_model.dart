import '/components/lucille_body1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'lucille_body1_page_widget.dart' show LucilleBody1PageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LucilleBody1PageModel extends FlutterFlowModel<LucilleBody1PageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LucilleBody1 component.
  late LucilleBody1Model lucilleBody1Model;

  @override
  void initState(BuildContext context) {
    lucilleBody1Model = createModel(context, () => LucilleBody1Model());
  }

  @override
  void dispose() {
    lucilleBody1Model.dispose();
  }
}
