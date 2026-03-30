import '/flutter_flow/flutter_flow_util.dart';
import 'journal_help_comp_widget.dart' show JournalHelpCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class JournalHelpCompModel extends FlutterFlowModel<JournalHelpCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
