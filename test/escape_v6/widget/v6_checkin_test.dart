// Daily Mood Check-in: mood → tags/note → "Here's what I noticed" → saving → result, plus the
// safety paths ("I'm really struggling", a distress note, a low mood).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/escape_v6/v6.dart';
import 'package:escape/escape_v6/v6_pages.dart';

import '../helpers/v6_test_harness.dart';

const _urgentTitle = "You don't have to do this alone";
const _gentleTitle = 'Would some support help?';

Future<void> _closeSupport(WidgetTester tester) async {
  await tester.ensureVisible(cta("I'm okay for now"));
  await tester.pump(const Duration(milliseconds: 200));
  await tester.tap(cta("I'm okay for now"));
  await settle(tester);
}

void main() {
  setUpAll(setUpV6Environment);

  testWidgets('daily check-in: copy, CTA disabled until a mood, choosing a mood previews it', (tester) async {
    final s = await resetStore();
    onlineApi().install();
    await pumpV6(tester, const V6CheckInScreen(daily: true));

    expect(find.text('How are you feeling right now?'), findsOneWidget);
    expect(find.textContaining('ALEX'), findsOneWidget, reason: 'greeting eyebrow uses the first name');
    for (final m in kV6Moods) {
      expect(find.text(m.label, skipOffstage: false), findsOneWidget, reason: 'mood orb ${m.label}');
    }
    expect(find.text("I'm really struggling"), findsOneWidget);
    expect(find.text('Not now'), findsOneWidget, reason: 'daily check-in can be skipped');
    expectCta(tester, 'Continue', enabled: false);
    expectTapTarget(tester, pressable("I'm really struggling"), what: '"I\'m really struggling" link');

    await tapText(tester, 'Focused');
    expect(s.previewMood, V6Mood.focused);
    expect(s.resolvePalette(), V6PaletteId.focused, reason: 'the whole app previews the mood');
    expectCta(tester, 'Continue');
    await scrollThrough(tester);
    await endV6Test(tester);
  });

  testWidgets('"I\'m really struggling" opens the urgent Support sheet with real people first', (tester) async {
    await resetStore();
    onlineApi().install();
    await pumpV6(tester, const V6CheckInScreen(daily: true));

    await tapText(tester, "I'm really struggling");
    await settle(tester);
    expect(find.text(_urgentTitle), findsOneWidget);
    expect(find.text('Call or text 988'), findsOneWidget);
    expect(find.text('Text HOME to 741741'), findsOneWidget);
    expect(find.text('Lucille is an AI companion, not a crisis service.'), findsOneWidget);

    await tester.tap(find.text('Call or text 988'));
    await tester.pump();
    expect(launchedUrls, contains('tel:988'));

    await _closeSupport(tester);
    expect(find.text(_urgentTitle), findsNothing);
    expect(find.text('How are you feeling right now?'), findsOneWidget, reason: 'back where they were');
    await endV6Test(tester);
  });

  testWidgets('"Not now" skips today\'s check-in', (tester) async {
    final s = await resetStore();
    onlineApi().install();
    await pumpV6(tester, const V6CheckInScreen(daily: true));
    expect(s.needsDailyCheckIn(), isTrue);
    await tapText(tester, 'Not now');
    expect(s.needsDailyCheckIn(), isFalse);
    expect(s.skippedCheckInDay, isNotNull);
    await endV6Test(tester);
  });

  testWidgets('full check-in saves locally and to the API, then explains the suggestion', (tester) async {
    final s = await resetStore();
    final api = onlineApi().install();
    await pumpV6(tester, const V6CheckInScreen(daily: true), overShell: true);

    await tapText(tester, 'Calm');
    await tapCta(tester, 'Continue');
    await settle(tester);

    expect(find.text("What's shaping it?"), findsOneWidget);
    await tapText(tester, 'Work');
    await scrollThrough(tester);
    expectCta(tester, 'Continue');
    await tapCta(tester, 'Continue');
    await settle(tester);

    expect(find.text("Here's what I noticed…"), findsOneWidget);
    expect(find.textContaining("You're feeling calm with steady energy, mostly around work"), findsOneWidget);
    await tapText(tester, 'Slow down');
    await scrollThrough(tester);
    expectCta(tester, 'Begin my day');
    await tapCta(tester, 'Begin my day');

    expect(find.text('Tuning your space…'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1)); // reduce motion: 900 ms labour illusion
    await settle(tester);

    expect(find.text('Your space is tuned to calm.'), findsOneWidget);
    await scrollTo(tester, find.text('Basic Breathing'));
    expect(find.text('Basic Breathing'), findsOneWidget);
    expect(find.textContaining("Because you're feeling calm", skipOffstage: false), findsOneWidget);
    expectCta(tester, 'Start');
    expectCta(tester, 'Go home');

    expect(s.currentMood, V6Mood.calm);
    expect(s.checkIn.intention, 'Slow down');
    expect(s.tasks.firstWhere((t) => t.id == 'checkin').done, isTrue);
    expect(s.needsDailyCheckIn(), isFalse);
    final body = api.where('POST', '/v1/mood/checkins').single.body as Map;
    expect(body['word'], 'Calm');
    expect(body['tags'], ['Work', 'intention:Slow down']);

    // Start → the suggested session's detail page.
    await tapCta(tester, 'Start');
    await settle(tester);
    expect(find.text('Basic Breathing'), findsWidgets);
    expectCta(tester, 'Start');
    await endV6Test(tester);
  });

  testWidgets('a distress note is never sent: urgent sheet + safe reply, note dropped on save', (tester) async {
    await resetStore();
    final api = onlineApi().install();
    await pumpV6(tester, const V6CheckInScreen(daily: true));

    await tapText(tester, 'Restless');
    await tapCta(tester, 'Continue');
    await settle(tester);
    await scrollTo(tester, find.byType(TextField));
    await tester.enterText(find.byType(TextField), 'honestly I don’t want to wake up tomorrow');
    await tester.pump();
    await tapCta(tester, 'Continue');
    await settle(tester);

    expect(find.text(_urgentTitle), findsOneWidget);
    await _closeSupport(tester);
    expect(find.text(kDistressReply, skipOffstage: false), findsOneWidget);
    expect(find.text("What's shaping it?", skipOffstage: false), findsOneWidget, reason: 'stays on the step');

    await tapCta(tester, 'Continue');
    await settle(tester);
    await tapCta(tester, 'Begin my day');
    await tester.pump(const Duration(seconds: 1));
    await settle(tester);

    final body = api.where('POST', '/v1/mood/checkins').single.body as Map;
    expect(body.containsKey('note'), isFalse, reason: 'the distress note never leaves the phone');
    await endV6Test(tester);
  });

  testWidgets('a low check-in offers the gentle Support sheet after the result', (tester) async {
    await resetStore();
    onlineApi().install();
    await pumpV6(tester, const V6CheckInScreen());

    expect(find.text('Not now'), findsNothing, reason: 'only the daily check-in offers "Not now"');
    await tapText(tester, 'Low');
    await tapCta(tester, 'Continue');
    await settle(tester);
    await tapCta(tester, 'Continue');
    await settle(tester);
    await tapCta(tester, 'Begin my day');
    await tester.pump(const Duration(seconds: 1));
    await settle(tester);
    expect(find.text('Your space is tuned to low.'), findsOneWidget);

    await tester.pump(const Duration(seconds: 1)); // the sheet waits 900 ms
    await settle(tester);
    expect(find.text(_gentleTitle), findsOneWidget);
    expect(find.text('Two minutes of long exhales', skipOffstage: false), findsOneWidget,
        reason: 'a tool first, people second');
    await _closeSupport(tester);
    await endV6Test(tester);
  });

  testWidgets('offline: the check-in still lands on the phone and shows the result', (tester) async {
    final s = await resetStore();
    FakeApi(offline: true).install();
    await pumpV6(tester, const V6CheckInScreen());

    await tapText(tester, 'Energized');
    await tapCta(tester, 'Continue');
    await settle(tester);
    await tapCta(tester, 'Continue');
    await settle(tester);
    await tapCta(tester, 'Begin my day');
    await tester.pump(const Duration(seconds: 1));
    await settle(tester);

    expect(find.text('Your space is tuned to energized.'), findsOneWidget);
    expect(s.currentMood, V6Mood.energized);
    await endV6Test(tester);
  });

  testWidgets('re-check later the same day: starts from today\'s answers, CTA says "Update my day"', (tester) async {
    final s = await resetStore();
    onlineApi().install();
    s.checkIn = V6CheckIn(mood: V6Mood.tired, energy: 0.2, tags: const ['Sleep'], at: DateTime.now());
    await pumpV6(tester, const V6CheckInScreen());
    expectCta(tester, 'Continue');
    expect(s.previewMood, V6Mood.tired);
    await tapCta(tester, 'Continue');
    await settle(tester);
    await tapCta(tester, 'Continue');
    await settle(tester);
    expectCta(tester, 'Update my day');
    await endV6Test(tester);
  });
}
