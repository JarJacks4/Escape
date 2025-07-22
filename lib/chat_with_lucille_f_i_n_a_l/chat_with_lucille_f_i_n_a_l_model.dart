import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_with_lucille_f_i_n_a_l_widget.dart'
    show ChatWithLucilleFINALWidget;
import 'package:flutter/material.dart';

class ChatWithLucilleFINALModel
    extends FlutterFlowModel<ChatWithLucilleFINALWidget> {
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

  // State field(s) for Input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  // Stores action output result for [AI Agent - Send Message to ChatWithLucilleAgent] action in CircleImage widget.
  String? chatWithLucilleAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();
  }
}
