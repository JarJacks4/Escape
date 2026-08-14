import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'PartnerToken';

/// Start Theory Of Mind Lucille Group Code

class TheoryOfMindLucilleGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static LucilleChatMainCall lucilleChatMainCall = LucilleChatMainCall();
  static CreateSessionCall createSessionCall = CreateSessionCall();
  static ChatStreamCall chatStreamCall = ChatStreamCall();
  static OnboardUserCall onboardUserCall = OnboardUserCall();
  static GetTherapyRecommendationsCall getTherapyRecommendationsCall =
      GetTherapyRecommendationsCall();
  static GetSoundscapesCall getSoundscapesCall = GetSoundscapesCall();
}

class LucilleChatMainCall {
  Future<ApiCallResponse> call({
    String? message = 'Hey Lucille!',
    String? sessionId = '',
    String? userId = '',
  }) async {
    final baseUrl = TheoryOfMindLucilleGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "[message]",
  "session_id": "[session_id]",
  "user_id": "[user_id]"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Lucille Chat Main',
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
      isStreamingApi: false,
      alwaysAllowBody: false,
      client: ApiManager.getClient(withCredentials: true),
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
  List<String>? conversation(dynamic response) => (getJsonField(
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
  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  int? messageCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message_count''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  String? detectedEmotion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_emotion''',
      ));
  String? detectedIntent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_intent''',
      ));
  String? modelUsed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.model_used''',
      ));
}

class CreateSessionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TheoryOfMindLucilleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Create Session',
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
      client: ApiManager.getClient(withCredentials: true),
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

class ChatStreamCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? sessionID = '',
    String? userID = '',
  }) async {
    final baseUrl = TheoryOfMindLucilleGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "I've been feeling anxious about work lately",
  "session_id": "optional-uuid (auto-generated if omitted)",
  "firebaseIDToken": "[firebaseIDToken]", 
  "user_id": "optional-user-id (enables personalization)"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatStream',
      apiUrl: '${baseUrl}/chat/stream',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'text/event-stream',
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
      client: ApiManager.getClient(withCredentials: true),
    );
  }

  String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.content''',
      ));
  String? detectedIntent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_intent''',
      ));
  String? detectedEmotions(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_emotion''',
      ));
  int? messageCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message_count''',
      ));
  String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  bool? done(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.done''',
      ));
}

class OnboardUserCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? responses = '',
  }) async {
    final baseUrl = TheoryOfMindLucilleGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userID)}",
  "responses": "${escapeStringForJson(responses)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Onboard User',
      apiUrl: '${baseUrl}/users/onboard',
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
      client: ApiManager.getClient(withCredentials: true),
    );
  }

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class GetTherapyRecommendationsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TheoryOfMindLucilleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Therapy Recommendations',
      apiUrl: '${baseUrl}/therapy/recommend/{user_id}',
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
      client: ApiManager.getClient(withCredentials: true),
    );
  }

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  List? recommendationsMeta(dynamic response) => getJsonField(
        response,
        r'''$.recommendations[:].rl_meta''',
        true,
      ) as List?;
  List<int>? durationMinutes(dynamic response) => (getJsonField(
        response,
        r'''$.recommendations[:].duration_minutes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? difficulty(dynamic response) => (getJsonField(
        response,
        r'''$.recommendations[:].difficulty''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? reason(dynamic response) => (getJsonField(
        response,
        r'''$.recommendations[:].reason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.recommendations[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.recommendations[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? modality(dynamic response) => (getJsonField(
        response,
        r'''$.recommendations[:].modality''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? exerciseID(dynamic response) => (getJsonField(
        response,
        r'''$.recommendations[:].exercise_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? recommendations(dynamic response) => getJsonField(
        response,
        r'''$.recommendations''',
        true,
      ) as List?;
  String? detectedIntent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_intent''',
      ));
  String? detectedEmotion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_emotion''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class GetSoundscapesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TheoryOfMindLucilleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetSoundscapes',
      apiUrl: '${baseUrl}/soundscapes',
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
      client: ApiManager.getClient(withCredentials: true),
    );
  }

  List? soundscapes(dynamic response) => getJsonField(
        response,
        r'''$.soundscapes''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].soundscape_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? category(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? durationInSeconds(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].duration_seconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? targetEmotions(dynamic response) => getJsonField(
        response,
        r'''$.soundscapes[:].target_emotions''',
        true,
      ) as List?;
  List? targetContexts(dynamic response) => getJsonField(
        response,
        r'''$.soundscapes[:].target_contexts''',
        true,
      ) as List?;
  List<String>? audioUrl(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].audio_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? icon(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
}

/// End Theory Of Mind Lucille Group Code

/// Start Theory of Mind Session Management Group Code

class TheoryOfMindSessionManagementGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateIDCall createIDCall = CreateIDCall();
  static GetChatHistoryCall getChatHistoryCall = GetChatHistoryCall();
  static DeleteChatHistoryCall deleteChatHistoryCall = DeleteChatHistoryCall();
  static ListRecentSessionsCall listRecentSessionsCall =
      ListRecentSessionsCall();
  static ValidateSessionCall validateSessionCall = ValidateSessionCall();
}

class CreateIDCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TheoryOfMindSessionManagementGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'CreateID',
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

class GetChatHistoryCall {
  Future<ApiCallResponse> call({
    String? sessionID = '',
  }) async {
    final baseUrl = TheoryOfMindSessionManagementGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Chat History',
      apiUrl: '${baseUrl}/chat/{session_id}',
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

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? statusCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
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

class DeleteChatHistoryCall {
  Future<ApiCallResponse> call({
    String? sessionID = '',
  }) async {
    final baseUrl = TheoryOfMindSessionManagementGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Chat History',
      apiUrl: '${baseUrl}/chat/{session_id}',
      callType: ApiCallType.DELETE,
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
  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ListRecentSessionsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TheoryOfMindSessionManagementGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List Recent Sessions',
      apiUrl: '${baseUrl}/sessions/',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List<bool>? hasSummary(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].has_summary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? updatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].updated_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? messageCount(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].message_count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? sessionID(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].session_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? sessions(dynamic response) => getJsonField(
        response,
        r'''$.sessions''',
        true,
      ) as List?;
}

class ValidateSessionCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    final baseUrl = TheoryOfMindSessionManagementGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Validate Session',
      apiUrl: '${baseUrl}/users/{user_id}/sessions',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List? sessions(dynamic response) => getJsonField(
        response,
        r'''$.sessions''',
        true,
      ) as List?;
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

/// End Theory of Mind Session Management Group Code

/// Start Theory of Mind Onboarding Group Code

class TheoryOfMindOnboardingGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app';
  static Map<String, String> headers = {};
  static OnboardingUserCall onboardingUserCall = OnboardingUserCall();
  static UserCompleteProfileCall userCompleteProfileCall =
      UserCompleteProfileCall();
  static UpdateUserProfileCall updateUserProfileCall = UpdateUserProfileCall();
  static DeleteUserProfileCall deleteUserProfileCall = DeleteUserProfileCall();
  static MoodCall moodCall = MoodCall();
}

class OnboardingUserCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? displayName = '',
    String? ageRange = '',
    List<String>? personalityTraitsList,
    String? communicationPreference = '',
    List<String>? interestsList,
    List<String>? coreValuesList,
    String? currentMood = '',
    List<String>? goalsList,
    String? sleepPattern = '',
    String? exerciseFrequency = '',
  }) async {
    final baseUrl = TheoryOfMindOnboardingGroup.getBaseUrl();
    final personalityTraits = _serializeList(personalityTraitsList);
    final interests = _serializeList(interestsList);
    final coreValues = _serializeList(coreValuesList);
    final goals = _serializeList(goalsList);

    final ffApiRequestBody = '''
{
  "user_id": "userID",
  "display_name": "displayName",
  "age_range": "ageRange",
  "personality_traits": personalityTraits,
  "communication_preference": "communicationPreference",
  "interests": interests,
  "core_values": coreValues,
  "current_mood": "currentMood",
  "goals": goals,
  "sleep_pattern": "sleepPattern",
  "exercise_frequency": "exerciseFrequency"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Onboarding User',
      apiUrl: '${baseUrl}/users/onboard',
      callType: ApiCallType.POST,
      headers: {},
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class UserCompleteProfileCall {
  Future<ApiCallResponse> call({
    String? userID = '5a1d1e85-17be-4e3a-a719-5eb7ee9d57a1',
  }) async {
    final baseUrl = TheoryOfMindOnboardingGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Complete Profile',
      apiUrl: '${baseUrl}/users/{user_id}',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class UpdateUserProfileCall {
  Future<ApiCallResponse> call({
    String? displayName = '',
    List<String>? interestsList,
  }) async {
    final baseUrl = TheoryOfMindOnboardingGroup.getBaseUrl();
    final interests = _serializeList(interestsList);

    final ffApiRequestBody = '''
{
    "display_name": "displayName",
    "interests": interests
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Profile',
      apiUrl: '${baseUrl}/users/{user_id}',
      callType: ApiCallType.PUT,
      headers: {},
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class DeleteUserProfileCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    final baseUrl = TheoryOfMindOnboardingGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete User Profile',
      apiUrl: '${baseUrl}/users/{user_id}',
      callType: ApiCallType.DELETE,
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class MoodCall {
  Future<ApiCallResponse> call({
    String? mood = '',
    int? intensity,
    String? context = '',
    String? detectedVia = '',
  }) async {
    final baseUrl = TheoryOfMindOnboardingGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "mood": "mood",
  "intensity": intensity,
  "context": "context",
  "detected_via": "detectedVia"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Mood',
      apiUrl: '${baseUrl}/',
      callType: ApiCallType.POST,
      headers: {},
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

/// End Theory of Mind Onboarding Group Code

/// Start Lucille Memories Group Code

class LucilleMemoriesGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetMemoriesCall getMemoriesCall = GetMemoriesCall();
  static CreateMemoryCall createMemoryCall = CreateMemoryCall();
  static SearchMemoriesCall searchMemoriesCall = SearchMemoriesCall();
  static DeleteMemoryCall deleteMemoryCall = DeleteMemoryCall();
  static ConsolidateMemoryCall consolidateMemoryCall = ConsolidateMemoryCall();
}

class GetMemoriesCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    final baseUrl = LucilleMemoriesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Memories',
      apiUrl: '${baseUrl}/users/{user_id}/memories',
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

  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  List? memories(dynamic response) => getJsonField(
        response,
        r'''$.memories''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
}

class CreateMemoryCall {
  Future<ApiCallResponse> call({
    String? content = '',
    String? memoryType = 'Episodic',
    int? importance,
    List<String>? tagsList,
  }) async {
    final baseUrl = LucilleMemoriesGroup.getBaseUrl();
    final tags = _serializeList(tagsList);

    final ffApiRequestBody = '''
{
  "content": "${escapeStringForJson(content)}",
  "memory_type": "${escapeStringForJson(memoryType)}",
  "importance": ${importance}
  "tags": tags
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Memory',
      apiUrl: '${baseUrl}/users/{user_id}/memories',
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

  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.detail''',
        true,
      ) as List?;
  String? cTXError(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail[:].ctx.error''',
      ));
  dynamic ctx(dynamic response) => getJsonField(
        response,
        r'''$.detail[:].ctx''',
      );
  dynamic input(dynamic response) => getJsonField(
        response,
        r'''$.detail[:].input''',
      );
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail[:].msg''',
      ));
  List<String>? loc(dynamic response) => (getJsonField(
        response,
        r'''$.detail[:].loc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail[:].type''',
      ));
}

class SearchMemoriesCall {
  Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    final baseUrl = LucilleMemoriesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "query": "[query]"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Search Memories',
      apiUrl: '${baseUrl}/users/{user_id}/memories/search',
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

  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class DeleteMemoryCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleMemoriesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Memory',
      apiUrl: '${baseUrl}/users/{user_id}/memories/{memory_id}',
      callType: ApiCallType.DELETE,
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

class ConsolidateMemoryCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleMemoriesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Consolidate Memory',
      apiUrl: '${baseUrl}/users/{user_id}/memories/consolidate',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? removedCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.removed_count''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

/// End Lucille Memories Group Code

/// Start Lucille Therapy Exercises Group Code

class LucilleTherapyExercisesGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetExercisesCall getExercisesCall = GetExercisesCall();
  static GetExerciseDetailCall getExerciseDetailCall = GetExerciseDetailCall();
  static RecommendedExercisesCall recommendedExercisesCall =
      RecommendedExercisesCall();
  static StartExerciseCall startExerciseCall = StartExerciseCall();
  static AdvanceExerciseCall advanceExerciseCall = AdvanceExerciseCall();
  static AbandonExerciseCall abandonExerciseCall = AbandonExerciseCall();
  static GetActiveExerciseCall getActiveExerciseCall = GetActiveExerciseCall();
  static GetExerciseHistoryCall getExerciseHistoryCall =
      GetExerciseHistoryCall();
}

class GetExercisesCall {
  Future<ApiCallResponse> call({
    String? modality = '',
  }) async {
    final baseUrl = LucilleTherapyExercisesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Exercises',
      apiUrl: '${baseUrl}/therapy/exercises',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'modality': modality,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List<int>? stepCount(dynamic response) => (getJsonField(
        response,
        r'''$.step_count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? durationMinutes(dynamic response) => (getJsonField(
        response,
        r'''$.duration_minutes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? difficulty(dynamic response) => (getJsonField(
        response,
        r'''$.difficulty''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? modality(dynamic response) => (getJsonField(
        response,
        r'''$.modality''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? exerciseID(dynamic response) => (getJsonField(
        response,
        r'''$.exercise_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? exercises(dynamic response) => getJsonField(
        response,
        r'''$.exercises''',
        true,
      ) as List?;
}

class GetExerciseDetailCall {
  Future<ApiCallResponse> call({
    String? exerciseID = '\"cbt_thought_record\"',
  }) async {
    final baseUrl = LucilleTherapyExercisesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Exercise Detail',
      apiUrl: '${baseUrl}/therapy/exercises/{exercise_id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'exerciseID': exerciseID,
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

class RecommendedExercisesCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? userID = '',
  }) async {
    final baseUrl = LucilleTherapyExercisesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Recommended Exercises',
      apiUrl: '${baseUrl}/therapy/recommend/{user_id}',
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

  String? tImestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List<int>? duration(dynamic response) => (getJsonField(
        response,
        r'''$.duration_minutes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? reason(dynamic response) => (getJsonField(
        response,
        r'''$.reason''',
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
  List? rLMeta(dynamic response) => getJsonField(
        response,
        r'''$.rl_meta''',
        true,
      ) as List?;
  List<String>? difficulty(dynamic response) => (getJsonField(
        response,
        r'''$.difficulty''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? modality(dynamic response) => (getJsonField(
        response,
        r'''$.modality''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? exerciseID(dynamic response) => (getJsonField(
        response,
        r'''$.exercise_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? recommendations(dynamic response) => getJsonField(
        response,
        r'''$.recommendations''',
        true,
      ) as List?;
  String? detectedIntent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_intent''',
      ));
  String? detectedEmotion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_emotion''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class StartExerciseCall {
  Future<ApiCallResponse> call({
    String? exerciseID = '',
  }) async {
    final baseUrl = LucilleTherapyExercisesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "exercise_id": "${escapeStringForJson(exerciseID)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Start Exercise',
      apiUrl: '${baseUrl}/therapy/{user_id}/start',
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

class AdvanceExerciseCall {
  Future<ApiCallResponse> call({
    String? note = '',
  }) async {
    final baseUrl = LucilleTherapyExercisesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "note": "${escapeStringForJson(note)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Advance Exercise',
      apiUrl: '${baseUrl}/therapy/{user_id}/advance/{session_id}',
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

class AbandonExerciseCall {
  Future<ApiCallResponse> call({
    String? exerciseID = '',
  }) async {
    final baseUrl = LucilleTherapyExercisesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Abandon Exercise',
      apiUrl: '${baseUrl}/therapy/{user_id}/abandon/{session_id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
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

class GetActiveExerciseCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleTherapyExercisesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Active Exercise',
      apiUrl: '${baseUrl}/therapy/{user_id}/active',
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

class GetExerciseHistoryCall {
  Future<ApiCallResponse> call({
    int? limit = 1,
  }) async {
    final baseUrl = LucilleTherapyExercisesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Exercise History',
      apiUrl: '${baseUrl}/therapy/{user_id}/history',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'limit': limit,
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

/// End Lucille Therapy Exercises Group Code

/// Start Lucille Task Management Group Code

class LucilleTaskManagementGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetTasksCall getTasksCall = GetTasksCall();
  static DueTasksCall dueTasksCall = DueTasksCall();
  static CreatePracticeTasksCall createPracticeTasksCall =
      CreatePracticeTasksCall();
  static UpdateATaskCall updateATaskCall = UpdateATaskCall();
  static GetProgressSummaryCall getProgressSummaryCall =
      GetProgressSummaryCall();
}

class GetTasksCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleTaskManagementGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Tasks',
      apiUrl: '${baseUrl}/therapy/{user_id}/tasks',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'status': "0",
        'limit': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List? tasks(dynamic response) => getJsonField(
        response,
        r'''$.tasks''',
        true,
      ) as List?;
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class DueTasksCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleTaskManagementGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Due Tasks',
      apiUrl: '${baseUrl}/therapy/{user_id}/tasks/due',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  int? count2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  List? dueTasks(dynamic response) => getJsonField(
        response,
        r'''$.due_tasks''',
        true,
      ) as List?;
}

class CreatePracticeTasksCall {
  Future<ApiCallResponse> call({
    String? sourceExerciseID = '',
    String? title = '',
    String? description = '',
    String? dueDate = '',
    String? targetCount = '',
  }) async {
    final baseUrl = LucilleTaskManagementGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "source_exercise_id": "sourceExerciseID",
  "title": "title",
  "description": "description",
  "due_date": "dueDate",
  "target_count": targetCount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Practice Tasks',
      apiUrl: '${baseUrl}/therapy/{user_id}/tasks',
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

class UpdateATaskCall {
  Future<ApiCallResponse> call({
    String? status = '',
    String? completedCount = '',
    String? note = '',
  }) async {
    final baseUrl = LucilleTaskManagementGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "status": "status",
  "completed_count": completedCount,
  "note": "note"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update a Task',
      apiUrl: '${baseUrl}/therapy/{user_id}/tasks/{task_id}',
      callType: ApiCallType.PUT,
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

class GetProgressSummaryCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleTaskManagementGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Progress Summary',
      apiUrl: '${baseUrl}/therapy/{user_id}/progress',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  double? averageHelpfulness(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.progress.average_helpfulness''',
      ));
  String? computedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.progress.computed_at''',
      ));
  double? taskCompletionRate(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.progress.task_completion_rate''',
      ));
  int? totalTasksAssigned(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.progress.total_tasks_assigned''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? totalPracticeMinutes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.progress.total_practice_minutes''',
      ));
  int? longestStreakDays(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.progress.longest_streak_days''',
      ));
  int? totalFeedbackGiven(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.progress.total_feedback_given''',
      ));
  int? totalTasksCompleted(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.progress.total_tasks_completed''',
      ));
  int? currentStreakDays(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.progress.current_streak_days''',
      ));
  dynamic modalityCounts(dynamic response) => getJsonField(
        response,
        r'''$.progress.modality_counts''',
      );
  double? completionRate(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress.completion_rate''',
      ));
  int? totalExercisesAbandoned(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.progress.total_exercises_abandoned''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  int? totalExercisesCompleted(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.progress.total_exercises_completed''',
      ));
  int? totalExercisesStarted(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.progress.total_exercises_started''',
      ));
  String? progressUserID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.progress.user_id''',
      ));
  dynamic progress(dynamic response) => getJsonField(
        response,
        r'''$.progress''',
      );
}

/// End Lucille Task Management Group Code

/// Start Lucille Feedback System Group Code

class LucilleFeedbackSystemGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static ResponseFeedbackCall responseFeedbackCall = ResponseFeedbackCall();
  static ExerciseFeedbackCall exerciseFeedbackCall = ExerciseFeedbackCall();
  static FeedbackHistoryCall feedbackHistoryCall = FeedbackHistoryCall();
  static EffectivenessCall effectivenessCall = EffectivenessCall();
}

class ResponseFeedbackCall {
  Future<ApiCallResponse> call({
    String? sessionID = '',
    int? messageIndex,
    int? rating,
    String? comment = '',
  }) async {
    final baseUrl = LucilleFeedbackSystemGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "session_id": "sessionID",
  "message_index": messageIndex,
  "rating": "rating",
  "comment": "comment"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Response Feedback',
      apiUrl: '${baseUrl}/feedback/{user_id}/response',
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

class ExerciseFeedbackCall {
  Future<ApiCallResponse> call({
    String? exerciseSessionID = '',
    int? effectiveness,
    String? moodBefore = '',
    String? moodAfter = '',
    String? notes = '',
    bool? wouldRepeat,
  }) async {
    final baseUrl = LucilleFeedbackSystemGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "session_id": "sessionID",
  "mood_before": moodBefore,
  "mood_after": moodAfter,
  "helpfulness": helpfulness,
  "would_repeat": wouldRepeat,
  "comment": "comment"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Exercise Feedback',
      apiUrl: '${baseUrl}/feedback/{user_id}/exercise-outcome',
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

class FeedbackHistoryCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleFeedbackSystemGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Feedback History',
      apiUrl: '${baseUrl}/feedback/{user_id}/history',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? totalExerciseOutcomes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_exercise_outcomes''',
      ));
  int? totalResponseFeedback(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_response_feedback''',
      ));
  List? exerciseOutcomes(dynamic response) => getJsonField(
        response,
        r'''$.exercise_outcomes''',
        true,
      ) as List?;
  List? responseFeedback(dynamic response) => getJsonField(
        response,
        r'''$.response_feedback''',
        true,
      ) as List?;
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class EffectivenessCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleFeedbackSystemGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Effectiveness',
      apiUrl: '${baseUrl}/feedback/{user_id}/effectiveness',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? computedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.effectiveness.computed_at''',
      ));
  double? responseHelpfulRate(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.effectiveness.response_helpful_rate''',
      ));
  int? totalResponseFeedback(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.effectiveness.total_response_feedback''',
      ));
  int? totalOutcomes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.effectiveness.total_outcomes''',
      ));
  dynamic modalityMoodDeltas(dynamic response) => getJsonField(
        response,
        r'''$.effectiveness.modality_mood_deltas''',
      );
  dynamic exerciseScores(dynamic response) => getJsonField(
        response,
        r'''$.effectiveness.exercise_scores''',
      );
  dynamic modalityScores(dynamic response) => getJsonField(
        response,
        r'''$.effectiveness.modality_scores''',
      );
  String? effectivenessUserID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.effectiveness.user_id''',
      ));
  dynamic effectiveness(dynamic response) => getJsonField(
        response,
        r'''$.effectiveness''',
      );
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

/// End Lucille Feedback System Group Code

/// Start Lucille Soundscapes Group Code

class LucilleSoundscapesGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetSoundscapeCall getSoundscapeCall = GetSoundscapeCall();
  static CategoriesCall categoriesCall = CategoriesCall();
  static RecommendedSoundscapesCall recommendedSoundscapesCall =
      RecommendedSoundscapesCall();
  static GetDetailsCall getDetailsCall = GetDetailsCall();
  static StartSoundCall startSoundCall = StartSoundCall();
  static StopSoundCall stopSoundCall = StopSoundCall();
  static StreamedAudioCall streamedAudioCall = StreamedAudioCall();
  static SoundscapeHistoryCall soundscapeHistoryCall = SoundscapeHistoryCall();
}

class GetSoundscapeCall {
  Future<ApiCallResponse> call({
    String? category = '',
  }) async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Soundscape',
      apiUrl: '${baseUrl}/soundscapes',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'Category': category,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List<String>? icon(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? audioUrl(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].audio_url''',
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
  List? targetContexts(dynamic response) => getJsonField(
        response,
        r'''$.soundscapes[:].target_contexts''',
        true,
      ) as List?;
  List? targetEmotions(dynamic response) => getJsonField(
        response,
        r'''$.soundscapes[:].target_emotions''',
        true,
      ) as List?;
  List<int>? durationSeconds(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].duration_seconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? category(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? soundscapesID(dynamic response) => (getJsonField(
        response,
        r'''$.soundscapes[:].soundscape_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? soundscapes(dynamic response) => getJsonField(
        response,
        r'''$.soundscapes''',
        true,
      ) as List?;
}

class CategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Categories',
      apiUrl: '${baseUrl}/soundscapes/categories',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  int? categoriesMusic(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.categories.music''',
      ));
  int? categoriesBinaural(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.categories.binaural''',
      ));
  int? categoriesMeditation(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.categories.meditation''',
      ));
  int? ambient(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.categories.ambient''',
      ));
  int? nature(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.categories.nature''',
      ));
  dynamic categories(dynamic response) => getJsonField(
        response,
        r'''$.categories''',
      );
}

class RecommendedSoundscapesCall {
  Future<ApiCallResponse> call({
    String? emotion = '',
    String? exerciseID = '',
    String? userID = '',
  }) async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Recommended Soundscapes',
      apiUrl: '${baseUrl}/soundscapes/recommend/{user_id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'emotion': emotion,
        'exerciseID': exerciseID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List? recommendations(dynamic response) => getJsonField(
        response,
        r'''$.recommendations''',
        true,
      ) as List?;
  String? detectedEmotions(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detected_emotion''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class GetDetailsCall {
  Future<ApiCallResponse> call({
    String? soundscapeID = 'nature_rain',
  }) async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Details',
      apiUrl: '${baseUrl}/soundscapes/{soundscape_id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'soundscape_id': soundscapeID,
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

class StartSoundCall {
  Future<ApiCallResponse> call({
    String? soundscapeId = '',
  }) async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "soundscape_id": "${escapeStringForJson(soundscapeId)}"
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
    String? sessionID = '',
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
      callName: 'StreamedAudio',
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

class SoundscapeHistoryCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleSoundscapesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Soundscape History',
      apiUrl: '${baseUrl}/soundscapes/{user_id}/history',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? statusCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? statusString(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List? sessions(dynamic response) => getJsonField(
        response,
        r'''$.sessions''',
        true,
      ) as List?;
}

/// End Lucille Soundscapes Group Code

/// Start Lucille Safety and Crisis Group Code

class LucilleSafetyAndCrisisGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SafetySystemCall safetySystemCall = SafetySystemCall();
  static AuditCall auditCall = AuditCall();
  static SafetyCheckCall safetyCheckCall = SafetyCheckCall();
}

class SafetySystemCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleSafetyAndCrisisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Safety System',
      apiUrl: '${baseUrl}/safety/resources',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List<String>? country(dynamic response) => (getJsonField(
        response,
        r'''$.resources[:].country''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$.resources[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceType(dynamic response) => (getJsonField(
        response,
        r'''$.resources[:].resource_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.resources[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? number(dynamic response) => (getJsonField(
        response,
        r'''$.resources[:].number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.resources[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? resources(dynamic response) => getJsonField(
        response,
        r'''$.resources''',
        true,
      ) as List?;
}

class AuditCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleSafetyAndCrisisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Audit',
      apiUrl: '${baseUrl}/safety/{user_id}/audit',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List? events(dynamic response) => getJsonField(
        response,
        r'''$.events''',
        true,
      ) as List?;
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class SafetyCheckCall {
  Future<ApiCallResponse> call({
    String? text = '',
    String? checkType = '',
  }) async {
    final baseUrl = LucilleSafetyAndCrisisGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "text": "text",
  "check_type": "checkType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Safety Check',
      apiUrl: '${baseUrl}/safety/check',
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

  String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? actionTaken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.action_taken''',
      ));
  bool? helplinesNeeded(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.result.helplines_needed''',
      ));
  bool? jailbreakDetected(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.result.jailbreak_detected''',
      ));
  bool? crisisDetected(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.result.crisis_detected''',
      ));
  List? resultFlags(dynamic response) => getJsonField(
        response,
        r'''$.result.flags''',
        true,
      ) as List?;
  String? riskLevel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.risk_level''',
      ));
  dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.result''',
      );
  String? checkType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.check_type''',
      ));
}

/// End Lucille Safety and Crisis Group Code

/// Start Lucille Voice Chat Group Code

class LucilleVoiceChatGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static TextToSpeechCall textToSpeechCall = TextToSpeechCall();
  static SpeechToTextCall speechToTextCall = SpeechToTextCall();
}

class TextToSpeechCall {
  Future<ApiCallResponse> call({
    String? text = '',
    String? voice = '',
    int? rate,
  }) async {
    final baseUrl = LucilleVoiceChatGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "text": "${escapeStringForJson(text)}",
  "voice": "${escapeStringForJson(voice)}",
  "rate": ${rate}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Text to Speech',
      apiUrl: '${baseUrl}/tts',
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

class SpeechToTextCall {
  Future<ApiCallResponse> call({
    String? audio = '',
  }) async {
    final baseUrl = LucilleVoiceChatGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "audio": "[audio_base64]"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Speech To Text',
      apiUrl: '${baseUrl}/stt',
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

/// End Lucille Voice Chat Group Code

/// Start Lucille Reviews Group Code

class LucilleReviewsGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GenerateReviewCall generateReviewCall = GenerateReviewCall();
  static GetReviewsCall getReviewsCall = GetReviewsCall();
}

class GenerateReviewCall {
  Future<ApiCallResponse> call({
    String? periodDays = '',
  }) async {
    final baseUrl = LucilleReviewsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "period_days": "${escapeStringForJson(periodDays)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Review',
      apiUrl: '${baseUrl}/reviews/{user_id}/generate',
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

  String? statusMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  dynamic review(dynamic response) => getJsonField(
        response,
        r'''$.review''',
      );
  String? reviewID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.review_id''',
      ));
  String? reviewUserID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.user_id''',
      ));
  String? periodStart(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.review_period_start''',
      ));
  String? periodEnd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.review_period_end''',
      ));
  dynamic progressSummary(dynamic response) => getJsonField(
        response,
        r'''$.review.progress_summary''',
      );
  String? summaryUserID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.progress_summary.user_id''',
      ));
  int? totalExercisesStarted(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.total_exercises_started''',
      ));
  int? totalExercisesCompleted(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.total_exercises_completed''',
      ));
  int? totalExercisesAbandoned(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.total_exercises_abandoned''',
      ));
  double? completionRate(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.review.progress_summary.completion_rate''',
      ));
  int? currentStreakDays(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.current_streak_days''',
      ));
  dynamic modalityCounts(dynamic response) => getJsonField(
        response,
        r'''$.review.progress_summary.modality_counts''',
      );
  int? longestStreakDays(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.longest_streak_days''',
      ));
  int? totalTasksAssigned(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.total_tasks_assigned''',
      ));
  int? totalTasksCompleted(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.total_tasks_completed''',
      ));
  double? taskCompletionRate(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.review.progress_summary.task_completion_rate''',
      ));
  int? totalPracticeMinutes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.total_practice_minutes''',
      ));
  String? computedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.progress_summary.computed_at''',
      ));
  String? reviewSummaryComputedAt(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.review.progress_summary.computed_at''',
      ));
  int? feedbackGiven(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.progress_summary.total_feedback_given''',
      ));
  double? avgHelpfuness(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.review.progress_summary.average_helpfulness''',
      ));
  dynamic effectivenessSummary(dynamic response) => getJsonField(
        response,
        r'''$.review.effectiveness_summary''',
      );
  String? effectivenessUserID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.review.effectiveness_summary.user_id''',
      ));
  dynamic summaryModalityScores(dynamic response) => getJsonField(
        response,
        r'''$.review.effectiveness_summary.modality_scores''',
      );
  dynamic exerciseScores(dynamic response) => getJsonField(
        response,
        r'''$.review.effectiveness_summary.exercise_scores''',
      );
  dynamic modalityMoodDeltas(dynamic response) => getJsonField(
        response,
        r'''$.review.effectiveness_summary.modality_mood_deltas''',
      );
  int? totalOutcomes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.effectiveness_summary.total_outcomes''',
      ));
  int? totalResponseFeedback(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.effectiveness_summary.total_response_feedback''',
      ));
  double? responseHelpfulRate(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.review.effectiveness_summary.response_helpful_rate''',
      ));
  String? effectivenessComputedAt(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.review.effectiveness_summary.computed_at''',
      ));
  dynamic safetySummary(dynamic response) => getJsonField(
        response,
        r'''$.review.safety_summary''',
      );
  int? totalEvents(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.safety_summary.total_events''',
      ));
  dynamic byRiskLevel(dynamic response) => getJsonField(
        response,
        r'''$.review.safety_summary.by_risk_level''',
      );
  dynamic byEventType(dynamic response) => getJsonField(
        response,
        r'''$.review.safety_summary.by_event_type''',
      );
  dynamic healthSummary(dynamic response) => getJsonField(
        response,
        r'''$.review.health_summary''',
      );
  String? healthSummaryUserID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.review.health_summary.user_id''',
      ));
  int? periodDays(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.health_summary.period_days''',
      ));
  double? avgSleepHours(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.review.health_summary.avg_sleep_hours''',
      ));
  int? avgSteps(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.health_summary.avg_steps''',
      ));
  int? avgActiveMinutes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.health_summary.avg_active_minutes''',
      ));
  String? sleepTrend(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.health_summary.sleep_trend''',
      ));
  String? activityTrend(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.health_summary.activity_trend''',
      ));
  int? totalRecords(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.review.health_summary.total_records''',
      ));
  String? healthSummaryStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.review.health_summary.status''',
      ));
  String? healthSummaryTimestamp(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.review.health_summary.timestamp''',
      ));
  dynamic engagementSummary(dynamic response) => getJsonField(
        response,
        r'''$.review.engagement_summary''',
      );
  dynamic reviewRLInsights(dynamic response) => getJsonField(
        response,
        r'''$.review.rl_insights''',
      );
  String? reviewGeneratedAt(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.review.generated_at''',
      ));
  String? reviewNarrative(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.review.narrative''',
      ));
  List<String>? reviewRecommmendations(dynamic response) => (getJsonField(
        response,
        r'''$.review.recommendations''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetReviewsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LucilleReviewsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Reviews',
      apiUrl: '${baseUrl}/reviews/{user_id}',
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

/// End Lucille Reviews Group Code

/// Start Theory of Mind Lucille Core Chat Group Code

class TheoryOfMindLucilleCoreChatGroup {
  static String getBaseUrl() =>
      'https://lucillellm2-286076426888.us-east4.run.app/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer <firebase_id_token>',
  };
  static CoreChatCall coreChatCall = CoreChatCall();
  static VoiceChatCall voiceChatCall = VoiceChatCall();
}

class CoreChatCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? sessionID = '',
    String? userID = '',
  }) async {
    final baseUrl = TheoryOfMindLucilleCoreChatGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "message",
  "session_id": "sessionID",
  "user_id": "userID"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Core Chat',
      apiUrl: '${baseUrl}/chat',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer <firebase_id_token>',
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

class VoiceChatCall {
  Future<ApiCallResponse> call({
    String? sessionID = '',
    String? userID = '',
    String? audioInput = '',
    String? responseFormat = '',
    String? audioFormat = '',
    String? ttsVoice = '',
  }) async {
    final baseUrl = TheoryOfMindLucilleCoreChatGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "",
  "session_id": "sessionID",
  "user_id": "userID",
  "audio_input": "audioInput",
  "audio_format": "audioFormat",
  "response_format": "responseFormat",
  "tts_voice": "ttsVoice"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Voice Chat',
      apiUrl: '${baseUrl}/chat/voice',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer <firebase_id_token>',
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

/// End Theory of Mind Lucille Core Chat Group Code

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
        'Authorization': 'Bearer \${gorpKey}',
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
