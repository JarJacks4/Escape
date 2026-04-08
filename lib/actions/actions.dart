import '/backend/ai_agents/ai_agent.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/assessment_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:convert';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:that_audio_player_oo85ab/backend/api_requests/api_calls.dart'
    as that_audio_player_oo85ab_api_calls_util;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future lucillePushNotificationMood(BuildContext context) async {}

Future generateDailyQuoteBasedOnMood(BuildContext context) async {
  String? lucilleGenerateQuote;
}

Future<String?> advancedMoodAnalyzing(BuildContext context) async {
  String? advancedMoodScan;
  String? lucilleMessage;
  String? generateGentleTextBasedOnMood;

  return null;
}

Future selfCareCheckIn(BuildContext context) async {
  logFirebaseEvent('SelfCareCheckIn_haptic_feedback');
  HapticFeedback.heavyImpact();
  logFirebaseEvent('SelfCareCheckIn_bottom_sheet');
  await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return WebViewAware(
        child: Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: AssessmentBottomSheetWidget(),
        ),
      );
    },
  );
}

Future annualReviews(BuildContext context) async {
  ApiCallResponse? generateReview;

  logFirebaseEvent('AnnualReviews_backend_call');
  generateReview = await LucilleReviewsGroup.generateReviewCall.call(
    periodDays: '5',
  );

  if (!(generateReview?.succeeded ?? true)) {
    return;
  }
}
