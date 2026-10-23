// On-device safety rules: distress detection (runs before any text leaves the phone) and the age
// gate (13+ to use Escape, teen protections until 18).
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/escape_v6/v6.dart';

void main() {
  group('detectDistress', () {
    const positives = <String>[
      'I want to kill myself',
      'sometimes I think about hurting... no, I want to hurt myself',
      'I keep thinking about self-harm',
      'self harm has been on my mind',
      'I wanted to die last night',
      'I want to die',
      'I started cutting myself again',
      'I cut myself',
      'I think I might overdose',
      'Having SUICIDAL thoughts',
      'suicide',
      'I just want to end it',
      'thinking about ending my life',
      'I want to end everything',
      "I don't want to be here anymore",
      'I don’t want to be here anymore', // iOS curly apostrophe
      'I dont want to live',
      'I don’t want to wake up tomorrow',
      "I can't go on",
      'I can’t do this anymore',
      'i cant keep going',
      "there's no reason to live",
      'everyone would be better off without me',
      'I feel hopeless',
      'HOPELESS',
    ];

    const negatives = <String>[
      "I'm dying to see it",
      'I’m dying to see the new film',
      'This workout is killing me',
      'I could kill for a coffee',
      'I hurt my knee at football',
      'My back hurts me a little', // "hurts" is not "hurt me"
      'the end of the movie was great',
      'I want to live by the sea one day',
      'Let\'s cut to the chase',
      'I cut my hair',
      'I can go on a walk later',
      'I feel hopeful today',
      'Happy, a bit tired',
      '',
    ];

    for (final t in positives) {
      test('flags: "$t"', () => expect(detectDistress(t), isTrue));
    }
    for (final t in negatives) {
      test('does not flag: "$t"', () => expect(detectDistress(t), isFalse));
    }

    test('the safe reply and AI notice copy are present and plain', () {
      expect(kDistressReply, contains('real person'));
      expect(kAiNoticeText, contains('AI companion'));
      expect(kAiNoticeText, contains('not a person'));
    });

    test('crisis lines: 988 call/text, Crisis Text Line, 911 and a worldwide finder', () {
      final uris = kCrisisLines.map((l) => l.uri).toList();
      expect(uris, containsAll(['tel:988', 'sms:741741?body=HOME', 'tel:911', 'https://findahelpline.com']));
      for (final l in kCrisisLines) {
        expect(l.label.trim(), isNotEmpty);
        expect(l.detail.trim(), isNotEmpty);
        expect(Uri.tryParse(l.uri), isNotNull);
      }
    });
  });

  group('age gate', () {
    final now = DateTime(2026, 10, 22);

    test('ageFrom counts the birthday month as passed', () {
      expect(ageFrom(2013, 10, now), 13); // born Oct 2013
      expect(ageFrom(2013, 11, now), 12); // born Nov 2013
      expect(ageFrom(2013, 9, now), 13);
      expect(ageFrom(2008, 10, now), 18);
      expect(ageFrom(2008, 11, now), 17);
      expect(ageFrom(2009, 1, now), 17);
      expect(ageFrom(2026, 1, now), 0);
    });

    test('bandForAge edges 12 / 13 / 17 / 18', () {
      expect(bandForAge(0), V6AgeBand.under13);
      expect(bandForAge(12), V6AgeBand.under13);
      expect(bandForAge(13), V6AgeBand.teen);
      expect(bandForAge(17), V6AgeBand.teen);
      expect(bandForAge(18), V6AgeBand.adult);
      expect(bandForAge(90), V6AgeBand.adult);
      expect(kMinAge, 13);
      expect(kAdultAge, 18);
    });

    test('end to end: month boundary decides 12 vs 13 and 17 vs 18', () {
      expect(bandForAge(ageFrom(2013, 11, now)), V6AgeBand.under13);
      expect(bandForAge(ageFrom(2013, 10, now)), V6AgeBand.teen);
      expect(bandForAge(ageFrom(2008, 11, now)), V6AgeBand.teen);
      expect(bandForAge(ageFrom(2008, 10, now)), V6AgeBand.adult);
    });
  });
}
