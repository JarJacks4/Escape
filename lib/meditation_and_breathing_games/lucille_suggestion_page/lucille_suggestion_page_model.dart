 import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_suggestion_page_widget.dart' show LucilleSuggestionPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LucilleSuggestionPageModel
    extends FlutterFlowModel<LucilleSuggestionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  int timerInitialTimeMs = 7;
  int timerMilliseconds = 7;
  String timerValue = StopWatchTimer.getDisplayTime(
    7,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  AudioPlayer? soundPlayer;
  // Stores action output result for [Backend Call - API (Create Memory)] action in Button widget.
  ApiCallResponse? memory;

  @override
  void initState(BuildContext context) {
    // 根据传入的练习时长(分钟)计算倒计时初始毫秒数,而不是写死的7ms占位值
    final durationMinutes = widget?.exerciseDuration;
    if (durationMinutes != null && durationMinutes > 0) {
      timerInitialTimeMs = (durationMinutes * 60 * 1000).round();
    } else {
      // 没有传入有效时长时,兜底给5分钟,避免计时器瞬间归零
      timerInitialTimeMs = 5 * 60 * 1000;
    }
    timerMilliseconds = timerInitialTimeMs;
    timerValue = StopWatchTimer.getDisplayTime(
      timerInitialTimeMs,
      hours: false,
      minute: false,
      milliSecond: false,
    );
  }

  @override
  void dispose() {
    timerController.dispose();
  }
}