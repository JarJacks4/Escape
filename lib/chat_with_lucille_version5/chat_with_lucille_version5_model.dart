import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/lucille_g_p_t_comp/writing_indicator/writing_indicator_widget.dart';
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

  String? streamedResponse;

  List<String> chatMessages = [];
  void addToChatMessages(String item) => chatMessages.add(item);
  void removeFromChatMessages(String item) => chatMessages.remove(item);
  void removeAtIndexFromChatMessages(int index) => chatMessages.removeAt(index);
  void insertAtIndexInChatMessages(int index, String item) =>
      chatMessages.insert(index, item);
  void updateChatMessagesAtIndex(int index, Function(String) updateFn) =>
      chatMessages[index] = updateFn(chatMessages[index]);

  bool? newMessage = false;

  String? sessionID;

  List<String> messages = [];
  void addToMessages(String item) => messages.add(item);
  void removeFromMessages(String item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, String item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(String) updateFn) =>
      messages[index] = updateFn(messages[index]);

  List<LucilleStreamResponseFINALStruct> message = [];
  void addToMessage(LucilleStreamResponseFINALStruct item) => message.add(item);
  void removeFromMessage(LucilleStreamResponseFINALStruct item) =>
      message.remove(item);
  void removeAtIndexFromMessage(int index) => message.removeAt(index);
  void insertAtIndexInMessage(
          int index, LucilleStreamResponseFINALStruct item) =>
      message.insert(index, item);
  void updateMessageAtIndex(
          int index, Function(LucilleStreamResponseFINALStruct) updateFn) =>
      message[index] = updateFn(message[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Custom Action - startListening] action in LottieAnimation widget.
  String? returnedVoiceText;
  // Stores action output result for [Backend Call - API (Lucille Streaming Response)] action in LottieAnimation widget.
  ApiCallResponse? getChatHistory2;
  // Stores action output result for [Backend Call - API (Lucille Chat Stream)] action in LottieAnimation widget.
  ApiCallResponse? voiceChatLucilleResponse1;
  // Stores action output result for [Backend Call - API (Lucille Streaming Response)] action in LottieAnimation widget.
  ApiCallResponse? sessionIDVoiceChat;
  // Stores action output result for [Backend Call - API (Lucille Chat Stream)] action in LottieAnimation widget.
  ApiCallResponse? voiceChatLucilleResponse2;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for writingIndicator component.
  late WritingIndicatorModel writingIndicatorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Lucille Streaming Response)] action in IconButton widget.
  ApiCallResponse? lucilleStreamChat;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
    writingIndicatorModel = createModel(context, () => WritingIndicatorModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    tabBarController?.dispose();
    listViewController?.dispose();
    writingIndicatorModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
