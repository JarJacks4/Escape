import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'ai_chat_component_widget.dart' show AiChatComponentWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
