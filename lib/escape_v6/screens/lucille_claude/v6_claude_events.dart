// Escape v6 — Lucille (Claude edition): the wire model for POST /v2/lucille/turn.
//
// One class per `type` in the frozen contract (briefs/lucille_claude_contract.md). Nothing here
// invents a field: every value is read straight off the server's JSON, and a payload the server
// didn't send stays null so the UI can render nothing rather than a plausible-looking guess.
import 'package:flutter/foundation.dart';

/// `type` of an SSE frame. [unknown] keeps a future server type from breaking the stream.
enum V6ClaudeEventType {
  session,
  status,
  delta,
  artifact,
  action,
  plan,
  approval,
  safety,
  disclosure,
  done,
  error,
  unknown,
}

V6ClaudeEventType v6ClaudeEventType(String? raw) {
  switch (raw) {
    case 'session':
      return V6ClaudeEventType.session;
    case 'status':
      return V6ClaudeEventType.status;
    case 'delta':
      return V6ClaudeEventType.delta;
    case 'artifact':
      return V6ClaudeEventType.artifact;
    case 'action':
      return V6ClaudeEventType.action;
    case 'plan':
      return V6ClaudeEventType.plan;
    case 'approval':
      return V6ClaudeEventType.approval;
    case 'safety':
      return V6ClaudeEventType.safety;
    case 'disclosure':
      return V6ClaudeEventType.disclosure;
    case 'done':
      return V6ClaudeEventType.done;
    case 'error':
      return V6ClaudeEventType.error;
    default:
      return V6ClaudeEventType.unknown;
  }
}

/// One decoded `data:` line.
@immutable
class V6ClaudeEvent {
  const V6ClaudeEvent(this.type, this.data);
  final V6ClaudeEventType type;
  final Map<String, dynamic> data;

  static V6ClaudeEvent? parse(Map<String, dynamic> m) {
    final t = v6ClaudeEventType(m['type']?.toString());
    if (t == V6ClaudeEventType.unknown) return null;
    return V6ClaudeEvent(t, m);
  }

  String? str(String k) {
    final v = data[k];
    if (v == null) return null;
    final s = v.toString();
    return s.isEmpty ? null : s;
  }

  int? intOf(String k) => (data[k] is num) ? (data[k] as num).toInt() : null;
  bool boolOf(String k) => data[k] == true;
}

// ───────────────────────── status ─────────────────────────

/// `status.kind` from the contract. Drives the icon only — the words are always the server's.
enum V6ClaudeStatusKind { thinking, reading, writing, searching, drafting, checking, other }

V6ClaudeStatusKind v6ClaudeStatusKind(String? raw) {
  switch (raw) {
    case 'thinking':
      return V6ClaudeStatusKind.thinking;
    case 'reading':
      return V6ClaudeStatusKind.reading;
    case 'writing':
      return V6ClaudeStatusKind.writing;
    case 'searching':
      return V6ClaudeStatusKind.searching;
    case 'drafting':
      return V6ClaudeStatusKind.drafting;
    case 'checking':
      return V6ClaudeStatusKind.checking;
    default:
      return V6ClaudeStatusKind.other;
  }
}

@immutable
class V6ClaudeStatusEvent {
  const V6ClaudeStatusEvent({required this.label, required this.kind});
  final String label;
  final V6ClaudeStatusKind kind;

  /// Null when the server sent no label: a status with no words is never shown.
  static V6ClaudeStatusEvent? from(V6ClaudeEvent e) {
    final label = e.str('label');
    if (label == null) return null;
    return V6ClaudeStatusEvent(label: label, kind: v6ClaudeStatusKind(e.str('kind')));
  }

  Map<String, dynamic> toJson() => {'label': label, 'kind': kind.name};

  static V6ClaudeStatusEvent? fromJson(Map m) {
    final label = m['label']?.toString();
    if (label == null || label.isEmpty) return null;
    return V6ClaudeStatusEvent(label: label, kind: v6ClaudeStatusKind(m['kind']?.toString()));
  }
}

// ───────────────────────── artifact ─────────────────────────

@immutable
class V6ClaudeArtifactEvent {
  const V6ClaudeArtifactEvent({
    required this.id,
    required this.kind,
    required this.title,
    this.url,
    this.mime,
    this.bytes,
  });

  final String id;
  /// Server wording, e.g. `document` / `chart`.
  final String kind;
  final String title;
  final String? url;
  final String? mime;
  final int? bytes;

  bool get isChart => kind.toLowerCase().contains('chart');

  static V6ClaudeArtifactEvent? from(V6ClaudeEvent e) {
    final id = e.str('id');
    final title = e.str('title');
    if (id == null || title == null) return null;
    return V6ClaudeArtifactEvent(
      id: id,
      kind: e.str('kind') ?? 'document',
      title: title,
      url: e.str('url'),
      mime: e.str('mime'),
      bytes: e.intOf('bytes'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'kind': kind,
        'title': title,
        if (url != null) 'url': url,
        if (mime != null) 'mime': mime,
        if (bytes != null) 'bytes': bytes,
      };

  static V6ClaudeArtifactEvent? fromJson(Map m) {
    final id = m['id']?.toString();
    final title = m['title']?.toString();
    if (id == null || title == null || id.isEmpty || title.isEmpty) return null;
    return V6ClaudeArtifactEvent(
      id: id,
      kind: m['kind']?.toString() ?? 'document',
      title: title,
      url: m['url']?.toString(),
      mime: m['mime']?.toString(),
      bytes: (m['bytes'] as num?)?.toInt(),
    );
  }
}

// ───────────────────────── action ─────────────────────────

@immutable
class V6ClaudeActionEvent {
  const V6ClaudeActionEvent({
    required this.id,
    required this.label,
    required this.route,
    this.params = const {},
  });

  final String id;
  final String label;
  final String route;
  final Map<String, String> params;

  static V6ClaudeActionEvent? from(V6ClaudeEvent e) {
    final id = e.str('id');
    final label = e.str('label');
    final route = e.str('route');
    if (id == null || label == null || route == null) return null;
    return V6ClaudeActionEvent(id: id, label: label, route: route, params: _params(e.data['params']));
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'label': label, 'route': route, if (params.isNotEmpty) 'params': params};

  static V6ClaudeActionEvent? fromJson(Map m) {
    final id = m['id']?.toString();
    final label = m['label']?.toString();
    final route = m['route']?.toString();
    if (id == null || label == null || route == null) return null;
    return V6ClaudeActionEvent(id: id, label: label, route: route, params: _params(m['params']));
  }

  static Map<String, String> _params(dynamic raw) {
    if (raw is! Map) return const {};
    final out = <String, String>{};
    raw.forEach((k, v) {
      if (v != null) out[k.toString()] = v.toString();
    });
    return out;
  }

  /// `v6Exercise?id=box-breathing` — the form [v6Open] takes.
  String get routeWithParams {
    if (params.isEmpty) return route;
    final q = params.entries
        .map((e) => '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');
    return route.contains('?') ? '$route&$q' : '$route?$q';
  }
}

// ───────────────────────── plan ─────────────────────────

@immutable
class V6ClaudePlanEvent {
  const V6ClaudePlanEvent({
    required this.planId,
    required this.title,
    this.days,
    this.minutesPerDay,
    this.updated = false,
  });

  final String planId;
  final String title;
  final int? days;
  final int? minutesPerDay;
  final bool updated;

  static V6ClaudePlanEvent? from(V6ClaudeEvent e) {
    final id = e.str('planId');
    final title = e.str('title');
    if (id == null || title == null) return null;
    return V6ClaudePlanEvent(
      planId: id,
      title: title,
      days: e.intOf('days'),
      minutesPerDay: e.intOf('minutesPerDay'),
      updated: e.boolOf('updated'),
    );
  }

  Map<String, dynamic> toJson() => {
        'planId': planId,
        'title': title,
        if (days != null) 'days': days,
        if (minutesPerDay != null) 'minutesPerDay': minutesPerDay,
        'updated': updated,
      };

  static V6ClaudePlanEvent? fromJson(Map m) {
    final id = m['planId']?.toString();
    final title = m['title']?.toString();
    if (id == null || title == null) return null;
    return V6ClaudePlanEvent(
      planId: id,
      title: title,
      days: (m['days'] as num?)?.toInt(),
      minutesPerDay: (m['minutesPerDay'] as num?)?.toInt(),
      updated: m['updated'] == true,
    );
  }
}

// ───────────────────────── approval ─────────────────────────

/// What the user answered. [pending] means nothing has been written server-side.
enum V6ClaudeApprovalState { pending, allowed, declined, failed }

@immutable
class V6ClaudeApprovalEvent {
  const V6ClaudeApprovalEvent({
    required this.id,
    required this.label,
    this.detail,
    this.destructive = false,
    this.state = V6ClaudeApprovalState.pending,
  });

  final String id;
  final String label;
  final String? detail;
  final bool destructive;
  final V6ClaudeApprovalState state;

  V6ClaudeApprovalEvent copyWith({V6ClaudeApprovalState? state}) => V6ClaudeApprovalEvent(
        id: id,
        label: label,
        detail: detail,
        destructive: destructive,
        state: state ?? this.state,
      );

  static V6ClaudeApprovalEvent? from(V6ClaudeEvent e) {
    final id = e.str('id');
    final label = e.str('label');
    if (id == null || label == null) return null;
    return V6ClaudeApprovalEvent(
      id: id,
      label: label,
      detail: e.str('detail'),
      destructive: e.boolOf('destructive'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        if (detail != null) 'detail': detail,
        'destructive': destructive,
        'state': state.name,
      };

  static V6ClaudeApprovalEvent? fromJson(Map m) {
    final id = m['id']?.toString();
    final label = m['label']?.toString();
    if (id == null || label == null) return null;
    return V6ClaudeApprovalEvent(
      id: id,
      label: label,
      detail: m['detail']?.toString(),
      destructive: m['destructive'] == true,
      state: V6ClaudeApprovalState.values
              .where((s) => s.name == m['state']?.toString())
              .v6FirstOrNull ??
          V6ClaudeApprovalState.pending,
    );
  }
}

// ───────────────────────── safety ─────────────────────────

@immutable
class V6ClaudeSafetyEvent {
  const V6ClaudeSafetyEvent({required this.urgent});

  /// `level: "urgent"` → the urgent Support sheet; anything else is the gentle one.
  final bool urgent;

  static V6ClaudeSafetyEvent from(V6ClaudeEvent e) =>
      V6ClaudeSafetyEvent(urgent: (e.str('level') ?? 'gentle') == 'urgent');
}

/// Local copy of the store's `v6First` (this file must not import the store).
extension V6ClaudeIterableX<T> on Iterable<T> {
  T? get v6FirstOrNull {
    final it = iterator;
    return it.moveNext() ? it.current : null;
  }
}
