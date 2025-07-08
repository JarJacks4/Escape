import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'display_name_f_i_n_a_l_widget.dart' show DisplayNameFINALWidget;
import 'package:flutter/material.dart';

class DisplayNameFINALModel extends FlutterFlowModel<DisplayNameFINALWidget> {
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
