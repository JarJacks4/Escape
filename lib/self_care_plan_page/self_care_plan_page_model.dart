import '/auth/firebase_auth/auth_util.dart';
import '/components/progress_bar_final_widget.dart';
import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'self_care_plan_page_widget.dart' show SelfCarePlanPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelfCarePlanPageModel extends FlutterFlowModel<SelfCarePlanPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for progressBarFinal component.
  late ProgressBarFinalModel progressBarFinalModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for TodaysSelfCareActivitiesComp component.
  late TodaysSelfCareActivitiesCompModel todaysSelfCareActivitiesCompModel;

  @override
  void initState(BuildContext context) {
    progressBarFinalModel = createModel(context, () => ProgressBarFinalModel());
    todaysSelfCareActivitiesCompModel =
        createModel(context, () => TodaysSelfCareActivitiesCompModel());
  }

  @override
  void dispose() {
    progressBarFinalModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    todaysSelfCareActivitiesCompModel.dispose();
  }
}
