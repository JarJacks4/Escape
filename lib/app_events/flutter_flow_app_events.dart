// ignore_for_file: constant_identifier_names

import '/backend/schema/structs/index.dart';

import 'package:ff_commons/flutter_flow/app_events/app_events_base.dart';
export 'package:ff_commons/flutter_flow/app_events/app_events_base.dart';

/// This is app block is for the Mood Scan result and further examination from Lucille.
class MoodScannedEvent extends FFAppEvent {
  /// Structured data associated with MoodScannedEvent
  final AiResponseStruct? data;

  const MoodScannedEvent({
    this.data,
    super.debugId,
    super.waitForCompletion = true,
    required super.timestamp,
  }) : super(
          scope: FFAppEventScope.GLOBAL,
        );
}

class ChatSentEvent extends FFAppEvent {
  /// Structured data associated with ChatSentEvent
  final AiResponseStruct? data;

  const ChatSentEvent({
    this.data,
    super.debugId,
    super.waitForCompletion = true,
    required super.timestamp,
  }) : super(
          scope: FFAppEventScope.GLOBAL,
        );
}

class AiRecommendationReadyEvent extends FFAppEvent {
  const AiRecommendationReadyEvent({
    super.debugId,
    super.waitForCompletion = true,
    required super.timestamp,
  }) : super(
          scope: FFAppEventScope.GLOBAL,
        );
}

class SafetyAndCrisisAssessmentEvent extends FFAppEvent {
  const SafetyAndCrisisAssessmentEvent({
    super.debugId,
    super.waitForCompletion = true,
    required super.timestamp,
  }) : super(
          scope: FFAppEventScope.GLOBAL,
        );
}

class AiThinkingEvent extends FFAppEvent {
  const AiThinkingEvent({
    super.debugId,
    super.waitForCompletion = true,
    required super.timestamp,
  }) : super(
          scope: FFAppEventScope.GLOBAL,
        );
}
