import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'energy_scan_version5_copy_widget.dart'
    show EnergyScanVersion5CopyWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class EnergyScanVersion5CopyModel
    extends FlutterFlowModel<EnergyScanVersion5CopyWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
  }
}
