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
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
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
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
import 'package:that_audio_player_oo85ab/flutter_flow/custom_functions.dart'
    as that_audio_player_oo85ab_functions;

int challengeStreak(List<DateTime>? checkIns) {
  if (checkIns == null || checkIns.isEmpty) return 0;

  final completedDays =
      checkIns.map((date) => DateTime(date.year, date.month, date.day)).toSet();
  final now = DateTime.now();
  var day = DateTime(now.year, now.month, now.day);

  if (!completedDays.contains(day)) {
    day = DateTime(day.year, day.month, day.day - 1);
  }

  var streak = 0;
  while (completedDays.contains(day)) {
    streak++;
    day = DateTime(day.year, day.month, day.day - 1);
  }
  return streak;
}

double challengeProgress(int completedDays, int totalDays) {
  if (totalDays <= 0) return 0.0;
  return (completedDays / totalDays).clamp(0.0, 1.0).toDouble();
}

int challengeDaysLeft(int completedDays, int totalDays) {
  return math.max(totalDays - completedDays, 0);
}

String challengePercentLabel(double progress) {
  return '${(progress * 100).round()}%';
}

List<DateTime> challengeDays(List<DateTime>? checkIns, int totalDays) {
  final completedDays = (checkIns ?? [])
      .map((date) => DateTime(date.year, date.month, date.day))
      .toSet();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  var start = completedDays.contains(today)
      ? today
      : DateTime(today.year, today.month, today.day - 1);

  while (completedDays
      .contains(DateTime(start.year, start.month, start.day - 1))) {
    start = DateTime(start.year, start.month, start.day - 1);
  }
  if (!completedDays.contains(start)) start = today;

  return List.generate(
    totalDays,
    (index) => DateTime(start.year, start.month, start.day + index),
  );
}

String challengeDayStatus(DateTime day, List<DateTime>? checkIns) {
  final normalizedDay = DateTime(day.year, day.month, day.day);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final isCompleted = (checkIns ?? []).any(
    (checkIn) =>
        checkIn.year == normalizedDay.year &&
        checkIn.month == normalizedDay.month &&
        checkIn.day == normalizedDay.day,
  );

  if (isCompleted) return 'Completed';
  if (normalizedDay == today) return 'Today';
  if (normalizedDay.isAfter(today)) return 'Upcoming';
  return 'Missed';
}

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
  int? currentWeekCount,
) {
  final currentCount = currentWeekCount ?? 0;
  if (weekStartDate == null) {
    return 1;
  }
  final daysSinceWeekStart = DateTime.now().difference(weekStartDate).inDays;
  if (daysSinceWeekStart >= 7) {
    return 1;
  }
  return currentCount + 1;
}

DateTime getUpdatedWeekStartDate(
  DateTime? weekStartDate,
  int? currentWeekCount,
) {
  if (weekStartDate == null) {
    return DateTime.now();
  }
  final daysSinceWeekStart = DateTime.now().difference(weekStartDate).inDays;
  if (daysSinceWeekStart >= 7) {
    return DateTime.now();
  }
  return weekStartDate;
}

int getUpdatedStreak(
  DateTime? lastCompletedDate,
  int? streakCount,
) {
  final currentStreak = streakCount ?? 0;
  if (lastCompletedDate == null) {
    return 1;
  }
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final lastCompletedDay = DateTime(
    lastCompletedDate.year,
    lastCompletedDate.month,
    lastCompletedDate.day,
  );
  final daysDifference = today.difference(lastCompletedDay).inDays;

  if (daysDifference == 0) {
    return currentStreak;
  } else if (daysDifference == 1) {
    return currentStreak + 1;
  } else {
    return 1;
  }
}
