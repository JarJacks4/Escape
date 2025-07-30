import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lucille_new_chat_widget.dart' show LucilleNewChatWidget;
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

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [AI Agent - Send Message to ChatWithLucilleAgent] action in IconButton widget.
  String? chatWithLucilleAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
