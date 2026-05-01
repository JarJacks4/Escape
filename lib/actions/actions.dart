import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/assessment_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
  ApiCallResponse? safetyAndCrisis3;
  ApiCallResponse? safetyAndCrisis4;
  ApiCallResponse? safetyAndCrisis5;
  ApiCallResponse? safetyAndCrisis6;

  logFirebaseEvent('SelfCareCheckIn_haptic_feedback');
  HapticFeedback.heavyImpact();
  if ((valueOrDefault(currentUserDocument?.currentMood, '') == 'Sad') &&
          (valueOrDefault(currentUserDocument?.currentMood, '') == 'Unhappy') &&
          (valueOrDefault(currentUserDocument?.currentMood, '') == 'Mad') &&
          (valueOrDefault(currentUserDocument?.currentMood, '') ==
              'Unstable') &&
          (valueOrDefault(currentUserDocument?.currentMood, '') == 'depressed')
      ? true
      : false) {
    logFirebaseEvent('SelfCareCheckIn_backend_call');
    safetyAndCrisis3 = await LucilleSafetyAndCrisisGroup.safetyCheckCall.call(
      text: (FFAppState().messagesTheoryOfMind.isNotEmpty).toString(),
    );

    logFirebaseEvent('SelfCareCheckIn_backend_call');
    safetyAndCrisis4 = await LucilleSafetyAndCrisisGroup.auditCall.call();

    logFirebaseEvent('SelfCareCheckIn_backend_call');
    safetyAndCrisis5 =
        await LucilleSafetyAndCrisisGroup.safetySystemCall.call();

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
  } else {
    logFirebaseEvent('SelfCareCheckIn_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Keep up the great work with your self care progress!',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        duration: Duration(milliseconds: 7750),
        backgroundColor: FlutterFlowTheme.of(context).accent3,
      ),
    );
  }

  logFirebaseEvent('SelfCareCheckIn_backend_call');
  safetyAndCrisis6 = await LucilleMemoriesGroup.createMemoryCall.call(
    content: (safetyAndCrisis6?.bodyText ?? ''),
    memoryType: 'Episodic',
    importance: 10,
  );
}

Future annualReviews(BuildContext context) async {
  ApiCallResponse? generateReview;
  ApiCallResponse? getReview;

  logFirebaseEvent('AnnualReviews_backend_call');
  generateReview = await LucilleReviewsGroup.generateReviewCall.call(
    periodDays: '5',
  );

  if ((generateReview.succeeded ?? true)) {
    logFirebaseEvent('AnnualReviews_backend_call');
    getReview = await LucilleReviewsGroup.getReviewsCall.call();
  } else {
    return;
  }
}

Future moodScanResult(
  BuildContext context, {
  AiResponseStruct? data,
}) async {
  ApiCallResponse? moodScanResult;
  ApiCallResponse? moodMemory;

  logFirebaseEvent('moodScanResult_backend_call');
  moodScanResult = await TheoryOfMindLucilleGroup.lucilleChatMainCall.call(
    sessionId: FFAppState().chatSessionId,
    message:
        'Take the following mood and use this as a analysis for the mood of the user and profile:${valueOrDefault(currentUserDocument?.currentMood, '')}',
    userId: currentUserUid,
  );

  if ((moodScanResult.succeeded ?? true)) {
    logFirebaseEvent('moodScanResult_update_app_state');
    FFAppState().addToMessagesTheoryOfMind(TheoryOfMindLucilleStreamChatStruct(
      content: TheoryOfMindLucilleGroup.lucilleChatMainCall.response(
        (moodScanResult.jsonBody ?? ''),
      ),
      done: (moodScanResult.succeeded ?? true),
      sessionId: FFAppState().chatSessionId,
      response: TheoryOfMindLucilleGroup.lucilleChatMainCall.response(
        (moodScanResult.jsonBody ?? ''),
      ),
      messageCount: TheoryOfMindLucilleGroup.lucilleChatMainCall.messageCount(
        (moodScanResult.jsonBody ?? ''),
      ),
    ));
    FFAppState().update(() {});
    logFirebaseEvent('moodScanResult_backend_call');
    moodMemory = await LucilleMemoriesGroup.createMemoryCall.call(
      content:
          'User feels ${TheoryOfMindLucilleGroup.lucilleChatMainCall.response(
        (moodScanResult.jsonBody ?? ''),
      )}. And Here is the Detected Emotion: ${TheoryOfMindLucilleGroup.lucilleChatMainCall.detectedEmotion(
        (moodScanResult.jsonBody ?? ''),
      )}',
      memoryType: 'Episodic',
      importance: 10,
    );
  }
}

Future chatResultActionBlock(
  BuildContext context, {
  required AiResponseStruct? data,
}) async {
  ApiCallResponse? memoryForChatResult;
  ApiCallResponse? consolidateMemoryForChat;

  logFirebaseEvent('chatResultActionBlock_backend_call');
  memoryForChatResult = await LucilleMemoriesGroup.createMemoryCall.call(
    content: data?.message,
    memoryType: valueOrDefault<String>(
      data?.type,
      'Semantic',
    ),
    importance: 5,
  );

  logFirebaseEvent('chatResultActionBlock_backend_call');
  consolidateMemoryForChat =
      await LucilleMemoriesGroup.consolidateMemoryCall.call();
}

Future lucilleRecommendations(BuildContext context) async {
  ApiCallResponse? therapyRecommendations;
  ApiCallResponse? moodMemory;
  ApiCallResponse? consolidateMemory2;

  logFirebaseEvent('LucilleRecommendations_backend_call');
  therapyRecommendations =
      await TheoryOfMindLucilleGroup.getTherapyRecommendationsCall.call();

  if ((therapyRecommendations.succeeded ?? true)) {
    logFirebaseEvent('LucilleRecommendations_update_app_state');
    FFAppState().addToMessagesTheoryOfMind(TheoryOfMindLucilleStreamChatStruct(
      content: TheoryOfMindLucilleGroup.getTherapyRecommendationsCall
          .recommendations(
            (therapyRecommendations.jsonBody ?? ''),
          )
          ?.firstOrNull
          ?.toString(),
      done: (therapyRecommendations.succeeded ?? true),
      sessionId: FFAppState().chatSessionId,
      response: TheoryOfMindLucilleGroup.getTherapyRecommendationsCall
          .recommendations(
            (therapyRecommendations.jsonBody ?? ''),
          )
          ?.take(100)
          .toList()
          .firstOrNull
          ?.toString(),
      messageCount:
          TheoryOfMindLucilleGroup.getTherapyRecommendationsCall.count(
        (therapyRecommendations.jsonBody ?? ''),
      ),
    ));
    FFAppState().update(() {});
    logFirebaseEvent('LucilleRecommendations_backend_call');
    moodMemory = await LucilleMemoriesGroup.createMemoryCall.call(
      content:
          'User needs new recommendations based off of the new mood or change:${TheoryOfMindLucilleGroup.getTherapyRecommendationsCall.detectedIntent(
        (therapyRecommendations.jsonBody ?? ''),
      )}. And Here is the Detected Emotion: ${TheoryOfMindLucilleGroup.getTherapyRecommendationsCall.detectedEmotion(
        (therapyRecommendations.jsonBody ?? ''),
      )}',
      memoryType: 'Episodic',
      importance: 10,
    );

    logFirebaseEvent('LucilleRecommendations_backend_call');
    consolidateMemory2 =
        await LucilleMemoriesGroup.consolidateMemoryCall.call();
  }
}

Future onboardingWalkthrough(BuildContext context) async {}
