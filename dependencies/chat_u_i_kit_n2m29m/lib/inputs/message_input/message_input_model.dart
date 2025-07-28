import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'message_input_widget.dart' show MessageInputWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MessageInputModel extends FlutterFlowModel<MessageInputWidget> {
  ///  Local state fields for this component.

  String? textInput;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SendMessage widget.
  FocusNode? sendMessageFocusNode;
  TextEditingController? sendMessageTextController;
  String? Function(BuildContext, String?)? sendMessageTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sendMessageFocusNode?.dispose();
    sendMessageTextController?.dispose();
  }
}
