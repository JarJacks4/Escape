import '/auth/firebase_auth/auth_util.dart';
import '/components/earn_points_with_avatar_card_widget.dart';
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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelfCarePlanPageModel extends FlutterFlowModel<SelfCarePlanPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EarnPointsWithAvatarCard component.
  late EarnPointsWithAvatarCardModel earnPointsWithAvatarCardModel;
  // Model for TodaysSelfCareActivitiesComp component.
  late TodaysSelfCareActivitiesCompModel todaysSelfCareActivitiesCompModel;
  // Model for progressBarFinal component.
  late ProgressBarFinalModel progressBarFinalModel;

  @override
  void initState(BuildContext context) {
    earnPointsWithAvatarCardModel =
        createModel(context, () => EarnPointsWithAvatarCardModel());
    todaysSelfCareActivitiesCompModel =
        createModel(context, () => TodaysSelfCareActivitiesCompModel());
    progressBarFinalModel = createModel(context, () => ProgressBarFinalModel());
  }

  @override
  void dispose() {
    earnPointsWithAvatarCardModel.dispose();
    todaysSelfCareActivitiesCompModel.dispose();
    progressBarFinalModel.dispose();
  }
}
