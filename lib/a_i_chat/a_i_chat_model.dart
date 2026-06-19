import '/components/chat_bubble_glass_widget.dart';
import '/components/glass_action_pill_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_chat_widget.dart' show AIChatWidget;
import 'package:flutter/material.dart';

class AIChatModel extends FlutterFlowModel<AIChatWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for ChatBubbleGlass.
  late ChatBubbleGlassModel chatBubbleGlassModel1;
  // Model for ChatBubbleGlass.
  late ChatBubbleGlassModel chatBubbleGlassModel2;
  // Model for ChatBubbleGlass.
  late ChatBubbleGlassModel chatBubbleGlassModel3;
  // State field(s) for Row widget.
  ScrollController? rowScrollController;
  // Model for GlassActionPill.
  late GlassActionPillModel glassActionPillModel1;
  // Model for GlassActionPill.
  late GlassActionPillModel glassActionPillModel2;
  // Model for GlassActionPill.
  late GlassActionPillModel glassActionPillModel3;
  // Model for TextField.
  late TextFieldModel textFieldModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    chatBubbleGlassModel1 = createModel(context, () => ChatBubbleGlassModel());
    chatBubbleGlassModel2 = createModel(context, () => ChatBubbleGlassModel());
    chatBubbleGlassModel3 = createModel(context, () => ChatBubbleGlassModel());
    rowScrollController = ScrollController();
    glassActionPillModel1 = createModel(context, () => GlassActionPillModel());
    glassActionPillModel2 = createModel(context, () => GlassActionPillModel());
    glassActionPillModel3 = createModel(context, () => GlassActionPillModel());
    textFieldModel = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    chatBubbleGlassModel1.dispose();
    chatBubbleGlassModel2.dispose();
    chatBubbleGlassModel3.dispose();
    rowScrollController?.dispose();
    glassActionPillModel1.dispose();
    glassActionPillModel2.dispose();
    glassActionPillModel3.dispose();
    textFieldModel.dispose();
  }
}
