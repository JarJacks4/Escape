// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/cupertino.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({
    super.key,
    this.width,
    this.height,
    this.initialDateTime,
    this.minimumDate,
    this.maximumDate,
    required this.minuteInterval,
    required this.use24hFormat,
    this.backgroundColor,
    required this.rebuildpage,
  });

  final double? width;
  final double? height;
  final DateTime? initialDateTime;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final int minuteInterval;
  final bool use24hFormat;
  final Color? backgroundColor;
  final Future Function() rebuildpage;

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late DateTime _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialDateTime ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoDatePicker(
      mode: CupertinoDatePickerMode.time,
      initialDateTime: _selectedTime,
      minimumDate: widget.minimumDate,
      maximumDate: widget.maximumDate,
      minuteInterval: widget.minuteInterval,
      use24hFormat: widget.use24hFormat,
      backgroundColor: widget.backgroundColor ?? Colors.transparent,
      onDateTimeChanged: (DateTime newDateTime) async {
        FFAppState().selectedTime = newDateTime;
        await widget.rebuildpage();
      },
    );
  }
}
