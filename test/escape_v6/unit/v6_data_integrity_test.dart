// Content and wiring checks: every exercise / routine / tour / route the v6 pages depend on exists
// and is well formed. Source checks read files with dart:io (flutter test runs from the package
// root).
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import 'package:escape/body_sections.dart' show bodyMoveNamed;
import 'package:escape/escape_v6/screens/body/v6_body_content.dart';
import 'package:escape/escape_v6/screens/sessions/v6_session_common.dart';
import 'package:escape/escape_v6/v6.dart';

String _read(String path) => File(path).readAsStringSync();

List<File> _dartFiles(String dir) => Directory(dir)
    .listSync(recursive: true)
    .whereType<File>()
    .where((f) => f.path.endsWith('.dart'))
    .toList();

const _mindGroups = {'Breathe', 'Meditate', 'Focus', 'Sleep', 'Energy'}; // v6_mind_screen.dart
const _resetGroups = {'Quick reset', 'Breathing', 'Grounding', 'Nature'}; // v6_reset_screen.dart

void main() {
  group('exercises', () {
    test('ids are unique and resolvable', () {
      final ids = kV6Exercises.map((e) => e.id).toList();
      expect(ids.toSet().length, ids.length);
      for (final id in ids) {
        expect(v6Exercise(id)?.id, id);
      }
      expect(v6Exercise('nope'), isNull);
      expect(v6Exercise(null), isNull);
    });

    for (final e in kV6Exercises) {
      test('${e.id}: steps, palette, kind-specific content', () {
        expect(e.title.trim(), isNotEmpty);
        expect(e.summary.trim(), isNotEmpty);
        expect(e.needs.trim(), isNotEmpty);
        expect(e.steps, isNotEmpty, reason: 'every session shows "How it works"');
        expect(e.steps.every((s) => s.trim().isNotEmpty), isTrue);
        expect(e.minutes, greaterThan(0));
        expect(kV6Palettes[e.palette], isNotNull, reason: 'palette ${e.palette} must exist');
        expect(['mind', 'reset'], contains(e.area));
        expect(e.area == 'mind' ? _mindGroups : _resetGroups, contains(e.group),
            reason: 'a group the ${e.area} page does not list hides the session');
        expect(e.heroTag, 'exercise-${e.id}');
        switch (e.kind) {
          case V6ExerciseKind.breath:
            final b = e.breath;
            expect(b, isNotNull, reason: 'breath sessions need a pattern');
            expect(b!.inhale, greaterThan(0));
            expect(b.exhale, greaterThan(0));
            expect(b.hold, greaterThanOrEqualTo(0));
            expect(b.rest, greaterThanOrEqualTo(0));
            expect(b.cycle, lessThanOrEqualTo(e.minutes * 60), reason: 'at least one full cycle fits');
          case V6ExerciseKind.meditation:
            expect(e.script, isNotEmpty, reason: 'meditations narrate their script');
          case V6ExerciseKind.grounding:
            expect(e.steps.length, greaterThanOrEqualTo(5), reason: 'the 5·4·3·2·1 player walks 5 cards');
        }
        final img = e.image;
        if (img != null) expect(Uri.parse(img).scheme, 'https');
        if (e.taskId != null) {
          expect(defaultTasks().map((t) => t.id), contains(e.taskId));
        }
        expect(v6ExerciseMood(e), isA<V6Mood>());
      });
    }

    test('breath labels read naturally', () {
      expect(const V6Breath(4, 4, 4, 4).label, 'In 4 · hold 4 · out 4 · hold 4');
      expect(const V6Breath(4, 0, 6, 0).label, 'In 4 · out 6');
      expect(const V6Breath(4, 7, 8, 0).cycle, 19);
    });

    test('every mood suggests an existing session; energy centers start existing practices', () {
      for (final m in [...V6Mood.values, null]) {
        expect(v6Exercise(v6ExerciseForMood(m)), isNotNull, reason: 'mood $m');
      }
      for (final c in kV6EnergyCenters) {
        expect(v6Exercise(c.exerciseId), isNotNull, reason: 'center ${c.id}');
      }
      expect(kV6EnergyCenters.length, 7);
    });

    test('Lucille has a note for every mood and for no check-in', () {
      for (final m in V6Mood.values) {
        expect(kV6LucilleNotes[m.name], isNotNull, reason: m.name);
      }
      expect(kV6LucilleNotes['none'], isNotNull);
    });

    test('default plan tasks route to real pages', () {
      for (final t in defaultTasks()) {
        final r = t.route;
        if (r == null) continue;
        final name = r.split('?').first;
        if (name == 'v6Exercise') {
          expect(v6Exercise(Uri.splitQueryString(r.split('?').last)['id']), isNotNull, reason: r);
        }
      }
    });
  });

  group('mood orbs & palettes', () {
    test('every mood has an option, a loop and a poster; URLs are https', () {
      for (final m in V6Mood.values) {
        expect(moodOption(m).id, m);
        expect(kV6MoodLoop[m], isNotNull);
        expect(v6OrbVideoUrl(m), startsWith('https://'));
        expect(v6OrbVideoUrl(m, android: true), contains('_h264'));
        expect(v6OrbVideoUrl(m), contains('_hevc'));
        expect(v6OrbPosterUrl(m), startsWith('https://'));
      }
      expect(v6OrbVideoUrl(null), contains(kV6NeutralLoop));
    });

    test('bundled posters and offline loops exist for every orb the app can show', () {
      for (final m in <V6Mood?>[...V6Mood.values, null]) {
        expect(File(v6OrbPosterAsset(m)).existsSync(), isTrue, reason: v6OrbPosterAsset(m));
        expect(File(v6OrbLoopSource(m, preferOffline: true)).existsSync(), isTrue,
            reason: v6OrbLoopSource(m, preferOffline: true));
      }
      for (final id in V6PaletteId.values) {
        expect(File(ambientLoopFor(id)).existsSync(), isTrue, reason: ambientLoopFor(id));
        expect(File(ambientPosterFor(id)).existsSync(), isTrue, reason: ambientPosterFor(id));
      }
    });

    test('every palette is complete', () {
      for (final id in V6PaletteId.values) {
        final p = v6Palette(id);
        expect(p.id, id);
        expect(p.base.length, 3);
        expect(p.glass.length, 3);
        expect(p.label.trim(), isNotEmpty);
      }
      final mid = V6Palette.lerp(v6Palette(V6PaletteId.day), v6Palette(V6PaletteId.night), 0.75);
      expect(mid.id, V6PaletteId.night);
      expect(mid.base.length, 3);
    });

    test('valence is on -1…1 and ordered sensibly', () {
      for (final o in kV6Moods) {
        expect(o.valence, inInclusiveRange(-1, 1));
      }
      expect(moodOption(V6Mood.low).valence, lessThan(moodOption(V6Mood.calm).valence));
    });
  });

  group('help tours', () {
    final sources = {for (final f in _dartFiles('lib/escape_v6')) f.path: f.readAsStringSync()};
    final targetIds = <String>{};
    final helpPages = <String>{};
    final targetRx = RegExp(r"V6HelpTarget\(\s*(?:key:[^,]+,\s*)?id:\s*'([^']+)'");
    final pageRx = RegExp(r"V6(?:AutoHelp|HelpButton)\(\s*(?:key:[^,]+,\s*)?page:\s*'([^']+)'");
    for (final src in sources.values) {
      targetIds.addAll(targetRx.allMatches(src).map((m) => m.group(1)!));
      helpPages.addAll(pageRx.allMatches(src).map((m) => m.group(1)!));
    }

    test('the source scan found the help widgets', () {
      expect(targetIds, isNotEmpty);
      expect(helpPages, isNotEmpty);
    });

    for (final entry in kV6PageHelp.entries) {
      test('tour "${entry.key}": every target is a V6HelpTarget on some screen', () {
        expect(entry.value.tips, isNotEmpty);
        for (final tip in entry.value.tips) {
          expect(tip.title.trim(), isNotEmpty);
          expect(tip.body.trim(), isNotEmpty);
          final t = tip.target;
          if (t != null) expect(targetIds, contains(t), reason: 'tour "${entry.key}" points at "$t"');
        }
      });

      test('tour "${entry.key}" can be opened (V6AutoHelp or V6HelpButton)', () {
        expect(helpPages, contains(entry.key));
      });
    }

    test('every page key used by a help widget has tour content', () {
      for (final p in helpPages) {
        expect(kV6PageHelp.containsKey(p), isTrue, reason: 'page "$p" has no tour');
      }
    });
  });

  group('routes', () {
    final routesSrc = _read('lib/escape_v6/v6_routes.dart');
    final navSrc = _read('lib/flutter_flow/nav/nav.dart');
    final fieldRx = RegExp(r"static const (\w+) = '(v6\w+)'");
    final fields = {for (final m in fieldRx.allMatches(routesSrc)) m.group(1)!: m.group(2)!};

    test('the scan found the v6 route names', () {
      expect(fields.length, greaterThanOrEqualTo(20));
      expect(fields['checkIn'], V6Routes.checkIn);
    });

    for (final f in fields.entries) {
      test('V6Routes.${f.key} (${f.value}) is registered in nav.dart', () {
        final byConst = RegExp('name:\\s*V6Routes\\.${f.key}\\b').hasMatch(navSrc);
        final byString = navSrc.contains("name: '${f.value}'");
        expect(byConst || byString, isTrue);
      });
    }

    test('route names are unique', () {
      expect(fields.values.toSet().length, fields.length);
    });

    test('legacy deeplinks land on registered v6 routes or real exercises', () {
      final names = fields.values.toSet();
      const external = {
        V6Routes.journal,
        V6Routes.marketplace,
        V6Routes.tabHome,
        V6Routes.tabExplore,
        V6Routes.tabLucille,
        V6Routes.tabSound,
        V6Routes.tabProfile,
        'soundscapes',
      };
      V6Routes.legacy.forEach((from, to) {
        final name = to.split('?').first;
        expect(names.contains(name) || external.contains(name), isTrue, reason: '$from -> $to');
        if (name == V6Routes.exercise) {
          final id = Uri.splitQueryString(to.split('?').last)['id'];
          expect(v6Exercise(id), isNotNull, reason: '$from -> $to');
        }
      });
    });
  });

  group('body content', () {
    test('4 sections × 10 moves, each move fully described', () {
      expect(kBodySections.map((s) => s.id), ['yoga', 'pilates', 'taichi', 'exercise']);
      for (final s in kBodySections) {
        expect(s.moves.length, 10, reason: s.id);
        expect(s.moves.map((m) => m.name).toSet().length, 10, reason: '${s.id}: move names are unique');
        for (final m in s.moves) {
          expect(m.cue.trim(), isNotEmpty, reason: m.name);
          expect(m.steps, isNotEmpty, reason: m.name);
          expect(v6BodyMoveSeconds(m), greaterThan(0), reason: m.name);
          expect(m.stepLabels.isEmpty || m.stepLabels.length == m.models.length, isTrue,
              reason: '${m.name}: one label per model');
        }
      }
    });

    test('every GLB url is https and points at a .glb', () {
      for (final s in kBodySections) {
        for (final m in s.moves) {
          for (final u in [...m.models, ...v6GlbsFor(m)]) {
            final uri = Uri.parse(u);
            expect(uri.scheme, 'https', reason: '${m.name}: $u');
            expect(uri.path.toLowerCase(), endsWith('.glb'), reason: '${m.name}: $u');
          }
          final g = v6GlbFor(m);
          if (g != null) expect(Uri.parse(g).scheme, 'https');
        }
      }
      kLucilleAvatarGlb.forEach((name, url) {
        expect(bodyMoveNamed(name), isNotNull, reason: 'avatar GLB for unknown move "$name"');
        expect(Uri.parse(url).scheme, 'https', reason: name);
      });
    });

    test('routines: unique ids, minutes > 0, every picked move name exists', () {
      final ids = kV6BodyRoutines.map((r) => r.id).toList();
      expect(ids.toSet().length, ids.length);
      for (final r in kV6BodyRoutines) {
        expect(r.minutes, greaterThan(0), reason: r.id);
        expect(r.moves, isNotEmpty, reason: r.id);
        expect(['Gentle', 'Steady', 'Lively'], contains(r.intensity), reason: r.id);
        expect(kBodySections.map((s) => s.id), contains(r.sectionId));
        expect(v6BodyRoutine(r.id), same(r));
        final img = r.image;
        if (img != null) expect(Uri.parse(img).scheme, 'https');
      }
      for (final s in kBodySections) {
        final full = v6BodyRoutine('full-${s.id}');
        expect(full, isNotNull, reason: '"Start all 10" needs full-${s.id}');
        expect(full!.moves.length, s.moves.length);
      }
      expect(v6BodyRoutine(''), isNull);
      expect(v6BodyRoutine('nope'), isNull);
    });

    test('_pick(...) names in v6_body_content.dart all exist (unknown names are silently dropped)', () {
      final src = _read('lib/escape_v6/screens/body/v6_body_content.dart');
      final pickRx = RegExp(r"_pick\('(\w+)',\s*\[(.*?)\]\)", dotAll: true);
      // 'Single quoted' or "Double quoted (Child's Pose)" string literals.
      final nameRx = RegExp(r"'([^']*)'|" '"([^"]*)"');
      var checked = 0;
      for (final m in pickRx.allMatches(src)) {
        final section = bodySectionById(m.group(1)!);
        expect(section.id, m.group(1), reason: 'unknown section ${m.group(1)}');
        for (final n in nameRx.allMatches(m.group(2)!)) {
          final name = n.group(1) ?? n.group(2)!;
          expect(section.moves.any((x) => x.name == name), isTrue, reason: '${section.id}: "$name"');
          checked++;
        }
      }
      expect(checked, greaterThan(20));
    });
  });

  group('helpers', () {
    test('v6Clock', () {
      expect(v6Clock(0), '0:00');
      expect(v6Clock(65), '1:05');
      expect(v6Clock(-3), '0:00');
      expect(v6Clock(600), '10:00');
    });

    test('daily reminder: later today, or tomorrow once the time has passed', () {
      tzdata.initializeTimeZones();
      final utc = tz.getLocation('UTC');
      final at8 = tz.TZDateTime(utc, 2026, 10, 22, 8);
      expect(V6Reminders.nextAt(at8, 9, 0), tz.TZDateTime(utc, 2026, 10, 22, 9));
      final at9 = tz.TZDateTime(utc, 2026, 10, 22, 9);
      expect(V6Reminders.nextAt(at9, 9, 0), tz.TZDateTime(utc, 2026, 10, 23, 9), reason: 'exactly now: tomorrow');
      final late = tz.TZDateTime(utc, 2026, 12, 31, 23, 30);
      expect(V6Reminders.nextAt(late, 9, 0), tz.TZDateTime(utc, 2027, 1, 1, 9));
    });
  });
}
