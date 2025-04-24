import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'lucille_g_p_t_widget.dart' show LucilleGPTWidget;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LucilleGPTModel extends FlutterFlowModel<LucilleGPTWidget> {
  ///  Local state fields for this page.

  List<String> inputContent = [];
  void addToInputContent(String item) => inputContent.add(item);
  void removeFromInputContent(String item) => inputContent.remove(item);
  void removeAtIndexFromInputContent(int index) => inputContent.removeAt(index);
  void insertAtIndexInInputContent(int index, String item) =>
      inputContent.insert(index, item);
  void updateInputContentAtIndex(int index, Function(String) updateFn) =>
      inputContent[index] = updateFn(inputContent[index]);

  dynamic chatHistory;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ChatWithLucille )] action in IconButton widget.
  ApiCallResponse? lucilleResponse;

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
