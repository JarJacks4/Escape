import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'PartnerToken';

/// Start Lucille Self Care AI LLM Group Code

class LucilleSelfCareAILLMGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateSessionCall createSessionCall = CreateSessionCall();
  static ChatCall chatCall = ChatCall();
  static GetChatHistoryCall getChatHistoryCall = GetChatHistoryCall();
  static HealthCheckCall healthCheckCall = HealthCheckCall();
}

class CreateSessionCall {
  Future<ApiCallResponse> call({
    dynamic sessionIdJson,
  }) async {
    final baseUrl = LucilleSelfCareAILLMGroup.getBaseUrl();

    final sessionId = _serializeJson(sessionIdJson);

    return ApiManager.instance.makeApiCall(
      callName: 'CreateSession',
      apiUrl: '${baseUrl}//',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'SessionId': {"session_id": "newly-generated-uuid"},
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic sessionId(dynamic response) => getJsonField(
        response,
        r'''$.session_id''',
      );
}

class ChatCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? sessionId = '',
  }) async {
    final baseUrl = LucilleSelfCareAILLMGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "Hello! Can you give me a mindfulness tip?",
  "session_id": "unique-session-identifier"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Chat',
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
      cache: true,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  dynamic aIResponse(dynamic response) => getJsonField(
        response,
        r'''$.response.content''',
      );
  dynamic category(dynamic response) => getJsonField(
        response,
        r'''$.response.category''',
      );
  dynamic hasDisclaimer(dynamic response) => getJsonField(
        response,
        r'''$.response.has_disclaimer''',
      );
  dynamic disclaimerText(dynamic response) => getJsonField(
        response,
        r'''$.response.disclaimer''',
      );
  dynamic confidence(dynamic response) => getJsonField(
        response,
        r'''$.response.confidence''',
      );
  String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  List<String>? conversationHistory(dynamic response) => (getJsonField(
        response,
        r'''$.conversation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetChatHistoryCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
  }) async {
    final baseUrl = LucilleSelfCareAILLMGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetChatHistory',
      apiUrl: '${baseUrl}/chat/{session_id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'session_id': sessionId,
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

class HealthCheckCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleSelfCareAILLMGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Health Check',
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

/// End Lucille Self Care AI LLM Group Code

/// Start Epidemic Sound API Group Code

class EpidemicSoundAPIGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://partner-content-api.epidemicsound.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer {{EpidemicSound.accessToken}}',
  };
  static EpidemicSearchTracksAPICall epidemicSearchTracksAPICall =
      EpidemicSearchTracksAPICall();
  static EpidemicSoundAlbumsCall epidemicSoundAlbumsCall =
      EpidemicSoundAlbumsCall();
  static EpidemicSoundPlaylistsCall epidemicSoundPlaylistsCall =
      EpidemicSoundPlaylistsCall();
  static EpidemicSoundGenresCall epidemicSoundGenresCall =
      EpidemicSoundGenresCall();
  static EpidemicMoodsCall epidemicMoodsCall = EpidemicMoodsCall();
}

class EpidemicSearchTracksAPICall {
  Future<ApiCallResponse> call({
    dynamic tracksJson,
    String? id = '',
    String? title = '',
    int? durationMs,
    String? artistsName = '',
    String? previewUrl = '',
    String? accessToken = '',
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final tracks = _serializeJson(tracksJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Search Tracks API',
      apiUrl: '${baseUrl}/v0/tracks/search',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer {{EpidemicSound.accessToken}}',
      },
      params: {
        'query': "{{query}}",
        'limit': 50,
        'mood': "{CurrentMood}",
        'offset': 3,
        'genre': "Nature",
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
    String? accessToken = '',
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final albums = _serializeJson(albumsJson);

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound Albums',
      apiUrl: '${baseUrl}/v0/albums',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer {{EpidemicSound.accessToken}}',
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
    String? accessToken = '',
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );
    final coverArtUrl = _serializeList(coverArtUrlList);
    final playlists = _serializeJson(playlistsJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound Playlists',
      apiUrl: '${baseUrl}/v0/collections',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer {{EpidemicSound.accessToken}}',
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

class EpidemicSoundGenresCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound Genres',
      apiUrl: '${baseUrl}/v0/genres',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer {{EpidemicSound.accessToken}}',
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

class EpidemicMoodsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Moods',
      apiUrl: '${baseUrl}/v0/moods',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer {{EpidemicSound.accessToken}}',
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

/// End Epidemic Sound API Group Code

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static String getBaseUrl() => 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    dynamic promptJson,
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    final prompt = _serializeJson(promptJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-4",
  "messages": ${prompt}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: '${baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
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

  int? createdTimestamp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.role''',
      ));
  String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

/// End OpenAI ChatGPT Group Code

class PartnerTokenEpidemicSoundCall {
  static Future<ApiCallResponse> call({
    String? tokenType = 'client-credentials',
    String? accessToken = '',
    int? expiresIn,
    String? grantType = 'client_credentials',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Partner Token Epidemic Sound',
      apiUrl:
          'https://epidemic-server-286076426888.us-central1.run.app/api/auth/user-token',
      callType: ApiCallType.POST,
      headers: {
        'Grant_Type': 'client_credentials',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'grant_type': "client_credentials",
        'clientId': "2a291f75dcfb452e88f89dc86a140ca5",
        'clientSecret': "E9006b29e6c44232aca5846836df0d54",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EpidemicMCPServerAuthCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic MCP Server Auth',
      apiUrl: 'https://www.epidemicsound.com/a/mcp-service/mcp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'grant_type': "client_credentials",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LucilleChatCall {
  static Future<ApiCallResponse> call({
    String? message = 'Hey Lucille! How are you?',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": "${escapeStringForJson(message)}",
  "session_id": "${escapeStringForJson(sessionId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Lucille Chat',
      apiUrl: 'https://lucillellm2-286076426888.us-east4.run.app/chat',
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

  static String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  static String? aIResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
  static List<String>? conversation(dynamic response) => (getJsonField(
        response,
        r'''$.conversation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  static int? messageCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message_count''',
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
