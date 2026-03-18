import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'PartnerToken';

/// Start Lucille Streaming Group Code

class LucilleStreamingGroup {
  static String getBaseUrl({
    String? sessionID = '',
    String? message = 'Hey Lucille!',
    List<String>? deltaList,
    String? response = '',
  }) =>
      'https://lucillellm2-286076426888.us-east4.run.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static LucilleHealthCheckCall lucilleHealthCheckCall =
      LucilleHealthCheckCall();
  static CreateNewSessionCall createNewSessionCall = CreateNewSessionCall();
  static LucilleChatResponseCall lucilleChatResponseCall =
      LucilleChatResponseCall();
  static LucilleStreamingResponseCall lucilleStreamingResponseCall =
      LucilleStreamingResponseCall();
}

class LucilleHealthCheckCall {
  Future<ApiCallResponse> call({
    String? sessionID = '',
    String? message = 'Hey Lucille!',
    List<String>? deltaList,
    String? response = '',
  }) async {
    final baseUrl = LucilleStreamingGroup.getBaseUrl(
      sessionID: sessionID,
      message: message,
      deltaList: deltaList,
      response: response,
    );
    final delta = _serializeList(deltaList);

    return ApiManager.instance.makeApiCall(
      callName: 'Lucille Health Check',
      apiUrl: '${baseUrl}/health',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewSessionCall {
  Future<ApiCallResponse> call({
    String? sessionID = '',
    String? message = 'Hey Lucille!',
    List<String>? deltaList,
    String? response = '',
  }) async {
    final baseUrl = LucilleStreamingGroup.getBaseUrl(
      sessionID: sessionID,
      message: message,
      deltaList: deltaList,
      response: response,
    );
    final delta = _serializeList(deltaList);

    return ApiManager.instance.makeApiCall(
      callName: 'Create New Session',
      apiUrl: '${baseUrl}//',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
}

class LucilleChatResponseCall {
  Future<ApiCallResponse> call({
    String? sessionID = '',
    String? message = 'Hey Lucille!',
    List<String>? deltaList,
    String? response = '',
  }) async {
    final baseUrl = LucilleStreamingGroup.getBaseUrl(
      sessionID: sessionID,
      message: message,
      deltaList: deltaList,
      response: response,
    );
    final delta = _serializeList(deltaList);

    final ffApiRequestBody = '''
{
  "message": "Give me a quick tip for relaxation",
  "session_id": "your-session-id-here"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Lucille Chat Response',
      apiUrl: '${baseUrl}/chat',
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

  String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
  List<String>? convo(dynamic response) => (getJsonField(
        response,
        r'''$.conversation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? timeStamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  int? messageCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message_count''',
      ));
}

class LucilleStreamingResponseCall {
  Future<ApiCallResponse> call({
    String? sessionID = '',
    String? message = 'Hey Lucille!',
    List<String>? deltaList,
    String? response = '',
  }) async {
    final baseUrl = LucilleStreamingGroup.getBaseUrl(
      sessionID: sessionID,
      message: message,
      deltaList: deltaList,
      response: response,
    );
    final delta = _serializeList(deltaList);

    final ffApiRequestBody = '''
{
  "message": "${escapeStringForJson(message)}",
  "session_id": "${escapeStringForJson(sessionID)}",
  "stream": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Lucille Streaming Response',
      apiUrl: '${baseUrl}/chat/stream',
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
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  String? lucilleEntireResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
  int? messageCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message_count''',
      ));
  String? delta(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.content''',
      ));
  bool? doneStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.done''',
      ));
}

/// End Lucille Streaming Group Code

class LucilleChatStreamCall {
  static Future<ApiCallResponse> call({
    String? message = 'Hey Lucille! How are you?',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": "What is mindfulness?",
  "session_id": "stream-test-001"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Lucille Chat Stream',
      apiUrl: 'https://lucillellm2-286076426888.us-east4.run.app/chat/stream',
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
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  static String? lucilleResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
  static int? messageCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message_count''',
      ));
  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.content''',
      ));
  static bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.done''',
      ));
}

class LucilleStreamingBuildShipCall {
  static Future<ApiCallResponse> call({
    String? sessionID = '',
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": "${escapeStringForJson(message)}",
  "session_id": "${escapeStringForJson(sessionID)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Lucille Streaming BuildShip',
      apiUrl: 'https://mj1jep.buildship.run/chat/stream/',
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

  static int? statusCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? delta(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

class EscapeAudioScriptCall {
  static Future<ApiCallResponse> call({
    String? model = 'whisper-large-v3',
    FFUploadedFile? file,
    String? responseFormat = 'verbose_json',
    String? gorqKey =
        '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Escape AudioScript',
      apiUrl: 'https://api.groq.com/openai/v1/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${gorqKey}',
      },
      params: {
        'file': file,
        'model': "whisper-large-v3",
        'response_format': "verbose_json",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.error.message''',
      ));
  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error.type''',
      ));
  static String? errorCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error.code''',
      ));
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
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
