// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart'; // Imports custom actions

import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class QuestionaryView extends StatefulWidget {
  const QuestionaryView({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<QuestionaryView> createState() => _QuestionaryViewState();
}

class _QuestionaryViewState extends State<QuestionaryView> {
  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [],
      ),
    );
  }
}
