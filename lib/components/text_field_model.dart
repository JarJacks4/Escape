import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_widget.dart' show TextFieldWidget;
import 'package:flutter/material.dart';

class TextFieldModel extends FlutterFlowModel<TextFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();
  }
}
