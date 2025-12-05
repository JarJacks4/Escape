// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// This function reorders a list of TiktokPageStruct items and returns the updated list.
Future<List<TiktokPageStruct>> reorderTiktokPages(
  List<TiktokPageStruct> list,
  int oldIndex,
  int newIndex,
) async {
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  final item = list.removeAt(oldIndex);
  list.insert(newIndex, item);

  return list;
}
