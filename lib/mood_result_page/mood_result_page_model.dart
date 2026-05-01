import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mood_result_page_widget.dart' show MoodResultPageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MoodResultPageModel extends FlutterFlowModel<MoodResultPageWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
