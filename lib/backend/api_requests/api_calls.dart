import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cloud_call_http.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'lucillellmfunction';

/// Start Lucille Self Care AI LLM Group Code

class LucilleSelfCareAILLMGroup {
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
    return await makeCloudCallHttp(
      Firebase.app().options.projectId,
      _kPrivateApiFunctionName,
      {
        'callName': 'GetSessionCall',
        'variables': {
          'sessionId': sessionId,
          'message': message,
          'getChatHistory': getChatHistory,
        },
      },
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
    return await makeCloudCallHttp(
      Firebase.app().options.projectId,
      _kPrivateApiFunctionName,
      {
        'callName': 'SendMessageCall',
        'variables': {
          'userMessage': userMessage,
          'sessionID': sessionID,
          'sessionId': sessionId,
          'message': message,
          'getChatHistory': getChatHistory,
        },
      },
    );
  }
}

class GetChatHistoryCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
    String? message = '',
    String? getChatHistory = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetChatHistoryCall',
        'variables': {
          'sessionId': sessionId,
          'message': message,
          'getChatHistory': getChatHistory,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
