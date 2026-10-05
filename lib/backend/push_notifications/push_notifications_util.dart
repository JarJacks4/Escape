import 'package:cloud_firestore/cloud_firestore.dart';

import 'serialization_util.dart';
import '../../auth/firebase_auth/auth_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

export 'push_notifications_handler.dart';
export 'serialization_util.dart';

const kUserPushNotificationsCollectionName = 'ff_user_push_notifications';

class UserTokenInfo {
  const UserTokenInfo(this.userPath, this.fcmToken);
  final String userPath;
  final String fcmToken;
}

Future<String?> _getFcmTokenIfAuthorized() async {
  final messaging = FirebaseMessaging.instance;
  final settings = await messaging.getNotificationSettings();
  final isAuthorized =
      settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;
  if (!isAuthorized) return null;

  // On Apple platforms, Firebase cannot issue an FCM token until APNs has
  // registered the device. Give APNs a brief chance to finish after startup.
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    String? apnsToken;
    for (var attempt = 0; attempt < 10 && apnsToken == null; attempt++) {
      apnsToken = await messaging.getAPNSToken();
      if (apnsToken == null) {
        await Future<void>.delayed(const Duration(milliseconds: 300));
      }
    }
    if (apnsToken == null) return null;
  }

  return messaging.getToken();
}

Future<void> registerFcmTokenForCurrentUser() async {
  final userReference = currentUserReference;
  if (userReference == null) return;

  final fcmToken = await _getFcmTokenIfAuthorized();
  if (fcmToken == null || fcmToken.isEmpty) return;

  await makeCloudCall(
    'addFcmToken',
    {
      'userDocPath': userReference.path,
      'fcmToken': fcmToken,
      'deviceType':
          defaultTargetPlatform == TargetPlatform.iOS ? 'iOS' : 'Android',
    },
  );
}

Stream<UserTokenInfo> getFcmTokenStream(String userPath) => Stream.value(
        !kIsWeb &&
            (defaultTargetPlatform == TargetPlatform.iOS ||
                defaultTargetPlatform == TargetPlatform.android))
    .where((shouldGetToken) => shouldGetToken)
    .asyncMap<String?>((_) => _getFcmTokenIfAuthorized())
    .switchMap((fcmToken) =>
        Stream.value(fcmToken).merge(FirebaseMessaging.instance.onTokenRefresh))
    .where((fcmToken) => fcmToken != null && fcmToken.isNotEmpty)
    .map((token) => UserTokenInfo(userPath, token!));

final fcmTokenUserStream = authenticatedUserStream
    .where((user) => user != null)
    .map((user) => user!.reference.path)
    .distinct()
    .switchMap(getFcmTokenStream)
    .map(
      (userTokenInfo) => makeCloudCall(
        'addFcmToken',
        {
          'userDocPath': userTokenInfo.userPath,
          'fcmToken': userTokenInfo.fcmToken,
          'deviceType':
              defaultTargetPlatform == TargetPlatform.iOS ? 'iOS' : 'Android',
        },
      ),
    );

void triggerPushNotification({
  required String? notificationTitle,
  required String? notificationText,
  String? notificationImageUrl,
  DateTime? scheduledTime,
  String? notificationSound,
  required List<DocumentReference> userRefs,
  required String initialPageName,
  required Map<String, dynamic> parameterData,
}) {
  if ((notificationTitle ?? '').isEmpty || (notificationText ?? '').isEmpty) {
    return;
  }
  final serializedParameterData = serializeParameterData(parameterData);
  final pushNotificationData = {
    'notification_title': notificationTitle,
    'notification_text': notificationText,
    if (notificationImageUrl != null)
      'notification_image_url': notificationImageUrl,
    if (scheduledTime != null) 'scheduled_time': scheduledTime,
    if (notificationSound != null) 'notification_sound': notificationSound,
    'user_refs': userRefs.map((u) => u.path).join(','),
    'initial_page_name': initialPageName,
    'parameter_data': serializedParameterData,
    'sender': currentUserReference,
    'timestamp': DateTime.now(),
  };
  FirebaseFirestore.instance
      .collection(kUserPushNotificationsCollectionName)
      .doc()
      .set(pushNotificationData);
}
