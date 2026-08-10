import '/components/mood_category_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_i_soundscapes_f_i_n_a_l_widget.dart' show AISoundscapesFINALWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AISoundscapesFINALModel
    extends FlutterFlowModel<AISoundscapesFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  AudioPlayer? soundPlayer1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

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
  // State field(s) for Row widget.
  ScrollController? rowScrollController3;
  AudioPlayer? soundPlayer4;
  // State field(s) for Row widget.
  ScrollController? rowScrollController4;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel4;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel5;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel6;
  AudioPlayer? soundPlayer5;
  // State field(s) for Row widget.
  ScrollController? rowScrollController5;
  AudioPlayer? soundPlayer6;
  // State field(s) for Row widget.
  ScrollController? rowScrollController6;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel7;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel8;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel9;
  AudioPlayer? soundPlayer7;
  // State field(s) for Row widget.
  ScrollController? rowScrollController7;
  AudioPlayer? soundPlayer8;
  // State field(s) for Row widget.
  ScrollController? rowScrollController8;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel10;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel11;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel12;
  AudioPlayer? soundPlayer9;
  // State field(s) for Row widget.
  ScrollController? rowScrollController9;
  AudioPlayer? soundPlayer10;
  // State field(s) for Row widget.
  ScrollController? rowScrollController10;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel13;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel14;
  // Model for MoodCategoryCard.
  late MoodCategoryCardModel moodCategoryCardModel15;
  AudioPlayer? soundPlayer11;

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
    rowScrollController3 = ScrollController();
    rowScrollController4 = ScrollController();
    moodCategoryCardModel4 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel5 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel6 =
        createModel(context, () => MoodCategoryCardModel());
    rowScrollController5 = ScrollController();
    rowScrollController6 = ScrollController();
    moodCategoryCardModel7 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel8 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel9 =
        createModel(context, () => MoodCategoryCardModel());
    rowScrollController7 = ScrollController();
    rowScrollController8 = ScrollController();
    moodCategoryCardModel10 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel11 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel12 =
        createModel(context, () => MoodCategoryCardModel());
    rowScrollController9 = ScrollController();
    rowScrollController10 = ScrollController();
    moodCategoryCardModel13 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel14 =
        createModel(context, () => MoodCategoryCardModel());
    moodCategoryCardModel15 =
        createModel(context, () => MoodCategoryCardModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    columnScrollController?.dispose();
    tabBarController?.dispose();
    rowScrollController1?.dispose();
    rowScrollController2?.dispose();
    moodCategoryCardModel1.dispose();
    moodCategoryCardModel2.dispose();
    moodCategoryCardModel3.dispose();
    rowScrollController3?.dispose();
    rowScrollController4?.dispose();
    moodCategoryCardModel4.dispose();
    moodCategoryCardModel5.dispose();
    moodCategoryCardModel6.dispose();
    rowScrollController5?.dispose();
    rowScrollController6?.dispose();
    moodCategoryCardModel7.dispose();
    moodCategoryCardModel8.dispose();
    moodCategoryCardModel9.dispose();
    rowScrollController7?.dispose();
    rowScrollController8?.dispose();
    moodCategoryCardModel10.dispose();
    moodCategoryCardModel11.dispose();
    moodCategoryCardModel12.dispose();
    rowScrollController9?.dispose();
    rowScrollController10?.dispose();
    moodCategoryCardModel13.dispose();
    moodCategoryCardModel14.dispose();
    moodCategoryCardModel15.dispose();
  }
}
