import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/lucille_g_p_t_comp/writing_indicator/writing_indicator_widget.dart';
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

  List<LucilleChatStruct> chatMessages = [];
  void addToChatMessages(LucilleChatStruct item) => chatMessages.add(item);
  void removeFromChatMessages(LucilleChatStruct item) =>
      chatMessages.remove(item);
  void removeAtIndexFromChatMessages(int index) => chatMessages.removeAt(index);
  void insertAtIndexInChatMessages(int index, LucilleChatStruct item) =>
      chatMessages.insert(index, item);
  void updateChatMessagesAtIndex(
          int index, Function(LucilleChatStruct) updateFn) =>
      chatMessages[index] = updateFn(chatMessages[index]);

  String? userInput;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for writingIndicator component.
  late WritingIndicatorModel writingIndicatorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (CreateSession)] action in IconButton widget.
  ApiCallResponse? sessionID;
  // Stores action output result for [Backend Call - API (GetChatHistory)] action in IconButton widget.
  ApiCallResponse? getChatHistoryResponse;
  // Stores action output result for [Backend Call - API (Lucille Chat)] action in IconButton widget.
  ApiCallResponse? chatResult;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    writingIndicatorModel = createModel(context, () => WritingIndicatorModel());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    writingIndicatorModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
