import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
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
