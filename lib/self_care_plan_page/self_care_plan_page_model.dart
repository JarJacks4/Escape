import '/auth/firebase_auth/auth_util.dart';
import '/components/progress_bar_widget.dart';
import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter_animate/flutter_animate.dart';
import 'self_care_plan_page_widget.dart' show SelfCarePlanPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelfCarePlanPageModel extends FlutterFlowModel<SelfCarePlanPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for ProgressBar component.
  late ProgressBarModel progressBarModel;
  // Model for TodaysSelfCareActivitiesComp component.
  late TodaysSelfCareActivitiesCompModel todaysSelfCareActivitiesCompModel;

  @override
  void initState(BuildContext context) {
    progressBarModel = createModel(context, () => ProgressBarModel());
    todaysSelfCareActivitiesCompModel =
        createModel(context, () => TodaysSelfCareActivitiesCompModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    progressBarModel.dispose();
    todaysSelfCareActivitiesCompModel.dispose();
  }
}
