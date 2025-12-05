import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';

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
