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

String getListOfMessages(List<MessageStruct> messages) {
  // iterate through list of messages datatype and returning final string value for user & bot response.
  String finalString = '';
  for (MessageStruct message in messages) {
    if (message.userSent == true) {
      finalString += 'User: ${message.text}\n';
    } else {
      finalString += 'Bot: ${message.text}\n';
    }
  }
  return finalString;
}
