import '/backend/api_requests/api_calls.dart';
import '/components/assessment_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  if (!(generateReview.succeeded ?? true)) {
    return;
  }
}
