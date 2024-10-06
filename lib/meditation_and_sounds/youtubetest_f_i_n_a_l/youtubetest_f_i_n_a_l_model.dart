import '/flutter_flow/flutter_flow_util.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'youtubetest_f_i_n_a_l_widget.dart' show YoutubetestFINALWidget;
import 'package:flutter/material.dart';

class YoutubetestFINALModel extends FlutterFlowModel<YoutubetestFINALWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? musicWalkthroughController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    musicWalkthroughController?.finish();
  }
}
