import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mood_scan_result_version5_widget.dart'
    show MoodScanResultVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MoodScanResultVersion5Model
    extends FlutterFlowModel<MoodScanResultVersion5Widget> {
  ///  Local state fields for this page.

  String? profilePicture;

  bool interests = false;

  String? mood;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
