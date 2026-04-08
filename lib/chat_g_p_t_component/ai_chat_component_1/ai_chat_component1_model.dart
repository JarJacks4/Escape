import '/chat_g_p_t_component/empty_list_2/empty_list2_widget.dart';
import '/chat_g_p_t_component/writing_indicator_1/writing_indicator1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'ai_chat_component1_widget.dart' show AiChatComponent1Widget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AiChatComponent1Model extends FlutterFlowModel<AiChatComponent1Widget> {
  ///  Local state fields for this component.

  dynamic chatHistory;

  bool aiResponding = false;

  String inputContent = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for writingIndicator_1 component.
  late WritingIndicator1Model writingIndicator1Model;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    writingIndicator1Model =
        createModel(context, () => WritingIndicator1Model());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    writingIndicator1Model.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
