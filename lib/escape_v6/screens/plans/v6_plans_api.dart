// Escape v6 — client for the Claude-edition self-care plans (`/v2/plans/*`).
//
// Everything goes through [V6Api.call], so the Firebase ID token, the X-Timezone header, the
// 401 refresh and the consent sheet (plans need `personalization`) are handled exactly once, in
// one place. This file adds no auth of its own except for the document download, which needs raw
// bytes rather than JSON (see [V6PlansApi.downloadDocument]).
//
// Both branches: when the Claude edition is off the server answers /v2/plans with 404, so every
// call falls back to the v1 catalog endpoints (`/v1/selfcare/*`). The plan JSON has the same
// shape in both editions; what v1 cannot do (documents, adherence / minutes charts) is reported
// as "unavailable" and the screens show an honest empty state instead of a made-up number.
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '/custom_code/actions/lucille_v1.dart' as lucille_actions;
import '/escape_v6/v6.dart';

/// Route names for the three plan pages (registered in lib/flutter_flow/nav/nav.dart).
class V6PlanRoutes {
  static const builder = 'v6PlanBuilder';
  static const plan = 'v6Plan'; // ?id=
  static const progress = 'v6PlanProgress'; // ?id=

  /// Hero tag the plan card carries from the page that links into [plan].
  static const heroTag = 'v6-plan-card';
}

// ───────────────────────── models ─────────────────────────

/// A goal a plan can be built around (`GET /v1/selfcare/goals`).
@immutable
class V6PlanGoal {
  const V6PlanGoal({required this.key, required this.label, this.why});

  final String key;
  final String label;

  /// Why the server suggested this goal for *this* person. Null when it did not say — the UI
  /// then shows nothing rather than inventing a reason.
  final String? why;

  static V6PlanGoal? fromJson(Map m) {
    final key = m['key']?.toString() ?? m['id']?.toString();
    if (key == null || key.isEmpty) return null;
    final why = (m['why'] ?? m['reason'] ?? m['because'])?.toString().trim();
    return V6PlanGoal(
      key: key,
      label: (m['label'] ?? m['title'] ?? key).toString(),
      why: why == null || why.isEmpty ? null : why,
    );
  }
}

/// One step of a plan.
@immutable
class V6PlanItem {
  const V6PlanItem({
    required this.id,
    required this.day,
    required this.title,
    required this.minutes,
    this.date,
    this.kind,
    this.route,
    this.params = const {},
    this.why,
    this.done = false,
    this.doneAt,
    this.planId,
  });

  final String id;
  final int day;
  final String? date; // yyyy-mm-dd
  final String title;
  final String? kind;
  final int minutes;
  final String? route;
  final Map<String, String> params;
  final String? why;
  final bool done;
  final DateTime? doneAt;
  final String? planId;

  /// `v6Exercise?id=long-exhale` — what [v6Open] takes. Null when the step has no destination.
  String? get openRoute {
    final r = route;
    if (r == null || r.isEmpty) return r;
    if (params.isEmpty) return r;
    return '$r?${Uri(queryParameters: params).query}';
  }

  static V6PlanItem? fromJson(Map m, {String? planId}) {
    final id = m['id']?.toString() ?? m['itemId']?.toString();
    if (id == null || id.isEmpty) return null;
    final rawParams = m['params'];
    final link = m['deeplink'];
    var route = m['route']?.toString();
    var params = <String, String>{};
    if (rawParams is Map) {
      params = rawParams.map((k, v) => MapEntry(k.toString(), v.toString()));
    }
    if ((route == null || route.isEmpty) && link is Map) {
      route = link['route']?.toString();
      final lp = link['params'];
      if (params.isEmpty && lp is Map) {
        params = lp.map((k, v) => MapEntry(k.toString(), v.toString()));
      }
    }
    final why = m['why']?.toString().trim();
    return V6PlanItem(
      id: id,
      day: (m['day'] as num?)?.toInt() ?? 1,
      date: m['date']?.toString(),
      title: (m['title'] ?? m['label'] ?? 'Plan step').toString(),
      kind: m['kind']?.toString(),
      minutes: (m['minutes'] as num?)?.toInt() ?? 0,
      route: route == null || route.isEmpty ? null : route,
      params: params,
      why: why == null || why.isEmpty ? null : why,
      done: m['done'] == true,
      doneAt: v6ParseDate(m['doneAt']),
      planId: m['planId']?.toString() ?? planId,
    );
  }
}

/// A whole plan (`{"plan": …}` in every /v2/plans answer).
@immutable
class V6Plan {
  const V6Plan({
    required this.id,
    required this.title,
    required this.days,
    required this.minutesPerDay,
    required this.goals,
    required this.goalLabels,
    required this.items,
    this.why,
    this.provider,
    this.revision = 1,
    this.archived = false,
    this.startDay,
    this.createdAt,
  });

  final String id;
  final String title;
  final String? why;
  final int days;
  final int minutesPerDay;
  final List<String> goals;
  final List<String> goalLabels;
  final List<V6PlanItem> items;
  final String? provider;
  final int revision;
  final bool archived;
  final String? startDay;
  final DateTime? createdAt;

  bool get fromClaude => provider == 'claude';

  List<V6PlanItem> itemsOn(int day) => items.where((i) => i.day == day).toList();

  int get doneCount => items.where((i) => i.done).length;

  /// Null when the plan has no steps at all (never 0 % for "nothing to do").
  double? get progress => items.isEmpty ? null : doneCount / items.length;

  /// Which day of the plan today is, 1-based; null when today is outside the plan.
  int? get todayDay {
    final today = v6DayKey(DateTime.now());
    for (final i in items) {
      if (i.date == today) return i.day;
    }
    final start = startDay;
    if (start == null) return null;
    final s = DateTime.tryParse(start);
    if (s == null) return null;
    final n = DateTime.now().difference(DateTime(s.year, s.month, s.day)).inDays + 1;
    return n >= 1 && n <= days ? n : null;
  }

  static V6Plan? fromJson(dynamic raw) {
    if (raw is! Map) return null;
    final id = raw['id']?.toString() ?? raw['planId']?.toString();
    if (id == null || id.isEmpty) return null;
    final items = <V6PlanItem>[];
    final rawItems = raw['items'];
    if (rawItems is List) {
      for (final it in rawItems.whereType<Map>()) {
        final parsed = V6PlanItem.fromJson(it, planId: id);
        if (parsed != null) items.add(parsed);
      }
    }
    items.sort((a, b) => a.day == b.day ? a.id.compareTo(b.id) : a.day.compareTo(b.day));
    final goals = (raw['goals'] as List?)?.map((e) => e.toString()).toList() ?? const <String>[];
    final labels = (raw['goalLabels'] as List?)?.map((e) => e.toString()).toList();
    final why = raw['why']?.toString().trim();
    return V6Plan(
      id: id,
      title: (raw['title'] ?? 'Your plan').toString(),
      why: why == null || why.isEmpty ? null : why,
      days: (raw['days'] as num?)?.toInt() ?? 7,
      minutesPerDay: (raw['minutesPerDay'] as num?)?.toInt() ?? 15,
      goals: goals,
      goalLabels: labels ?? goals,
      items: items,
      provider: raw['provider']?.toString(),
      revision: (raw['revision'] as num?)?.toInt() ?? 1,
      archived: raw['archived'] == true,
      startDay: raw['startDay']?.toString(),
      createdAt: v6ParseDate(raw['createdAt']),
    );
  }
}

/// One point of a chart series. [value] is null for a day with no data — never 0.
@immutable
class V6PlanPoint {
  const V6PlanPoint({required this.day, required this.label, this.value});
  final String day;
  final String label;
  final double? value;
}

/// `GET /v2/plans/{id}/chart` — data only; we draw it ourselves.
@immutable
class V6PlanSeries {
  const V6PlanSeries({
    required this.metric,
    required this.range,
    required this.title,
    required this.unit,
    required this.points,
    required this.empty,
    this.note = '',
    this.max = 0,
    this.average,
  });

  final String metric;
  final String range;
  final String title;
  final String unit;
  final List<V6PlanPoint> points;

  /// True when there is not enough real history to draw an honest shape.
  final bool empty;
  final String note;
  final double max;
  final double? average;

  /// A series that cannot exist on this edition at all (v1 fallback).
  static V6PlanSeries unavailable(String metric, String range, String title, String note) =>
      V6PlanSeries(
          metric: metric, range: range, title: title, unit: '', points: const [], empty: true, note: note);

  int get realCount => points.where((p) => p.value != null).length;

  static V6PlanSeries? fromJson(dynamic raw, {String? metric, String? range}) {
    if (raw is! Map) return null;
    final pts = <V6PlanPoint>[];
    final list = raw['points'];
    if (list is List) {
      for (final p in list.whereType<Map>()) {
        pts.add(V6PlanPoint(
          day: p['day']?.toString() ?? '',
          label: p['label']?.toString() ?? '',
          value: (p['value'] as num?)?.toDouble(),
        ));
      }
    }
    return V6PlanSeries(
      metric: raw['metric']?.toString() ?? metric ?? '',
      range: raw['range']?.toString() ?? range ?? '30d',
      title: raw['title']?.toString() ?? '',
      unit: raw['unit']?.toString() ?? '',
      points: pts,
      empty: raw['empty'] == true || pts.every((p) => p.value == null),
      note: raw['note']?.toString() ?? '',
      max: (raw['max'] as num?)?.toDouble() ?? 0,
      average: (raw['average'] as num?)?.toDouble(),
    );
  }
}

/// `POST /v2/plans/{id}/document` — a ready file behind a short-lived URL.
@immutable
class V6PlanDocument {
  const V6PlanDocument({
    required this.url,
    required this.mime,
    required this.bytes,
    required this.filename,
    this.id,
    this.expiresAt,
    this.storage,
  });

  final String url;
  final String mime;
  final int bytes;
  final String filename;
  final String? id;
  final DateTime? expiresAt;

  /// 'gcs' (a signed URL anyone with the link can fetch) or 'firestore' (our API, needs the token).
  final String? storage;

  bool get needsAuth => storage != 'gcs';

  static V6PlanDocument? fromJson(Map m, {required String fallbackName}) {
    final url = m['url']?.toString();
    if (url == null || url.isEmpty) return null;
    return V6PlanDocument(
      url: url,
      mime: m['mime']?.toString() ?? 'application/octet-stream',
      bytes: (m['bytes'] as num?)?.toInt() ?? 0,
      filename: m['filename']?.toString() ?? fallbackName,
      id: m['id']?.toString(),
      expiresAt: v6ParseDate(m['expiresAt']),
      storage: m['storage']?.toString(),
    );
  }
}

/// What every call here returns: the plan (when the call carries one), today's steps, and a
/// human-readable error that is safe to show.
@immutable
class V6PlanResult {
  const V6PlanResult({
    required this.ok,
    this.plan,
    this.today = const [],
    this.changed = const [],
    this.statuses = const [],
    this.score,
    this.coins,
    this.error,
    this.status = 0,
  });

  final bool ok;
  final V6Plan? plan;
  final List<V6PlanItem> today;
  final List<String> changed;
  final List<String> statuses;
  final int? score;
  final int? coins;
  final String? error;
  final int status;

  /// True when the person has no active plan (a successful call with nothing in it).
  bool get isEmpty => ok && plan == null;

  static const offline = V6PlanResult(ok: false, error: 'offline');
}

DateTime? v6ParseDate(dynamic v) {
  if (v == null) return null;
  if (v is num) return DateTime.fromMillisecondsSinceEpoch(v.toInt());
  return DateTime.tryParse(v.toString())?.toLocal();
}

/// yyyy-mm-dd in the phone's own timezone (the server days are local days too).
String v6DayKey(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

// ───────────────────────── client ─────────────────────────

class V6PlansApi {
  V6PlansApi._();

  static const _v2 = '/v2/plans';
  static const _v1 = '/v1/selfcare/plans';

  /// Null until we have asked once. True when /v2/plans answered, false when this deployment
  /// only has the v1 catalog plans.
  static bool? _claude;

  static bool? get claudeEdition => _claude;

  /// A 404 / 405 from the gateway means the route is not deployed. Anything else (403 consent,
  /// 429 quota, 500, offline) is a real answer from a server that *does* have /v2.
  static bool _missing(V6Result r) => r.status == 404 || r.status == 405 || r.status == 501;

  static List<V6PlanItem> _today(Map<String, dynamic> m, V6Plan? plan) {
    final raw = m['today'];
    final out = <V6PlanItem>[];
    if (raw is List) {
      for (final it in raw.whereType<Map>()) {
        final parsed = V6PlanItem.fromJson(it, planId: plan?.id);
        if (parsed != null) out.add(parsed);
      }
    }
    if (out.isEmpty && plan != null) {
      final day = plan.todayDay;
      if (day != null) return plan.itemsOn(day);
    }
    return out;
  }

  static List<String> _strings(dynamic v) =>
      v is List ? v.map((e) => e.toString()).where((s) => s.isNotEmpty).toList() : const [];

  static V6PlanResult _result(V6Result r) {
    if (!r.ok) {
      return V6PlanResult(ok: false, status: r.status, error: v6PlanError(r));
    }
    final m = r.map;
    final plan = V6Plan.fromJson(m['plan']);
    return V6PlanResult(
      ok: true,
      status: r.status,
      plan: plan,
      today: _today(m, plan),
      changed: _strings(m['changed']),
      statuses: _strings(m['statuses']),
      score: (m['score'] as num?)?.toInt(),
      coins: (m['coins'] as num?)?.toInt(),
    );
  }

  /// The goal list. Shared by both editions.
  static Future<List<V6PlanGoal>> goals() async {
    final r = await V6Api.call('GET', '/v1/selfcare/goals');
    if (!r.ok) return const [];
    final items = r.map['items'];
    final out = <V6PlanGoal>[];
    if (items is List) {
      for (final g in items.whereType<Map>()) {
        final parsed = V6PlanGoal.fromJson(g);
        if (parsed != null) out.add(parsed);
      }
    }
    return out;
  }

  /// The active plan plus today's steps. Also decides, once, which edition we are on.
  static Future<V6PlanResult> active() async {
    if (_claude != false) {
      final r = await V6Api.call('GET', '$_v2/active');
      if (!_missing(r)) {
        if (r.ok) _claude = true;
        return _result(r);
      }
      _claude = false;
    }
    return _result(await V6Api.call('GET', '$_v1/active'));
  }

  static Future<V6PlanResult> plan(String id) async {
    if (_claude != false) {
      final r = await V6Api.call('GET', '$_v2/$id');
      if (!_missing(r)) return _result(r);
      _claude = false;
    }
    // v1 has no "one plan" route; the active plan is the only one it keeps.
    return _result(await V6Api.call('GET', '$_v1/active'));
  }

  /// Creates the plan. Nothing is written before this call.
  static Future<V6PlanResult> create({
    required List<String> goals,
    required int minutesPerDay,
    required int days,
    String? notes,
  }) async {
    final body = <String, dynamic>{
      'goals': goals.take(3).toList(),
      'minutesPerDay': minutesPerDay.clamp(5, 90),
      'days': days.clamp(3, 14),
      if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
    };
    if (_claude != false) {
      final r = await V6Api.call('POST', _v2, body);
      if (!_missing(r)) {
        if (r.ok) _claude = true;
        return _result(r);
      }
      _claude = false;
    }
    // v1 takes no note: it is a catalog plan, nobody reads it. The builder says so.
    body.remove('notes');
    return _result(await V6Api.call('POST', _v1, body));
  }

  /// easier | harder | shift_days. Only the Claude edition can reshape a plan.
  static Future<V6PlanResult> adjust(String id, String adjust, {String? note}) async {
    if (_claude == false) {
      return const V6PlanResult(
          ok: false, error: 'Adjusting a plan needs the new plans service, which is off here.');
    }
    final r = await V6Api.call('PATCH', '$_v2/$id', {
      'adjust': adjust,
      if (note != null && note.trim().isNotEmpty) 'note': note.trim(),
    });
    if (_missing(r)) {
      _claude = false;
      return const V6PlanResult(
          ok: false, error: 'Adjusting a plan needs the new plans service, which is off here.');
    }
    if (r.ok) _claude = true;
    return _result(r);
  }

  /// Ticks a step off. Coins and the Self-Care Score are awarded server-side.
  static Future<V6PlanResult> completeItem(String planId, String itemId) async {
    if (_claude != false) {
      final r = await V6Api.call('POST', '$_v2/$planId/items/$itemId/complete');
      if (!_missing(r)) return _result(r);
      _claude = false;
    }
    final r = await V6Api.call('POST', '$_v1/$planId/items/$itemId/complete');
    if (!r.ok) return V6PlanResult(ok: false, status: r.status, error: v6PlanError(r));
    // v1 answers {item, coinsAwarded} — no plan, so the caller refetches.
    return V6PlanResult(ok: true, status: r.status, coins: (r.map['coinsAwarded'] as num?)?.toInt());
  }

  static Future<V6PlanResult> archive(String id) async {
    if (_claude != false) {
      final r = await V6Api.call('DELETE', '$_v2/$id');
      if (!_missing(r)) return _result(r);
      _claude = false;
    }
    final r = await V6Api.call('DELETE', '$_v1/$id');
    return r.ok
        ? const V6PlanResult(ok: true)
        : V6PlanResult(ok: false, status: r.status, error: v6PlanError(r));
  }

  /// One metric over 7d / 30d / 90d.
  ///
  /// On the v1 branch there is no chart endpoint: the Self-Care Score has its own history, and
  /// everything else is reported as unavailable rather than guessed at.
  static Future<V6PlanSeries> chart({
    required String metric,
    required String range,
    String planId = 'active',
  }) async {
    if (_claude != false) {
      final r = await V6Api.call('GET', '$_v2/$planId/chart?metric=$metric&range=$range');
      if (!_missing(r)) {
        final s = r.ok ? V6PlanSeries.fromJson(r.map['series'], metric: metric, range: range) : null;
        if (s != null) return s;
        if (r.ok) {
          return V6PlanSeries.unavailable(
              metric, range, v6MetricTitle(metric), 'No data came back for this one.');
        }
        return V6PlanSeries.unavailable(metric, range, v6MetricTitle(metric), v6PlanError(r));
      }
      _claude = false;
    }
    if (metric == 'score') return _v1ScoreSeries(range);
    return V6PlanSeries.unavailable(metric, range, v6MetricTitle(metric),
        'This chart needs the new plans service, which is off on this build.');
  }

  /// `/v1/selfcare/score/history` — real stored snapshots, with the gaps left as gaps.
  static Future<V6PlanSeries> _v1ScoreSeries(String range) async {
    final n = range == '7d' ? 7 : (range == '90d' ? 90 : 30);
    final r = await V6Api.call('GET', '/v1/selfcare/score/history?days=${n < 7 ? 7 : n}');
    final title = v6MetricTitle('score');
    if (!r.ok) return V6PlanSeries.unavailable('score', range, title, v6PlanError(r));
    final byDay = <String, double>{};
    final items = r.map['items'];
    if (items is List) {
      for (final d in items.whereType<Map>()) {
        final day = d['day']?.toString();
        final v = (d['score'] as num?)?.toDouble();
        if (day != null && v != null) byDay[day] = v;
      }
    }
    final today = DateTime.now();
    final pts = <V6PlanPoint>[];
    for (var i = n - 1; i >= 0; i--) {
      final d = DateTime(today.year, today.month, today.day).subtract(Duration(days: i));
      final key = v6DayKey(d);
      pts.add(V6PlanPoint(day: key, label: v6PointLabel(d, n), value: byDay[key]));
    }
    final real = pts.where((p) => p.value != null).map((p) => p.value!).toList();
    final empty = real.length < 2;
    return V6PlanSeries(
      metric: 'score',
      range: range,
      title: title,
      unit: '/100',
      points: pts,
      empty: empty,
      note: empty ? 'Not enough days yet — your score needs a few check-ins to have a shape.' : '',
      max: empty ? 0 : real.reduce((a, b) => a > b ? a : b),
      average: empty ? null : (real.reduce((a, b) => a + b) / real.length),
    );
  }

  // ───────────────────────── documents ─────────────────────────

  /// Asks the server for a PDF / Markdown / Word file of the plan.
  static Future<V6PlanDocumentResult> document({
    required String planId,
    required String format,
    required List<String> include,
  }) async {
    if (_claude == false) {
      return const V6PlanDocumentResult(
          ok: false, error: 'Plan documents need the new plans service, which is off here.');
    }
    final r = await V6Api.call('POST', '$_v2/$planId/document', {
      'format': format,
      'include': include.isEmpty ? ['schedule'] : include,
    });
    if (_missing(r)) {
      _claude = false;
      return const V6PlanDocumentResult(
          ok: false, error: 'Plan documents need the new plans service, which is off here.');
    }
    if (!r.ok) return V6PlanDocumentResult(ok: false, error: v6PlanError(r), status: r.status);
    final doc = V6PlanDocument.fromJson(r.map, fallbackName: 'escape-plan.$format');
    if (doc == null) {
      return const V6PlanDocumentResult(ok: false, error: 'The server made no file this time.');
    }
    return V6PlanDocumentResult(ok: true, document: doc, status: r.status);
  }

  /// Downloads [doc] into the app's documents directory and returns the file.
  ///
  /// [onProgress] is called with the bytes received so far and the total the server declared
  /// (null when it declared none) — real progress, never a timer pretending to be one.
  ///
  /// A GCS signed URL needs no header; a document kept in Firestore comes back through our own
  /// API, so that one carries the same Bearer token and X-Timezone header as every other call.
  static Future<File?> downloadDocument(
    V6PlanDocument doc, {
    void Function(int received, int? total)? onProgress,
  }) async {
    http.Client? client;
    try {
      final uri = Uri.parse(doc.url.startsWith('http')
          ? doc.url
          : '${lucille_actions.kLucilleV1BaseUrl}${doc.url}');
      final headers = <String, String>{'X-Timezone': lucille_actions.lucilleTimezoneHeader()};
      if (doc.needsAuth) {
        final token = await FirebaseAuth.instance.currentUser?.getIdToken();
        if (token != null && token.isNotEmpty) headers['Authorization'] = 'Bearer $token';
      }
      client = http.Client();
      final req = http.Request('GET', uri)..headers.addAll(headers);
      final res = await client.send(req).timeout(const Duration(seconds: 60));
      if (res.statusCode != 200) {
        debugPrint('V6PlansApi document download -> ${res.statusCode}');
        return null;
      }
      final dir = await getApplicationDocumentsDirectory();
      final safe = doc.filename.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
      final file = File('${dir.path}/${safe.isEmpty ? 'escape-plan' : safe}');
      final total = res.contentLength ?? (doc.bytes > 0 ? doc.bytes : null);
      final sink = file.openWrite();
      var received = 0;
      try {
        await for (final chunk in res.stream) {
          received += chunk.length;
          sink.add(chunk);
          onProgress?.call(received, total);
        }
      } finally {
        await sink.close();
      }
      if (received == 0) {
        return null;
      }
      return file;
    } catch (e) {
      debugPrint('V6PlansApi download failed: $e');
      return null;
    } finally {
      client?.close();
    }
  }

  /// Test hook: forget which edition we decided we are on.
  @visibleForTesting
  static void resetEdition() => _claude = null;
}

@immutable
class V6PlanDocumentResult {
  const V6PlanDocumentResult({required this.ok, this.document, this.error, this.status = 0});
  final bool ok;
  final V6PlanDocument? document;
  final String? error;
  final int status;
}

// ───────────────────────── small shared helpers ─────────────────────────

/// A message from a failed call that is safe to put on screen.
String v6PlanError(V6Result r) {
  final detail = r.map['detail'];
  if (detail is Map) {
    final msg = detail['message']?.toString();
    if (msg != null && msg.isNotEmpty) return msg;
  }
  final e = r.error;
  if (r.status == 429) return "You've made as many of these as today allows. Try again tomorrow.";
  if (r.status == 0 || e == 'offline') return "Couldn't reach Escape. Nothing was lost.";
  if (e == null || e.isEmpty || e.startsWith('HTTP')) return 'That did not work. Try again?';
  return e;
}

const kV6PlanMetrics = <String>['adherence', 'minutes', 'mood', 'score'];
const kV6PlanRanges = <String>['7d', '30d', '90d'];

String v6MetricTitle(String metric) => switch (metric) {
      'adherence' => 'Plan adherence',
      'minutes' => 'Minutes of self-care',
      'mood' => 'Mood',
      'score' => 'Self-Care Score',
      'streak' => 'Streak',
      _ => metric,
    };

/// The one line under a chart title that says what it is measuring.
String v6MetricCaption(String metric) => switch (metric) {
      'adherence' => 'How much of each planned day you finished.',
      'minutes' => 'Minutes you spent on yourself each day.',
      'mood' => 'The average of how you checked in that day.',
      'score' => 'Your Self-Care Score, the way Escape works it out.',
      _ => '',
    };

String v6RangeLabel(String range) => switch (range) {
      '7d' => '7 days',
      '30d' => '30 days',
      '90d' => '90 days',
      _ => range,
    };

const _shortWeekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const _shortMonths = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

/// Same labels the server uses: weekday for a week, "04 Nov" for longer windows.
String v6PointLabel(DateTime d, int span) =>
    span <= 7 ? _shortWeekdays[d.weekday - 1] : '${d.day.toString().padLeft(2, '0')} ${_shortMonths[d.month - 1]}';

/// "Mon 4 Nov" — read out by screen readers for a chart point.
String v6SpokenDay(String isoDay) {
  final d = DateTime.tryParse(isoDay);
  if (d == null) return isoDay;
  return '${_shortWeekdays[d.weekday - 1]} ${d.day} ${_shortMonths[d.month - 1]}';
}

/// A value plus its unit, for labels and screen readers.
String v6FormatValue(double v, String unit) {
  final n = v.abs() >= 10 || v == v.roundToDouble() ? v.round().toString() : v.toStringAsFixed(1);
  return switch (unit) {
    '%' => '$n%',
    'min' => '$n min',
    '/100' => '$n out of 100',
    'days' => '$n days',
    _ => n,
  };
}

/// Icon for a plan step's kind (never the only signal — the title is always there).
IconData v6PlanKindIcon(String? kind) => switch (kind) {
      'breathe' => Icons.air_rounded,
      'meditate' => Icons.self_improvement_rounded,
      'move' => Icons.directions_walk_rounded,
      'sleep' => Icons.nightlight_round,
      'journal' => Icons.edit_note_rounded,
      'listen' => Icons.headphones_rounded,
      'focus' => Icons.center_focus_strong_rounded,
      'talk' || 'connect' => Icons.favorite_border_rounded,
      'checkin' => Icons.wb_twilight_rounded,
      _ => Icons.spa_rounded,
    };
