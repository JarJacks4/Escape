// Onboarding (age gate → Lucille → first mood → personalize → reminders → privacy) and All Set.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/escape_v6/v6.dart';
import 'package:escape/escape_v6/v6_pages.dart';

import '../helpers/v6_test_harness.dart';

Future<void> _pickBirth(WidgetTester tester, {required int year, String month = 'Jan'}) async {
  await tapText(tester, month);
  // The year wheel is its own (lazy) list inside the step's list.
  final years = find
      .descendant(
        of: find.byWidgetPredicate((w) => w is Semantics && w.properties.label == 'Birth year'),
        matching: find.byType(Scrollable),
      )
      .first;
  await tester.ensureVisible(years);
  await tester.pump(const Duration(milliseconds: 200));
  await tester.scrollUntilVisible(find.text('$year'), 150, scrollable: years);
  await tester.pump(const Duration(milliseconds: 200));
  await tester.tap(find.text('$year'));
  await tester.pump(const Duration(milliseconds: 300));
}

void main() {
  setUpAll(setUpV6Environment);

  testWidgets('age gate: required, under-13 sees the 988 screen and nothing is saved', (tester) async {
    final s = await resetStore();
    s.hasOnboarded = false;
    onlineApi().install();
    await pumpV6(tester, const V6OnboardingScreen());

    expect(find.text('When were you born?'), findsOneWidget);
    expectCta(tester, 'Continue', enabled: false);

    final year = DateTime.now().year - 4; // first year in the list
    await _pickBirth(tester, year: year);
    expectCta(tester, 'Continue');
    await tapCta(tester, 'Continue');
    await settle(tester);

    expect(find.text('Escape is for people 13 and older.'), findsOneWidget);
    expectCta(tester, 'Call or text 988');
    expect(s.ageBand, isNull);
    expect(s.birthYear, isNull);

    await tapCta(tester, 'Call or text 988');
    expect(launchedUrls, contains('tel:988'));
    await endV6Test(tester);
  });

  testWidgets('teen: extra-protections notice, then Lucille says she reminds more often', (tester) async {
    final s = await resetStore();
    s.hasOnboarded = false;
    onlineApi().install();
    await pumpV6(tester, const V6OnboardingScreen());

    await _pickBirth(tester, year: DateTime.now().year - 15);
    await tapCta(tester, 'Continue');
    await settle(tester);
    expect(find.text('Welcome. A few extra protections are on.'), findsOneWidget);
    expect(s.ageBand, V6AgeBand.teen);

    await tapCta(tester, 'Continue');
    await settle(tester);
    expect(find.text("Hi, I'm Lucille."), findsOneWidget);
    expect(find.textContaining("Because you're under 18"), findsOneWidget);
    await endV6Test(tester);
  });

  testWidgets('adult: full flow to All Set saves profile, consents and the first mood', (tester) async {
    final s = await resetStore(name: '');
    s.hasOnboarded = false;
    final api = onlineApi().install();
    await pumpV6(tester, const V6OnboardingScreen());

    await _pickBirth(tester, year: DateTime.now().year - 30);
    await tapCta(tester, 'Continue');
    await settle(tester);
    expect(s.ageBand, V6AgeBand.adult);

    // Meet Lucille: AI disclosure up front.
    expect(find.text("Hi, I'm Lucille."), findsOneWidget);
    expect(find.textContaining('not a person or a therapist'), findsOneWidget);
    expectCta(tester, 'Hi, Lucille');
    await tapCta(tester, 'Hi, Lucille');
    await settle(tester);

    // First mood is required; picking one previews the palette.
    expect(find.text('How are you feeling?'), findsOneWidget);
    expectCta(tester, 'Continue', enabled: false);
    await tapText(tester, 'Calm');
    expect(s.previewMood, V6Mood.calm);
    expectCta(tester, 'Continue');
    await tapCta(tester, 'Continue');
    await settle(tester);

    // Personalize.
    expect(find.text("Let's personalize your journey"), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Sam');
    await tester.pump();
    await tapCta(tester, 'Continue');
    await settle(tester);

    // Reminders.
    expect(find.text('Stay in touch with yourself'), findsOneWidget);
    await scrollTo(tester, toggle('Mood Check Reminder'));
    expect(toggle('Mood Check Reminder'), findsOneWidget);
    expectTapTarget(tester, toggle('Mood Check Reminder'), what: 'reminder toggle');
    await tapCta(tester, 'Continue');
    await settle(tester);

    // Privacy: consents default off, the user turns one on.
    expect(find.text('Your inner world stays yours.'), findsOneWidget);
    await scrollTo(tester, toggle('Save my check-ins'));
    expect(tester.widget<V6Toggle>(toggle('Save my check-ins')).on, isFalse);
    await tester.tap(toggle('Save my check-ins'));
    await tester.pump(const Duration(milliseconds: 300));
    expectCta(tester, "I'm ready");
    await tapCta(tester, "I'm ready");
    await settle(tester, const Duration(seconds: 1));

    // All Set.
    expect(find.text("You're all set, Sam."), findsOneWidget);
    expect(find.textContaining('Your space is tuned to calm.'), findsOneWidget);
    expectCta(tester, 'Enter Escape');

    expect(s.hasOnboarded, isTrue);
    expect(s.profile.name, 'Sam');
    expect(s.currentMood, V6Mood.calm);
    expect(s.previewMood, isNull);
    final consents = api.where('PUT', '/v1/privacy/consents').map((c) => (c.body as Map)['flags'] as Map).toList();
    expect(consents, containsAll([
      {'wellbeing_data': true},
      {'ai_reflection': false},
      {'personalization': false},
    ]));
    expect(api.where('POST', '/v1/mood/checkins'), hasLength(1), reason: '"Save my check-ins" is on');
    await endV6Test(tester);
  });

  testWidgets('adult with "Save my check-ins" off: first mood stays on the phone', (tester) async {
    final s = await resetStore();
    s.hasOnboarded = false;
    final api = onlineApi().install();
    await pumpV6(tester, const V6OnboardingScreen());

    await _pickBirth(tester, year: DateTime.now().year - 40);
    await tapCta(tester, 'Continue');
    await settle(tester);
    await tapCta(tester, 'Hi, Lucille');
    await settle(tester);
    await tapText(tester, 'Low');
    for (var i = 0; i < 3; i++) {
      await tapCta(tester, 'Continue');
      await settle(tester);
    }
    await tapCta(tester, "I'm ready");
    await settle(tester, const Duration(seconds: 1));

    expect(s.currentMood, V6Mood.low);
    expect(api.where('POST', '/v1/mood/checkins'), isEmpty);
    expect(find.textContaining("You're all set"), findsOneWidget);
    await endV6Test(tester);
  });

  testWidgets('All Set: copy, CTA, and Enter Escape goes to the tab shell', (tester) async {
    final s = await resetStore();
    s.checkIn = V6CheckIn(mood: V6Mood.focused, at: DateTime.now());
    await pumpV6(tester, const V6AllSetScreen());

    expect(find.text("You're all set, Alex."), findsOneWidget);
    expect(find.textContaining('tuned to focused'), findsOneWidget);
    expectCta(tester, 'Enter Escape');
    await scrollTo(tester, find.text('Your daily check-in'));
    expect(find.text('Your daily check-in'), findsOneWidget);
    await scrollThrough(tester);

    await tapCta(tester, 'Enter Escape');
    await settle(tester);
    expect(find.text(kShellStub), findsOneWidget);
    await endV6Test(tester);
  });
}
