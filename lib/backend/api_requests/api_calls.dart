import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class YouTubeDataAPICall {
  static Future<ApiCallResponse> call({
    String? playlistId = '',
    String? apiKey = 'AIzaSyB7aTJq3vp0n_4k4ct5d4Z0jOjjAeqSQis',
    String? maxResults = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data API ',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'playlistId': playlistId,
        'key': apiKey,
        'maxResults': maxResults,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? itemSnippet(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet''',
        true,
      ) as List?;
  static List<String>? itemSnippetChannel(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? itemsSnippetTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetDescription(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? snipppetThumbnails(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails''',
        true,
      ) as List?;
  static List? snippetThumbnailsDefault(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.default''',
        true,
      ) as List?;
  static List? snippetThumbnailsStandard(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.standard''',
        true,
      ) as List?;
  static List<String>? snippetPlaylistId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.playlistId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataAPIBinauralBeatsCall {
  static Future<ApiCallResponse> call({
    String? playlistId = 'PLyC3pcUWmqsTalfauEnixmkhUeV7g9TdU',
    String? apiKey = 'AIzaSyB7aTJq3vp0n_4k4ct5d4Z0jOjjAeqSQis',
    String? maxResults = '50',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data API  Binaural Beats',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'playlistId': playlistId,
        'key': apiKey,
        'maxResults': maxResults,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? itemSnippet(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet''',
        true,
      ) as List?;
  static List<String>? itemSnippetChannel(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? itemsSnippetTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetDescription(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? snipppetThumbnails(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails''',
        true,
      ) as List?;
  static List? snippetThumbnailsDefault(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.default''',
        true,
      ) as List?;
  static List? snippetThumbnailsStandard(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.standard''',
        true,
      ) as List?;
  static List<String>? snippetPlaylistId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.playlistId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? snippetThumbnailDefault(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.default.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? snippetResourceId(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? snippetResourceIdKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetResourceVideoId(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetVideoOwnerChannelTitle(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetVideoOwnerChannelId(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataAPIIncreaseFocusCopyCall {
  static Future<ApiCallResponse> call({
    String? playlistId = 'PLyC3pcUWmqsS9kb5LkS1Thhut2hHwqYN5',
    String? apiKey = 'AIzaSyB7aTJq3vp0n_4k4ct5d4Z0jOjjAeqSQis',
    String? maxResults = '50',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data API  Increase Focus Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'playlistId': playlistId,
        'key': apiKey,
        'maxResults': maxResults,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? itemSnippet(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet''',
        true,
      ) as List?;
  static List<String>? itemSnippetChannel(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? itemsSnippetTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetDescription(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? snipppetThumbnails(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails''',
        true,
      ) as List?;
  static List? snippetThumbnailsDefault(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.default''',
        true,
      ) as List?;
  static List? snippetThumbnailsStandard(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.standard''',
        true,
      ) as List?;
  static List<String>? snippetPlaylistId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.playlistId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? snippetThumbnailDefault(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.default.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? snippetResourceId(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? snippetResourceIdKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetResourceVideoId(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetVideoOwnerChannelTitle(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snippetVideoOwnerChannelId(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
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
