import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'thread_chats_widget.dart' show ThreadChatsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThreadChatsModel extends FlutterFlowModel<ThreadChatsWidget> {
  ///  Local state fields for this component.

  List<MessageStruct> conversations = [];
  void addToConversations(MessageStruct item) => conversations.add(item);
  void removeFromConversations(MessageStruct item) =>
      conversations.remove(item);
  void removeAtIndexFromConversations(int index) =>
      conversations.removeAt(index);
  void insertAtIndexInConversations(int index, MessageStruct item) =>
      conversations.insert(index, item);
  void updateConversationsAtIndex(
          int index, Function(MessageStruct) updateFn) =>
      conversations[index] = updateFn(conversations[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? createdText;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
