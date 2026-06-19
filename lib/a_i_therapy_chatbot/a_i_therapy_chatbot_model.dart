import '/components/chat_bubble_widget.dart';
import '/components/suggestion_chip_widget.dart';
import '/components/text_field2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_therapy_chatbot_widget.dart' show AITherapyChatbotWidget;
import 'package:flutter/material.dart';

class AITherapyChatbotModel extends FlutterFlowModel<AITherapyChatbotWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for ChatBubble.
  late ChatBubbleModel chatBubbleModel1;
  // Model for ChatBubble.
  late ChatBubbleModel chatBubbleModel2;
  // Model for ChatBubble.
  late ChatBubbleModel chatBubbleModel3;
  // State field(s) for Row widget.
  ScrollController? rowScrollController;
  // Model for SuggestionChip.
  late SuggestionChipModel suggestionChipModel1;
  // Model for SuggestionChip.
  late SuggestionChipModel suggestionChipModel2;
  // Model for SuggestionChip.
  late SuggestionChipModel suggestionChipModel3;
  // Model for SuggestionChip.
  late SuggestionChipModel suggestionChipModel4;
  // Model for TextField.
  late TextField2Model textFieldModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    chatBubbleModel1 = createModel(context, () => ChatBubbleModel());
    chatBubbleModel2 = createModel(context, () => ChatBubbleModel());
    chatBubbleModel3 = createModel(context, () => ChatBubbleModel());
    rowScrollController = ScrollController();
    suggestionChipModel1 = createModel(context, () => SuggestionChipModel());
    suggestionChipModel2 = createModel(context, () => SuggestionChipModel());
    suggestionChipModel3 = createModel(context, () => SuggestionChipModel());
    suggestionChipModel4 = createModel(context, () => SuggestionChipModel());
    textFieldModel = createModel(context, () => TextField2Model());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    chatBubbleModel1.dispose();
    chatBubbleModel2.dispose();
    chatBubbleModel3.dispose();
    rowScrollController?.dispose();
    suggestionChipModel1.dispose();
    suggestionChipModel2.dispose();
    suggestionChipModel3.dispose();
    suggestionChipModel4.dispose();
    textFieldModel.dispose();
  }
}
