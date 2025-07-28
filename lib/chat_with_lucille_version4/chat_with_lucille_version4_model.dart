import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_with_lucille_version4_widget.dart'
    show ChatWithLucilleVersion4Widget;
import 'package:flutter/material.dart';

class ChatWithLucilleVersion4Model
    extends FlutterFlowModel<ChatWithLucilleVersion4Widget> {
  ///  Local state fields for this page.

  List<ChatStruct> chats = [];
  void addToChats(ChatStruct item) => chats.add(item);
  void removeFromChats(ChatStruct item) => chats.remove(item);
  void removeAtIndexFromChats(int index) => chats.removeAt(index);
  void insertAtIndexInChats(int index, ChatStruct item) =>
      chats.insert(index, item);
  void updateChatsAtIndex(int index, Function(ChatStruct) updateFn) =>
      chats[index] = updateFn(chats[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [AI Agent - Send Message to ChatWithLucilleAgent] action in CircleImage widget.
  String? chatWithLucilleAction;
  // State field(s) for Input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();
  }
}
