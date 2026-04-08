import '/components/coaching_session_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'coaching_session_page_widget.dart' show CoachingSessionPageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoachingSessionPageModel
    extends FlutterFlowModel<CoachingSessionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for coachingSession component.
  late CoachingSessionModel coachingSessionModel;

  @override
  void initState(BuildContext context) {
    coachingSessionModel = createModel(context, () => CoachingSessionModel());
  }

  @override
  void dispose() {
    coachingSessionModel.dispose();
  }
}
