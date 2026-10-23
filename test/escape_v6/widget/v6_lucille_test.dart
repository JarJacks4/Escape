// Lucille text chat: AI disclosure first, the distress path never reaches the network, and an
// offline turn offers a retry instead of a fake reply.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/escape_v6/v6.dart';
import 'package:escape/escape_v6/screens/lucille/v6_lucille_parts.dart' show kV6LucillePrompts;
import 'package:escape/escape_v6/v6_pages.dart';

import '../helpers/v6_test_harness.dart';

Future<void> _send(WidgetTester tester, String text) async {
  await tester.enterText(find.byType(TextField), text);
  await tester.pump();
  await tester.tap(pressable('Send'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 600));
}

void main() {
  setUpAll(setUpV6Environment);

  testWidgets('opens with the AI notice, greeting, prompts and a 48 px send button', (tester) async {
    final s = await resetStore();
    final api = onlineApi().install();
    final net = installNoNetwork();
    await pumpV6(tester, const V6LucilleTextScreen());
    await settle(tester);

    expect(find.text('Lucille'), findsWidgets);
    expect(find.text('AI'), findsWidgets, reason: 'AI badge next to her name');
    expect(find.text(kAiNoticeText), findsOneWidget, reason: 'every conversation starts with the disclosure');
    expect(find.textContaining("Hi Alex, I'm Lucille"), findsOneWidget);
    expect(s.lucilleMessages.single.aiNotice, isTrue);
    for (final p in kV6LucillePrompts) {
      expect(find.text(p, skipOffstage: false), findsOneWidget);
    }
    expectTapTarget(tester, pressable('Send'), what: 'send button');
    expect(tester.widget<V6Pressable>(pressable('Send')).onTap, isNull, reason: 'empty draft');
    expectTapTarget(tester, pressable('Switch to voice'), what: 'voice button');
    expectTapTarget(tester, pressable('Back'), what: 'back button');

    expect(net.clientsCreated, 0);
    expect(api.calls, isEmpty);
    await endV6Test(tester);
  });

  testWidgets('distress: safe reply + urgent Support sheet, and no network call is made', (tester) async {
    final s = await resetStore();
    final api = onlineApi().install();
    final net = installNoNetwork();
    await pumpV6(tester, const V6LucilleTextScreen());
    await settle(tester);

    await _send(tester, 'I don’t want to be here anymore'); // curly apostrophe, as typed on iOS
    await settle(tester);

    expect(find.text("You don't have to do this alone"), findsOneWidget);
    expect(find.text('Call or text 988'), findsOneWidget);
    expect(net.clientsCreated, 0, reason: 'the message never left the phone');
    expect(api.calls, isEmpty, reason: 'no /v1 call either (no speak, no suggestions)');

    await tester.ensureVisible(cta("I'm okay for now"));
    await tester.tap(cta("I'm okay for now"));
    await settle(tester);

    expect(s.lucilleMessages.map((m) => m.text).toList(), [
      s.lucilleMessages.first.text, // greeting
      'I don’t want to be here anymore',
      kDistressReply,
    ]);
    expect(find.text(kDistressReply, skipOffstage: false), findsOneWidget);
    expect(find.text('typing…'), findsNothing);
    expect(net.clientsCreated, 0);
    await endV6Test(tester);
  });

  testWidgets('a seed prompt with distress is caught too', (tester) async {
    final s = await resetStore();
    final net = installNoNetwork();
    onlineApi().install();
    await pumpV6(tester, const V6LucilleTextScreen(seed: 'I feel hopeless'));
    await settle(tester);
    expect(find.text("You don't have to do this alone"), findsOneWidget);
    expect(s.lucilleMessages.last.text, kDistressReply);
    expect(net.clientsCreated, 0);
    await tester.ensureVisible(cta("I'm okay for now"));
    await tester.tap(cta("I'm okay for now"));
    await settle(tester);
    await endV6Test(tester);
  });

  testWidgets('offline: an ordinary message shows "Couldn\'t reach Lucille" and never invents a reply',
      (tester) async {
    final s = await resetStore();
    onlineApi().install();
    final net = installNoNetwork();
    await pumpV6(tester, const V6LucilleTextScreen());
    await settle(tester);

    await _send(tester, 'Help me plan a calm evening');
    await settle(tester);

    expect(net.clientsCreated, greaterThan(0), reason: 'a normal turn does go to the /chat pipeline');
    expect(find.text("Couldn't reach Lucille. Tap to try again.", skipOffstage: false), findsOneWidget);
    expect(s.lucilleMessages.where((m) => m.fromLucille).length, 1, reason: 'only the greeting');
    expect(find.text('typing…'), findsNothing);
    await endV6Test(tester);
  });

  testWidgets('teen: the AI notice repeats after 5 Lucille turns', (tester) async {
    final s = await resetStore();
    onlineApi().install();
    s.ageBand = V6AgeBand.teen;
    await pumpV6(tester, const V6LucilleTextScreen());
    await settle(tester);
    for (var i = 1; i <= 5; i++) {
      s.pushLucille('reply $i', fromLucille: true);
    }
    await settle(tester);
    expect(find.text(kAiNoticeText, skipOffstage: false), findsNWidgets(2));
    await scrollThrough(tester);
    await endV6Test(tester);
  });
}
