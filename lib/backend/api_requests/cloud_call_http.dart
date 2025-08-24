import 'dart:convert';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, dynamic>> getAuthHeaders() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String? token = await user.getIdToken();
    return token != null ? {"authorization": 'Bearer $token'} : {};
  }
  return {};
}

Future<ApiCallResponse> makeCloudCallHttp(
  String firebaseProjectId,
  String callName,
  Map<String, dynamic> input,
) async {
  final apiUrl =
      'https://us-central1-$firebaseProjectId.cloudfunctions.net/lucillellmfunctionV2';
  ApiCallResponse result;

  try {
    final body = {"data": input};
    result = await ApiManager.requestWithBody(
      ApiCallType.POST,
      apiUrl,
      await getAuthHeaders(),
      {}, //query params
      json.encode(body),
      BodyType.JSON,
      true,
      false,
      false,
      false,
      true,
    );
  } catch (e) {
    result = ApiCallResponse(null, {}, -1, exception: e);
  }
  return result;
}
