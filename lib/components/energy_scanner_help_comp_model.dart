import '/flutter_flow/flutter_flow_util.dart';
import 'energy_scanner_help_comp_widget.dart' show EnergyScannerHelpCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class EnergyScannerHelpCompModel
    extends FlutterFlowModel<EnergyScannerHelpCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  // State field(s) for Row widget.
  ScrollController? rowController3;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    rowController3 = ScrollController();
  }

  @override
  void dispose() {
    rowController1?.dispose();
    rowController2?.dispose();
    rowController3?.dispose();
  }
}
