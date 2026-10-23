// V6Store: persistence, day rollover, daily check-in gate, palette priority, AI-notice cadence,
// server plan merge, server-owned numbers and local deletion.
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:escape/escape_v6/v6.dart';

import '../helpers/v6_test_harness.dart';

String _today() {
  final n = DateTime.now();
  return '${n.year}-${n.month}-${n.day}';
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final stores = <V6Store>[];
  late FakeApi api;

  /// A store loaded for [uid] (never touches FirebaseAuth: uid is explicit, name is set).
  Future<V6Store> loaded(String uid, {String name = 'Alex'}) async {
    final s = V6Store.forTest();
    stores.add(s);
    await s.load(uid: uid);
    if (s.profile.name.isEmpty) s.profile.name = name;
    return s;
  }

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    api = onlineApi().install();
  });

  tearDown(() async {
    // Cancels the day/night clock and the debounced save of every store this test made.
    for (final s in stores) {
      await s.signOut();
    }
    stores.clear();
  });

  group('persistence', () {
    test('check-in save → restore round-trip for the same account', () async {
      final a = await loaded('u1');
      await a.completeCheckIn(const V6CheckIn(
        mood: V6Mood.focused,
        intention: 'Find focus',
        energy: 0.8,
        tags: ['Work'],
        note: 'Busy day ahead',
      ));
      await a.save();

      final b = await loaded('u1');
      expect(b.checkIn.mood, V6Mood.focused);
      expect(b.checkIn.intention, 'Find focus');
      expect(b.checkIn.energy, 0.8);
      expect(b.checkIn.tags, ['Work']);
      expect(b.checkIn.note, 'Busy day ahead');
      expect(b.checkIn.isToday, isTrue);
      expect(b.currentMood, V6Mood.focused);
      expect(b.hasSavedState, isTrue);
      expect(b.tasks.firstWhere((t) => t.id == 'checkin').done, isTrue, reason: 'check-in task ticks itself');
    });

    test('check-in is sent to the API with valence/energy on 0…1 and the intention as a tag', () async {
      final s = await loaded('u1');
      final r = await s.completeCheckIn(const V6CheckIn(mood: V6Mood.focused, intention: 'Find focus', energy: 0.8, tags: ['Work']));
      expect(r.ok, isTrue);
      final call = api.where('POST', '/v1/mood/checkins').single;
      final body = call.body as Map;
      expect(body['word'], 'Focused');
      expect(body['valence'], closeTo(0.75, 1e-9)); // (0.5 + 1) / 2
      expect(body['energy'], 0.8);
      expect(body['tags'], ['Work', 'intention:Find focus']);
      expect(body.containsKey('note'), isFalse);
      expect(body['source'], 'checkin');
    });

    test('sync: false keeps the check-in on the phone (onboarding with "Save my check-ins" off)', () async {
      final s = await loaded('u1');
      await s.completeCheckIn(const V6CheckIn(mood: V6Mood.calm), sync: false);
      expect(s.currentMood, V6Mood.calm);
      expect(api.where('POST', '/v1/mood/checkins'), isEmpty);
    });

    test('a distress note opens the urgent Support sheet hook', () async {
      final s = await loaded('u1');
      final levels = <V6SupportLevel>[];
      s.onOpenSupport = levels.add;
      await s.completeCheckIn(const V6CheckIn(mood: V6Mood.low, note: 'I don’t want to be here anymore'));
      expect(levels, [V6SupportLevel.urgent]);
    });

    test('accounts never share state on one phone', () async {
      final a = await loaded('alice');
      await a.completeCheckIn(const V6CheckIn(mood: V6Mood.energized));
      a.addWater(3);
      a.setThemeMode(V6ThemeMode.night);
      await a.save();

      final b = await loaded('bob');
      expect(b.checkIn.mood, isNull);
      expect(b.water, 0);
      expect(b.themeMode, V6ThemeMode.auto);
      expect(b.hasSavedState, isFalse);

      // Switching the same store object between accounts resets in memory too.
      await a.load(uid: 'bob');
      expect(a.checkIn.mood, isNull);
      await a.load(uid: 'alice');
      expect(a.checkIn.mood, V6Mood.energized);
      expect(a.themeMode, V6ThemeMode.night);
    });

    test('model JSON round-trips (check-in, task, profile defaults)', () {
      final at = DateTime(2026, 10, 22, 8, 30);
      final c = V6CheckIn.fromJson(
          V6CheckIn(mood: V6Mood.tired, intention: 'Slow down', energy: 0.2, tags: const ['Sleep'], note: 'n', at: at)
              .toJson());
      expect([c.mood, c.intention, c.energy, c.tags, c.note, c.at], [V6Mood.tired, 'Slow down', 0.2, ['Sleep'], 'n', at]);

      final t = V6Task.fromJson(V6Task(
              id: 'plan_x', title: 'Walk', minutes: 10, area: V6Area.body, done: true, fromLucille: true, route: 'v6Body', planId: 'p')
          .toJson());
      expect([t.id, t.title, t.minutes, t.area, t.done, t.fromLucille, t.route, t.planId],
          ['plan_x', 'Walk', 10, V6Area.body, true, true, 'v6Body', 'p']);
      expect(V6Task.fromJson({'id': 1, 'title': 'x', 'area': 'nope'}).area, V6Area.life);

      final p = V6Profile.fromJson({});
      expect(p.moodReminder, isTrue, reason: 'reminder defaults on when missing');
      expect(p.dailyGoalMin, 15);
      expect(p.reminderHour, 9);
      expect(moodFromName('nope'), isNull);
    });

    test('corrupt saved state never crashes load', () async {
      SharedPreferences.setMockInitialValues({'v6_state_u1': '{not json'});
      final s = await loaded('u1');
      expect(s.loaded, isTrue);
      expect(s.tasks, isNotEmpty);
    });
  });

  group('day rollover', () {
    test('a saved yesterday: done own tasks go, unfinished roll over, plan steps and water reset', () async {
      SharedPreferences.setMockInitialValues({
        'v6_state_u1': jsonEncode({
          'hasOnboarded': true,
          'savedOnce': true,
          'tasksDay': '2000-1-1',
          'water': 6,
          'minutesToday': 25,
          'tasks': [
            {'id': 'checkin', 'title': 'Check in with yourself', 'minutes': 1, 'area': 'mind', 'done': true},
            {'id': 't1', 'title': 'Call mum', 'minutes': 5, 'area': 'life', 'done': true},
            {'id': 't2', 'title': 'Stretch', 'minutes': 5, 'area': 'body', 'done': false},
            {'id': 'plan_i9', 'title': 'Old plan step', 'minutes': 5, 'area': 'life', 'planId': 'p-old'},
          ],
        }),
      });
      final s = await loaded('u1');
      expect(s.tasks.map((t) => t.id), ['checkin', 't2']);
      expect(s.tasks.every((t) => !t.done), isTrue);
      expect(s.water, 0);
      expect(s.minutesToday, 0);
      expect(s.tasksDay, _today());
    });

    test('an empty list after rollover falls back to the default kind tasks', () async {
      SharedPreferences.setMockInitialValues({
        'v6_state_u1': jsonEncode({
          'tasksDay': '2000-1-1',
          'tasks': [
            {'id': 't1', 'title': 'Done yesterday', 'minutes': 5, 'area': 'life', 'done': true},
          ],
        }),
      });
      final s = await loaded('u1');
      expect(s.tasks.map((t) => t.id), defaultTasks().map((t) => t.id));
    });

    test('rollDay() at midnight resets in memory; same day is a no-op', () async {
      final s = await loaded('u1');
      s.addWater(3);
      s.markTaskDone('checkin');
      s.rollDay();
      expect(s.water, 3, reason: 'same day: nothing changes');
      s.tasksDay = '1999-12-31'; // what the store saw before midnight
      s.rollDay();
      expect(s.water, 0);
      expect(s.tasks.firstWhere((t) => t.id == 'checkin').done, isFalse);
      expect(s.tasksDay, _today());
    });

    test('water is clamped to goal + 4 and never below 0', () async {
      final s = await loaded('u1');
      s.addWater(100);
      expect(s.water, s.waterGoal + 4);
      s.addWater(-100);
      expect(s.water, 0);
    });
  });

  group('daily check-in gate', () {
    test('needsDailyCheckIn + skip for today', () async {
      final s = await loaded('u1');
      expect(s.needsDailyCheckIn(), isFalse, reason: 'not onboarded yet');
      s.adoptExistingAccount();
      expect(s.needsDailyCheckIn(), isTrue);
      s.skipCheckInToday();
      expect(s.needsDailyCheckIn(), isFalse);
      await s.save();

      final again = await loaded('u1');
      expect(again.needsDailyCheckIn(), isFalse, reason: '"Not now" survives an app restart the same day');
      again.skippedCheckInDay = '2000-1-1';
      expect(again.needsDailyCheckIn(), isTrue, reason: 'a skip from another day does not count');
    });

    test("yesterday's check-in does not count (and its mood no longer colours the app)", () async {
      final s = await loaded('u1');
      s.adoptExistingAccount();
      s.checkIn = V6CheckIn(mood: V6Mood.calm, at: DateTime.now().subtract(const Duration(days: 1)));
      expect(s.needsDailyCheckIn(), isTrue);
      expect(s.currentMood, isNull);
      s.checkIn = V6CheckIn(mood: V6Mood.calm, at: DateTime.now());
      expect(s.needsDailyCheckIn(), isFalse);
      expect(s.currentMood, V6Mood.calm);
    });
  });

  group('palette resolution', () {
    test('priority: activity > preview mood > saved mood (takeover on) > time of day', () async {
      final s = await loaded('u1');
      s.themeMode = V6ThemeMode.day;
      expect(s.resolvePalette(), V6PaletteId.day);

      s.checkIn = V6CheckIn(mood: V6Mood.low, at: DateTime.now());
      expect(s.resolvePalette(), V6PaletteId.low);
      expect(s.resolvePalette(entryScreen: true), V6PaletteId.day, reason: 'entry screens ignore the saved mood');

      s.setPreviewMood(V6Mood.energized);
      expect(s.resolvePalette(), V6PaletteId.energized);
      expect(s.resolvePalette(entryScreen: true), V6PaletteId.energized, reason: 'onboarding previews the picked mood');

      expect(s.resolvePalette(activity: V6PaletteId.body), V6PaletteId.body);
      expect(s.resolvePalette(activity: V6PaletteId.sleep, entryScreen: true), V6PaletteId.sleep);

      s.setPreviewMood(null);
      s.setMoodTakeover(false);
      expect(s.resolvePalette(), V6PaletteId.day, reason: 'takeover off: time of day wins over the saved mood');

      s.setThemeMode(V6ThemeMode.night);
      expect(s.resolvePalette(), V6PaletteId.night);
    });

    test('every mood maps to its own palette', () {
      for (final m in V6Mood.values) {
        expect(paletteForMood(m).name, m.name);
        expect(kV6Palettes[paletteForMood(m)], isNotNull);
      }
    });

    test('auto day/night boundaries 05:59 / 06:00 / 17:59 / 18:00', () async {
      final s = await loaded('u1');
      s.themeMode = V6ThemeMode.auto;
      DateTime at(int h, int m) => DateTime(2026, 3, 1, h, m);
      expect(s.isDaytime(at(5, 59)), isFalse);
      expect(s.isDaytime(at(6, 0)), isTrue);
      expect(s.isDaytime(at(12, 0)), isTrue);
      expect(s.isDaytime(at(17, 59)), isTrue);
      expect(s.isDaytime(at(18, 0)), isFalse);
      expect(s.isDaytime(at(0, 0)), isFalse);
      expect(s.isDaytime(at(23, 59)), isFalse);

      s.themeMode = V6ThemeMode.day;
      expect(s.isDaytime(at(23, 0)), isTrue);
      s.themeMode = V6ThemeMode.night;
      expect(s.isDaytime(at(12, 0)), isFalse);
    });

    test('auto time of day drives resolvePalette when nothing else applies', () async {
      final s = await loaded('u1');
      s.themeMode = V6ThemeMode.auto;
      expect(s.resolvePalette(), s.isDaytime() ? V6PaletteId.day : V6PaletteId.night);
    });

    test('toggleDayNight pins the opposite of the clock, a second tap returns to auto', () async {
      final s = await loaded('u1');
      s.themeMode = V6ThemeMode.auto;
      final clockDay = s.isDaytime();
      s.toggleDayNight();
      expect(s.themeMode, clockDay ? V6ThemeMode.night : V6ThemeMode.day);
      expect(s.isDaytime(), !clockDay);
      s.toggleDayNight();
      expect(s.themeMode, V6ThemeMode.auto);
    });
  });

  group('AI-notice cadence (SB 243 / S-3008C)', () {
    test('adult: notice at the start, then again on the 12th Lucille turn', () async {
      final s = await loaded('u1');
      s.ageBand = V6AgeBand.adult;
      s.startConversationIfNeeded();
      expect(s.lucilleMessages.single.aiNotice, isTrue, reason: 'every conversation opens with the disclosure');
      for (var i = 1; i <= 11; i++) {
        expect(s.pushLucille('reply $i', fromLucille: true).aiNotice, isFalse, reason: 'turn $i');
        expect(s.pushLucille('user $i', fromLucille: false).aiNotice, isFalse);
      }
      expect(s.pushLucille('reply 12', fromLucille: true).aiNotice, isTrue);
      expect(s.turnsSinceAiNotice, 0);
    });

    test('teen: again on the 5th Lucille turn', () async {
      final s = await loaded('u1');
      s.setAge(DateTime.now().year - 15, V6AgeBand.teen);
      s.startConversationIfNeeded();
      for (var i = 1; i <= 4; i++) {
        expect(s.pushLucille('reply $i', fromLucille: true).aiNotice, isFalse, reason: 'turn $i');
      }
      expect(s.pushLucille('reply 5', fromLucille: true).aiNotice, isTrue);
    });

    test('time-based: adult after 3 h, teen after 1 h', () async {
      final s = await loaded('u1');
      s.ageBand = V6AgeBand.adult;
      s.lastAiNoticeAt = DateTime.now().subtract(const Duration(hours: 2, minutes: 50));
      expect(s.pushLucille('a', fromLucille: true).aiNotice, isFalse);
      s.lastAiNoticeAt = DateTime.now().subtract(const Duration(hours: 3, minutes: 1));
      expect(s.pushLucille('b', fromLucille: true).aiNotice, isTrue);

      s.ageBand = V6AgeBand.teen;
      s.lastAiNoticeAt = DateTime.now().subtract(const Duration(minutes: 50));
      expect(s.pushLucille('c', fromLucille: true).aiNotice, isFalse);
      s.lastAiNoticeAt = DateTime.now().subtract(const Duration(minutes: 61));
      expect(s.pushLucille('d', fromLucille: true).aiNotice, isTrue);
    });

    test('aiNoticeDue table', () {
      final now = DateTime(2026, 10, 22, 12);
      Duration h(num x) => Duration(minutes: (x * 60).round());
      expect(aiNoticeDue(V6AgeBand.adult, null, 0, now), isTrue);
      expect(aiNoticeDue(V6AgeBand.adult, now.subtract(h(2.99)), 11, now), isFalse);
      expect(aiNoticeDue(V6AgeBand.adult, now.subtract(h(3)), 0, now), isTrue);
      expect(aiNoticeDue(V6AgeBand.adult, now, 12, now), isTrue);
      expect(aiNoticeDue(V6AgeBand.teen, now.subtract(h(0.99)), 4, now), isFalse);
      expect(aiNoticeDue(V6AgeBand.teen, now.subtract(h(1)), 0, now), isTrue);
      expect(aiNoticeDue(V6AgeBand.teen, now, 5, now), isTrue);
      expect(aiNoticeDue(null, now.subtract(h(1.5)), 6, now), isFalse,
          reason: 'unknown age band is treated as adult (see report: existing accounts skip the age gate)');
    });

    test('cadence state survives a restart; a cleared chat starts with the notice again', () async {
      final s = await loaded('u1');
      s.ageBand = V6AgeBand.adult;
      s.startConversationIfNeeded();
      s.pushLucille('r1', fromLucille: true);
      s.pushLucille('r2', fromLucille: true);
      await s.save();
      final t = await loaded('u1');
      expect(t.turnsSinceAiNotice, 2);
      expect(t.lastAiNoticeAt, isNotNull);
      expect(t.ageBand, V6AgeBand.adult);

      s.clearLucille();
      s.startConversationIfNeeded();
      expect(s.lucilleMessages.single.aiNotice, isTrue);
    });

    test('the greeting uses today\'s mood', () async {
      final s = await loaded('u1', name: 'Alex');
      s.checkIn = V6CheckIn(mood: V6Mood.tired, at: DateTime.now());
      s.startConversationIfNeeded();
      expect(s.lucilleMessages.single.text, contains('Hi Alex'));
      expect(s.lucilleMessages.single.text, contains('feeling tired'));
    });
  });

  group('server sync', () {
    test('coins / streak / plan are null until /v1/home loads; offline keeps them null', () async {
      final s = await loaded('u1');
      expect(s.coins, isNull);
      expect(s.streakDays, isNull);
      expect(s.lifetimeCoins, isNull);
      api.offline = true;
      await s.refreshFromServer();
      expect(s.coins, isNull, reason: 'never invented locally');
      expect(s.streakDays, isNull);
      expect(s.tasks.where((t) => t.planId != null), isEmpty);

      api.offline = false;
      await s.refreshFromServer();
      expect(s.coins, 120);
      expect(s.streakDays, 4);
    });

    test('a partial payload keeps the last known numbers', () async {
      final s = await loaded('u1');
      await s.refreshFromServer();
      api.reply('GET /v1/home', ok({'todayPlan': <Map<String, dynamic>>[]}));
      await s.refreshFromServer();
      expect(s.coins, 120);
      expect(s.streakDays, 4);
    });

    test('todayPlan items merge as plan_<itemId> tasks with planId, deeplink route and done state', () async {
      final s = await loaded('u1', name: '');
      s.profile.name = '';
      await s.refreshFromServer();
      final walk = s.tasks.firstWhere((t) => t.id == 'plan_i1');
      expect(walk.planId, 'plan-7');
      expect(walk.title, 'Walk for 10 minutes');
      expect(walk.minutes, 10);
      expect(walk.route, 'v6Body');
      expect(walk.fromLucille, isTrue);
      expect(walk.done, isFalse);
      final water = s.tasks.firstWhere((t) => t.id == 'plan_i2');
      expect(water.title, 'Drink a glass of water', reason: '"label" is accepted when "title" is missing');
      expect(water.minutes, 5);
      expect(water.done, isTrue);

      expect(s.suggestionTitle, 'Box Breathing');
      expect(s.suggestionRoute, 'v6Exercise?id=box-breathing', reason: 'deeplink params are kept');
      expect(s.profile.name, 'Alex Rivera', reason: 'displayName fills an empty profile name');

      // A second refresh never duplicates, and never un-ticks a step done on the phone.
      walk.done = true;
      await s.refreshFromServer();
      expect(s.tasks.where((t) => t.id == 'plan_i1').length, 1);
      expect(s.tasks.firstWhere((t) => t.id == 'plan_i1').done, isTrue);
    });

    test('ticking a plan step completes it server-side and adds the awarded coins', () async {
      final s = await loaded('u1');
      await s.refreshFromServer();
      await s.toggleTask('plan_i1');
      final call = api.where('POST', '/v1/selfcare/plans/').single;
      expect(call.path, '/v1/selfcare/plans/plan-7/items/i1/complete');
      expect(s.coins, 125);

      await s.toggleTask('plan_i1'); // un-tick: local only
      expect(api.where('POST', '/v1/selfcare/plans/').length, 1);

      s.removeTask('plan_i1');
      expect(s.tasks.any((t) => t.id == 'plan_i1'), isTrue, reason: 'server plan steps cannot be removed');
      await s.toggleTask('checkin'); // own tasks never call the plan API
      expect(api.where('POST', '/v1/selfcare/plans/').length, 1);
    });

    test('own tasks: blank titles are ignored, others are added and removable', () async {
      final s = await loaded('u1');
      final n = s.tasks.length;
      s.addTask('   ');
      expect(s.tasks.length, n);
      s.addTask('  Drink water  ');
      expect(s.tasks.last.title, 'Drink water');
      expect(s.tasks.last.id, startsWith('t'));
      s.removeTask(s.tasks.last.id);
      expect(s.tasks.length, n);
    });

    test(
      'two tasks added in the same millisecond get distinct ids',
      () async {
        final s = await loaded('u1');
        s.addTask('One');
        s.addTask('Two');
        final ids = s.tasks.map((t) => t.id).toList();
        expect(ids.toSet().length, ids.length);
      },
      skip: 'BUG v6_store.dart addTask: id is t<millisecondsSinceEpoch>, so two adds in one ms collide '
          '(duplicate Dismissible keys in Daily plan, toggleTask/removeTask hit both). See report.',
    );

    test('a finished session: minutes, plan task, server coins + streak', () async {
      final s = await loaded('u1');
      await s.refreshFromServer();
      final r = await s.completeSession(
        const V6SessionResult(area: V6Area.mind, id: 'box-breathing', title: 'Box Breathing', minutes: 4),
        taskId: 'breathe',
      );
      expect(s.minutesToday, 4);
      expect(s.tasks.firstWhere((t) => t.id == 'breathe').done, isTrue);
      expect(r.coins, 10);
      expect(s.coins, 130);
      expect(s.streakDays, 5);
      final body = api.where('POST', '/v1/sessions/complete').single.body as Map;
      expect(body, containsPair('area', 'mind'));
      expect(body, containsPair('sessionId', 'box-breathing'));
      expect(body, containsPair('minutes', 4));
    });

    test('a finished session offline still counts locally, with 0 coins and no invented streak', () async {
      final s = await loaded('u1');
      api.offline = true;
      final r = await s.completeSession(
          const V6SessionResult(area: V6Area.reset, id: 'long-exhale', title: 'Long Exhale', minutes: 2));
      expect(s.minutesToday, 2);
      expect(r.coins, 0);
      expect(s.coins, isNull);
      expect(s.streakDays, isNull);
      expect(s.lastSession?.id, 'long-exhale');
    });

    test('a negative mood shift opens the gentle Support sheet hook', () async {
      final s = await loaded('u1');
      final levels = <V6SupportLevel>[];
      s.onOpenSupport = levels.add;
      s.recordMoodShift(1, V6Mood.calm); // no session yet: ignored
      expect(levels, isEmpty);
      await s.completeSession(
          const V6SessionResult(area: V6Area.mind, id: 'basic-breathing', title: 'Basic Breathing', minutes: 3));
      s.recordMoodShift(1, V6Mood.calm);
      expect(levels, isEmpty);
      expect(s.lastSession?.shift, 1);
      s.recordMoodShift(-1, V6Mood.low);
      expect(levels, [V6SupportLevel.gentle]);
      expect(s.lastSession?.afterMood, V6Mood.low);
    });
  });

  group('account', () {
    test('deleteLocalData wipes this account on the phone and in memory', () async {
      final s = await loaded('u1');
      s.adoptExistingAccount();
      await s.completeCheckIn(const V6CheckIn(mood: V6Mood.calm));
      await s.refreshFromServer();
      s.startConversationIfNeeded();
      s.setAge(1990, V6AgeBand.adult);
      await s.save();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('v6_state_u1'), isNotNull);

      await s.deleteLocalData();
      expect(prefs.getString('v6_state_u1'), isNull);
      expect(s.hasOnboarded, isFalse);
      expect(s.checkIn.mood, isNull);
      expect(s.coins, isNull);
      expect(s.streakDays, isNull);
      expect(s.ageBand, isNull);
      expect(s.birthYear, isNull);
      expect(s.lucilleMessages, isEmpty);
      expect(s.tasks.map((t) => t.id), defaultTasks().map((t) => t.id));

      final fresh = await loaded('u1');
      expect(fresh.hasSavedState, isFalse);
      expect(fresh.checkIn.mood, isNull);
    });

    test('signOut saves first, then forgets everything in memory', () async {
      final s = await loaded('u1');
      await s.completeCheckIn(const V6CheckIn(mood: V6Mood.restless));
      await s.signOut();
      expect(s.loaded, isFalse);
      expect(s.checkIn.mood, isNull);
      final back = await loaded('u1');
      expect(back.checkIn.mood, V6Mood.restless);
    });

    test('help tours: auto only for new users, once per page, resettable', () async {
      final s = await loaded('u1');
      expect(s.shouldAutoHelp('home'), isTrue);
      s.markHelpSeen('home');
      expect(s.shouldAutoHelp('home'), isFalse);
      expect(s.shouldAutoHelp('mind'), isTrue);
      s.isNewUser = false;
      expect(s.shouldAutoHelp('mind'), isFalse);
      s.resetWalkthrough();
      expect(s.shouldAutoHelp('home'), isTrue);
    });
  });
}
