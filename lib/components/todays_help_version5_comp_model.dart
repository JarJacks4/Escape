import '/flutter_flow/flutter_flow_util.dart';
import 'todays_help_version5_comp_widget.dart'
    show TodaysHelpVersion5CompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TodaysHelpVersion5CompModel
    extends FlutterFlowModel<TodaysHelpVersion5CompWidget> {
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
