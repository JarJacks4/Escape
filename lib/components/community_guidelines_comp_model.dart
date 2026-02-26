import '/flutter_flow/flutter_flow_util.dart';
import 'community_guidelines_comp_widget.dart'
    show CommunityGuidelinesCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CommunityGuidelinesCompModel
    extends FlutterFlowModel<CommunityGuidelinesCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
