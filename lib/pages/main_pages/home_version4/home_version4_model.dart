import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/binuaral_beats_card_widget.dart';
import '/components/breathing_card_copy_widget.dart';
import '/components/meditation_card_widget.dart';
import '/components/nature_card_widget.dart';
import '/components/success_home_feedback_widget.dart';
import '/components/therapist_directory_card_widget.dart';
import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_version4_widget.dart' show HomeVersion4Widget;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomeVersion4Model extends FlutterFlowModel<HomeVersion4Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - reorderItems] action in Container widget.
  List<String>? reorderMeditationPages;
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
