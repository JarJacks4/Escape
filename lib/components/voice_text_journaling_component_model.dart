import '/components/insight_chip_widget.dart';
import '/components/mode_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voice_text_journaling_component_widget.dart'
    show VoiceTextJournalingComponentWidget;
import 'package:flutter/material.dart';

class VoiceTextJournalingComponentModel
    extends FlutterFlowModel<VoiceTextJournalingComponentWidget> {
  ///  State fields for stateful widgets in this component.

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

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    modeCardModel1 = createModel(context, () => ModeCardModel());
    modeCardModel2 = createModel(context, () => ModeCardModel());
    insightChipModel1 = createModel(context, () => InsightChipModel());
    insightChipModel2 = createModel(context, () => InsightChipModel());
    insightChipModel3 = createModel(context, () => InsightChipModel());
    insightChipModel4 = createModel(context, () => InsightChipModel());
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
  }
}
