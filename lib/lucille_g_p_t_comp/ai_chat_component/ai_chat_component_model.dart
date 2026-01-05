import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ai_chat_component_widget.dart' show AiChatComponentWidget;
import 'package:flutter/material.dart';

class AiChatComponentModel extends FlutterFlowModel<AiChatComponentWidget> {
  ///  Local state fields for this component.

  dynamic chatHistory;

  bool aiResponding = false;

  String inputContent = '';

  List<LucilleChatStruct> chatHistoryLucille = [];
  void addToChatHistoryLucille(LucilleChatStruct item) =>
      chatHistoryLucille.add(item);
  void removeFromChatHistoryLucille(LucilleChatStruct item) =>
      chatHistoryLucille.remove(item);
  void removeAtIndexFromChatHistoryLucille(int index) =>
      chatHistoryLucille.removeAt(index);
  void insertAtIndexInChatHistoryLucille(int index, LucilleChatStruct item) =>
      chatHistoryLucille.insert(index, item);
  void updateChatHistoryLucilleAtIndex(
          int index, Function(LucilleChatStruct) updateFn) =>
      chatHistoryLucille[index] = updateFn(chatHistoryLucille[index]);

  String? sessionId;

  String? userInput;

  bool? newMessage = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
