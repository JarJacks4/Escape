import '/backend/api_requests/api_calls.dart';
import '/components/lucille_first_recommendation_comp_copy_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_version5_widget.dart' show HomeVersion5Widget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeVersion5Model extends FlutterFlowModel<HomeVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? introWalkthroughController;
  // Stores action output result for [Backend Call - API (Create New Session)] action in HomeVersion5 widget.
  ApiCallResponse? createSession;
  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  // Model for LucilleFirstRecommendationCompCopy component.
  late LucilleFirstRecommendationCompCopyModel
      lucilleFirstRecommendationCompCopyModel;
  // State field(s) for Row widget.
  ScrollController? rowController;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    lucilleFirstRecommendationCompCopyModel =
        createModel(context, () => LucilleFirstRecommendationCompCopyModel());
    rowController = ScrollController();
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    introWalkthroughController?.finish();
    columnController?.dispose();
    lucilleFirstRecommendationCompCopyModel.dispose();
    rowController?.dispose();
    sideNavModel.dispose();
  }
}
