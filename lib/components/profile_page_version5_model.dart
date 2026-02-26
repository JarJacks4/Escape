import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_version5_widget.dart' show ProfilePageVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ProfilePageVersion5Model
    extends FlutterFlowModel<ProfilePageVersion5Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
