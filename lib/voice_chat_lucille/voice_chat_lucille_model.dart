import '/flutter_flow/flutter_flow_util.dart';
import 'voice_chat_lucille_widget.dart' show VoiceChatLucilleWidget;
import 'package:flutter/material.dart';

class VoiceChatLucilleModel extends FlutterFlowModel<VoiceChatLucilleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
