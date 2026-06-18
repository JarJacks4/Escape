import '/components/button4_widget.dart';
import '/components/insight_chip_widget.dart';
import '/components/mode_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voice_text_journaling_widget.dart' show VoiceTextJournalingWidget;
import 'package:flutter/material.dart';

class VoiceTextJournalingModel
    extends FlutterFlowModel<VoiceTextJournalingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for ModeCard.
  late ModeCardModel modeCardModel1;
  // Model for ModeCard.
  late ModeCardModel modeCardModel2;
  // Model for InsightChip.
  late InsightChipModel insightChipModel1;
  // Model for InsightChip.
  late InsightChipModel insightChipModel2;
  // Model for InsightChip.
  late InsightChipModel insightChipModel3;
  // Model for InsightChip.
  late InsightChipModel insightChipModel4;
  // Model for Button.
  late Button4Model buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    modeCardModel1 = createModel(context, () => ModeCardModel());
    modeCardModel2 = createModel(context, () => ModeCardModel());
    insightChipModel1 = createModel(context, () => InsightChipModel());
    insightChipModel2 = createModel(context, () => InsightChipModel());
    insightChipModel3 = createModel(context, () => InsightChipModel());
    insightChipModel4 = createModel(context, () => InsightChipModel());
    buttonModel = createModel(context, () => Button4Model());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    modeCardModel1.dispose();
    modeCardModel2.dispose();
    insightChipModel1.dispose();
    insightChipModel2.dispose();
    insightChipModel3.dispose();
    insightChipModel4.dispose();
    buttonModel.dispose();
  }
}
