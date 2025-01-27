import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int setLastIndex(
  List<ChatModelStruct>? chatList,
  int setIndex,
) {
  if (chatList != null && chatList.isNotEmpty && chatList.length >= setIndex) {
    return chatList.length - setIndex;
  } else {
    return 0;
  }
}

double getVerticalSize(
  double screenHeight,
  double px,
) {
  double designHeight = 852;

  return ((px * screenHeight) / designHeight).floorToDouble();
}

double getHorizontalSize(
  double screenWidth,
  double px,
) {
  double designWidth = 390;

  double value = ((px * screenWidth) / designWidth).floorToDouble();

  return value;
}

bool checkValue(String? value) {
  return value != null && value.isNotEmpty;
}

bool checkImageValue(FFUploadedFile? value) {
  return value != null && value.bytes != null && value.bytes!.isNotEmpty;
}
