import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_page_view_widget.dart' show OnboardingPageViewWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class OnboardingPageViewModel
    extends FlutterFlowModel<OnboardingPageViewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
