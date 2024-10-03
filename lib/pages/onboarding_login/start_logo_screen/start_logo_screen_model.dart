import '/flutter_flow/flutter_flow_util.dart';
import 'start_logo_screen_widget.dart' show StartLogoScreenWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StartLogoScreenModel extends FlutterFlowModel<StartLogoScreenWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
