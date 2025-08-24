import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lucille_new_chat_widget.dart' show LucilleNewChatWidget;
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:flutter/material.dart';

class LucilleNewChatModel extends FlutterFlowModel<LucilleNewChatWidget> {
  ///  Local state fields for this page.

  List<ChatStruct> chatConvo = [];
  void addToChatConvo(ChatStruct item) => chatConvo.add(item);
  void removeFromChatConvo(ChatStruct item) => chatConvo.remove(item);
  void removeAtIndexFromChatConvo(int index) => chatConvo.removeAt(index);
  void insertAtIndexInChatConvo(int index, ChatStruct item) =>
      chatConvo.insert(index, item);
  void updateChatConvoAtIndex(int index, Function(ChatStruct) updateFn) =>
      chatConvo[index] = updateFn(chatConvo[index]);

  String? sessionID;

  String? userMessage;

  String? llmResponse;

  List<String> llmConversation = [];
  void addToLlmConversation(String item) => llmConversation.add(item);
  void removeFromLlmConversation(String item) => llmConversation.remove(item);
  void removeAtIndexFromLlmConversation(int index) =>
      llmConversation.removeAt(index);
  void insertAtIndexInLlmConversation(int index, String item) =>
      llmConversation.insert(index, item);
  void updateLlmConversationAtIndex(int index, Function(String) updateFn) =>
      llmConversation[index] = updateFn(llmConversation[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetSession)] action in LucilleNewChat widget.
  ApiCallResponse? apiResultagn;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (SendMessage)] action in IconButton widget.
  ApiCallResponse? sendMessage;
  // Stores action output result for [Backend Call - API (GetChatHistory)] action in IconButton widget.
  ApiCallResponse? getChatHistoryAPI;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
