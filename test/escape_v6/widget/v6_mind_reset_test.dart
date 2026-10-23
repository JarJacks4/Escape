// Mind (Lucille's pick, energy centers, guided sessions) and Reset (one obvious tool first, human
// support always visible).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/escape_v6/v6.dart';
import 'package:escape/escape_v6/v6_pages.dart';

import '../helpers/v6_test_harness.dart';

Finder _glass(String semanticLabelStart) => find.byWidgetPredicate(
      (w) => w is V6Pressable && (w.semanticLabel ?? '').startsWith(semanticLabelStart),
      description: 'card "$semanticLabelStart…"',
    );

void main() {
  setUpAll(setUpV6Environment);

  group('Mind', () {
    testWidgets('copy, Lucille\'s pick explains itself, every session is listed', (tester) async {
      final s = await resetStore();
      onlineApi().install();
      s.checkIn = V6CheckIn(mood: V6Mood.restless, at: DateTime.now());
      await pumpV6(tester, const V6MindScreen());

      expect(find.text('Mind'), findsOneWidget);
      expect(find.text('Quiet the noise, one breath at a time.'), findsOneWidget);
      expect(find.text('LET LUCILLE CHOOSE'), findsOneWidget);
      expect(find.text('ADHD & Overthinking'), findsWidgets, reason: 'restless → adhd-overthinking');
      expect(find.textContaining("Because you're feeling restless"), findsOneWidget);
      expectTapTarget(tester, _glass('Let Lucille choose'), what: "Lucille's pick card");
      expectTapTarget(tester, pressable('How this page works'), what: 'help button');

      await scrollTo(tester, find.text('Guided sessions'));
      for (final e in kV6Exercises.where((e) => e.area == 'mind')) {
        await scrollTo(tester, find.text(e.title));
        expect(find.text(e.title), findsWidgets, reason: e.id);
      }
      await scrollThrough(tester);
      await endV6Test(tester);
    });

    testWidgets('group chips filter the sessions', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6MindScreen());
      await scrollTo(tester, find.text('Guided sessions'));
      await tapText(tester, 'Sleep');
      await settle(tester);
      expect(find.text('Deep Sleep'), findsOneWidget);
      expect(find.text('Box Breathing'), findsNothing);
      await tapText(tester, 'All');
      await settle(tester);
      await scrollTo(tester, find.text('Box Breathing'));
      expect(find.text('Box Breathing'), findsOneWidget);
      await endV6Test(tester);
    });

    testWidgets('energy center sheet: affirmation + start a short practice', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6MindScreen(), overShell: true);
      await scrollTo(tester, find.text('Energy centers'));
      expect(find.text('Root', skipOffstage: false), findsOneWidget);
      await tapText(tester, 'Root');
      await settle(tester);

      expect(find.text('Root center'), findsOneWidget);
      expect(find.text('“I am safe. I am here.”'), findsOneWidget);
      expect(find.textContaining('5·4·3·2·1 Grounding'), findsOneWidget);
      expectCta(tester, 'Start a short practice');
      await tapCta(tester, 'Start a short practice');
      await settle(tester);
      expect(find.text('5·4·3·2·1 Grounding'), findsWidgets, reason: 'opens the practice detail');
      expectCta(tester, 'Start');
      await endV6Test(tester);
    });

    testWidgets('no check-in yet: a gentle default pick', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6MindScreen());
      expect(find.text('Anxiety Relief'), findsWidgets);
      expect(find.textContaining('A gentle place to start'), findsOneWidget);
      await endV6Test(tester);
    });
  });

  group('Reset', () {
    testWidgets('one obvious tool first, support card always there', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6ResetScreen(), overShell: true);

      expect(find.text('Reset'), findsOneWidget);
      expect(find.text('Small tools for big moments.'), findsOneWidget);
      expect(find.text('One-Minute Reset'), findsOneWidget);
      expectCta(tester, 'Start now');

      await scrollTo(tester, find.text('I need support now'));
      expect(find.text('Talk to a real person, any time'), findsOneWidget);
      expectTapTarget(tester, _glass('I need support now'), what: 'support card');
      for (final title in ['Long Exhale', 'Write it out', 'Rain Reset']) {
        expect(find.text(title, skipOffstage: false), findsWidgets, reason: title);
      }
      await scrollThrough(tester);
      await endV6Test(tester);
    });

    testWidgets('"I need support now" opens the urgent sheet', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6ResetScreen());
      await tapText(tester, 'I need support now');
      await settle(tester);
      expect(find.text("You don't have to do this alone"), findsOneWidget);
      await tester.ensureVisible(cta("I'm okay for now"));
      await tester.tap(cta("I'm okay for now"));
      await settle(tester);
      await endV6Test(tester);
    });

    testWidgets('"Start now" goes straight to the player', (tester) async {
      await resetStore();
      onlineApi().install();
      await pumpV6(tester, const V6ResetScreen(), overShell: true);
      await tapCta(tester, 'Start now');
      await settle(tester);
      expect(find.text('One-Minute Reset'), findsOneWidget);
      expect(find.byIcon(Icons.pause_rounded), findsOneWidget, reason: 'the session is running');
      await endV6Test(tester);
    });
  });
}
