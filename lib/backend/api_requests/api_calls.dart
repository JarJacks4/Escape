import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'lucillellmfunction';

/// Start Lucille Self Care AI LLM Group Code

class LucilleSelfCareAILLMGroup {
  static String getBaseUrl({
    String? sessionId = '',
    String? message = '',
    String? getChatHistory = '',
  }) =>
      'https://lucillellm-function-w2jy2mx6tq-uc.a.run.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer',
  };
  static GetSessionCall getSessionCall = GetSessionCall();
  static SendMessageCall sendMessageCall = SendMessageCall();
  static GetChatHistoryCall getChatHistoryCall = GetChatHistoryCall();
}

class GetSessionCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
    String? message = '',
    String? getChatHistory = '',
  }) async {
    final baseUrl = LucilleSelfCareAILLMGroup.getBaseUrl(
      sessionId: sessionId,
      message: message,
      getChatHistory: getChatHistory,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSession',
      apiUrl: '${baseUrl}//',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

class SendMessageCall {
  Future<ApiCallResponse> call({
    String? userMessage = '',
    String? sessionID = '',
    String? sessionId = '',
    String? message = '',
    String? getChatHistory = '',
  }) async {
    final baseUrl = LucilleSelfCareAILLMGroup.getBaseUrl(
      sessionId: sessionId,
      message: message,
      getChatHistory: getChatHistory,
    );

    final ffApiRequestBody = '''
{
  "message": "<userMessage>",
  "session_id": "${escapeStringForJson(sessionID)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendMessage',
      apiUrl: '${baseUrl}/chat',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

class GetChatHistoryCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
    String? message = '',
    String? getChatHistory = '',
  }) async {
    final baseUrl = LucilleSelfCareAILLMGroup.getBaseUrl(
      sessionId: sessionId,
      message: message,
      getChatHistory: getChatHistory,
    );

    final ffApiRequestBody = '''
{
  "session_id": "string",
  "response": "Chat history retrieved successfully",
  "conversation": ["..."]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetChatHistory',
      apiUrl: '${baseUrl}/chat/{session_id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer',
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

/// End Lucille Self Care AI LLM Group Code

/// Start Epidemic Sound API Group Code

class EpidemicSoundAPIGroup {
  static String getBaseUrl({
    String? baseURL = 'https://api.epidemicsound.com/v1/',
    String? authToken = '',
    int? limit = 100,
    int? offset = 0,
  }) =>
      'https://api.epidemicsound.com/v1/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer (YourToken)',
  };
  static EpidemicSoundTracksAPICall epidemicSoundTracksAPICall =
      EpidemicSoundTracksAPICall();
  static EpidemicSoundAlbumsCall epidemicSoundAlbumsCall =
      EpidemicSoundAlbumsCall();
  static EpidemicSoundPlaylistsCall epidemicSoundPlaylistsCall =
      EpidemicSoundPlaylistsCall();
}

class EpidemicSoundTracksAPICall {
  Future<ApiCallResponse> call({
    dynamic tracksJson,
    String? id = '',
    String? title = '',
    int? durationMs,
    String? artistsName = '',
    String? previewsMp3Url = '',
    String? baseURL = 'https://api.epidemicsound.com/v1/',
    String? authToken = '',
    int? limit = 100,
    int? offset = 0,
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      baseURL: baseURL,
      authToken: authToken,
      limit: limit,
      offset: offset,
    );

    final tracks = _serializeJson(tracksJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound Tracks API',
      apiUrl: '${baseUrl}/tracks?q={query}&limit={limit}&offset={offset}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer (YourToken)',
      },
      params: {
        'q': "calm",
        'limit': 50,
        'offset': 0,
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

class EpidemicSoundAlbumsCall {
  Future<ApiCallResponse> call({
    dynamic albumsJson,
    String? id = '',
    String? title = '',
    String? coverArtUrl = '',
    String? releaseDate = '',
    String? baseURL = 'https://api.epidemicsound.com/v1/',
    String? authToken = '',
    int? limit = 100,
    int? offset = 0,
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      baseURL: baseURL,
      authToken: authToken,
      limit: limit,
      offset: offset,
    );

    final albums = _serializeJson(albumsJson);

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound Albums',
      apiUrl: '${baseUrl}/albums',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer (YourToken)',
      },
      params: {
        'q': "calm",
        'limit': 50,
        'offset': 0,
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

class EpidemicSoundPlaylistsCall {
  Future<ApiCallResponse> call({
    dynamic playlistsJson,
    String? id = '',
    String? title = '',
    List<String>? coverArtUrlList,
    String? description = '',
    String? baseURL = 'https://api.epidemicsound.com/v1/',
    String? authToken = '',
    int? limit = 100,
    int? offset = 0,
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      baseURL: baseURL,
      authToken: authToken,
      limit: limit,
      offset: offset,
    );
    final coverArtUrl = _serializeList(coverArtUrlList);
    final playlists = _serializeJson(playlistsJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound Playlists',
      apiUrl: '${baseUrl}/playlists',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer (YourToken)',
      },
      params: {
        'q': "ambient",
        'limit': 50,
        'offset': 0,
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

/// End Epidemic Sound API Group Code

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
