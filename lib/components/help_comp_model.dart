import '/flutter_flow/flutter_flow_util.dart';
import 'help_comp_widget.dart' show HelpCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HelpCompModel extends FlutterFlowModel<HelpCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
