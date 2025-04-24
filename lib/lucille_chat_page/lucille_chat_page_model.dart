import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/thread_chats_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'lucille_chat_page_widget.dart' show LucilleChatPageWidget;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LucilleChatPageModel extends FlutterFlowModel<LucilleChatPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? activeChat;

  bool hasActiveChat = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetSessionId)] action in LucilleChatPage widget.
  ApiCallResponse? apiResulthiv;
  // Model for thread_chats component.
  late ThreadChatsModel threadChatsModel;

  @override
  void initState(BuildContext context) {
    threadChatsModel = createModel(context, () => ThreadChatsModel());
  }

  @override
  void dispose() {
    threadChatsModel.dispose();
  }
}
