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
    String? accessToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
  }) =>
      'https://partner-content-api.epidemicsound.com';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer {eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA}',
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
    String? accessToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final tracks = _serializeJson(tracksJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Search Tracks API',
      apiUrl: '${baseUrl}v0/tracks',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer {eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA}',
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
    String? accessToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
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
        'Authorization':
            'Bearer {eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA}',
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
    String? accessToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
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
        'Authorization':
            'Bearer {eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA}',
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
    String? accessToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound Genres',
      apiUrl: '${baseUrl}/v0/genres',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer {eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA}',
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
    String? accessToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
  }) async {
    final baseUrl = EpidemicSoundAPIGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Moods',
      apiUrl: '${baseUrl}/v0/moods',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer {eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA}',
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
    String? userId = 'Escape-User-1',
    String? token = '',
    String? apiUrl = 'https://partner-content-api.epidemicsound.com',
    int? expiresIn = 518400,
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "some-unique-user-id"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Partner Token Epidemic Sound',
      apiUrl:
          'https://epidemic-server-286076426888.us-central1.run.app/api/auth/user-token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? epidemicToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
  static String? apiURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.apiUrl''',
      ));
  static int? expiringTokenTime(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.expiresIn''',
      ));
  static dynamic usageOfToken(dynamic response) => getJsonField(
        response,
        r'''$.usage''',
      );
  static String? usageAuth(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.usage.authorization''',
      ));
  static String? usageExample(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.usage.example''',
      ));
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

class EpidemicSoundAPICheckCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound API Check',
      apiUrl:
          'https://epidemic-server-286076426888.us-central1.run.app/api/info',
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

class EpidemicSoundCollectionsCall {
  static Future<ApiCallResponse> call({
    String? token =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Sound Collections',
      apiUrl: 'https://partner-content-api.epidemicsound.com/v0/collections',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token':
            "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? collections(dynamic response) => getJsonField(
        response,
        r'''$.collections''',
        true,
      ) as List?;
  static List<String>? collectionID(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionName(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? collectionTracks(dynamic response) => getJsonField(
        response,
        r'''$.collections[:].tracks''',
        true,
      ) as List?;
  static List<String>? collectionTrackID(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].tracks[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? collectionTrackMainArtist(dynamic response) => getJsonField(
        response,
        r'''$.collections[:].tracks[:].mainArtists''',
        true,
      ) as List?;
  static List? collectionTrackFeaturedArtist(dynamic response) => getJsonField(
        response,
        r'''$.collections[:].tracks[:].featuredArtists''',
        true,
      ) as List?;
  static List<String>? collectionTrackTitle(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].tracks[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? collectionTrackBPM(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].tracks[:].bpm''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? collectionTrackLength(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].tracks[:].length''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? collectionTrackMoods(dynamic response) => getJsonField(
        response,
        r'''$.collections[:].tracks[:].moods''',
        true,
      ) as List?;
  static List<String>? collectionTrackMoodsID(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].moods[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackMoodsName(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].moods[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackGenresID(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].genres[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackGenresName(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].genres[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? collectionTrackGenresParent(dynamic response) => getJsonField(
        response,
        r'''$.collections[:].tracks[:].genres[:].parent''',
        true,
      ) as List?;
  static List<String>? collectionTrackGenresParentID(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].genres[:].parent.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackParentName(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].genres[:].parent.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? collectionTrackImages(dynamic response) => getJsonField(
        response,
        r'''$.collections[:].tracks[:].images''',
        true,
      ) as List?;
  static List<String>? collectionTrackImagesDefault(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].images.default''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackImagesXS(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].images.XS''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackImagesS(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].images.S''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackImagesM(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].images.M''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackImagesL(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].images.L''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackWaveformUrl(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].waveformUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? collectionTrackisExplicit(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].isExplicit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<bool>? collectionTrackHasVocals(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].hasVocals''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTracksAdded(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].tracks[:].added''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? collectionTrackIsPreviewOnly(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].isPreviewOnly''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionTrackTierOption(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].tracks[:].tierOption''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? collectionAvailableTracks(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].availableTracks''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? collectionTrackGenres(dynamic response) => getJsonField(
        response,
        r'''$.collections[:].tracks[:].genres''',
        true,
      ) as List?;
  static List? collectionImages(dynamic response) => getJsonField(
        response,
        r'''$.collections[:].images''',
        true,
      ) as List?;
  static List<String>? collectionImagesDefault(dynamic response) =>
      (getJsonField(
        response,
        r'''$.collections[:].images.default''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionImagesXS(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].images.XS''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionImagesS(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].images.S''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionImagesM(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].images.M''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? collectionImagesL(dynamic response) => (getJsonField(
        response,
        r'''$.collections[:].images.L''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic pagination(dynamic response) => getJsonField(
        response,
        r'''$.pagination''',
      );
  static int? paginationImages(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.pagination.page''',
      ));
  static int? paginationLimit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pagination.limit''',
      ));
  static dynamic links(dynamic response) => getJsonField(
        response,
        r'''$.links''',
      );
  static String? linksNext(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.links.next''',
      ));
}

class GetEpidemicTracksCall {
  static Future<ApiCallResponse> call({
    String? token =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Epidemic Tracks',
      apiUrl:
          'https://partner-content-api.epidemicsound.com/v0/tracks?limit=20',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'token':
            "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? tracks(dynamic response) => getJsonField(
        response,
        r'''$.tracks''',
        true,
      ) as List?;
  static List? tracksMainArtists(dynamic response) => getJsonField(
        response,
        r'''$.tracks[:].mainArtists''',
        true,
      ) as List?;
  static List? tracksFeaturedArtists(dynamic response) => getJsonField(
        response,
        r'''$.tracks[:].featuredArtists''',
        true,
      ) as List?;
  static List<String>? tracksTitle(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? tracksBPM(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].bpm''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? tracksLength(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].length''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? tracksMoods(dynamic response) => getJsonField(
        response,
        r'''$.tracks[:].moods''',
        true,
      ) as List?;
  static List<String>? tracksMoodName(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].moods[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? tracksGenres(dynamic response) => getJsonField(
        response,
        r'''$.tracks[:].genres''',
        true,
      ) as List?;
  static List<String>? tracksGenresID(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].genres[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksGenresName(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].genres[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? tracksGenresParent(dynamic response) => getJsonField(
        response,
        r'''$.tracks[:].genres[:].parent''',
        true,
      ) as List?;
  static List<String>? tracksGenresParentID(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].genres[:].parent.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksGenresParentName(dynamic response) =>
      (getJsonField(
        response,
        r'''$.tracks[:].genres[:].parent.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? tracksImages(dynamic response) => getJsonField(
        response,
        r'''$.tracks[:].images''',
        true,
      ) as List?;
  static List<String>? tracksImagesDefault(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].images.default''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksImagesXS(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].images.XS''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksImagesS(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].images.S''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksImagesM(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].images.M''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksImagesL(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].images.L''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksWaveformUrl(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].waveformUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksMoodsID(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].moods[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksID(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? tracksIsExplicit(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].isExplicit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<bool>? tracksHasVocals(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].hasVocals''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? tracksAdded(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].added''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? tracksIsPreviewOnly(dynamic response) => (getJsonField(
        response,
        r'''$.tracks[:].isPreviewOnly''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List? tracksTierOption(dynamic response) => getJsonField(
        response,
        r'''$.tracks[:].tierOption''',
        true,
      ) as List?;
  static dynamic pagination(dynamic response) => getJsonField(
        response,
        r'''$.pagination''',
      );
  static int? paginationPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pagination.page''',
      ));
  static int? paginationLimit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pagination.limit''',
      ));
  static dynamic links(dynamic response) => getJsonField(
        response,
        r'''$.links''',
      );
  static String? linksNext(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.links.next''',
      ));
}

class EpidemicStreamURLCall {
  static Future<ApiCallResponse> call({
    String? token =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
    String? trackId = '1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Epidemic Stream URL',
      apiUrl:
          'https://partner-content-api.epidemicsound.com/v0/tracks/${trackId}/stream',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA',
      },
      params: {
        'track_id': "1",
        'token':
            "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVySWQiOiIxODEzNTBlZS04ZjYwLTRlOWMtODE2Yi1jMzhhMDgwZTAyZDUiLCJwYXJ0bmVyTmFtZSI6IkVzY2FwZSBFbnRlcnByaXNlcyIsImFwcElkIjoiZjYzZTM4NGItMDExYi00MDZiLTgyZDUtNDkyNzUzMDA4ZGE0IiwiYXBwTmFtZSI6IkVzY2FwZSBBcHAiLCJ1c2VySWQiOiJzb21lLXVuaXF1ZS11c2VyLWlkIiwidGllcklkIjoiNzViMzEwY2YtMjM0Yi00NTIzLWEyZmMtZjIxOWZiZDk4YTJhIiwidGllck5hbWUiOiJDdXN0b20iLCJhdWQiOiJlbmQtdXNlciIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNzY0MjIwMDY3fQ.j80T5uKOuTlvbr8EzCF7Gp-kyJKTm1MGisMKCq70IEuMvA7Y-Jv1yuJ0OhkzhVHL3FTG6t_5EZ3-d24m_rJ5MpVqwfRsMDyXz83PpVRcD10ZijB7i3U5gEenVltccpixkW4rC6zuSx9IneDfrh8RNBO0AVvff0woJ6lvkA_77l9WZ6mB5cMlt_Zp44Bj6VVL0Zj0jtNW2dwpDONW6uTBLn9nMmrAOCTDcNQ_ezlA-Rzekf83UsE39x2LaAEoDs_4F140yIeI2NnZgRhOthb0CTzqy1xjefu7hsM8kRrHUvEmxyIvK33SyM-KP4Jmqy7PztB3lsAJDvMHCABdASpzBA",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? musicStreamUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static String? expirationTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.expires''',
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
