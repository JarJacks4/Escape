import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';

/// Picks the soundscape the Lucille Suggestion Page plays (its `exersiseSoundscape` URL).
///
/// Order: Lucille's recommendation for this user -> the /soundscapes entry matching the user's
/// mood and the time of day -> a default for the time of day. When an entry has no audio_url
/// (the backend doesn't fill them yet) it maps to the matching rendered Lucille track in the
/// media bucket. Always returns a playable URL.
class SuggestedSoundscape {
  SuggestedSoundscape._();

  static const String _media =
      'https://storage.googleapis.com/escape-self-care-505618-escape-media/soundscapes';

  /// Backend soundscape_id -> rendered track (category/trackId) in the media bucket.
  static const Map<String, String> _trackFor = {
    'nature_rain': 'nature/nature_01',
    'nature_ocean': 'nature/nature_02',
    'nature_forest': 'nature/nature_03',
    'nature_stream': 'nature/nature_04',
    'ambient_cafe': 'jazz/jazz_01',
    'ambient_fireplace': 'sleep_ambient/sleep_ambient_01',
    'ambient_library': 'brainwave_music/brainwave_music_01',
    'meditation_bowls': 'music_meditations/music_meditations_01',
    'meditation_breath': 'music_meditations/music_meditations_02',
    'meditation_chimes': 'music_meditations/music_meditations_03',
    'meditation_om': 'music_meditations/music_meditations_04',
    'binaural_alpha': 'binaural_beats/binaural_beats_01',
    'binaural_theta': 'binaural_beats/binaural_beats_02',
    'binaural_delta': 'binaural_beats/binaural_beats_03',
    'music_piano': 'depression_anxiety/depression_anxiety_01',
    'music_ambient_electronic': 'vaporwave/vaporwave_01',
    'music_acoustic': 'depression_anxiety/depression_anxiety_02',
  };

  /// Unknown ids fall back by their prefix.
  static const Map<String, String> _trackForPrefix = {
    'nature': 'nature/nature_05',
    'ambient': 'sleep_ambient/sleep_ambient_02',
    'meditation': 'music_meditations/music_meditations_01',
    'binaural': 'binaural_beats/binaural_beats_04',
    'music': 'depression_anxiety/depression_anxiety_03',
    'sleep': 'sleep_ambient/sleep_ambient_03',
  };

  static List<Map<String, dynamic>>? _catalog;

  static String get _base {
    var b = LucilleSoundscapesGroup.getBaseUrl();
    while (b.endsWith('/')) {
      b = b.substring(0, b.length - 1);
    }
    return b;
  }

  static String _trackUrl(String track) => '$_media/$track/body_1.m4a';

  /// App mood word -> the backend's emotion vocabulary ('' when nothing fits).
  static String _emotion(String? mood) {
    final m = (mood ?? '').toLowerCase();
    for (final e in const ['anxious', 'overwhelmed', 'sad', 'angry', 'lonely', 'fearful']) {
      if (m.contains(e)) return e;
    }
    if (m.contains('stress') || m.contains('restless') || m.contains('nervous')) return 'anxious';
    if (m.contains('frustrat') || m.contains('mad') || m.contains('irritat')) return 'angry';
    if (m.contains('scared') || m.contains('afraid') || m.contains('worr')) return 'fearful';
    if (m.contains('down') || m.contains('depress') || m.contains('low') || m.contains('unhappy')) return 'sad';
    return '';
  }

  /// sleep late at night or when tired, focus in work hours, relaxation otherwise.
  static String _context(String? mood) {
    final m = (mood ?? '').toLowerCase();
    final h = DateTime.now().hour;
    if (m.contains('tired') || m.contains('sleep') || h >= 21 || h < 5) return 'sleep';
    if (h >= 8 && h < 17) return 'focus';
    return 'relaxation';
  }

  static Future<String> audioUrlFor({String? mood, String? exerciseId}) async {
    final emotion = _emotion(mood);
    final context = _context(mood);

    // 1. Lucille's recommendation (empty today; used as soon as the backend returns one).
    final uid = currentUserUid;
    if (uid.isNotEmpty) {
      final rec = await _getJson(
        Uri.parse('$_base/soundscapes/recommend/${Uri.encodeComponent(uid)}').replace(
          queryParameters: {
            if (emotion.isNotEmpty) 'emotion': emotion,
            if (exerciseId != null && exerciseId.isNotEmpty) 'exerciseID': exerciseId,
            if (exerciseId != null && exerciseId.isNotEmpty) 'exercise_id': exerciseId,
          },
        ),
      );
      for (final r in ((rec?['recommendations'] as List?) ?? const []).whereType<Map>()) {
        final s = r['soundscape'] is Map ? r['soundscape'] as Map : r;
        final url = _urlOf(s);
        if (url != null) return url;
      }
    }

    // 2. Catalog entry for this mood and time of day, rotating daily among the matches.
    _catalog ??= ((await _getJson(Uri.parse('$_base/soundscapes')))?['soundscapes'] as List?)
        ?.whereType<Map>()
        .map((m) => Map<String, dynamic>.from(m))
        .toList();
    final catalog = _catalog ?? const <Map<String, dynamic>>[];
    List<Map<String, dynamic>> matches = const [];
    if (emotion.isNotEmpty) {
      matches = catalog
          .where((s) => _has(s['target_emotions'], emotion) && _has(s['target_contexts'], context))
          .toList();
      if (matches.isEmpty) matches = catalog.where((s) => _has(s['target_emotions'], emotion)).toList();
    }
    if (matches.isEmpty) matches = catalog.where((s) => _has(s['target_contexts'], context)).toList();
    if (matches.isNotEmpty) {
      final now = DateTime.now();
      final day = now.difference(DateTime(now.year)).inDays;
      final url = _urlOf(matches[day % matches.length]);
      if (url != null) return url;
    }

    // 3. Offline or empty catalog.
    return _trackUrl(context == 'sleep'
        ? 'sleep_ambient/sleep_ambient_01'
        : context == 'focus'
            ? 'brainwave_music/brainwave_music_01'
            : 'nature/nature_01');
  }

  static String? _urlOf(Map s) {
    final audio = (s['audio_url'] ?? s['audioUrl'] ?? '').toString();
    if (audio.startsWith('http')) return audio;
    final id = (s['soundscape_id'] ?? s['id'] ?? '').toString();
    final track = _trackFor[id] ??
        _trackForPrefix.entries.where((e) => id.startsWith(e.key)).map((e) => e.value).firstOrNull;
    return track == null ? null : _trackUrl(track);
  }

  static bool _has(dynamic list, String value) =>
      list is List && list.any((x) => x.toString().toLowerCase() == value);

  static Future<Map<String, dynamic>?> _getJson(Uri uri) async {
    try {
      final r = await http
          .get(uri, headers: const {'Content-Type': 'application/json'})
          .timeout(const Duration(seconds: 5));
      if (r.statusCode != 200) return null;
      final body = jsonDecode(utf8.decode(r.bodyBytes));
      return body is Map<String, dynamic> ? body : null;
    } catch (_) {
      return null;
    }
  }
}
