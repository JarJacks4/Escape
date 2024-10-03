import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class YouTubeDataAPIBaseCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data API Base',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLkFHhEEbS0xQn73rofa9zRJDz0O0RMzAE&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataAPIDarkAndMellowAmbientCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data API Dark and Mellow Ambient',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLhOwWgsOZ3tkF7enQItbr_Gi5HsnO1VgQ&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataAPIGuidedMeditationsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data API Guided Meditations',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLkFHhEEbS0xT5e-32Q-EIj-zI3-jIVI7C&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataAPIVibrationCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data API Vibration',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsSNn3o-HGJtPCUIfsRUczGv&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataYogaAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Yoga API',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsQBckb0AfOsxtmjgvr0wZa1&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataBinauralBeatsAPICopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Binaural Beats  API Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsTalfauEnixmkhUeV7g9TdU&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataTaiChiAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Tai Chi API',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsS8np_023S06Nf32JFLPVIj&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataTaiChiFormEightAPIFINALCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Tai Chi Form Eight API FINAL Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLKbhoDbSI76uVjLsjQNVJHULDBIcMS2cH&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataBoostCreativityCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Boost Creativity',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLkFHhEEbS0xRuCVC1Y2acpalP-SsHyRuh&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataGeneralSoundscapesAPICallCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data General Soundscapes API Call',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsSo3eWgzk-eAkyhaxTf-_Dm&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataAmbientSoundscapesAPICallCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Ambient Soundscapes API Call',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLhOwWgsOZ3tkF7enQItbr_Gi5HsnO1VgQ&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataCitySoundscapesAPICallCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data City Soundscapes API Call Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLhOwWgsOZ3tkAh0JFGw52xACehD2V3-Su&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataSleepAPICallCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Sleep API Call Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsRfYKuYTEVZagZze83K_Gt5&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataTaiChiForBeginnersDataAPICallCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Tai Chi For Beginners Data API Call',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLMypbNPFKGgRcuiKMpj79cE-VHP4I2zhB&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataQigongDataAPICallCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Qigong Data API Call',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLkFHhEEbS0xT2Wfi2KQWRL9ZcmKJxClSU&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataPilatesAPIFINALCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Pilates API FINAL',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsQVftbgeaf_Bl5bIl4XPQ-I&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataKemeticYogaAPIFINALCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Kemetic Yoga API FINAL ',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PL8-LlZ29KU5qZHXhT3BVXwm1V_IVASGDZ&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataEliminateDepressionAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Eliminate Depression API',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsRRcDvGOJBY5AsEW7925CX0&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataPeacefulSoundsAPIFINALCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Peaceful Sounds  API FINAL  Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsRt118UTul9CMnn6f8vTCsB&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataMeditationAPIFINALCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Meditation  API FINAL Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsTfH2-BQQ4PfuS7NjxcFa9v&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataBeginnersYogaAPIFINALCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Beginners Yoga API FINAL Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsRR6IxiqlYWTPVNcQJoRjV2&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataSleepYogaAPIFINALCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Sleep Yoga API FINAL ',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsTVcl7VGoxMS1niMKstQW3c&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataFireSoundsAPIFINALCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Fire Sounds API FINAL  ',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsS9kb5LkS1Thhut2hHwqYN5&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataGroundingFINALAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Grounding FINAL API',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsQj_UV612ruMIMppCG87zJp&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataThunderstormsAPIFINALCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Thunderstorms API FINAL Copy Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsSfsn0VnXMmWKhkI4j76GQc&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataStressAndAnxietyMeditationsAPIFINALCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Stress and Anxiety Meditations API FINAL ',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsT9TXxbQCryj5zcWq356xim&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataStressAndAnxietyYogaAPIFINALCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Stress and Anxiety Yoga API FINAL ',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsS9kb5LkS1Thhut2hHwqYN5&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataSleepMeditationsAPIFINALCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Sleep Meditations API FINAL Copy Copy Copy',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsRfYKuYTEVZagZze83K_Gt5&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataBeginnersGuideToYogaCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data Beginners Guide to Yoga',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsRR6IxiqlYWTPVNcQJoRjV2&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YouTubeDataIncreaseFocusAPIFINALCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Data increase Focus  API FINAL ',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyC3pcUWmqsS9kb5LkS1Thhut2hHwqYN5&key=AIzaSyCm8Xdnu-h9T7hS_-XZLtnNSrImqjnoCGY',
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
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoChannelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.videoOwnerChannelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resourceID(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? resourceKind(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.kind''',
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
