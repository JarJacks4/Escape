// Escape v6 — Lucille (Claude edition): the local thread log.
//
// Duet keeps one ongoing thread plus separate threads per topic, all sharing the same memory.
// The memory lives on the server (chat_sessions + user_memories, shared with the OpenAI edition);
// this file only remembers, on the phone, which threads exist and what was said in them, so the
// list and the scrollback survive a restart.
//
// The frozen contract has no thread-list endpoint (only `sessionId` on the turn), so the list is
// local by design — see the report's TODO. Nothing here is ever invented: a thread exists only
// because the user started it, and its title is the server's own `session.title` until then the
// user's first line.
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'v6_claude_events.dart';

const kV6ClaudeThreadsKey = 'v6_claude_threads';

/// One message in a thread. Lucille's messages carry the cards and the status receipt of the
/// turn that produced them.
class V6ClaudeMessage {
  V6ClaudeMessage({
    required this.id,
    required this.fromLucille,
    required this.text,
    required this.at,
    this.voice = false,
    this.statuses = const [],
    this.artifacts = const [],
    this.actions = const [],
    this.approvals = const [],
    this.plan,
    this.disclosure,
  });

  final String id;
  final bool fromLucille;
  String text;
  final DateTime at;

  /// The user spoke this one (transcribed on the phone).
  final bool voice;

  List<V6ClaudeStatusEvent> statuses;
  List<V6ClaudeArtifactEvent> artifacts;
  List<V6ClaudeActionEvent> actions;
  List<V6ClaudeApprovalEvent> approvals;
  V6ClaudePlanEvent? plan;

  /// The periodic AI notice, rendered inline under this message.
  String? disclosure;

  bool get hasCards =>
      artifacts.isNotEmpty || actions.isNotEmpty || approvals.isNotEmpty || plan != null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'fromLucille': fromLucille,
        'text': text,
        'at': at.millisecondsSinceEpoch,
        if (voice) 'voice': true,
        if (statuses.isNotEmpty) 'statuses': statuses.map((s) => s.toJson()).toList(),
        if (artifacts.isNotEmpty) 'artifacts': artifacts.map((a) => a.toJson()).toList(),
        if (actions.isNotEmpty) 'actions': actions.map((a) => a.toJson()).toList(),
        if (approvals.isNotEmpty) 'approvals': approvals.map((a) => a.toJson()).toList(),
        if (plan != null) 'plan': plan!.toJson(),
        if (disclosure != null) 'disclosure': disclosure,
      };

  static V6ClaudeMessage? fromJson(Map m) {
    final id = m['id']?.toString();
    if (id == null) return null;
    List<T> list<T>(String key, T? Function(Map m) parse) {
      final raw = m[key];
      if (raw is! List) return <T>[];
      final out = <T>[];
      for (final item in raw.whereType<Map>()) {
        final v = parse(item);
        if (v != null) out.add(v);
      }
      return out;
    }

    return V6ClaudeMessage(
      id: id,
      fromLucille: m['fromLucille'] == true,
      text: m['text']?.toString() ?? '',
      at: DateTime.fromMillisecondsSinceEpoch((m['at'] as num?)?.toInt() ?? 0),
      voice: m['voice'] == true,
      statuses: list<V6ClaudeStatusEvent>('statuses', V6ClaudeStatusEvent.fromJson),
      artifacts: list<V6ClaudeArtifactEvent>('artifacts', V6ClaudeArtifactEvent.fromJson),
      actions: list<V6ClaudeActionEvent>('actions', V6ClaudeActionEvent.fromJson),
      approvals: list<V6ClaudeApprovalEvent>('approvals', V6ClaudeApprovalEvent.fromJson),
      plan: m['plan'] is Map ? V6ClaudePlanEvent.fromJson(m['plan'] as Map) : null,
      disclosure: m['disclosure']?.toString(),
    );
  }
}

/// A thread (Duet's "channel"): a title, the server session it continues, and its messages.
class V6ClaudeThread {
  V6ClaudeThread({
    required this.id,
    this.sessionId,
    this.title,
    List<V6ClaudeMessage>? messages,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : messages = messages ?? <V6ClaudeMessage>[],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  /// Local id. Stable across a server session change (a thread keeps its place in the list).
  final String id;

  /// The server's thread id, once a turn has come back. Null until the first reply.
  String? sessionId;

  /// The server's `session.title`, or null until it sends one.
  String? title;

  final List<V6ClaudeMessage> messages;
  final DateTime createdAt;
  DateTime updatedAt;

  V6ClaudeMessage? get last => messages.isEmpty ? null : messages[messages.length - 1];

  /// What the list row shows. Falls back to the user's own first line, never to invented copy.
  String get displayTitle {
    final t = title?.trim();
    if (t != null && t.isNotEmpty) return t;
    for (final m in messages) {
      if (!m.fromLucille && m.text.trim().isNotEmpty) {
        final line = m.text.trim().replaceAll('\n', ' ');
        return line.length <= 48 ? line : '${line.substring(0, 47)}…';
      }
    }
    return 'New thread';
  }

  String get preview {
    final m = last;
    if (m == null) return '';
    final line = m.text.trim().replaceAll('\n', ' ');
    if (line.isEmpty) return m.hasCards ? 'Shared something with you' : '';
    return line;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        if (sessionId != null) 'sessionId': sessionId,
        if (title != null) 'title': title,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
        // Scrollback is capped so one long thread can't fill the phone's preferences store.
        'messages': messages
            .sublist(messages.length > 120 ? messages.length - 120 : 0)
            .map((m) => m.toJson())
            .toList(),
      };

  static V6ClaudeThread? fromJson(Map m) {
    final id = m['id']?.toString();
    if (id == null) return null;
    final msgs = <V6ClaudeMessage>[];
    if (m['messages'] is List) {
      for (final item in (m['messages'] as List).whereType<Map>()) {
        final msg = V6ClaudeMessage.fromJson(item);
        if (msg != null) msgs.add(msg);
      }
    }
    return V6ClaudeThread(
      id: id,
      sessionId: m['sessionId']?.toString(),
      title: m['title']?.toString(),
      messages: msgs,
      createdAt: DateTime.fromMillisecondsSinceEpoch((m['createdAt'] as num?)?.toInt() ?? 0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch((m['updatedAt'] as num?)?.toInt() ?? 0),
    );
  }
}

/// The thread log. One instance, loaded once, saved debounced.
class V6ClaudeThreads extends ChangeNotifier {
  V6ClaudeThreads._();
  static final V6ClaudeThreads instance = V6ClaudeThreads._();

  final List<V6ClaudeThread> threads = <V6ClaudeThread>[];
  bool loaded = false;
  Timer? _saveTimer;
  int _n = 0;

  /// Newest first (what the list shows).
  List<V6ClaudeThread> get byRecency {
    final out = [...threads];
    out.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return out;
  }

  Future<void> load() async {
    if (loaded) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(kV6ClaudeThreadsKey);
      if (raw != null) {
        final decoded = jsonDecode(raw);
        if (decoded is List) {
          for (final item in decoded.whereType<Map>()) {
            final t = V6ClaudeThread.fromJson(item);
            if (t != null) threads.add(t);
          }
        }
      }
    } catch (e) {
      debugPrint('V6ClaudeThreads load failed: $e');
    }
    loaded = true;
    notifyListeners();
  }

  void touch(V6ClaudeThread t) {
    t.updatedAt = DateTime.now();
    changed();
  }

  void changed() {
    notifyListeners();
    _saveTimer?.cancel();
    _saveTimer = Timer(const Duration(milliseconds: 600), () => unawaited(save()));
  }

  Future<void> save() async {
    _saveTimer?.cancel();
    try {
      final prefs = await SharedPreferences.getInstance();
      // Only the 30 most recent threads are kept on disk.
      final keep = byRecency.take(30).map((t) => t.toJson()).toList();
      await prefs.setString(kV6ClaudeThreadsKey, jsonEncode(keep));
    } catch (e) {
      debugPrint('V6ClaudeThreads save failed: $e');
    }
  }

  V6ClaudeThread create() {
    final t = V6ClaudeThread(id: 't${DateTime.now().microsecondsSinceEpoch}-${++_n}');
    threads.add(t);
    changed();
    return t;
  }

  /// The thread the Lucille tab continues: the most recent one, or a fresh one.
  V6ClaudeThread ongoing() {
    final list = byRecency;
    return list.isEmpty ? create() : list.first;
  }

  V6ClaudeThread? byId(String id) => threads.where((t) => t.id == id).v6FirstOrNull;

  void remove(String id) {
    threads.removeWhere((t) => t.id == id);
    changed();
  }

  String nextMessageId() => 'cm${DateTime.now().microsecondsSinceEpoch}-${++_n}';

  @override
  void dispose() {
    _saveTimer?.cancel();
    super.dispose();
  }
}

/// "9:04" / "Yesterday" / "12 Oct" — the time column of the thread list.
String v6ClaudeWhen(DateTime at, [DateTime? nowOverride]) {
  final now = nowOverride ?? DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(at.year, at.month, at.day);
  if (day == today) {
    final h = at.hour % 12 == 0 ? 12 : at.hour % 12;
    return '$h:${at.minute.toString().padLeft(2, '0')} ${at.hour < 12 ? 'am' : 'pm'}';
  }
  if (today.difference(day).inDays == 1) return 'Yesterday';
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return '${at.day} ${months[at.month - 1]}';
}
