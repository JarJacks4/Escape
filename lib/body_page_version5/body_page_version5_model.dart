import '/components/body_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'body_page_version5_widget.dart' show BodyPageVersion5Widget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BodyPageVersion5Model extends FlutterFlowModel<BodyPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for BodyPage component.
  late BodyPageModel bodyPageModel;

  @override
  void initState(BuildContext context) {
    bodyPageModel = createModel(context, () => BodyPageModel());
  }

  @override
  void dispose() {
    bodyPageModel.dispose();
  }
}
