import '/components/active_challenge_card_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quest_comp_version5_widget.dart' show QuestCompVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class QuestCompVersion5Model extends FlutterFlowModel<QuestCompVersion5Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  // Model for ActiveChallengeCardComp component.
  late ActiveChallengeCardCompModel activeChallengeCardCompModel1;
  // Model for ActiveChallengeCardComp component.
  late ActiveChallengeCardCompModel activeChallengeCardCompModel2;
  // Model for ActiveChallengeCardComp component.
  late ActiveChallengeCardCompModel activeChallengeCardCompModel3;
  // Model for ActiveChallengeCardComp component.
  late ActiveChallengeCardCompModel activeChallengeCardCompModel4;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    activeChallengeCardCompModel1 =
        createModel(context, () => ActiveChallengeCardCompModel());
    activeChallengeCardCompModel2 =
        createModel(context, () => ActiveChallengeCardCompModel());
    activeChallengeCardCompModel3 =
        createModel(context, () => ActiveChallengeCardCompModel());
    activeChallengeCardCompModel4 =
        createModel(context, () => ActiveChallengeCardCompModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    activeChallengeCardCompModel1.dispose();
    activeChallengeCardCompModel2.dispose();
    activeChallengeCardCompModel3.dispose();
    activeChallengeCardCompModel4.dispose();
  }
}
