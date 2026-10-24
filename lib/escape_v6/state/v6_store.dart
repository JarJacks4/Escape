// Escape v6 — app state (Figma Make: src/store.ts).
//
// One ChangeNotifier for the whole v6 shell. Local-first: everything is saved on the phone per
// account (SharedPreferences, key v6_state_<uid>) so the UI is instant and works offline. Numbers
// the server owns (coins, streak, plan) are refreshed from /v1/home and never invented locally.
import 'dart:async';
import 'dart:convert';

import 'package:escape_health/escape_health.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/v6_api.dart';
import '../services/v6_safety.dart';
import '../theme/v6_palettes.dart';

enum V6ThemeMode { auto, day, night }

@immutable
class V6CheckIn {
  const V6CheckIn({this.mood, this.intention, this.energy = 0.5, this.tags = const [], this.note, this.at});
  final V6Mood? mood;
  final String? intention;
  final double energy;
  final List<String> tags;
  final String? note;
  final DateTime? at;

  bool get isToday {
    final a = at;
    if (a == null) return false;
    final n = DateTime.now();
    return a.year == n.year && a.month == n.month && a.day == n.day;
  }

  Map<String, dynamic> toJson() => {
        'mood': mood?.name,
        'intention': intention,
        'energy': energy,
        'tags': tags,
        'note': note,
        'at': at?.millisecondsSinceEpoch,
      };

  factory V6CheckIn.fromJson(Map m) => V6CheckIn(
        mood: moodFromName(m['mood'] as String?),
        intention: m['intention'] as String?,
        energy: (m['energy'] as num?)?.toDouble() ?? 0.5,
        tags: (m['tags'] as List?)?.map((e) => e.toString()).toList() ?? const [],
        note: m['note'] as String?,
        at: m['at'] is num ? DateTime.fromMillisecondsSinceEpoch((m['at'] as num).toInt()) : null,
      );
}

enum V6Area { mind, body, reset, journal, life }

class V6Task {
  V6Task({
    required this.id,
    required this.title,
    required this.minutes,
    required this.area,
    this.done = false,
    this.fromLucille = false,
    this.route,
    this.planId,
  });

  final String id;
  final String title;
  final int minutes;
  final V6Area area;
  bool done;
  final bool fromLucille;

  /// Where tapping the task goes (a v6 route name or a server deeplink).
  final String? route;

  /// Set for tasks that come from the server plan (ticking them awards coins server-side).
  final String? planId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'minutes': minutes,
        'area': area.name,
        'done': done,
        'fromLucille': fromLucille,
        'route': route,
        'planId': planId,
      };

  factory V6Task.fromJson(Map m) => V6Task(
        id: m['id'].toString(),
        title: m['title'].toString(),
        minutes: (m['minutes'] as num?)?.toInt() ?? 0,
        area: V6Area.values.firstWhere((a) => a.name == m['area'], orElse: () => V6Area.life),
        done: m['done'] == true,
        fromLucille: m['fromLucille'] == true,
        route: m['route'] as String?,
        planId: m['planId'] as String?,
      );
}

List<V6Task> defaultTasks() => [
      V6Task(id: 'checkin', title: 'Check in with yourself', minutes: 1, area: V6Area.mind, route: 'v6CheckIn'),
      V6Task(
          id: 'breathe',
          title: 'Two minutes of slow breathing',
          minutes: 2,
          area: V6Area.reset,
          fromLucille: true,
          route: 'v6Exercise?id=long-exhale'),
      V6Task(id: 'stretch', title: 'Loosen neck & shoulders', minutes: 6, area: V6Area.body, route: 'v6Body'),
      V6Task(
          id: 'journal',
          title: 'Write one honest line',
          minutes: 3,
          area: V6Area.journal,
          fromLucille: true,
          route: 'journal'),
      V6Task(id: 'winddown', title: 'Screens down by 10:30 pm', minutes: 0, area: V6Area.life),
    ];

@immutable
class V6SessionResult {
  const V6SessionResult({
    required this.area,
    required this.id,
    required this.title,
    required this.minutes,
    this.beforeMood,
    this.coins = 0,
    this.shift,
    this.afterMood,
    this.streakDays,
  });
  final V6Area area;
  final String id;
  final String title;
  final int minutes;
  final V6Mood? beforeMood;
  final int coins;

  /// -2 much worse … +2 much better (MoodShift step).
  final int? shift;
  final V6Mood? afterMood;
  final int? streakDays;

  V6SessionResult copyWith({int? coins, int? shift, V6Mood? afterMood, int? streakDays}) => V6SessionResult(
        area: area,
        id: id,
        title: title,
        minutes: minutes,
        beforeMood: beforeMood,
        coins: coins ?? this.coins,
        shift: shift ?? this.shift,
        afterMood: afterMood ?? this.afterMood,
        streakDays: streakDays ?? this.streakDays,
      );
}

class V6Profile {
  V6Profile({
    this.name = '',
    this.pronouns = '',
    this.energyType,
    List<String>? goals,
    this.dailyGoalMin = 15,
    this.moodReminder = true,
    this.reminderHour = 9,
    this.reminderMinute = 0,
  }) : goals = goals ?? [];

  String name;
  String pronouns;
  String? energyType;
  List<String> goals;
  int dailyGoalMin;
  bool moodReminder;
  int reminderHour;
  int reminderMinute;

  Map<String, dynamic> toJson() => {
        'name': name,
        'pronouns': pronouns,
        'energyType': energyType,
        'goals': goals,
        'dailyGoalMin': dailyGoalMin,
        'moodReminder': moodReminder,
        'reminderHour': reminderHour,
        'reminderMinute': reminderMinute,
      };

  factory V6Profile.fromJson(Map m) => V6Profile(
        name: (m['name'] ?? '').toString(),
        pronouns: (m['pronouns'] ?? '').toString(),
        energyType: m['energyType'] as String?,
        goals: (m['goals'] as List?)?.map((e) => e.toString()).toList(),
        dailyGoalMin: (m['dailyGoalMin'] as num?)?.toInt() ?? 15,
        moodReminder: m['moodReminder'] != false,
        reminderHour: (m['reminderHour'] as num?)?.toInt() ?? 9,
        reminderMinute: (m['reminderMinute'] as num?)?.toInt() ?? 0,
      );
}

@immutable
class V6ChatMessage {
  const V6ChatMessage({required this.id, required this.fromLucille, required this.text, required this.at, this.aiNotice = false});
  final String id;
  final bool fromLucille;
  final String text;
  final DateTime at;

  /// Render the "Lucille is an AI" notice above this message.
  final bool aiNotice;
}

/// Support sheet urgency.
enum V6SupportLevel { gentle, urgent }

class V6Store extends ChangeNotifier {
  V6Store._();
  static final V6Store instance = V6Store._();

  /// Test hook.
  @visibleForTesting
  factory V6Store.forTest() => V6Store._();

  // ───────────────────────── state ─────────────────────────
  String? _uid;
  bool loaded = false;

  /// False until this account has saved v6 state on this phone once.
  bool hasSavedState = false;

  V6Profile profile = V6Profile();
  bool hasOnboarded = false;
  bool isNewUser = true;
  Map<String, bool> seenHelp = {};

  V6CheckIn checkIn = const V6CheckIn();
  V6Mood? previewMood;
  V6ThemeMode themeMode = V6ThemeMode.auto;
  bool moodTakeover = true;
  bool reduceMotion = false;
  bool notificationsOn = true;
  bool personalizeFromMood = true;
  bool healthConnected = false;

  /// Server feature flag: `/v1/config` → `features.lucilleEdition == 'claude'` turns the Claude
  /// edition of Lucille on (screens/lucille_claude). Default false: today's users see no change.
  bool v6ClaudeEdition = false;

  List<V6Task> tasks = defaultTasks();
  String? tasksDay;
  int water = 0;
  int waterGoal = 8;
  int minutesToday = 0;

  /// Server-owned (refreshed from /v1/home). Null until the first successful load.
  int? coins;
  int? streakDays;
  int? lifetimeCoins;
  String? suggestionTitle;
  String? suggestionWhy;
  String? suggestionRoute;

  V6AgeBand? ageBand;
  int? birthYear;
  DateTime? lastAiNoticeAt;
  int turnsSinceAiNotice = 0;

  V6SessionResult? lastSession;
  final List<V6ChatMessage> lucilleMessages = [];
  String? lucilleSeed;
  V6SupportLevel supportLevel = V6SupportLevel.gentle;

  HealthSnapshot? health;

  /// Hook the shell installs so state changes can open the Support sheet from anywhere.
  void Function(V6SupportLevel level)? onOpenSupport;

  // ───────────────────────── derived ─────────────────────────

  bool isDaytime([DateTime? now]) {
    switch (themeMode) {
      case V6ThemeMode.day:
        return true;
      case V6ThemeMode.night:
        return false;
      case V6ThemeMode.auto:
        final h = (now ?? DateTime.now()).hour;
        return h >= 6 && h < 18;
    }
  }

  /// The mood that colours the app right now (today's check-in only; yesterday's mood fades out).
  V6Mood? get currentMood => checkIn.isToday ? checkIn.mood : null;

  /// Palette priority: activity > mood preview > saved mood (takeover on) > time of day.
  V6PaletteId resolvePalette({V6PaletteId? activity, bool entryScreen = false}) {
    if (activity != null) return activity;
    if (previewMood != null) return paletteForMood(previewMood!);
    final m = currentMood;
    if (moodTakeover && m != null && !entryScreen) return paletteForMood(m);
    return isDaytime() ? V6PaletteId.day : V6PaletteId.night;
  }

  double get planProgress =>
      tasks.isEmpty ? 0 : tasks.where((t) => t.done).length / tasks.length;

  V6Task? get nextTask {
    for (final t in tasks) {
      if (!t.done) return t;
    }
    return null;
  }

  String get firstName {
    final n = profile.name.trim();
    if (n.isNotEmpty) return n.split(' ').first;
    final d = FirebaseAuth.instance.currentUser?.displayName?.trim() ?? '';
    return d.isEmpty ? '' : d.split(' ').first;
  }

  /// The day the user tapped "Not now" on the login check-in (so it doesn't nag again today).
  String? skippedCheckInDay;

  bool needsDailyCheckIn() =>
      hasOnboarded && !checkIn.isToday && skippedCheckInDay != _dayKey(DateTime.now());

  void skipCheckInToday() {
    skippedCheckInDay = _dayKey(DateTime.now());
    _changed();
  }

  /// Existing accounts (made before v6) skip the new onboarding but still get the daily check-in.
  void adoptExistingAccount() {
    if (hasOnboarded) return;
    hasOnboarded = true;
    _changed();
  }

  // ───────────────────────── persistence ─────────────────────────

  Timer? _saveTimer;

  String get _key => 'v6_state_${_uid ?? 'guest'}';

  Future<void> load({String? uid}) async {
    final next = uid ?? FirebaseAuth.instance.currentUser?.uid;
    if (loaded && next == _uid) {
      rollDay();
      return;
    }
    // A pending debounced save belongs to the previous account: write it there now, so it can't
    // fire later under the new account's key.
    if (_saveTimer?.isActive ?? false) {
      _saveTimer!.cancel();
      if (loaded) await save();
    }
    // Never let one account's state leak into another's on a shared phone. Not "loaded" while the
    // next account's state is read, so no screen acts on the blank in-between state.
    _resetInMemory();
    loaded = false;
    V6Api.resetChat();
    _uid = next;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw != null) _fromJson(jsonDecode(raw) as Map);
    } catch (e) {
      debugPrint('V6Store load failed: $e');
    }
    _rollDay();
    loaded = true;
    _scheduleClock();
    notifyListeners();
  }

  bool _rollDay() {
    final today = _dayKey(DateTime.now());
    if (tasksDay == today) return false;
    // New day: yesterday's server plan steps go (today's plan arrives from /v1/home), your own
    // finished tasks are cleared, unfinished ones roll into today (no guilt), defaults reset.
    tasks.removeWhere((t) => t.planId != null || t.id.startsWith('plan_'));
    tasks.removeWhere((t) => t.done && t.id.startsWith('t') && !_defaultIds.contains(t.id));
    for (final t in tasks) {
      t.done = false;
    }
    if (tasks.isEmpty) tasks = defaultTasks();
    water = 0;
    minutesToday = 0;
    tasksDay = today;
    return true;
  }

  static final Set<String> _defaultIds = {for (final t in defaultTasks()) t.id};

  /// Call when the app resumes / on the clock tick: rolls the day over once midnight passed.
  void rollDay() {
    if (!loaded) return;
    if (_rollDay()) _changed();
  }

  /// App back in the foreground: timers may not have fired while suspended, so roll the day,
  /// re-arm the clock and repaint (Day/Night may have flipped at 06:00 / 18:00).
  void onResume() {
    if (!loaded) return;
    rollDay();
    _scheduleClock();
    notifyListeners();
  }

  // Day/night (06:00 / 18:00) and midnight need a repaint even when nothing else changes.
  Timer? _clock;

  void _scheduleClock() {
    _clock?.cancel();
    final now = DateTime.now();
    final day = DateTime(now.year, now.month, now.day);
    final next = [day.add(const Duration(hours: 6)), day.add(const Duration(hours: 18)), day.add(const Duration(days: 1))]
        .firstWhere((t) => t.isAfter(now));
    _clock = Timer(next.difference(now) + const Duration(seconds: 1), () {
      if (!_rollDay()) {
        notifyListeners();
      } else {
        _changed();
      }
      _scheduleClock();
    });
  }

  static String _dayKey(DateTime d) => '${d.year}-${d.month}-${d.day}';

  void _scheduleSave() {
    _saveTimer?.cancel();
    _saveTimer = Timer(const Duration(milliseconds: 400), save);
  }

  Future<void> save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, jsonEncode(_toJson()));
    } catch (e) {
      debugPrint('V6Store save failed: $e');
    }
  }

  Map<String, dynamic> _toJson() => {
        'profile': profile.toJson(),
        'hasOnboarded': hasOnboarded,
        'isNewUser': isNewUser,
        'seenHelp': seenHelp,
        'checkIn': checkIn.toJson(),
        'themeMode': themeMode.name,
        'moodTakeover': moodTakeover,
        'reduceMotion': reduceMotion,
        'notificationsOn': notificationsOn,
        'personalizeFromMood': personalizeFromMood,
        'healthConnected': healthConnected,
        'v6ClaudeEdition': v6ClaudeEdition,
        'tasks': tasks.map((t) => t.toJson()).toList(),
        'tasksDay': tasksDay,
        'water': water,
        'waterGoal': waterGoal,
        'minutesToday': minutesToday,
        'ageBand': ageBand?.name,
        'birthYear': birthYear,
        'lastAiNoticeAt': lastAiNoticeAt?.millisecondsSinceEpoch,
        'turnsSinceAiNotice': turnsSinceAiNotice,
        'skippedCheckInDay': skippedCheckInDay,
        'savedOnce': true,
      };

  void _fromJson(Map m) {
    if (m['profile'] is Map) profile = V6Profile.fromJson(m['profile'] as Map);
    hasOnboarded = m['hasOnboarded'] == true;
    isNewUser = m['isNewUser'] != false;
    seenHelp = (m['seenHelp'] as Map?)?.map((k, v) => MapEntry(k.toString(), v == true)) ?? {};
    if (m['checkIn'] is Map) checkIn = V6CheckIn.fromJson(m['checkIn'] as Map);
    themeMode = V6ThemeMode.values.firstWhere((t) => t.name == m['themeMode'], orElse: () => V6ThemeMode.auto);
    moodTakeover = m['moodTakeover'] != false;
    reduceMotion = m['reduceMotion'] == true;
    notificationsOn = m['notificationsOn'] != false;
    personalizeFromMood = m['personalizeFromMood'] != false;
    healthConnected = m['healthConnected'] == true;
    // Last known value of the server flag, so the first frame after a relaunch matches what the
    // user saw. refreshClaudeEdition() re-reads it from /v1/config right after.
    v6ClaudeEdition = m['v6ClaudeEdition'] == true;
    final t = m['tasks'];
    if (t is List && t.isNotEmpty) tasks = t.whereType<Map>().map(V6Task.fromJson).toList();
    tasksDay = m['tasksDay'] as String?;
    water = (m['water'] as num?)?.toInt() ?? 0;
    waterGoal = (m['waterGoal'] as num?)?.toInt() ?? 8;
    minutesToday = (m['minutesToday'] as num?)?.toInt() ?? 0;
    ageBand = V6AgeBand.values.where((b) => b.name == m['ageBand']).v6First;
    birthYear = (m['birthYear'] as num?)?.toInt();
    lastAiNoticeAt = m['lastAiNoticeAt'] is num
        ? DateTime.fromMillisecondsSinceEpoch((m['lastAiNoticeAt'] as num).toInt())
        : null;
    turnsSinceAiNotice = (m['turnsSinceAiNotice'] as num?)?.toInt() ?? 0;
    skippedCheckInDay = m['skippedCheckInDay'] as String?;
    hasSavedState = m['savedOnce'] == true;
  }

  void _changed() {
    notifyListeners();
    _scheduleSave();
  }

  // ───────────────────────── server sync ─────────────────────────

  Future<void> refreshFromServer() async {
    final r = await V6Api.home();
    if (!r.ok) return;
    final d = r.map;
    coins = (d['coins'] as num?)?.toInt() ?? coins;
    streakDays = (d['streakDays'] as num?)?.toInt() ?? streakDays;
    final s = d['suggestion'];
    if (s is Map) {
      suggestionTitle = s['title']?.toString();
      suggestionWhy = s['why']?.toString();
      suggestionRoute = _routeOf(s['deeplink']);
    }
    final name = d['displayName']?.toString();
    if (profile.name.isEmpty && name != null && name.isNotEmpty) profile.name = name;
    _mergePlan(d['todayPlan']);
    notifyListeners();
    await refreshClaudeEdition();
  }

  /// Reads `features.lucilleEdition` from /v1/config. Anything other than an explicit "claude"
  /// (including an unreachable server or a missing route) leaves the Claude edition off.
  Future<void> refreshClaudeEdition() async {
    final r = await V6Api.call('GET', '/v1/config');
    if (!r.ok) return;
    final features = r.map['features'];
    final edition = features is Map ? features['lucilleEdition']?.toString() : null;
    final on = edition != null && edition.toLowerCase() == 'claude';
    if (on == v6ClaudeEdition) return;
    v6ClaudeEdition = on;
    _changed();
  }

  /// Server plan items (from Lucille's self-care plan) join the local kind tasks.
  void _mergePlan(dynamic today) {
    if (today is! List) return;
    for (final it in today.whereType<Map>()) {
      final id = 'plan_${it['itemId']}';
      final existing = tasks.where((t) => t.id == id).v6First;
      final done = it['done'] == true;
      if (existing != null) {
        existing.done = done || existing.done;
        continue;
      }
      tasks.add(V6Task(
        id: id,
        title: (it['title'] ?? it['label'] ?? 'Plan step').toString(),
        minutes: (it['minutes'] as num?)?.toInt() ?? 5,
        area: V6Area.life,
        done: done,
        fromLucille: true,
        route: _routeOf(it['deeplink']),
        planId: it['planId']?.toString(),
      ));
    }
  }

  /// Server deeplink {route, params} -> "Route?a=b" for v6Open (params were being dropped).
  static String? _routeOf(dynamic link) {
    if (link is! Map) return null;
    final r = link['route']?.toString();
    if (r == null || r.isEmpty) return null;
    final params = link['params'];
    if (params is Map && params.isNotEmpty) {
      final q = Uri(queryParameters: params.map((k, v) => MapEntry(k.toString(), v.toString()))).query;
      return '$r?$q';
    }
    return r;
  }

  Future<void> refreshHealth() async {
    if (!healthConnected) return;
    health = await EscapeHealth.snapshot();
    notifyListeners();
  }

  Future<bool> connectHealth() async {
    final a = await EscapeHealth.availability();
    if (a == HealthAvailability.needsInstall) {
      await EscapeHealth.openStore();
      return false;
    }
    if (a != HealthAvailability.available) return false;
    final ok = await EscapeHealth.requestAuthorization();
    healthConnected = ok;
    _changed();
    if (ok) await refreshHealth();
    return ok;
  }

  void disconnectHealth() {
    healthConnected = false;
    health = null;
    _changed();
  }

  // ───────────────────────── entry & profile ─────────────────────────

  void updateProfile(void Function(V6Profile p) edit) {
    edit(profile);
    _changed();
  }

  void finishOnboarding() {
    hasOnboarded = true;
    isNewUser = true;
    _changed();
  }

  void setAge(int year, V6AgeBand band) {
    birthYear = year;
    ageBand = band;
    _changed();
  }

  void markHelpSeen(String id) {
    seenHelp[id] = true;
    _changed();
  }

  bool shouldAutoHelp(String id) => isNewUser && seenHelp[id] != true;

  void resetWalkthrough() {
    seenHelp = {};
    isNewUser = true;
    _changed();
  }

  // ───────────────────────── mood ─────────────────────────

  void setPreviewMood(V6Mood? m) {
    if (previewMood == m) return;
    previewMood = m;
    notifyListeners();
  }

  /// Mood Scan word (Soundscapes module) -> v6 mood. The module offers four words per quadrant.
  static V6Mood? moodForScanWord(String word) => switch (word.trim().toLowerCase()) {
        'calm' || 'steady' || 'content' || 'open' => V6Mood.calm,
        'energized' || 'bright' || 'hopeful' => V6Mood.energized,
        'focused' => V6Mood.focused,
        'restless' || 'wired' || 'anxious' || 'tense' => V6Mood.restless,
        'foggy' || 'drained' => V6Mood.tired,
        'low' || 'heavy' => V6Mood.low,
        _ => null,
      };

  /// A saved Mood Scan becomes today's check-in, so Home, the palette and suggestions follow
  /// it. Local only: the module already sent the scan to Lucille (POST /v1/mood/checkins).
  /// Keeps today's intention if the person set one in a check-in earlier.
  void adoptMoodScan({required String word, double? energy}) {
    final mood = moodForScanWord(word);
    if (mood == null) return;
    final today = checkIn.isToday ? checkIn : null;
    checkIn = V6CheckIn(
      mood: mood,
      intention: today?.intention,
      energy: (energy ?? today?.energy ?? 0.5).clamp(0.0, 1.0),
      tags: [...?today?.tags.where((t) => t != 'mood_scan'), 'mood_scan'],
      note: today?.note,
      at: DateTime.now(),
    );
    previewMood = null;
    for (final t in tasks) {
      if (t.id == 'checkin') t.done = true;
    }
    _changed();
  }

  /// Saves the daily check-in locally first (instant), then to the API and Apple Health.
  /// Returns the server response (orb, suggestions) when online.
  /// [sync] false keeps it on the phone only (e.g. onboarding when "Save my check-ins" is off).
  Future<V6Result> completeCheckIn(V6CheckIn c, {double? bpm, bool sync = true}) async {
    checkIn = V6CheckIn(
        mood: c.mood, intention: c.intention, energy: c.energy, tags: c.tags, note: c.note, at: DateTime.now());
    previewMood = null;
    for (final t in tasks) {
      if (t.id == 'checkin') t.done = true;
    }
    _changed();
    final m = c.mood;
    if (m == null) return V6Result.offline;
    final opt = moodOption(m);
    if (healthConnected) {
      unawaited(EscapeHealth.logStateOfMind(valence: opt.valence, label: opt.label));
    }
    final note = c.note;
    if (note != null && detectDistress(note)) openSupport(V6SupportLevel.urgent);
    if (!sync) return V6Result.offline;
    return V6Api.checkIn(
      word: opt.label,
      valence: (opt.valence + 1) / 2,
      energy: c.energy,
      tags: [...c.tags, if (c.intention != null) 'intention:${c.intention}'],
      note: note,
      bpm: bpm,
    );
  }

  void setThemeMode(V6ThemeMode m) {
    themeMode = m;
    _changed();
  }

  /// Flips day/night. Landing back on what the clock says returns to auto (06:00–18:00), so
  /// one tap never pins the app to a mode forever.
  void toggleDayNight() {
    final wantDay = !isDaytime();
    final h = DateTime.now().hour;
    final autoDay = h >= 6 && h < 18;
    setThemeMode(wantDay == autoDay ? V6ThemeMode.auto : (wantDay ? V6ThemeMode.day : V6ThemeMode.night));
  }

  void setMoodTakeover(bool v) {
    moodTakeover = v;
    _changed();
  }

  void setReduceMotion(bool v) {
    reduceMotion = v;
    _changed();
  }

  void setNotifications(bool v) {
    notificationsOn = v;
    _changed();
  }

  void setPersonalize(bool v) {
    personalizeFromMood = v;
    _changed();
  }

  // ───────────────────────── productivity ─────────────────────────

  Future<void> toggleTask(String id) async {
    final t = tasks.where((x) => x.id == id).v6First;
    if (t == null) return;
    t.done = !t.done;
    _changed();
    if (t.done && t.planId != null) {
      final r = await V6Api.completePlanItem(t.planId!, t.id.replaceFirst('plan_', ''));
      final c = (r.map['coinsAwarded'] as num?)?.toInt() ?? 0;
      if (c > 0 && coins != null) {
        coins = coins! + c;
        notifyListeners();
      }
    }
  }

  void addTask(String title, {V6Area area = V6Area.life, int minutes = 5}) {
    final clean = title.trim();
    if (clean.isEmpty) return;
    tasks.add(V6Task(id: 't${DateTime.now().millisecondsSinceEpoch}', title: clean, minutes: minutes, area: area));
    _changed();
  }

  void removeTask(String id) {
    tasks.removeWhere((t) => t.id == id && t.planId == null);
    _changed();
  }

  void addWater(int n) {
    water = (water + n).clamp(0, waterGoal + 4);
    _changed();
  }

  void markTaskDone(String id) {
    for (final t in tasks) {
      if (t.id == id) t.done = true;
    }
    _changed();
  }

  // ───────────────────────── sessions ─────────────────────────

  DateTime? _sessionStart;

  void startSession() => _sessionStart = DateTime.now();

  /// Records a finished Mind / Reset / Body session. Coins come back from the server.
  Future<V6SessionResult> completeSession(V6SessionResult r, {String? taskId}) async {
    minutesToday += r.minutes;
    if (taskId != null) markTaskDone(taskId);
    lastSession = r;
    _changed();
    final start = _sessionStart ?? DateTime.now().subtract(Duration(minutes: r.minutes));
    if (healthConnected && r.area != V6Area.body) {
      unawaited(EscapeHealth.logMindfulSession(start: start, end: DateTime.now(), title: r.title));
    }
    _sessionStart = null;
    final res = await V6Api.completeSession(
      area: r.area.name,
      sessionId: r.id,
      title: r.title,
      minutes: r.minutes,
      moodBefore: r.beforeMood?.name,
    );
    if (res.ok) {
      final awarded = (res.map['coinsAwarded'] as num?)?.toInt() ?? 0;
      coins = (res.map['coins'] as num?)?.toInt() ?? coins;
      streakDays = (res.map['streakDays'] as num?)?.toInt() ?? streakDays;
      lastSession = r.copyWith(coins: awarded, streakDays: streakDays);
      notifyListeners();
    }
    return lastSession!;
  }

  void recordMoodShift(int? shift, V6Mood? after) {
    final s = lastSession;
    if (s == null) return;
    lastSession = s.copyWith(shift: shift, afterMood: after);
    notifyListeners();
    if (shift != null && shift < 0) openSupport(V6SupportLevel.gentle);
  }

  // ───────────────────────── Lucille ─────────────────────────

  int _msgN = 0;

  V6ChatMessage pushLucille(String text, {required bool fromLucille}) {
    var notice = false;
    if (fromLucille) {
      turnsSinceAiNotice += 1;
      if (aiNoticeDue(ageBand, lastAiNoticeAt, turnsSinceAiNotice)) {
        notice = true;
        lastAiNoticeAt = DateTime.now();
        turnsSinceAiNotice = 0;
      }
    }
    final m = V6ChatMessage(
      id: 'm${DateTime.now().microsecondsSinceEpoch}-${++_msgN}',
      fromLucille: fromLucille,
      text: text,
      at: DateTime.now(),
      aiNotice: notice,
    );
    lucilleMessages.add(m);
    _changed();
    return m;
  }

  /// A fresh conversation always opens with the AI disclosure.
  void startConversationIfNeeded() {
    if (lucilleMessages.isNotEmpty) return;
    lastAiNoticeAt = null;
    final name = firstName;
    final mood = currentMood;
    final hi = name.isEmpty ? 'Hi' : 'Hi $name';
    pushLucille(
      mood == null
          ? "$hi, I'm Lucille. What's on your mind?"
          : '$hi. You checked in feeling ${moodOption(mood).label.toLowerCase()}. What\'s on your mind?',
      fromLucille: true,
    );
  }

  void clearLucille() {
    lucilleMessages.clear();
    V6Api.resetChat();
    _changed();
  }

  void openSupport(V6SupportLevel level) {
    supportLevel = level;
    notifyListeners();
    onOpenSupport?.call(level);
  }

  // ───────────────────────── account ─────────────────────────

  Future<void> signOut() async {
    // Save first: today's check-in, plan and settings stay with this account on this phone.
    _saveTimer?.cancel();
    if (loaded) await save();
    _clock?.cancel();
    _resetInMemory();
    V6Api.resetChat();
    previewMood = null;
    _uid = null;
    loaded = false;
    notifyListeners();
  }

  /// Wipes everything stored on this phone for this account (server data is deleted separately).
  Future<void> deleteLocalData() async {
    _saveTimer?.cancel();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_key);
    } catch (_) {}
    _resetInMemory();
    V6Api.resetChat();
    notifyListeners();
  }

  void _resetInMemory() {
    hasSavedState = false;
    skippedCheckInDay = null;
    themeMode = V6ThemeMode.auto;
    moodTakeover = true;
    reduceMotion = false;
    healthConnected = false;
    v6ClaudeEdition = false;
    health = null;
    tasksDay = null;
    lastAiNoticeAt = null;
    turnsSinceAiNotice = 0;
    lastSession = null;
    suggestionTitle = null;
    suggestionWhy = null;
    suggestionRoute = null;
    profile = V6Profile();
    hasOnboarded = false;
    isNewUser = true;
    seenHelp = {};
    checkIn = const V6CheckIn();
    tasks = defaultTasks();
    water = 0;
    minutesToday = 0;
    coins = null;
    streakDays = null;
    ageBand = null;
    birthYear = null;
    lucilleMessages.clear();
    previewMood = null;
    notificationsOn = true;
    personalizeFromMood = true;
    waterGoal = 8;
    lifetimeCoins = null;
    supportLevel = V6SupportLevel.gentle;
  }
}

/// Rebuilds [builder] whenever the store changes.
class V6Watch extends StatelessWidget {
  const V6Watch({super.key, required this.builder});
  final Widget Function(BuildContext context, V6Store s) builder;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: V6Store.instance,
        builder: (context, _) => builder(context, V6Store.instance),
      );
}

extension V6IterableX<T> on Iterable<T> {
  /// First element or null (own name, so it never clashes with package:collection).
  T? get v6First {
    final it = iterator;
    return it.moveNext() ? it.current : null;
  }
}
