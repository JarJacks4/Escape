import '/components/choose_your_realm_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'choose_your_realm_version5_page_widget.dart'
    show ChooseYourRealmVersion5PageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseYourRealmVersion5PageModel
    extends FlutterFlowModel<ChooseYourRealmVersion5PageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChooseYourRealmVersion5 component.
  late ChooseYourRealmVersion5Model chooseYourRealmVersion5Model;

  @override
  void initState(BuildContext context) {
    chooseYourRealmVersion5Model =
        createModel(context, () => ChooseYourRealmVersion5Model());
  }

  @override
  void dispose() {
    chooseYourRealmVersion5Model.dispose();
  }
}
