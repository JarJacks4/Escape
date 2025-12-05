import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/lucille_g_p_t_comp/ai_chat_component/ai_chat_component_widget.dart';
import 'chat_with_lucille_version5_widget.dart'
    show ChatWithLucilleVersion5Widget;
import 'package:flutter/material.dart';

class ChatWithLucilleVersion5Model
    extends FlutterFlowModel<ChatWithLucilleVersion5Widget> {
  ///  Local state fields for this page.

  bool aiIsResponsing = true;

  List<LucilleChatStruct> chats = [];
  void addToChats(LucilleChatStruct item) => chats.add(item);
  void removeFromChats(LucilleChatStruct item) => chats.remove(item);
  void removeAtIndexFromChats(int index) => chats.removeAt(index);
  void insertAtIndexInChats(int index, LucilleChatStruct item) =>
      chats.insert(index, item);
  void updateChatsAtIndex(int index, Function(LucilleChatStruct) updateFn) =>
      chats[index] = updateFn(chats[index]);

  String userInput = 'userResponse';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Custom Action - startListening] action in LottieAnimation widget.
  String? returnedVoiceText;
  // Stores action output result for [Backend Call - API (GetChatHistory)] action in LottieAnimation widget.
  ApiCallResponse? getChatHistory;
  // Stores action output result for [Backend Call - API (Lucille Chat)] action in LottieAnimation widget.
  ApiCallResponse? voiceChatLucilleResponse1;
  // Stores action output result for [Backend Call - API (CreateSession)] action in LottieAnimation widget.
  ApiCallResponse? sessionIDVoiceChat;
  // Stores action output result for [Backend Call - API (Lucille Chat)] action in LottieAnimation widget.
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
