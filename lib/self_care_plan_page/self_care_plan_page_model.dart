import '/components/chat_with_lucille_card_widget.dart';
import '/components/generate_soundscapes_card_widget.dart';
import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'self_care_plan_page_widget.dart' show SelfCarePlanPageWidget;
import 'package:flutter/material.dart';

class SelfCarePlanPageModel extends FlutterFlowModel<SelfCarePlanPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChatWithLucilleCard component.
  late ChatWithLucilleCardModel chatWithLucilleCardModel;
  // Model for GenerateSoundscapesCard component.
  late GenerateSoundscapesCardModel generateSoundscapesCardModel;
  // Model for TodaysSelfCareActivitiesComp component.
  late TodaysSelfCareActivitiesCompModel todaysSelfCareActivitiesCompModel;

  @override
  void initState(BuildContext context) {
    chatWithLucilleCardModel =
        createModel(context, () => ChatWithLucilleCardModel());
    generateSoundscapesCardModel =
        createModel(context, () => GenerateSoundscapesCardModel());
    todaysSelfCareActivitiesCompModel =
        createModel(context, () => TodaysSelfCareActivitiesCompModel());
  }

  @override
  void dispose() {
    chatWithLucilleCardModel.dispose();
    generateSoundscapesCardModel.dispose();
    todaysSelfCareActivitiesCompModel.dispose();
  }
}
