// Daily plan (kind tasks, add / complete / remove, Lucille's server plan, distress in a task) and
// Progress (empty week, offline, real numbers only).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/escape_v6/v6.dart';
import 'package:escape/escape_v6/v6_pages.dart';

import '../helpers/v6_test_harness.dart';

Finder _check(String title, {bool done = false}) =>
    pressable(done ? '$title, done. Mark not done' : 'Mark $title done');

void main() {
  setUpAll(setUpV6Environment);

  group('Daily plan', () {
    testWidgets('copy, add a task, complete it, progress updates', (tester) async {
      final s = await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6DailyPlanScreen());

      expect(find.text("Today's plan"), findsOneWidget);
      expect(find.text('0 of 5 done'), findsOneWidget);
      expect(find.text('Small steps count.'), findsOneWidget);
      expect(find.text('Check in with yourself', skipOffstage: false), findsOneWidget);
      final add = pressable('Add task');
      expectTapTarget(tester, add, what: 'add button');
      expect(tester.widget<V6Pressable>(add).onTap, isNull, reason: 'nothing to add yet');

      await tester.enterText(find.byType(TextField), 'Drink a glass of water');
      await tester.pump();
      expect(tester.widget<V6Pressable>(add).onTap, isNotNull);
      await tester.tap(add);
      await settle(tester);

      expect(s.tasks.last.title, 'Drink a glass of water');
      expect(find.text('0 of 6 done'), findsOneWidget);
      await scrollTo(tester, find.text('Drink a glass of water'));
      expectTapTarget(tester, _check('Drink a glass of water'), what: 'check circle');

      await tester.tap(_check('Drink a glass of water'));
      await settle(tester);
      expect(s.tasks.last.done, isTrue);
      expect(find.text('1 of 6 done'), findsOneWidget);
      expect(_check('Drink a glass of water', done: true), findsOneWidget);
      expect(find.text('Nice momentum.', skipOffstage: false), findsOneWidget);
      await scrollThrough(tester);
      await endV6Test(tester);
    });

    testWidgets('everything done: a quiet success state, no confetti', (tester) async {
      final s = await resetStore();
      onlineApi().install();
      for (final t in s.tasks) {
        t.done = true;
      }
      await pumpV6(tester, const V6DailyPlanScreen());
      expect(find.text('You did it all.'), findsOneWidget);
      expect(find.textContaining('Rest counts too.'), findsOneWidget);
      await endV6Test(tester);
    });

    testWidgets('own tasks swipe away; Lucille\'s plan steps are marked and cannot be removed', (tester) async {
      final s = await resetStore();
      onlineApi().install();
      await s.refreshFromServer();
      s.addTask('Text a friend');
      await pumpV6(tester, const V6DailyPlanScreen());

      await scrollTo(tester, find.text('Walk for 10 minutes'));
      expect(find.byIcon(Icons.auto_awesome_rounded), findsWidgets, reason: "Lucille's steps carry a spark");
      final planRow = find.ancestor(of: find.text('Walk for 10 minutes'), matching: find.byType(Dismissible));
      expect(planRow, findsNothing, reason: 'server plan steps are not swipeable');

      await scrollTo(tester, find.text('Text a friend'));
      await tester.drag(find.text('Text a friend'), const Offset(-500, 0));
      await settle(tester);
      expect(s.tasks.any((t) => t.title == 'Text a friend'), isFalse);
      expect(find.text('Text a friend'), findsNothing);
      await endV6Test(tester);
    });

    testWidgets('ticking a plan step awards coins from the server', (tester) async {
      final s = await resetStore();
      final api = onlineApi().install();
      await s.refreshFromServer();
      await pumpV6(tester, const V6DailyPlanScreen());
      await scrollTo(tester, find.text('Walk for 10 minutes'));
      await tester.tap(_check('Walk for 10 minutes'));
      await settle(tester);
      expect(api.where('POST', '/v1/selfcare/plans/plan-7/items/i1/complete'), hasLength(1));
      expect(s.coins, 125);
      await endV6Test(tester);
    });

    testWidgets('a distressing task is not added: safe reply + urgent Support sheet', (tester) async {
      final s = await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6DailyPlanScreen());
      final before = s.tasks.length;
      await tester.enterText(find.byType(TextField), 'end it all tonight');
      await tester.pump();
      await tester.tap(pressable('Add task'));
      await settle(tester);
      expect(s.tasks.length, before);
      expect(find.text("You don't have to do this alone"), findsOneWidget);
      await tester.ensureVisible(cta("I'm okay for now"));
      await tester.tap(cta("I'm okay for now"));
      await settle(tester);
      expect(find.text(kDistressReply), findsOneWidget);
      await endV6Test(tester);
    });

    testWidgets('tapping an open task starts it', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6DailyPlanScreen(), overShell: true);
      await scrollTo(tester, pressable('Start Two minutes of slow breathing'));
      await tester.tap(pressable('Start Two minutes of slow breathing'));
      await settle(tester);
      expect(find.text('Long Exhale'), findsOneWidget);
      expectCta(tester, 'Start');
      await endV6Test(tester);
    });
  });

  group('Progress', () {
    testWidgets('empty week: honest empty state with a check-in CTA', (tester) async {
      final s = await resetStore();
      onlineApi().install();
      s.minutesToday = 4;
      await pumpV6(tester, const V6ProgressScreen());
      await settle(tester);

      expect(find.text('Your progress'), findsOneWidget);
      expect(find.text('Mindful minutes'), findsOneWidget);
      expect(find.text('4'), findsWidgets);
      expect(find.text('day streak'), findsOneWidget);
      expect(find.text('Best 9', skipOffstage: false), findsOneWidget);
      await scrollTo(tester, find.text('Sacral · Svadhisthana'));
      expect(find.text('140 coins to Solar Plexus.'), findsOneWidget);
      await scrollTo(tester, find.text('Mood this week'));
      expect(find.text('No check-ins this week yet. Check in and your week takes shape here.', skipOffstage: false),
          findsOneWidget);
      await scrollTo(tester, cta('Check in now'));
      expectCta(tester, 'Check in now');
      expect(find.text("Couldn't reach Escape. Try again"), findsNothing);
      await scrollThrough(tester);
      await endV6Test(tester);
    });

    testWidgets("today's local check-in shows even before the server has it", (tester) async {
      final s = await resetStore();
      onlineApi().install();
      s.checkIn = V6CheckIn(mood: V6Mood.calm, at: DateTime.now());
      await pumpV6(tester, const V6ProgressScreen());
      await settle(tester);
      await scrollTo(tester, find.text('Mood this week'));
      expect(cta('Check in now'), findsNothing);
      expect(find.text('Each orb is the last way you checked in that day.', skipOffstage: false), findsOneWidget);
      await endV6Test(tester);
    });

    testWidgets('offline: no invented numbers, a calm retry', (tester) async {
      await resetStore();
      final api = FakeApi(offline: true).install();
      await pumpV6(tester, const V6ProgressScreen());
      await settle(tester);

      expect(find.text('—'), findsWidgets, reason: 'streak / coins unknown, not zero');
      await scrollTo(tester, find.text("Couldn't load your moods right now. Nothing is lost."));
      await scrollTo(tester, find.text("Couldn't reach Escape. Try again"));
      final calls = api.calls.length;
      api.offline = false;
      await tester.tap(find.text("Couldn't reach Escape. Try again"));
      await settle(tester);
      expect(api.calls.length, greaterThan(calls));
      expect(find.text("Couldn't reach Escape. Try again"), findsNothing);
      await endV6Test(tester);
    });
  });
}
