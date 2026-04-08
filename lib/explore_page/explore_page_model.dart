import '/components/explore_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'explore_page_widget.dart' show ExplorePageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExplorePageModel extends FlutterFlowModel<ExplorePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ExploreScreen component.
  late ExploreScreenModel exploreScreenModel;

  @override
  void initState(BuildContext context) {
    exploreScreenModel = createModel(context, () => ExploreScreenModel());
  }

  @override
  void dispose() {
    exploreScreenModel.dispose();
  }
}
