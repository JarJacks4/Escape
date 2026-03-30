import '/flutter_flow/flutter_flow_util.dart';
import 'body_help_comp_widget.dart' show BodyHelpCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class BodyHelpCompModel extends FlutterFlowModel<BodyHelpCompWidget> {
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
