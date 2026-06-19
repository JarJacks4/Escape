import '/components/mood_category_card_widget.dart';
import '/components/soundscape_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'soundscapes_meditation_widget.dart' show SoundscapesMeditationWidget;
import 'package:flutter/material.dart';

class SoundscapesMeditationModel
    extends FlutterFlowModel<SoundscapesMeditationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // State field(s) for Row widget.
  ScrollController? rowScrollController1;
  // State field(s) for Row widget.
  ScrollController? rowScrollController2;
  // Model for SoundscapeCard.
  late SoundscapeCardModel soundscapeCardModel1;
  // Model for SoundscapeCard.
  late SoundscapeCardModel soundscapeCardModel2;
  // Model for SoundscapeCard.
  late SoundscapeCardModel soundscapeCardModel3;
  // State field(s) for Row widget.
  ScrollController? rowScrollController3;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel1;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel2;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel3;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    rowScrollController1 = ScrollController();
    rowScrollController2 = ScrollController();
    soundscapeCardModel1 = createModel(context, () => SoundscapeCardModel());
    soundscapeCardModel2 = createModel(context, () => SoundscapeCardModel());
    soundscapeCardModel3 = createModel(context, () => SoundscapeCardModel());
    rowScrollController3 = ScrollController();
    moodCategoryCardModel1 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel2 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel3 =
        createModel(context, () => MoodCategoryCardModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    rowScrollController1?.dispose();
    rowScrollController2?.dispose();
    soundscapeCardModel1.dispose();
    soundscapeCardModel2.dispose();
    soundscapeCardModel3.dispose();
    rowScrollController3?.dispose();
    moodCategoryCardModel1.dispose();
    moodCategoryCardModel2.dispose();
    moodCategoryCardModel3.dispose();
  }
}
