import '/components/choose_realms_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'choose_realms_page_widget.dart' show ChooseRealmsPageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseRealmsPageModel extends FlutterFlowModel<ChooseRealmsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChooseRealms component.
  late ChooseRealmsModel chooseRealmsModel;

  @override
  void initState(BuildContext context) {
    chooseRealmsModel = createModel(context, () => ChooseRealmsModel());
  }

  @override
  void dispose() {
    chooseRealmsModel.dispose();
  }
}
