import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Lucille Soundscapes Group Code

class LucilleSoundscapesGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static StartSoundCall startSoundCall = StartSoundCall();
  static StopSoundCall stopSoundCall = StopSoundCall();
  static StreamedAudioCall streamedAudioCall = StreamedAudioCall();
}

class StartSoundCall {
  Future<ApiCallResponse> call({
    String? soundscapeId = '',
  }) async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "soundscape_id": ${soundscapeId == null ? 'null' : '"${escapeStringForJson(soundscapeId)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Start Sound',
      apiUrl: '${baseUrl}/soundscapes/{user_id}/start',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StopSoundCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
  }) async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Stop Sound',
      apiUrl: '${baseUrl}/soundscapes/{user_id}/stop/{session_id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StreamedAudioCall {
  Future<ApiCallResponse> call({
    String? soundscapeId = '',
  }) async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Streamed Audio',
      apiUrl: '${baseUrl}/soundscapes/{soundscape_id}/audio',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'soundscape_id': soundscapeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Lucille Soundscapes Group Code

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
