// Escape v6 — thin client over the Lucille v1 API (custom action `lucilleV1`).
//
// Every call returns a [V6Result]. When the server answers with a consent purpose (GDPR Art. 9:
// mood / journal / voice data need an explicit yes), [V6Api.consentPrompt] is asked once and the
// call is retried after the user agrees. The prompt is installed by the v6 shell (it needs a
// BuildContext to show the glass consent sheet).
import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '/custom_code/actions/lucille_v1.dart' as lucille_actions;

typedef V6ConsentPrompt = Future<bool> Function(String purpose);

@immutable
class V6Result {
  const V6Result({required this.ok, this.status = 0, this.data, this.error});
  final bool ok;
  final int status;
  final dynamic data;
  final String? error;

  Map<String, dynamic> get map =>
      data is Map ? Map<String, dynamic>.from(data as Map) : const {};

  static const offline = V6Result(ok: false, error: 'offline');
}

class V6Api {
  V6Api._();

  /// Shown when a call needs consent. Returns true when the user said yes.
  static V6ConsentPrompt? consentPrompt;

  /// Overridable in tests.
  @visibleForTesting
  static Future<dynamic> Function(String method, String path, dynamic body)
      transport = lucille_actions.lucilleV1;

  static Future<V6Result> call(String method, String path, [dynamic body]) async {
    try {
      var res = _toResult(await transport(method, path, body));
      final purpose = res.map['consentPurpose'];
      if (purpose != null && consentPrompt != null) {
        final yes = await consentPrompt!(purpose.toString());
        if (yes) {
          await transport('PUT', '/v1/privacy/consents', {
            'flags': {purpose.toString(): true}
          });
          res = _toResult(await transport(method, path, body));
        }
      }
      return res;
    } catch (e) {
      debugPrint('V6Api $method $path failed: $e');
      return V6Result(ok: false, error: e.toString());
    }
  }

  static V6Result _toResult(dynamic raw) {
    if (raw is! Map) return V6Result.offline;
    final m = Map<String, dynamic>.from(raw);
    final ok = m['ok'] == true;
    return V6Result(
      ok: ok,
      status: (m['status'] as num?)?.toInt() ?? 0,
      data: m['data'],
      error: ok ? null : (m['error']?.toString() ?? 'error'),
    )._withConsent(m['consentPurpose']);
  }

  // ───────────────────────── endpoints ─────────────────────────

  static Future<V6Result> home() => call('GET', '/v1/home');
  static Future<V6Result> progress() => call('GET', '/v1/me/progress');

  /// Daily check-in. valence/energy are 0…1 (Mood Field).
  static Future<V6Result> checkIn({
    required String word,
    required double valence,
    required double energy,
    List<String> tags = const [],
    String? note,
    double? bpm,
    String source = 'checkin',
  }) =>
      call('POST', '/v1/mood/checkins', {
        'source': source,
        'word': word,
        'valence': valence.clamp(0, 1),
        'energy': energy.clamp(0, 1),
        'tags': tags.take(12).toList(),
        if (note != null && note.trim().isNotEmpty) 'note': note.trim(),
        if (bpm != null) 'pulse': {'bpm': bpm},
      });

  /// Mind / Reset / Body session finished. Coins and streak are awarded server-side.
  static Future<V6Result> completeSession({
    required String area,
    required String sessionId,
    required String title,
    required int minutes,
    String? moodBefore,
    String? moodAfter,
    int? shift,
  }) =>
      call('POST', '/v1/sessions/complete', {
        'area': area,
        'sessionId': sessionId,
        'title': title,
        'minutes': minutes,
        if (moodBefore != null) 'moodBefore': moodBefore,
        if (moodAfter != null) 'moodAfter': moodAfter,
        if (shift != null) 'shift': shift,
      });

  static Future<V6Result> activePlan() => call('GET', '/v1/selfcare/plans/active');
  static Future<V6Result> completePlanItem(String planId, String itemId) =>
      call('POST', '/v1/selfcare/plans/$planId/items/$itemId/complete');

  static Future<V6Result> suggestions(String context, {String? word}) => call(
      'GET',
      '/v1/suggestions?context=$context${word == null ? '' : '&word=${Uri.encodeQueryComponent(word)}'}');

  static Future<V6Result> me() => call('GET', '/v1/me');
  static Future<V6Result> updateMe(Map<String, dynamic> patch) => call('PATCH', '/v1/me', patch);
  static Future<V6Result> exportData() => call('GET', '/v1/privacy/export');
  static Future<V6Result> deleteData(String scope) =>
      call('DELETE', '/v1/privacy/data?scope=$scope');
  static Future<V6Result> consents() => call('GET', '/v1/privacy/consents');
  static Future<V6Result> setConsent(String purpose, bool on) => call('PUT', '/v1/privacy/consents', {
        'flags': {purpose: on}
      });

  // ───────────────────────── Lucille chat (legacy /chat pipeline) ─────────────────────────

  static String? _chatSession;

  /// Text chat with Lucille. Uses the full /chat pipeline (memory, safety, cultural context).
  static Future<V6Result> chat(String message) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final token = await user?.getIdToken();
      final res = await http
          .post(
            Uri.parse('${lucille_actions.kLucilleV1BaseUrl}/chat'),
            headers: {
              'Content-Type': 'application/json',
              'X-Timezone': lucille_actions.lucilleTimezoneHeader(),
              if (token != null) 'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              'message': message,
              // Required by /chat (422 without it). Empty on the first turn: the server starts a
              // session and returns its id, which later turns reuse.
              'session_id': _chatSession ?? '',
              if (user != null) 'user_id': user.uid,
            }),
          )
          .timeout(const Duration(seconds: 60));
      final body = res.body.isEmpty ? null : jsonDecode(res.body);
      if (res.statusCode == 200 && body is Map) {
        _chatSession = body['session_id']?.toString() ?? _chatSession;
        return V6Result(ok: true, status: 200, data: body);
      }
      debugPrint('V6Api.chat: HTTP ${res.statusCode} ${res.body.length > 300 ? res.body.substring(0, 300) : res.body}');
      return V6Result(ok: false, status: res.statusCode, data: body, error: 'chat_${res.statusCode}');
    } catch (e) {
      debugPrint('V6Api.chat: $e');
      return V6Result(ok: false, error: e.toString());
    }
  }

  /// Voice turn: recorded audio -> transcript -> Lucille reply -> Lucille's voice (mp3, base64).
  static Future<V6Result> converse({
    required List<int> audio,
    required String filename,
    String mime = 'audio/m4a',
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final token = await user?.getIdToken();
      final req = http.MultipartRequest(
          'POST', Uri.parse('${lucille_actions.kLucilleV1BaseUrl}/v1/voice/converse'))
        ..headers.addAll({
          'X-Timezone': lucille_actions.lucilleTimezoneHeader(),
          if (token != null) 'Authorization': 'Bearer $token',
        })
        ..fields['session_id'] = _chatSession ?? ''
        ..files.add(http.MultipartFile.fromBytes('file', audio, filename: filename));
      final streamed = await req.send().timeout(const Duration(seconds: 90));
      final res = await http.Response.fromStream(streamed);
      final body = res.body.isEmpty ? null : jsonDecode(res.body);
      if (res.statusCode == 200 && body is Map) {
        _chatSession = body['sessionId']?.toString() ?? _chatSession;
        return V6Result(ok: true, status: 200, data: body);
      }
      // 403 consent_required: the API sends {detail: {code, purpose}}.
      if (body is Map && body['detail'] is Map) {
        final d = Map<String, dynamic>.from(body['detail'] as Map);
        final purpose = d['consentPurpose'] ?? d['purpose'];
        if (purpose != null) {
          return V6Result(
              ok: false,
              status: res.statusCode,
              data: {...d, 'consentPurpose': purpose},
              error: 'consent');
        }
      }
      return V6Result(ok: false, status: res.statusCode, data: body, error: 'voice_${res.statusCode}');
    } catch (e) {
      return V6Result(ok: false, error: e.toString());
    }
  }

  /// Lucille's voice for any line (greetings, session narration). Returns base64 mp3 in `audio`.
  static Future<V6Result> speak(String text) => call('POST', '/v1/voice/speak', {'text': text});

  static void resetChat() => _chatSession = null;
}

extension on V6Result {
  V6Result _withConsent(dynamic purpose) {
    if (purpose == null) return this;
    final m = {...map, 'consentPurpose': purpose};
    return V6Result(ok: ok, status: status, data: m, error: error);
  }
}
