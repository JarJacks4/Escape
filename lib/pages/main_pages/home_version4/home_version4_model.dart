import '/components/binuaral_beats_card_widget.dart';
import '/components/breathing_card_copy_widget.dart';
import '/components/meditation_card_widget.dart';
import '/components/nature_card_widget.dart';
import '/components/therapist_directory_card_widget.dart';
import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_version4_widget.dart' show HomeVersion4Widget;
import 'package:flutter/material.dart';

class HomeVersion4Model extends FlutterFlowModel<HomeVersion4Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? reorderSelfCarePacks;
  // Model for MeditationCard component.
  late MeditationCardModel meditationCardModel;
  // Model for BreathingCardCopy component.
  late BreathingCardCopyModel breathingCardCopyModel;
  // Model for NatureCard component.
  late NatureCardModel natureCardModel;
  // Model for BinuaralBeatsCard component.
  late BinuaralBeatsCardModel binuaralBeatsCardModel;
  // Model for therapistDirectoryCard component.
  late TherapistDirectoryCardModel therapistDirectoryCardModel;
  // Model for TodaysSelfCareActivitiesComp component.
  late TodaysSelfCareActivitiesCompModel todaysSelfCareActivitiesCompModel;

  @override
  void initState(BuildContext context) {
    meditationCardModel = createModel(context, () => MeditationCardModel());
    breathingCardCopyModel =
        createModel(context, () => BreathingCardCopyModel());
    natureCardModel = createModel(context, () => NatureCardModel());
    binuaralBeatsCardModel =
        createModel(context, () => BinuaralBeatsCardModel());
    therapistDirectoryCardModel =
        createModel(context, () => TherapistDirectoryCardModel());
    todaysSelfCareActivitiesCompModel =
        createModel(context, () => TodaysSelfCareActivitiesCompModel());
  }

  @override
  void dispose() {
    meditationCardModel.dispose();
    breathingCardCopyModel.dispose();
    natureCardModel.dispose();
    binuaralBeatsCardModel.dispose();
    therapistDirectoryCardModel.dispose();
    todaysSelfCareActivitiesCompModel.dispose();
  }
}
