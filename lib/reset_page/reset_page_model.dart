import '/components/reset_version5_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'reset_page_widget.dart' show ResetPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPageModel extends FlutterFlowModel<ResetPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ResetVersion5Copy component.
  late ResetVersion5CopyModel resetVersion5CopyModel;

  @override
  void initState(BuildContext context) {
    resetVersion5CopyModel =
        createModel(context, () => ResetVersion5CopyModel());
  }

  @override
  void dispose() {
    resetVersion5CopyModel.dispose();
  }
}
