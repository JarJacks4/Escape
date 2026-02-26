import '/components/lucille_first_recommendation_comp_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_home_comp_widget.dart' show NewHomeCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class NewHomeCompModel extends FlutterFlowModel<NewHomeCompWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer1;
  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  // Model for LucilleFirstRecommendationCompCopy component.
  late LucilleFirstRecommendationCompCopyModel
      lucilleFirstRecommendationCompCopyModel;
  // State field(s) for Row widget.
  ScrollController? rowController;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    lucilleFirstRecommendationCompCopyModel =
        createModel(context, () => LucilleFirstRecommendationCompCopyModel());
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    lucilleFirstRecommendationCompCopyModel.dispose();
    rowController?.dispose();
  }
}
