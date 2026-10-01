import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

tz.TZDateTime nextDailyQuestReminder(tz.TZDateTime now) {
  final location = now.location;
  var nextReminder = tz.TZDateTime(location, now.year, now.month, now.day, 9);
  if (!nextReminder.isAfter(now)) {
    nextReminder = tz.TZDateTime(location, now.year, now.month, now.day + 1, 9);
  }
  return nextReminder;
}

class QuestReminderService {
  QuestReminderService._();

  static const int _dailyReminderId = 7009;
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  static bool _initialized = false;

  static Future<void> initialize() async {
    if (kIsWeb || _initialized) return;

    tz.initializeTimeZones();
    try {
      final deviceTimeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(deviceTimeZone.identifier));
    } catch (error) {
      debugPrint('Could not load the device timezone: $error');
    }

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
    await _notifications.initialize(settings: settings);
    _initialized = true;
  }

  static Future<bool> scheduleDailyReminder() async {
    if (kIsWeb) return false;
    try {
      await initialize();
      await cancelDailyReminder();

      final now = tz.TZDateTime.now(tz.local);
      final nextReminder = nextDailyQuestReminder(now);

      await _notifications.zonedSchedule(
        id: _dailyReminderId,
        title: 'Your Quest is waiting',
        body: 'Complete today\'s check-in to keep your streak going.',
        scheduledDate: nextReminder,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'quest_daily_reminders',
            'Quest reminders',
            channelDescription: 'Daily reminders for active Escape Quests',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'quest_daily_check_in',
      );
      return true;
    } catch (error) {
      debugPrint('Could not schedule the Quest reminder: $error');
      return false;
    }
  }

  static Future<void> cancelDailyReminder() async {
    if (kIsWeb) return;
    await initialize();
    await _notifications.cancel(id: _dailyReminderId);
  }
}
