import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_first_recommendation_comp_copy_widget.dart'
    show LucilleFirstRecommendationCompCopyWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LucilleFirstRecommendationCompCopyModel
    extends FlutterFlowModel<LucilleFirstRecommendationCompCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
  }
}
