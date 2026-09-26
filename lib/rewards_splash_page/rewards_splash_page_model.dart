import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'rewards_splash_page_widget.dart' show RewardsSplashPageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RewardsSplashPageModel extends FlutterFlowModel<RewardsSplashPageWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    soundPlayer?.dispose();
  }
}
