import '/components/earn_points_with_avatar_card_widget.dart';
import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'self_care_plan_page_widget.dart' show SelfCarePlanPageWidget;
import 'package:flutter/material.dart';

class SelfCarePlanPageModel extends FlutterFlowModel<SelfCarePlanPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EarnPointsWithAvatarCard component.
  late EarnPointsWithAvatarCardModel earnPointsWithAvatarCardModel;
  // Model for TodaysSelfCareActivitiesComp component.
  late TodaysSelfCareActivitiesCompModel todaysSelfCareActivitiesCompModel;

  @override
  void initState(BuildContext context) {
    earnPointsWithAvatarCardModel =
        createModel(context, () => EarnPointsWithAvatarCardModel());
    todaysSelfCareActivitiesCompModel =
        createModel(context, () => TodaysSelfCareActivitiesCompModel());
  }

  @override
  void dispose() {
    earnPointsWithAvatarCardModel.dispose();
    todaysSelfCareActivitiesCompModel.dispose();
  }
}
