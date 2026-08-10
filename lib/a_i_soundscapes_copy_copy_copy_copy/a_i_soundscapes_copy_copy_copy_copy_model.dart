import '/components/mood_category_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_i_soundscapes_copy_copy_copy_copy_widget.dart'
    show AISoundscapesCopyCopyCopyCopyWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AISoundscapesCopyCopyCopyCopyModel
    extends FlutterFlowModel<AISoundscapesCopyCopyCopyCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  AudioPlayer? soundPlayer1;
  // State field(s) for Row widget.
  ScrollController? rowScrollController1;
  AudioPlayer? soundPlayer2;
  // State field(s) for Row widget.
  ScrollController? rowScrollController2;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel1;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel2;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel3;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    columnScrollController = ScrollController();
    rowScrollController1 = ScrollController();
    rowScrollController2 = ScrollController();
    moodCategoryCardModel1 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel2 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel3 =
        createModel(context, () => MoodCategoryCardModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    columnScrollController?.dispose();
    rowScrollController1?.dispose();
    rowScrollController2?.dispose();
    moodCategoryCardModel1.dispose();
    moodCategoryCardModel2.dispose();
    moodCategoryCardModel3.dispose();
  }
}
