import 'package:cloud_functions/cloud_functions.dart';

/// The 70s default matches the Firebase Functions SDK's built-in default
/// and is fine for chat / image-gen / STT / TTS. Long-running callers
/// (video gen — Veo can take 60-200s) pass an explicit [timeout] derived
/// from the agent's `deploymentSettings.timeoutSeconds`; see
/// `effectiveAgentTimeoutSeconds` for the per-kind fallbacks (60s for
/// chat/image/STT/TTS, 540s for video gen).
Future<Map<String, dynamic>> makeCloudCall(
  String callName,
  Map<String, dynamic> input, {
  Duration? timeout,
}) async {
  try {
    final response = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable(
          callName,
          options: HttpsCallableOptions(
            timeout: timeout ?? const Duration(seconds: 70),
          ),
        )
        .call(input);
    return response.data is Map
        ? Map<String, dynamic>.from(response.data as Map)
        : {};
  } on FirebaseFunctionsException catch (e) {
    print(
      'Cloud call error!\n ${callName}'
      'Code: ${e.code}\n'
      'Details: ${e.details}\n'
      'Message: ${e.message}',
    );
  } catch (e) {
    print('Cloud call error:${callName} $e');
  }
  return {};
}
