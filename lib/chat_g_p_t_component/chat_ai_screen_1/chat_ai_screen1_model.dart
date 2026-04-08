import '/chat_g_p_t_component/ai_chat_component_1/ai_chat_component1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'chat_ai_screen1_widget.dart' show ChatAiScreen1Widget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatAiScreen1Model extends FlutterFlowModel<ChatAiScreen1Widget> {
  ///  Local state fields for this page.

  String? inputContent = '';

  dynamic chatHistory;

  bool aiResponding = false;

  ///  State fields for stateful widgets in this page.

  // Model for aiChat_Component_1 component.
  late AiChatComponent1Model aiChatComponent1Model;

  @override
  void initState(BuildContext context) {
    aiChatComponent1Model = createModel(context, () => AiChatComponent1Model());
  }

  @override
  void dispose() {
    aiChatComponent1Model.dispose();
  }
}
