import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_home_version5_widget.dart' show LucilleHomeVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LucilleHomeVersion5Model
    extends FlutterFlowModel<LucilleHomeVersion5Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController?.dispose();
  }
}
