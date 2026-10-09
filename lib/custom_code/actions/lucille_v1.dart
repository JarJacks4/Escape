// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

/// Lucille v1 API base. Change here only (or pass a full URL as `path`).
const String kLucilleV1BaseUrl = 'https://lucille-861854898360.us-central1.run.app';

/// '+05:30' style UTC offset. The API also accepts IANA names
/// ('America/New_York') if you later add the flutter_timezone package.
String lucilleTimezoneHeader() {
  final o = DateTime.now().timeZoneOffset;
  final m = o.inMinutes.abs();
  final sign = o.isNegative ? '-' : '+';
  return '$sign${(m ~/ 60).toString().padLeft(2, '0')}:${(m % 60).toString().padLeft(2, '0')}';
}

/// One action for every /v1 endpoint.
///
/// FlutterFlow: Custom Code > Actions > + Add > Action, name `lucilleV1`
///   Arguments: method (String), path (String), body (JSON, nullable)
///   Return value: JSON (nullable: off)
///
/// Returns {ok: bool, status: int, data: <decoded JSON>, error: String?, consentPurpose: String?}
///   * attaches the signed-in user's Firebase ID token (refreshes once on 401)
///   * sends X-Timezone so "today", streaks and night mode match the user's clock
///   * on 403 consent_required, `consentPurpose` tells you which consent sheet to show
///
/// Examples
///   lucilleV1('GET',  '/v1/journal/home?period=week', null)
///   lucilleV1('POST', '/v1/mood/checkins', {'source': 'scan', 'word': 'Restless', 'pulse': {'bpm': 84}})
///   lucilleV1('POST', '/v1/journal/entries/$id/reflect', null)
Future<dynamic> lucilleV1(String method, String path, dynamic body) async {
  Future<http.Response> send(bool forceRefresh) async {
    final user = FirebaseAuth.instance.currentUser;
    final token = user == null ? null : await user.getIdToken(forceRefresh);
    final uri = Uri.parse(path.startsWith('http') ? path : '$kLucilleV1BaseUrl$path');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Timezone': lucilleTimezoneHeader(),
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
    final payload = body == null ? null : jsonEncode(body);
    const timeout = Duration(seconds: 30);
    switch (method.toUpperCase()) {
      case 'POST':
        return http.post(uri, headers: headers, body: payload).timeout(timeout);
      case 'PUT':
        return http.put(uri, headers: headers, body: payload).timeout(timeout);
      case 'PATCH':
        return http.patch(uri, headers: headers, body: payload).timeout(timeout);
      case 'DELETE':
        return http.delete(uri, headers: headers, body: payload).timeout(timeout);
      default:
        return http.get(uri, headers: headers).timeout(timeout);
    }
  }

  try {
    var res = await send(false);
    if (res.statusCode == 401) {
      res = await send(true); // token expired -> refresh once
    }
    dynamic data;
    if (res.body.isNotEmpty) {
      try {
        data = jsonDecode(utf8.decode(res.bodyBytes));
      } catch (_) {
        data = res.body;
      }
    }
    final ok = res.statusCode >= 200 && res.statusCode < 300;
    String? purpose;
    String? error;
    if (!ok) {
      final detail = data is Map ? data['detail'] : null;
      if (detail is Map && detail['code'] == 'consent_required') {
        purpose = detail['purpose']?.toString();
      }
      error = detail is String ? detail : (detail is Map ? (detail['code'] ?? detail.toString()).toString() : 'HTTP ${res.statusCode}');
    }
    return <String, dynamic>{
      'ok': ok,
      'status': res.statusCode,
      'data': data,
      'error': error,
      'consentPurpose': purpose,
    };
  } catch (e) {
    return <String, dynamic>{'ok': false, 'status': 0, 'data': null, 'error': e.toString(), 'consentPurpose': null};
  }
}
