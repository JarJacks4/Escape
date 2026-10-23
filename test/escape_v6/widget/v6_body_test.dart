// Body: hub (body check, Lucille's pick, four sections, routines), section (10 moves + preview
// sheet + "Start all 10") and routine detail. The 3D model viewer (a WebView) and the body player
// are covered by the device plan; here moves without a GLB are previewed.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/body_sections.dart';
import 'package:escape/escape_v6/v6.dart';
import 'package:escape/escape_v6/v6_pages.dart';

import '../helpers/v6_test_harness.dart';

Finder _startsWith(String prefix) => find.byWidgetPredicate(
      (w) => w is V6Pressable && (w.semanticLabel ?? '').startsWith(prefix),
      description: 'V6Pressable "$prefix…"',
    );

Future<void> _tapPressable(WidgetTester tester, Finder f) async {
  await scrollTo(tester, f);
  await tester.tap(f.first);
  await settle(tester);
}

void main() {
  setUpAll(setUpV6Environment);

  testWidgets('hub: body check without Health, Lucille explains her pick, four sections, routines', (tester) async {
    final s = await resetStore();
    onlineApi().install();
    s.checkIn = V6CheckIn(mood: V6Mood.energized, at: DateTime.now());
    await pumpV6(tester, const V6BodyHubScreen(), overShell: true);

    expect(find.text('Body'), findsOneWidget);
    expect(find.text('Move gently, Alex. Your body keeps the score.'), findsOneWidget);
    expect(find.text('Let your body have a say'), findsOneWidget);
    expectCta(tester, 'Connect Health Connect');
    expect(find.textContaining('heart rate', skipOffstage: false), findsWidgets);

    await scrollTo(tester, find.text('LUCILLE SUGGESTS'));
    expect(find.text("You checked in energized. Let's put that energy somewhere good."), findsOneWidget);
    expect(_startsWith('Open Energy Boost'), findsOneWidget);
    await tapText(tester, 'Not quite right? Try another');
    await settle(tester);
    expect(_startsWith('Open Quick Strength'), findsOneWidget, reason: '"Try another" rotates the pick');

    await scrollTo(tester, find.text('Four ways to move'));
    for (final sec in kBodySections) {
      final card = _startsWith('${sec.title}: ');
      await scrollTo(tester, card);
      expectTapTarget(tester, card, what: '${sec.title} card');
    }
    await scrollTo(tester, find.text('Routines'));
    expect(_startsWith('Full Yoga flow, '), findsOneWidget);
    await scrollThrough(tester);
    await endV6Test(tester);
  });

  testWidgets('hub → Yoga section → move preview → Start all 10', (tester) async {
    await resetStore();
    onlineApi().install();
    await pumpV6(tester, const V6BodyHubScreen(), overShell: true);

    await _tapPressable(tester, _startsWith('Yoga: '));
    expect(find.text('Strength, balance and calm'), findsOneWidget);
    expect(find.text('10 moves'), findsWidgets);
    expectCta(tester, 'Start all 10');

    // A move without a 3D model yet: calm silhouette + steps.
    await _tapPressable(tester, _startsWith('1. Mountain Pose.'));
    expect(find.text('3D move coming soon'), findsOneWidget);
    expect(find.text('HOW TO DO IT'), findsOneWidget);
    await tester.tapAt(const Offset(180, 20)); // barrier above the sheet
    await settle(tester);
    expect(find.text('3D move coming soon'), findsNothing);

    // Every move row is a real touch target.
    for (var i = 0; i < 10; i++) {
      final row = _startsWith('${i + 1}. ');
      await scrollTo(tester, row);
      expectTapTarget(tester, row, what: 'move row ${i + 1}');
    }
    await scrollTo(tester, find.text('Shorter routines'));
    expect(find.text('Morning Wake-Up'), findsOneWidget);
    await scrollThrough(tester);

    await tapCta(tester, 'Start all 10');
    await settle(tester);
    expect(find.text('BODY PLAYER full-yoga'), findsOneWidget);
    await endV6Test(tester);
  });

  for (final sec in ['pilates', 'taichi', 'exercise']) {
    testWidgets('section "$sec" renders at 360 × 640 with 1.3× text', (tester) async {
      await resetStore();
      await pumpV6(tester, V6BodySectionScreen(id: sec));
      final s = kBodySections.firstWhere((x) => x.id == sec);
      expect(find.text(s.tagline), findsOneWidget);
      expectCta(tester, 'Start all ${s.moves.length}');
      await scrollThrough(tester);
      await endV6Test(tester);
    });
  }

  testWidgets('routine detail: copy, moves list sheet, Start', (tester) async {
    await resetStore();
    onlineApi().install();
    await pumpV6(tester, const V6BodyDetailScreen(id: 'yoga-morning-wake-up'), overShell: true);

    expect(find.text('Morning Wake-Up'), findsWidgets);
    expect(find.textContaining('min · Mat · Steady'), findsOneWidget);
    expectCta(tester, 'Start');
    final list = pressable('See all 6 moves');
    expectTapTarget(tester, list, what: 'moves list button');

    await scrollTo(tester, find.text('6 movements'));
    await _tapPressable(tester, _startsWith('1. Mountain Pose, '));
    expect(find.text('Stand with feet hip-width apart and weight even on both feet.', skipOffstage: false),
        findsWidgets, reason: 'a move expands into its steps');
    await scrollThrough(tester);

    await tester.tap(list);
    await settle(tester);
    expect(find.text('6 moves'), findsOneWidget);
    expect(find.text('1. Mountain Pose'), findsOneWidget);
    await tester.tapAt(const Offset(180, 20));
    await settle(tester);

    await tapCta(tester, 'Start');
    await settle(tester);
    expect(find.text('BODY PLAYER yoga-morning-wake-up'), findsOneWidget);
    await endV6Test(tester);
  });

  testWidgets('routine detail for an unknown id never crashes', (tester) async {
    await resetStore();
    await pumpV6(tester, const V6BodyDetailScreen(id: 'retired-routine'));
    expect(find.text("This routine isn't here any more"), findsOneWidget);
    expectCta(tester, 'Back to Body');
    await endV6Test(tester);
  });

  testWidgets('body reflection page renders', (tester) async {
    await resetStore();
    onlineApi().install();
    await pumpV6(tester, const V6BodyReflectionScreen());
    expect(tester.takeException(), isNull);
    await scrollThrough(tester);
    await endV6Test(tester);
  });
}
