// Escape v6 — Lucille (Claude edition): the SSE client for POST /v2/lucille/turn.
//
// One [V6ClaudeTurn] per thread screen. It owns the HTTP client, exposes the turn as a
// [ValueListenable] so the UI rebuilds without setState chains, cancels cleanly on dispose, and
// retries exactly once when the connection drops before the server said `done`.
//
// It never produces an event the server didn't send: `statuses`, `artifacts`, `actions`, `plan`,
// `approvals` and `disclosure` are appended only while decoding real frames.
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'v6_claude_api.dart';
import 'v6_claude_events.dart';

/// Everything one turn has produced so far.
@immutable
class V6ClaudeTurnState {
  const V6ClaudeTurnState({
    this.seq = 0,
    this.active = false,
    this.done = false,
    this.text = '',
    this.statuses = const [],
    this.artifacts = const [],
    this.actions = const [],
    this.approvals = const [],
    this.plan,
    this.disclosure,
    this.sessionId,
    this.title,
    this.messageId,
    this.errorCode,
    this.errorMessage,
    this.retrying = false,
  });

  /// Counts turns in this screen's lifetime. The UI keys the reply bubble on it so the smoke
  /// reveal plays once per reply and never restarts while deltas append.
  final int seq;

  /// A request is open.
  final bool active;

  /// The server sent `done`.
  final bool done;

  /// Everything streamed by `delta`, in order.
  final String text;

  /// Only labels the server sent, oldest first.
  final List<V6ClaudeStatusEvent> statuses;
  final List<V6ClaudeArtifactEvent> artifacts;
  final List<V6ClaudeActionEvent> actions;
  final List<V6ClaudeApprovalEvent> approvals;
  final V6ClaudePlanEvent? plan;

  /// The periodic AI notice, when this turn carried one.
  final String? disclosure;

  final String? sessionId;
  final String? title;
  final String? messageId;

  final String? errorCode;
  final String? errorMessage;

  /// The second (and last) attempt is in flight.
  final bool retrying;

  bool get hasError => errorCode != null;
  bool get isEmpty =>
      text.isEmpty &&
      statuses.isEmpty &&
      artifacts.isEmpty &&
      actions.isEmpty &&
      approvals.isEmpty &&
      plan == null;

  /// The status to show right now, or null when the server hasn't sent one.
  V6ClaudeStatusEvent? get currentStatus => statuses.isEmpty ? null : statuses.last;

  V6ClaudeTurnState copyWith({
    int? seq,
    bool? active,
    bool? done,
    String? text,
    List<V6ClaudeStatusEvent>? statuses,
    List<V6ClaudeArtifactEvent>? artifacts,
    List<V6ClaudeActionEvent>? actions,
    List<V6ClaudeApprovalEvent>? approvals,
    V6ClaudePlanEvent? plan,
    String? disclosure,
    String? sessionId,
    String? title,
    String? messageId,
    String? errorCode,
    String? errorMessage,
    bool? retrying,
    bool clearError = false,
  }) =>
      V6ClaudeTurnState(
        seq: seq ?? this.seq,
        active: active ?? this.active,
        done: done ?? this.done,
        text: text ?? this.text,
        statuses: statuses ?? this.statuses,
        artifacts: artifacts ?? this.artifacts,
        actions: actions ?? this.actions,
        approvals: approvals ?? this.approvals,
        plan: plan ?? this.plan,
        disclosure: disclosure ?? this.disclosure,
        sessionId: sessionId ?? this.sessionId,
        title: title ?? this.title,
        messageId: messageId ?? this.messageId,
        errorCode: clearError ? null : (errorCode ?? this.errorCode),
        errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
        retrying: retrying ?? this.retrying,
      );

  static const idle = V6ClaudeTurnState();
}

/// What the screen must do with a turn, beyond rendering it.
typedef V6ClaudeSafetyHandler = void Function(V6ClaudeSafetyEvent event);
typedef V6ClaudeSessionHandler = void Function(String sessionId, String? title);
typedef V6ClaudeDoneHandler = void Function(V6ClaudeTurnState state);

class V6ClaudeTurn extends ValueNotifier<V6ClaudeTurnState> {
  V6ClaudeTurn({this.onSafety, this.onSession, this.onDone}) : super(V6ClaudeTurnState.idle);

  /// A `safety` frame arrived: the screen shows the Support sheet (needs a BuildContext).
  final V6ClaudeSafetyHandler? onSafety;

  /// A `session` frame arrived: the screen stores the thread id / title.
  final V6ClaudeSessionHandler? onSession;

  /// The turn finished — with `done`, with an error, or cancelled while active.
  final V6ClaudeDoneHandler? onDone;

  http.Client? _client;
  StreamSubscription<String>? _sub;
  bool _disposed = false;
  bool _finished = false;

  // The last request, so retry() can repeat it verbatim.
  String? _message;
  String? _sessionId;
  String _mode = 'text';
  bool _speak = false;
  Map<String, dynamic>? _clientContext;
  List<int>? _audio;
  String? _filename;
  int _seq = 0;

  bool get busy => value.active;

  /// Starts a turn. Any turn still running is cancelled first.
  Future<void> send({
    String? message,
    String? sessionId,
    String mode = 'text',
    bool speak = false,
    Map<String, dynamic>? clientContext,
  }) async {
    _message = message;
    _sessionId = sessionId;
    _mode = mode;
    _speak = speak;
    _clientContext = clientContext;
    _audio = null;
    _filename = null;
    await _run(attempt: 0);
  }

  /// The audio fallback of the same turn (used only when the phone could not transcribe).
  Future<void> sendAudio({
    required List<int> audio,
    String filename = 'turn.m4a',
    String? sessionId,
    bool speak = true,
    Map<String, dynamic>? clientContext,
  }) async {
    _message = null;
    _sessionId = sessionId;
    _mode = 'voice';
    _speak = speak;
    _clientContext = clientContext;
    _audio = audio;
    _filename = filename;
    await _run(attempt: 0);
  }

  /// Repeats the last request from scratch (the retry row taps this).
  Future<void> retry() async {
    if (_message == null && _audio == null) return;
    await _run(attempt: 0);
  }

  /// Stops the stream and keeps whatever already arrived.
  void cancel() {
    if (!value.active) return;
    _teardown();
    _set(value.copyWith(active: false, retrying: false));
    _finish();
  }

  @override
  void dispose() {
    _disposed = true;
    _teardown();
    super.dispose();
  }

  // ───────────────────────── internals ─────────────────────────

  void _teardown() {
    _sub?.cancel();
    _sub = null;
    try {
      _client?.close();
    } catch (_) {}
    _client = null;
  }

  void _set(V6ClaudeTurnState s) {
    if (_disposed) return;
    value = s;
  }

  void _finish() {
    if (_finished) return;
    _finished = true;
    if (!_disposed) onDone?.call(value);
  }

  Future<void> _run({required int attempt}) async {
    _teardown();
    if (_disposed) return;
    _finished = false;
    // Attempt 2 starts from a clean slate so retried text can never be appended twice.
    if (attempt == 0) _seq += 1;
    _set(V6ClaudeTurnState(
      seq: _seq,
      active: true,
      sessionId: _sessionId,
      retrying: attempt > 0,
    ));

    final client = http.Client();
    _client = client;
    http.StreamedResponse res;
    try {
      res = _audio != null
          ? await V6ClaudeApi.openAudioStream(
              client,
              audio: _audio!,
              filename: _filename ?? 'turn.m4a',
              sessionId: _sessionId,
              speak: _speak,
              clientContext: _clientContext,
            )
          : await V6ClaudeApi.openStream(
              client,
              V6ClaudeApi.turnPath,
              V6ClaudeApi.turnBody(
                message: _message,
                sessionId: _sessionId,
                mode: _mode,
                speak: _speak,
                clientContext: _clientContext,
              ),
            );
    } catch (e) {
      debugPrint('V6ClaudeTurn: connect failed ($e)');
      await _dropped(attempt, 'offline', 'Lucille is unreachable right now.');
      return;
    }
    if (_disposed || !identical(_client, client)) {
      try {
        client.close();
      } catch (_) {}
      return;
    }

    if (res.statusCode != 200) {
      // Drain so the socket closes tidily, and keep the body for a consent / error code.
      String body = '';
      try {
        body = await res.stream.bytesToString();
      } catch (_) {}
      _teardown();
      _set(value.copyWith(
        active: false,
        retrying: false,
        errorCode: 'http_${res.statusCode}',
        errorMessage: _messageFromBody(body) ?? "Lucille couldn't answer that just now.",
      ));
      _finish();
      return;
    }

    _sub = res.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen(_onLine, onError: (Object e) {
      debugPrint('V6ClaudeTurn: stream error ($e)');
      unawaited(_dropped(attempt, 'dropped', 'The connection dropped mid-answer.'));
    }, onDone: () {
      if (_disposed || !value.active) return;
      // The server hung up without `done`.
      unawaited(_dropped(attempt, 'dropped', 'The connection dropped mid-answer.'));
    }, cancelOnError: true);
  }

  Future<void> _dropped(int attempt, String code, String message) async {
    _teardown();
    if (_disposed) return;
    if (attempt == 0) {
      await _run(attempt: 1);
      return;
    }
    _set(value.copyWith(active: false, retrying: false, errorCode: code, errorMessage: message));
    _finish();
  }

  static String? _messageFromBody(String body) {
    if (body.isEmpty) return null;
    try {
      final m = jsonDecode(body);
      if (m is Map) {
        final d = m['detail'];
        if (d is Map && d['message'] != null) return d['message'].toString();
        if (d is String && d.isNotEmpty) return d;
        if (m['message'] != null) return m['message'].toString();
      }
    } catch (_) {}
    return null;
  }

  void _onLine(String raw) {
    if (_disposed) return;
    final line = raw.trimRight();
    if (line.isEmpty || line.startsWith(':') || line.startsWith('event:')) return;
    if (!line.startsWith('data:')) return;
    final payload = line.substring(5).trim();
    if (payload.isEmpty || payload == '[DONE]') return;
    Map<String, dynamic> m;
    try {
      final decoded = jsonDecode(payload);
      if (decoded is! Map) return;
      m = Map<String, dynamic>.from(decoded);
    } catch (e) {
      debugPrint('V6ClaudeTurn: bad frame ($e)');
      return;
    }
    final event = V6ClaudeEvent.parse(m);
    if (event == null) return; // a type this build doesn't know: ignored, never guessed at
    _apply(event);
  }

  void _apply(V6ClaudeEvent e) {
    switch (e.type) {
      case V6ClaudeEventType.session:
        final id = e.str('sessionId');
        if (id == null) return;
        _sessionId = id;
        _set(value.copyWith(sessionId: id, title: e.str('title')));
        onSession?.call(id, e.str('title'));
      case V6ClaudeEventType.status:
        final s = V6ClaudeStatusEvent.from(e);
        if (s == null) return;
        _set(value.copyWith(statuses: [...value.statuses, s]));
      case V6ClaudeEventType.delta:
        final t = e.data['text'];
        if (t == null) return;
        _set(value.copyWith(text: value.text + t.toString()));
      case V6ClaudeEventType.artifact:
        final a = V6ClaudeArtifactEvent.from(e);
        if (a == null) return;
        _set(value.copyWith(artifacts: [...value.artifacts, a]));
      case V6ClaudeEventType.action:
        final a = V6ClaudeActionEvent.from(e);
        if (a == null) return;
        _set(value.copyWith(actions: [...value.actions, a]));
      case V6ClaudeEventType.plan:
        final p = V6ClaudePlanEvent.from(e);
        if (p == null) return;
        _set(value.copyWith(plan: p));
      case V6ClaudeEventType.approval:
        final a = V6ClaudeApprovalEvent.from(e);
        if (a == null) return;
        _set(value.copyWith(approvals: [...value.approvals, a]));
      case V6ClaudeEventType.safety:
        onSafety?.call(V6ClaudeSafetyEvent.from(e));
      case V6ClaudeEventType.disclosure:
        final t = e.str('text');
        if (t == null) return;
        _set(value.copyWith(disclosure: t));
      case V6ClaudeEventType.done:
        _teardown();
        _set(value.copyWith(
          active: false,
          done: true,
          retrying: false,
          messageId: e.str('messageId'),
        ));
        _finish();
      case V6ClaudeEventType.error:
        _teardown();
        _set(value.copyWith(
          active: false,
          retrying: false,
          errorCode: e.str('code') ?? 'error',
          errorMessage: e.str('message') ?? "Lucille couldn't finish that answer.",
        ));
        _finish();
      case V6ClaudeEventType.unknown:
        return;
    }
  }

  /// Records the user's answer to an approval card so the card stops offering the choice.
  void markApproval(String id, V6ClaudeApprovalState state) {
    final next = value.approvals
        .map((a) => a.id == id ? a.copyWith(state: state) : a)
        .toList(growable: false);
    _set(value.copyWith(approvals: next));
  }

  /// Clears the turn (used when its content has been folded into the thread).
  void reset() {
    _teardown();
    _finished = true;
    _set(V6ClaudeTurnState.idle);
  }
}
