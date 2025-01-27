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

import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AnswerView extends StatefulWidget {
  const AnswerView({
    super.key,
    this.width,
    this.height = double.infinity,
    required this.text,
  });

  final double? width;
  final double? height;
  final String text;

  @override
  State<AnswerView> createState() => _AnswerViewState();
}

class _AnswerViewState extends State<AnswerView> {
  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: widget.text,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      selectable: true,
      onTapLink: (text, href, title) => launchUrlString(text),
      padding: EdgeInsets.zero,
    );
  }
}
