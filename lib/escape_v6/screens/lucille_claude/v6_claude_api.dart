// Escape v6 — Lucille (Claude edition): the few HTTP calls the Duet thread needs.
//
// Kept out of services/v6_api.dart on purpose: the Claude edition ships behind a flag and must be
// deletable in one folder. Auth headers are built exactly the way V6Api.chat builds them (Firebase
// ID token + X-Timezone), so both editions authenticate identically.
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '/custom_code/actions/lucille_v1.dart' as lucille_actions;
import '/escape_v6/v6.dart';

class V6ClaudeApi {
  V6ClaudeApi._();

  static const turnPath = '/v2/lucille/turn';
  static const audioTurnPath = '/v2/lucille/turn/audio';
  static const approvePath = '/v2/lucille/approve';
  static const briefPath = '/v2/lucille/brief';

  static Uri uri(String path) => Uri.parse('${lucille_actions.kLucilleV1BaseUrl}$path');

  /// The same headers V6Api.chat sends. [stream] adds the SSE Accept header.
  static Future<Map<String, String>> headers({bool stream = false, bool json = true}) async {
    String? token;
    try {
      token = await FirebaseAuth.instance.currentUser?.getIdToken();
    } catch (e) {
      debugPrint('V6ClaudeApi: no ID token ($e)');
    }
    return <String, String>{
      if (json) 'Content-Type': 'application/json',
      'Accept': stream ? 'text/event-stream' : 'application/json',
      if (stream) 'Cache-Control': 'no-cache',
      'X-Timezone': lucille_actions.lucilleTimezoneHeader(),
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  /// POST /v2/lucille/approve — the only way anything is written outside the conversation.
  /// Goes through V6Api.call so a consent prompt still works.
  static Future<V6Result> approve(String id, bool allow) =>
      V6Api.call('POST', approvePath, {'id': id, 'allow': allow});

  /// GET /v2/lucille/brief — the morning brief. Not part of the frozen turn contract: when the
  /// route is missing the result is simply not ok and the card shows its empty state.
  static Future<V6Result> brief() => V6Api.call('GET', briefPath);

  /// POST /v2/plans/{id}/document — a shareable file for a plan card.
  static Future<V6Result> planDocument(String planId, {String format = 'pdf'}) =>
      V6Api.call('POST', '/v2/plans/$planId/document', {
        'format': format,
        'include': const ['schedule', 'progress', 'notes'],
      });

  /// The JSON body of a turn, per the contract.
  static Map<String, dynamic> turnBody({
    String? message,
    String? sessionId,
    required String mode,
    required bool speak,
    Map<String, dynamic>? clientContext,
  }) =>
      <String, dynamic>{
        if (message != null && message.isNotEmpty) 'message': message,
        'sessionId': sessionId,
        'mode': mode,
        'speak': speak,
        if (clientContext != null && clientContext.isNotEmpty) 'clientContext': clientContext,
      };

  /// A streaming POST of [body] to [path]. The caller owns [client] and closes it.
  static Future<http.StreamedResponse> openStream(
    http.Client client,
    String path,
    Map<String, dynamic> body, {
    Duration timeout = const Duration(seconds: 45),
  }) async {
    final req = http.Request('POST', uri(path))
      ..headers.addAll(await headers(stream: true))
      ..body = jsonEncode(body);
    return client.send(req).timeout(timeout);
  }

  /// The audio fallback of the same turn (multipart `file` + the JSON fields as form values).
  static Future<http.StreamedResponse> openAudioStream(
    http.Client client, {
    required List<int> audio,
    required String filename,
    String? sessionId,
    bool speak = true,
    Map<String, dynamic>? clientContext,
    Duration timeout = const Duration(seconds: 60),
  }) async {
    final req = http.MultipartRequest('POST', uri(audioTurnPath))
      ..headers.addAll(await headers(stream: true, json: false))
      ..fields['mode'] = 'voice'
      ..fields['speak'] = speak.toString()
      ..files.add(http.MultipartFile.fromBytes('file', audio, filename: filename));
    if (sessionId != null && sessionId.isNotEmpty) req.fields['sessionId'] = sessionId;
    if (clientContext != null && clientContext.isNotEmpty) {
      req.fields['clientContext'] = jsonEncode(clientContext);
    }
    return client.send(req).timeout(timeout);
  }
}
