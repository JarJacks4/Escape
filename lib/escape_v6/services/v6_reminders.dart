// Escape v6 — the gentle daily mood check-in reminder (one local notification, user-set time).
//
// Copy is calm and optional ("no spam"): one reminder a day, never streak threats.
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

import '/flutter_flow/quest_reminder_service.dart';

class V6Reminders {
  V6Reminders._();

  static const int _id = 7010;
  static final FlutterLocalNotificationsPlugin _n = FlutterLocalNotificationsPlugin();

  /// Asks for notification permission (iOS alert / Android 13+). Returns true if allowed.
  static Future<bool> requestPermission() async {
    if (kIsWeb) return false;
    try {
      final s = await Permission.notification.request();
      return s.isGranted || s.isLimited || s.isProvisional;
    } catch (e) {
      debugPrint('V6Reminders permission: $e');
      return false;
    }
  }

  static tz.TZDateTime nextAt(tz.TZDateTime now, int hour, int minute) {
    var t = tz.TZDateTime(now.location, now.year, now.month, now.day, hour, minute);
    if (!t.isAfter(now)) t = t.add(const Duration(days: 1));
    return t;
  }

  static Future<bool> scheduleDaily({required int hour, required int minute}) async {
    if (kIsWeb) return false;
    try {
      await QuestReminderService.initialize(); // sets up the plugin + time zone once
      await cancel();
      await _n.zonedSchedule(
        id: _id,
        title: 'How are you feeling?',
        body: 'A 30-second check-in with Lucille, whenever you are ready.',
        scheduledDate: nextAt(tz.TZDateTime.now(tz.local), hour, minute),
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'mood_checkin',
            'Mood check-in',
            channelDescription: 'One gentle daily reminder to check in',
            importance: Importance.defaultImportance,
            priority: Priority.defaultPriority,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'v6CheckIn',
      );
      return true;
    } catch (e) {
      debugPrint('V6Reminders schedule: $e');
      return false;
    }
  }

  static Future<void> cancel() async {
    if (kIsWeb) return;
    try {
      await QuestReminderService.initialize();
      await _n.cancel(id: _id);
    } catch (_) {}
  }
}
