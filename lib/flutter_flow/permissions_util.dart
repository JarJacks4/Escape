import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';

const kPermissionStateToBool = {
  PermissionStatus.granted: true,
  PermissionStatus.limited: true,
  PermissionStatus.denied: false,
  PermissionStatus.restricted: false,
  PermissionStatus.permanentlyDenied: false,
};

final locationPermission = Permission.location;
final cameraPermission = Permission.camera;
final photoLibraryPermission = Permission.photos;
final microphonePermission = Permission.microphone;
final notificationsPermission = Permission.notification;

Future<bool> getPermissionStatus(Permission setting) async {
  final status = await setting.status;
  return kPermissionStateToBool[status]!;
}

Future<void> requestPermission(Permission setting) async {
  if (setting == Permission.photos && isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      await Permission.storage.request();
    } else {
      await Permission.photos.request();
    }
  }
  await setting.request();
}

Future<bool> requestNotificationPermissionWithSettings(
  BuildContext context,
) async {
  if (await getPermissionStatus(notificationsPermission)) return true;

  await requestPermission(notificationsPermission);
  if (await getPermissionStatus(notificationsPermission)) return true;
  if (!context.mounted) return false;

  final shouldOpenSettings = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Notifications are turned off'),
          content: const Text(
            'To receive notifications from Escape, allow notifications in your device settings.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Not now'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ) ??
      false;
  if (shouldOpenSettings) await openAppSettings();
  return false;
}
