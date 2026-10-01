import 'package:escape/flutter_flow/custom_functions.dart' as functions;
import 'package:escape/flutter_flow/quest_reminder_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('Quest progress', () {
    test('counts consecutive days and ignores duplicate same-day entries', () {
      final today = DateTime.now();
      final checkIns = [
        DateTime(today.year, today.month, today.day),
        DateTime(today.year, today.month, today.day, 18),
        DateTime(today.year, today.month, today.day - 1),
        DateTime(today.year, today.month, today.day - 2),
      ];

      expect(functions.challengeStreak(checkIns), 3);
      expect(functions.checkedInToday(checkIns), isTrue);
    });

    test('resets the current streak after a missed day', () {
      final today = DateTime.now();
      final checkIns = [
        DateTime(today.year, today.month, today.day - 2),
        DateTime(today.year, today.month, today.day - 3),
      ];

      expect(functions.challengeStreak(checkIns), 0);
      expect(functions.checkedInToday(checkIns), isFalse);
    });

    test('clamps progress and remaining days at completion', () {
      expect(functions.challengeProgress(8, 7), 1.0);
      expect(functions.challengeDaysLeft(8, 7), 0);
      expect(functions.challengePercentLabel(5 / 7), '71%');
    });

    test('labels completed, missed, today, and upcoming days', () {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = DateTime(now.year, now.month, now.day - 1);
      final tomorrow = DateTime(now.year, now.month, now.day + 1);

      expect(functions.challengeDayStatus(today, [today]), 'Completed');
      expect(functions.challengeDayStatus(yesterday, const []), 'Missed');
      expect(functions.challengeDayStatus(today, const []), 'Today');
      expect(functions.challengeDayStatus(tomorrow, const []), 'Upcoming');
    });
  });

  group('Quest reminder time', () {
    setUpAll(tz.initializeTimeZones);

    test('uses today at 9 AM when that time is still ahead', () {
      final location = tz.getLocation('Africa/Casablanca');
      final now = tz.TZDateTime(location, 2026, 10, 1, 8, 30);

      expect(
        nextDailyQuestReminder(now),
        tz.TZDateTime(location, 2026, 10, 1, 9),
      );
    });

    test('uses the next calendar day after 9 AM', () {
      final location = tz.getLocation('Africa/Casablanca');
      final now = tz.TZDateTime(location, 2026, 10, 1, 9);

      expect(
        nextDailyQuestReminder(now),
        tz.TZDateTime(location, 2026, 10, 2, 9),
      );
    });

    test('keeps 9 AM across a daylight-saving change', () {
      final location = tz.getLocation('America/New_York');
      final now = tz.TZDateTime(location, 2026, 10, 31, 10);
      final next = nextDailyQuestReminder(now);

      expect(next, tz.TZDateTime(location, 2026, 11, 1, 9));
      expect(next.hour, 9);
    });
  });
}
