import '/chat_g_p_t_component/ai_chat_component_1/ai_chat_component1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_ai_screen1_widget.dart' show ChatAiScreen1Widget;
import 'package:flutter/material.dart';

class ChatAiScreen1Model extends FlutterFlowModel<ChatAiScreen1Widget> {
  ///  Local state fields for this page.

  String? inputContent = '';

  dynamic chatHistory;

  bool aiResponding = false;

  ///  State fields for stateful widgets in this page.

  // Model for aiChat_Component_1 component.
  late AiChatComponent1Model aiChatComponent1Model;

  @override
  void initState(BuildContext context) {
    aiChatComponent1Model = createModel(context, () => AiChatComponent1Model());
  }

  @override
  void dispose() {
    aiChatComponent1Model.dispose();
  }
}
