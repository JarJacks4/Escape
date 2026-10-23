// Sessions: exercise detail → player (start / pause / resume / end early), the grounding player
// to completion → mood shift → reward, and the Hero continuity of the orb between pages.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/escape_v6/v6.dart';
import 'package:escape/escape_v6/v6_pages.dart';

import '../helpers/v6_test_harness.dart';

Finder _heroWithTag(Object tag) =>
    find.byWidgetPredicate((w) => w is Hero && w.tag == tag, description: 'Hero($tag)');

void main() {
  setUpAll(setUpV6Environment);

  group('exercise detail', () {
    testWidgets('copy, info card expands into steps, Start pill ≥ 48 px', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6ExerciseDetailScreen(id: 'box-breathing'));

      expect(find.text('Box Breathing'), findsOneWidget);
      expect(find.text('BREATHWORK'), findsOneWidget);
      expect(find.text('4 min · Seated · 4 minutes'), findsOneWidget);
      expect(find.text('In 4 · hold 4 · out 4 · hold 4'), findsOneWidget);
      expectCta(tester, 'Start');
      expectTapTarget(tester, pressable('How it works'), what: 'steps button');
      expectTapTarget(tester, pressable('Close'), what: 'close button');

      await tester.tap(find.text('4 min · Seated · 4 minutes'));
      await settle(tester);
      expect(find.text('Hold for 4'), findsWidgets, reason: 'steps are shown');
      expect(find.text('WHY IT HELPS', skipOffstage: false), findsOneWidget);
      await scrollThrough(tester);
      await endV6Test(tester);
    });

    testWidgets('photo session keeps text legible and still has Start', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6ExerciseDetailScreen(id: 'deep-sleep'));
      expect(find.text('Deep Sleep'), findsOneWidget);
      expectCta(tester, 'Start');
      await endV6Test(tester);
    });

    testWidgets('an unknown id (old deeplink) shows "This session moved", never a crash', (tester) async {
      await resetStore();
      await pumpV6(tester, const V6ExerciseDetailScreen(id: 'retired-session'));
      expect(find.text('This session moved'), findsOneWidget);
      expectCta(tester, 'Back');
      await endV6Test(tester);
    });

    testWidgets('"How it works" sheet → Start opens the player', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6ExerciseDetailScreen(id: 'calm-478'), overShell: true);
      await tester.tap(pressable('How it works'));
      await settle(tester);
      expect(find.text('How it works'), findsOneWidget);
      expect(cta('Start'), findsNWidgets(2), reason: 'page CTA + sheet CTA');
      await tester.tap(cta('Start').last);
      await settle(tester);
      expect(find.text('Calm Breathing 4·7·8'), findsOneWidget);
      expect(find.byIcon(Icons.pause_rounded), findsOneWidget);
      await endV6Test(tester);
    });
  });

  group('player', () {
    testWidgets('detail → Start → breathing guide → pause / resume → end early without saving', (tester) async {
      await resetStore();
      final api = onlineApi().install();
      await pumpV6(tester, const V6ExerciseDetailScreen(id: 'box-breathing'), overShell: true);

      await tapCta(tester, 'Start');
      await settle(tester);
      expect(find.text('Box Breathing'), findsOneWidget);
      // The phase follows the wall clock (Stopwatch), so accept whichever phase is showing.
      expect(
          find.byWidgetPredicate((w) => w is Text && const {'Breathe in', 'Hold', 'Breathe out'}.contains(w.data)),
          findsOneWidget);
      expect(find.textContaining(' left'), findsOneWidget);
      expect(find.text('Haptics'), findsOneWidget);
      expect(find.text("Lucille's voice"), findsOneWidget);
      expectTapTarget(tester, pressable('Pause'), what: 'pause button');
      expectTapTarget(tester, pressable('End session'), what: 'end button');

      // Pause: no timer pressure.
      await tester.tap(pressable('Pause'));
      await settle(tester);
      expect(find.text('Take your time'), findsOneWidget);
      expect(find.text('Paused'), findsWidgets);
      expect(find.textContaining(' left'), findsNothing);
      expect(pressable('Resume'), findsOneWidget);

      // Resume.
      await tester.tap(pressable('Resume'));
      await settle(tester);
      expect(find.text('Take your time'), findsNothing);
      expect(pressable('Pause'), findsOneWidget);

      // End early (< 30 s): only "Keep going" or leave.
      await tester.tap(pressable('End session'));
      await settle(tester);
      expect(find.text('End early?'), findsOneWidget);
      expectCta(tester, 'Keep going');
      expect(cta('Finish and reflect'), findsNothing);
      await tapText(tester, 'Leave without saving');
      await settle(tester);

      expect(find.text('BREATHWORK'), findsOneWidget, reason: 'back on the detail page');
      expect(api.where('POST', '/v1/sessions/complete'), isEmpty);
      await endV6Test(tester);
    });

    testWidgets('"Keep going" resumes the session', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6ExercisePlayerScreen(id: 'anxiety-relief'), overShell: true);
      expect(find.text('Anxiety Relief'), findsOneWidget);
      expect(find.text('Let your shoulders drop away from your ears.'), findsOneWidget, reason: 'first script line');
      expect(find.text('Haptics'), findsNothing, reason: 'no breath haptics for a meditation');
      await tester.tap(pressable('End session'));
      await settle(tester);
      await tapCta(tester, 'Keep going');
      await settle(tester);
      expect(find.text('End early?'), findsNothing);
      expect(pressable('Pause'), findsOneWidget);
      await endV6Test(tester);
    });

    testWidgets('grounding to completion → mood shift → reward with server coins', (tester) async {
      final s = await resetStore();
      final api = onlineApi().install();
      await s.refreshFromServer();
      s.checkIn = V6CheckIn(mood: V6Mood.restless, at: DateTime.now());
      await pumpV6(tester, const V6ExercisePlayerScreen(id: 'grounding-54321'), overShell: true);

      expect(find.text('Step 1 of 5'), findsOneWidget);
      expect(find.text('5 things you can see'), findsOneWidget);
      for (var i = 0; i < 4; i++) {
        expectCta(tester, 'Next');
        await tapCta(tester, 'Next');
      }
      expect(find.text('1 thing you can taste'), findsOneWidget);
      await tapCta(tester, 'Finish');
      await settle(tester, const Duration(seconds: 1));

      final body = api.where('POST', '/v1/sessions/complete').single.body as Map;
      expect(body['sessionId'], 'grounding-54321');
      expect(body['area'], 'reset');
      expect(body['moodBefore'], 'restless');
      expect(s.lastSession?.coins, 10);

      // Mood shift (the player replaced itself, so Back never lands in a finished session).
      expect(find.text('Has your mood shifted?'), findsOneWidget);
      expectCta(tester, 'Next', enabled: false);
      await tapText(tester, 'A bit better');
      expect(find.text('A bit better'), findsWidgets);
      expectCta(tester, 'Next');
      await tapCta(tester, 'Next');
      await settle(tester);
      expect(find.text('How do you feel now?'), findsOneWidget);
      await tapText(tester, 'Calm');
      expectCta(tester, 'Continue');
      await tapCta(tester, 'Continue');
      await settle(tester, const Duration(seconds: 1));

      // Reward.
      expect(find.text('Well done, Alex.'), findsOneWidget);
      expect(find.text('You completed 5·4·3·2·1 Grounding.'), findsOneWidget);
      await scrollTo(tester, find.text('+10'));
      expect(find.text('+10'), findsOneWidget);
      await scrollTo(tester, find.text('5 days'));
      expect(find.text('5 days'), findsOneWidget);
      expectCta(tester, 'Back to Home');
      expect(s.lastSession?.shift, 1);
      expect(s.lastSession?.afterMood, V6Mood.calm);
      expect(s.minutesToday, 1, reason: 'grounding is untimed: a quick finish counts its real minutes (min 1)');

      await tapCta(tester, 'Back to Home');
      await settle(tester);
      expect(find.text(kShellStub), findsOneWidget);
      await endV6Test(tester);
    });
  });

  group('mood shift & reward', () {
    testWidgets('a negative shift lands on the reward page, then the gentle Support sheet', (tester) async {
      final s = await resetStore();
      onlineApi().install();
      s.lastSession = const V6SessionResult(
          area: V6Area.mind, id: 'box-breathing', title: 'Box Breathing', minutes: 4, beforeMood: V6Mood.tired);
      await pumpV6(tester, const V6MoodShiftScreen(), overShell: true);

      expect(find.text('BOX BREATHING · QUESTION 1 OF 2'), findsOneWidget);
      await tapText(tester, 'Much worse');
      expect(find.textContaining('Thanks for being honest', skipOffstage: false), findsOneWidget);
      await tapCta(tester, 'Next');
      await settle(tester);
      await tapCta(tester, 'Continue');
      await settle(tester);
      expect(find.text('Well done, Alex.'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 700)); // the sheet waits for the reward page
      await settle(tester);
      expect(find.text('Would some support help?'), findsOneWidget);
      expect(s.lastSession?.shift, -2);
      await tester.ensureVisible(cta("I'm okay for now"));
      await tester.tap(cta("I'm okay for now"));
      await settle(tester);
      await endV6Test(tester);
    });

    testWidgets('Skip on question 1 records nothing', (tester) async {
      final s = await resetStore();
      onlineApi().install();
      s.lastSession = const V6SessionResult(area: V6Area.reset, id: 'long-exhale', title: 'Long Exhale', minutes: 2);
      await pumpV6(tester, const V6MoodShiftScreen(), overShell: true);
      expectTapTarget(tester, pressable('Skip'), what: 'Skip link');
      await tester.tap(pressable('Skip'));
      await settle(tester);
      expect(find.text('Well done, Alex.'), findsOneWidget);
      expect(s.lastSession?.shift, isNull);
      await endV6Test(tester);
    });

    testWidgets('reward without a session (deeplink) is still a calm page', (tester) async {
      await resetStore();
      await pumpV6(tester, const V6RewardScreen());
      expect(find.text('All done'), findsOneWidget);
      expectCta(tester, 'Back to Home');
      await endV6Test(tester);
    });

    testWidgets('reward offline: no invented coins or streak', (tester) async {
      final s = await resetStore();
      s.lastSession = const V6SessionResult(area: V6Area.mind, id: 'basic-breathing', title: 'Basic Breathing', minutes: 3);
      await pumpV6(tester, const V6RewardScreen());
      expect(find.text('Well done, Alex.'), findsOneWidget);
      expect(find.textContaining('day', skipOffstage: false).evaluate().where((e) {
        final w = e.widget;
        return w is Text && RegExp(r'^\d+ days?$').hasMatch(w.data ?? '');
      }), isEmpty);
      await scrollThrough(tester);
      await endV6Test(tester);
    });
  });

  group('Hero continuity (motion on)', () {
    testWidgets('Reset orb → exercise detail orb → player orb share one tag, no duplicates', (tester) async {
      await resetStore(motion: true);
      onlineApi().install();
      final tag = v6Exercise('one-minute-reset')!.heroTag;
      await pumpV6(tester, const V6ResetScreen(), motion: true, overShell: true);
      await tester.pump(const Duration(seconds: 2)); // ambient fade, rise-ins, poster fallback

      expect(_heroWithTag(tag), findsOneWidget, reason: 'one source orb on Reset');
      await tester.tap(pressable('One-Minute Reset details'));
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 60)); // mid-flight frames
      }
      await tester.pump(const Duration(seconds: 1));
      expect(tester.takeException(), isNull);
      expect(_heroWithTag(tag), findsOneWidget, reason: 'the detail orb continues the flight');

      await tapCta(tester, 'Start');
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 60));
      }
      await tester.pump(const Duration(seconds: 1));
      expect(tester.takeException(), isNull);
      expect(_heroWithTag(tag), findsOneWidget, reason: 'the player orb continues it again');
      await endV6Test(tester);
    });

    testWidgets('reduce motion: no Hero flights at all', (tester) async {
      await resetStore();
      await pumpV6(tester, const V6ExerciseDetailScreen(id: 'box-breathing'));
      expect(find.byType(Hero), findsNothing);
      await endV6Test(tester);
    });
  });
}
