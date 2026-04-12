import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/lucille_g_p_t_comp/writing_indicator/writing_indicator_widget.dart';
import 'chat_with_lucille_version5_widget.dart'
    show ChatWithLucilleVersion5Widget;
import 'dart:async';
import 'package:flutter/material.dart';

class ChatWithLucilleVersion5Model
    extends FlutterFlowModel<ChatWithLucilleVersion5Widget> {
  ///  Local state fields for this page.

  bool aiIsResponsing = false;

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

  // Uses LucilleStreamFINALStruct for proper role-based rendering
  List<LucilleStreamFINALStruct> streamMessages = [];
  void addToStreamMessages(LucilleStreamFINALStruct item) =>
      streamMessages.add(item);
  void removeFromStreamMessages(LucilleStreamFINALStruct item) =>
      streamMessages.remove(item);
  void removeAtIndexFromStreamMessages(int index) =>
      streamMessages.removeAt(index);
  void insertAtIndexInStreamMessages(
          int index, LucilleStreamFINALStruct item) =>
      streamMessages.insert(index, item);
  void updateStreamMessagesAtIndex(
          int index, Function(LucilleStreamFINALStruct) updateFn) =>
      streamMessages[index] = updateFn(streamMessages[index]);

  String? accumulatedResponse;

  int? aiMessageIndex = 0;

  // Text chat streaming fields
  String accumulatedTextResponse = '';
  bool needsTextUpdate = false;
  Timer? updateTimer;
  StreamSubscription? textStreamSubscription;

  // Voice streaming fields
  StreamSubscription? voiceStreamSubscription;
  ApiCallResponse? voiceChatLucilleResponse1;
  String? returnedVoiceText;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for outer Scrollbar/SingleChildScrollView
  ScrollController? columnController;

  // State field(s) for ListView widget.
  ScrollController? listViewController;

  // Model for writingIndicator component.
  late WritingIndicatorModel writingIndicatorModel;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  // Stores action output result for [Backend Call - API (ChatStream)] action in IconButton widget.
  ApiCallResponse? lucilleStreamChat;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
    writingIndicatorModel = createModel(context, () => WritingIndicatorModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    updateTimer?.cancel();
    textStreamSubscription?.cancel();
    voiceStreamSubscription?.cancel();
    columnController?.dispose();
    listViewController?.dispose();
    writingIndicatorModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
