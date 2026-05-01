import 'dart:async';
import 'package:flutter/foundation.dart';
import '/flutter_flow/nav/nav.dart';
import '/actions/actions.dart' as action_blocks;

import 'index.dart';

/// Handles global events
Future<void> handleGlobalEvent(FFAppEvent event) async {
  if (kDebugMode) {
    debugPrint('Processing event: ${event.runtimeType}');
  }
  final context = appNavigatorKey.currentContext;
  if (context == null) {
    if (kDebugMode) {
      debugPrint('No context found while handling event: ${event.runtimeType}');
    }
    return;
  }
  switch (event) {
    case MoodScannedEvent():
      await action_blocks.moodScanResult(
        context,
        data: event.data,
      );
      return;
    case ChatSentEvent():
      await action_blocks.chatResultActionBlock(
        context,
        data: event.data,
      );
      return;
    case AiRecommendationReadyEvent():
      await action_blocks.lucilleRecommendations(
        context,
      );
      return;
    case SafetyAndCrisisAssessmentEvent():
      await action_blocks.selfCareCheckIn(
        context,
      );
      return;
    case AiThinkingEvent():
      await action_blocks.annualReviews(
        context,
      );
      return;

    default:
      return;
  }
}
