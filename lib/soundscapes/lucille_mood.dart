import 'package:escape_soundscapes/escape_soundscapes.dart';

import '/custom_code/actions/lucille_v1.dart';

/// The person's mood as Lucille sees it (GET /v1/journal/home?period=week): the latest scan
/// and the week's Mood Orb. Profile, the Self-Care Progress card and the Body session summary
/// read it from here, so they all agree with the Journal and the Home "Your Path" card
/// (users.CurrentMood was written only by the old face scan and went stale, e.g. "Angry").
class LucilleMood {
  const LucilleMood({
    this.latestWord,
    this.latestAgeHours,
    this.weekWord,
    this.weekCaption,
    this.weekTone,
    this.bpm,
  });

  /// Word from the most recent Mood Scan / check-in ("Calm"), if any.
  final String? latestWord;
  final num? latestAgeHours;

  /// The week's Mood Orb: word ("Steady"), caption ("Mostly calm, a few restless days") and tone.
  final String? weekWord;
  final String? weekCaption;
  final String? weekTone;

  /// Camera pulse from the last Mood Scan (bpm), when it is recent.
  final int? bpm;

  /// Latest scan if there is one, else the week's mood.
  String? get currentWord => latestWord ?? weekWord;

  static LucilleMood? _cached;
  static DateTime? _cachedAt;
  static Future<LucilleMood>? _inFlight;

  /// Cached for a minute so cards on the same screen share one request.
  static Future<LucilleMood> load({bool refresh = false}) {
    final at = _cachedAt;
    if (!refresh &&
        _cached != null &&
        at != null &&
        DateTime.now().difference(at) < const Duration(minutes: 1)) {
      return Future.value(_cached);
    }
    return _inFlight ??= _fetch().whenComplete(() => _inFlight = null);
  }

  static Future<LucilleMood> _fetch() async {
    Map? data;
    try {
      final r = await lucilleV1('GET', '/v1/journal/home?period=week', null);
      final d = r is Map ? r['data'] : null;
      if (d is Map) data = d;
    } catch (_) {}
    final last = data?['lastScan'];
    final orb = data?['orb'];
    final mood = LucilleMood(
      latestWord: _word(last is Map ? last['word'] : null),
      latestAgeHours: last is Map ? last['ageHours'] as num? : null,
      weekWord: _word(orb is Map ? orb['word'] : null),
      weekCaption: _text(orb is Map ? orb['caption'] : null),
      weekTone: _text(orb is Map ? orb['tone'] : null),
      bpm: await _bpm(last is Map ? last : null),
    );
    if (data != null) {
      _cached = mood;
      _cachedAt = DateTime.now();
    }
    return mood;
  }

  /// The native module keeps the last scan pulse for 12 h; otherwise use the check-in's pulse.
  static Future<int?> _bpm(Map? last) async {
    final native = await EscapeSoundscapes.lastScanPulse();
    if (native != null && native > 0) return native;
    final pulse = last?['pulse'];
    final v = pulse is Map ? pulse['bpm'] : last?['bpm'];
    return v is num && v > 0 ? v.round() : null;
  }

  static String? _text(Object? v) {
    final s = v?.toString().trim() ?? '';
    return s.isEmpty ? null : s;
  }

  static String? _word(Object? v) {
    final s = _text(v);
    if (s == null) return null;
    return s[0].toUpperCase() + s.substring(1);
  }
}
