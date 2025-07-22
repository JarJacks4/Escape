import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FastAPI Group Code

class FastAPIGroup {
  static String getBaseUrl() =>
      'https://app.swaggerhub.com/apis/GAHOISIDDHANT/fast-api/1.0.0';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static ChatChatPostCall chatChatPostCall = ChatChatPostCall();
  static RootGetCall rootGetCall = RootGetCall();
  static GetChatHistoryChatSessionIdGetCall getChatHistoryChatSessionIdGetCall =
      GetChatHistoryChatSessionIdGetCall();
}

class ChatChatPostCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FastAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "",
  "session_id": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'chat_chat_post',
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
}

class RootGetCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FastAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'root__get',
      apiUrl: '${baseUrl}/root',
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

class GetChatHistoryChatSessionIdGetCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
  }) async {
    final baseUrl = FastAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get_chat_history_chat__session_id__get',
      apiUrl: '${baseUrl}/chat/${sessionId}',
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

/// End FastAPI Group Code

class GetSessionIdCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSessionId',
      apiUrl: 'https://lucillellm-334104837337.us-central1.run.app/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? sessionid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
}

class ChatWithLucilleCall {
  static Future<ApiCallResponse> call({
    String? message = '',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": "${escapeStringForJson(message)}",
  "session_id":"${escapeStringForJson(sessionId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatWithLucille ',
      apiUrl: 'https://lucillellm-334104837337.us-central1.run.app/chat',
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

  static String? lucilleResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response''',
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
