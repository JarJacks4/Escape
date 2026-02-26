import '/flutter_flow/flutter_flow_util.dart';
import 'sample_blank_widget.dart' show SampleBlankWidget;
import 'package:flutter/material.dart';

class SampleBlankModel extends FlutterFlowModel<SampleBlankWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for EditEmail widget.
  FocusNode? editEmailFocusNode;
  TextEditingController? editEmailTextController;
  String? Function(BuildContext, String?)? editEmailTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    editEmailFocusNode?.dispose();
    editEmailTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }
}
