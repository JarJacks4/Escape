import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/auth/firebase_auth/auth_util.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
import 'package:that_audio_player_oo85ab/flutter_flow/custom_functions.dart'
    as that_audio_player_oo85ab_functions;

int? getMinutesSinceDateTimeLastActivity(DateTime? lastActivity) {
  int getMinutesSince(DateTime lastActivity) {
    return DateTime.now().difference(lastActivity).inMinutes;
  }
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}

String formatSecondsToMinutes(
  double seconds,
  String format,
) {
  Duration duration = Duration(seconds: seconds.toInt());
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);
  int secs = duration.inSeconds.remainder(60);

  Map<String, String> formatMap = {
    "HH": hours.toString().padLeft(2, '0'),
    "H": hours.toString(),
    "MM": minutes.toString().padLeft(2, '0'),
    "M": minutes.toString(),
    "SS": secs.toString().padLeft(2, '0'),
    "S": secs.toString(),
  };

  formatMap.forEach((key, value) {
    format = format.replaceAll(key, value);
  });

  return format;
}

int? doubleToInt() {
  int doubleToInt(double value) {
    return value.toInt();
  }
}

int getUpdatedWeekCount(
  DateTime? weekStartDate,
  int? currentWeekCont,
) {
  int getUpdatedWeekCount(DateTime weekStartDate, int currentWeekCount) {
    final daysSinceWeekStart = DateTime.now().difference(weekStartDate).inDays;
    if (daysSinceWeekStart >= 7) {
      return 1;
    }
    return currentWeekCount + 1;
  }
}

DateTime getUpdatedWeekStartDate(
  DateTime? weekStartDate,
  int? currentWeekCount,
) {
  DateTime getUpdatedWeekStartDate(DateTime weekStartDate) {
    final daysSinceWeekStart = DateTime.now().difference(weekStartDate).inDays;
    if (daysSinceWeekStart >= 7) {
      return DateTime.now();
    }
    return weekStartDate;
  }
}

int getUpdatedStreak(
  DateTime? lastCompletedDate,
  int? streakCount,
) {
  int getUpdatedStreak(DateTime lastCompletedDate, int streakCount) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastCompletedDay = DateTime(
      lastCompletedDate.year,
      lastCompletedDate.month,
      lastCompletedDate.day,
    );
    final daysDifference = today.difference(lastCompletedDay).inDays;

    if (daysDifference == 0) {
      return streakCount; // already completed today, don't double-count
    } else if (daysDifference == 1) {
      return streakCount + 1; // completed yesterday, streak continues
    } else {
      return 1; // gap was longer than a day, streak restarts
    }
  }
}

int? challengeStreak(List<DateTime>? checkIns) {
  int challengeStreak(List<DateTime>? checkIns) {
    if (checkIns == null || checkIns.isEmpty) return 0;
    final done = checkIns.map((d) => DateTime(d.year, d.month, d.day)).toSet();
    final now = DateTime.now();
    var day = DateTime(now.year, now.month, now.day);
    // Today not checked in yet? The streak is still alive from yesterday.
    if (!done.contains(day)) day = DateTime(day.year, day.month, day.day - 1);
    var streak = 0;
    while (done.contains(day)) {
      streak++;
      day = DateTime(day.year, day.month, day.day - 1);
    }
    return streak;
    // "Any N days" rule instead: return done.length;
  }
}

bool? checkedInToday(List<DateTime>? checkins) {
  bool checkedInToday(List<DateTime>? checkIns) {
    if (checkIns == null) return false;
    final now = DateTime.now();
    return checkIns.any(
        (d) => d.year == now.year && d.month == now.month && d.day == now.day);
  }
}

double? challengeProgress(
  int? done,
  int? total,
) {
  double challengeProgress(int done, int total) {
    if (total <= 0) return 0.0;
    return (done / total).clamp(0.0, 1.0).toDouble();
  }

  String percentLabel(double progress) {
    return '${(progress * 100).round()}%';
  }
}

String? percentLabel(double? progress) {
  String percentLabel(double progress) {
    return '${(progress * 100).round()}%';
  }
}

List<DateTime>? challengeDays(
  List<DateTime>? checkIns,
  int? totalDays,
) {
  List<DateTime> challengeDays(List<DateTime>? checkIns, int totalDays) {
    // The current streak's days, then today and the days still to go.
    final done =
        (checkIns ?? []).map((d) => DateTime(d.year, d.month, d.day)).toSet();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    var start = done.contains(today)
        ? today
        : DateTime(today.year, today.month, today.day - 1);
    while (done.contains(DateTime(start.year, start.month, start.day - 1))) {
      start = DateTime(start.year, start.month, start.day - 1);
    }
    if (!done.contains(start)) start = today; // no streak yet
    return List.generate(
        totalDays, (i) => DateTime(start.year, start.month, start.day + i));
  }
}

String? dayStatus(
  DateTime? day,
  List<DateTime>? checkIns,
) {
  String dayStatus(DateTime day, List<DateTime>? checkIns) {
    final d = DateTime(day.year, day.month, day.day);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final done = (checkIns ?? [])
        .any((c) => c.year == d.year && c.month == d.month && c.day == d.day);
    if (done) return 'Completed';
    if (d == today) return 'Today';
    if (d.isAfter(today)) return 'Upcoming';
    return 'Missed';
  }
}

int? daysLeft(
  int? done,
  int? integer,
) {
  int daysLeft(int done, int total) {
    final left = total - done;
    return left < 0 ? 0 : left;
  }
}

DateTime? tomorrowAt(
  int? hour,
  int? minute,
) {
  DateTime tomorrowAt(int hour, int minute) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1, hour, minute);
  }
}
