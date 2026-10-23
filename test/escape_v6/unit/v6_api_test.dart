// V6Api over a fake `transport`: success, offline, malformed / throwing transport, consent retry.
import 'package:flutter_test/flutter_test.dart';

import 'package:escape/escape_v6/v6.dart';

import '../helpers/v6_test_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeApi api;

  setUp(() {
    api = FakeApi().install();
    final previousPrompt = V6Api.consentPrompt;
    addTearDown(() => V6Api.consentPrompt = previousPrompt);
    V6Api.consentPrompt = null;
  });

  group('results', () {
    test('ok: status, data and map', () async {
      api.reply('GET /v1/home', homePayload());
      final r = await V6Api.home();
      expect(r.ok, isTrue);
      expect(r.status, 200);
      expect(r.error, isNull);
      expect(r.map['coins'], 120);
      expect(api.calls.single.key, 'GET /v1/home');
    });

    test('offline ({ok:false, status:0}) is a failed result, never a throw', () async {
      api.offline = true;
      final r = await V6Api.progress();
      expect(r.ok, isFalse);
      expect(r.status, 0);
      expect(r.map, isEmpty);
      expect(r.error, isNotNull);
    });

    test('server error keeps status and message', () async {
      api.reply('GET /v1/me', {'ok': false, 'status': 500, 'error': 'boom'});
      final r = await V6Api.me();
      expect(r.ok, isFalse);
      expect(r.status, 500);
      expect(r.error, 'boom');
    });

    test('a non-map answer is treated as offline', () async {
      api.on('GET /v1/me', (_) => null);
      final r = await V6Api.me();
      expect(r.ok, isFalse);
      expect(r.error, 'offline');
    });

    test('a throwing transport becomes a failed result', () async {
      api.on('GET /v1/me', (_) => throw StateError('socket closed'));
      final r = await V6Api.me();
      expect(r.ok, isFalse);
      expect(r.error, contains('socket closed'));
    });

    test('a non-map data payload gives an empty map', () async {
      api.reply('GET /v1/me', ok().map((k, v) => MapEntry(k, k == 'data' ? [1, 2, 3] : v)));
      final r = await V6Api.me();
      expect(r.ok, isTrue);
      expect(r.data, [1, 2, 3]);
      expect(r.map, isEmpty);
    });
  });

  group('request shapes', () {
    test('check-in clamps 0…1, caps tags at 12, trims the note, sends the pulse', () async {
      await V6Api.checkIn(
        word: 'Calm',
        valence: 1.4,
        energy: -0.2,
        tags: List.generate(20, (i) => 't$i'),
        note: '  hello  ',
        bpm: 72,
      );
      final c = api.calls.single;
      expect(c.key, 'POST /v1/mood/checkins');
      final b = c.body as Map;
      expect(b['valence'], 1);
      expect(b['energy'], 0);
      expect((b['tags'] as List).length, 12);
      expect(b['note'], 'hello');
      expect(b['pulse'], {'bpm': 72.0});
      expect(b['source'], 'checkin');
    });

    test('blank notes and missing pulse are left out', () async {
      await V6Api.checkIn(word: 'Low', valence: 0.2, energy: 0.3, note: '   ');
      final b = api.calls.single.body as Map;
      expect(b.containsKey('note'), isFalse);
      expect(b.containsKey('pulse'), isFalse);
    });

    test('session completion body', () async {
      await V6Api.completeSession(
          area: 'reset', sessionId: 'long-exhale', title: 'Long Exhale', minutes: 2, moodBefore: 'tired', shift: 1);
      final c = api.calls.single;
      expect(c.key, 'POST /v1/sessions/complete');
      expect(c.body, {
        'area': 'reset',
        'sessionId': 'long-exhale',
        'title': 'Long Exhale',
        'minutes': 2,
        'moodBefore': 'tired',
        'shift': 1,
      });
    });

    test('paths: plan item, suggestions (encoded word), privacy scope, consents', () async {
      await V6Api.completePlanItem('plan-7', 'i1');
      await V6Api.suggestions('home', word: 'a bit low');
      await V6Api.suggestions('mind');
      await V6Api.deleteData('mood');
      await V6Api.setConsent('voice', false);
      expect(api.calls.map((c) => c.key), [
        'POST /v1/selfcare/plans/plan-7/items/i1/complete',
        'GET /v1/suggestions?context=home&word=a+bit+low',
        'GET /v1/suggestions?context=mind',
        'DELETE /v1/privacy/data?scope=mood',
        'PUT /v1/privacy/consents',
      ]);
      expect(api.calls.last.body, {
        'flags': {'voice': false}
      });
    });
  });

  group('consent retry (GDPR Art. 9)', () {
    void needsConsentOnce(String purpose) {
      var n = 0;
      api.on('POST /v1/mood/checkins', (_) {
        n++;
        return n == 1 ? {'ok': false, 'status': 403, 'error': 'consent_required', 'consentPurpose': purpose} : ok({'id': 'c1'});
      });
    }

    test('asks once, stores the consent, retries the call', () async {
      needsConsentOnce('wellbeing_data');
      final asked = <String>[];
      V6Api.consentPrompt = (p) async {
        asked.add(p);
        return true;
      };
      final r = await V6Api.checkIn(word: 'Calm', valence: 0.8, energy: 0.5);
      expect(asked, ['wellbeing_data']);
      expect(api.calls.map((c) => c.key), [
        'POST /v1/mood/checkins',
        'PUT /v1/privacy/consents',
        'POST /v1/mood/checkins',
      ]);
      expect(api.calls[1].body, {
        'flags': {'wellbeing_data': true}
      });
      expect(r.ok, isTrue);
      expect(r.map['id'], 'c1');
    });

    test('a "Not now" stores nothing and returns the consent result', () async {
      needsConsentOnce('wellbeing_data');
      V6Api.consentPrompt = (_) async => false;
      final r = await V6Api.checkIn(word: 'Calm', valence: 0.8, energy: 0.5);
      expect(r.ok, isFalse);
      expect(r.status, 403);
      expect(r.map['consentPurpose'], 'wellbeing_data');
      expect(api.calls.map((c) => c.key), ['POST /v1/mood/checkins']);
    });

    test('no prompt installed (no shell yet): no retry, no crash', () async {
      needsConsentOnce('ai_reflection');
      final r = await V6Api.checkIn(word: 'Calm', valence: 0.8, energy: 0.5);
      expect(r.ok, isFalse);
      expect(r.map['consentPurpose'], 'ai_reflection');
      expect(api.calls.length, 1);
    });

    test('the retry happens at most once even if the server asks again', () async {
      api.reply('GET /v1/me', {'ok': false, 'status': 403, 'consentPurpose': 'personalization'});
      var asked = 0;
      V6Api.consentPrompt = (_) async {
        asked++;
        return true;
      };
      final r = await V6Api.me();
      expect(asked, 1);
      expect(api.where('GET', '/v1/me').length, 2);
      expect(r.ok, isFalse);
    });

    test('a throwing prompt is a failed result, not a crash', () async {
      needsConsentOnce('wellbeing_data');
      V6Api.consentPrompt = (_) async => throw StateError('no context');
      final r = await V6Api.checkIn(word: 'Calm', valence: 0.8, energy: 0.5);
      expect(r.ok, isFalse);
      expect(r.error, contains('no context'));
    });
  });
}
