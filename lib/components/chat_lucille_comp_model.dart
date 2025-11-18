import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/lucille_g_p_t_comp/ai_chat_component/ai_chat_component_widget.dart';
import 'chat_lucille_comp_widget.dart' show ChatLucilleCompWidget;
import 'package:flutter/material.dart';

class ChatLucilleCompModel extends FlutterFlowModel<ChatLucilleCompWidget> {
  ///  Local state fields for this component.

  bool isListening = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Custom Action - startListening] action in LottieAnimation widget.
  String? returnedVoiceText;
  // Stores action output result for [Backend Call - API (GetChatHistory)] action in LottieAnimation widget.
  ApiCallResponse? apiResult80y;
  // Stores action output result for [Backend Call - API (Chat)] action in LottieAnimation widget.
  ApiCallResponse? voiceChatLucilleResponse1;
  // Stores action output result for [Backend Call - API (CreateSession)] action in LottieAnimation widget.
  ApiCallResponse? sessionIDVoiceChat;
  // Stores action output result for [Backend Call - API (Chat)] action in LottieAnimation widget.
  ApiCallResponse? voiceChatLucilleResponse2;
  // Model for aiChat_Component component.
  late AiChatComponentModel aiChatComponentModel;

  @override
  void initState(BuildContext context) {
    aiChatComponentModel = createModel(context, () => AiChatComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    aiChatComponentModel.dispose();
  }
}
