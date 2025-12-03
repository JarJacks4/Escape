import '/flutter_flow/flutter_flow_util.dart';
import 'soundscapes_widget.dart' show SoundscapesWidget;
import 'package:flutter/material.dart';

class SoundscapesModel extends FlutterFlowModel<SoundscapesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextFieldSearch widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    listViewController3 = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldSearchFocusNode?.dispose();
    textFieldSearchTextController?.dispose();

    listViewController1?.dispose();
    listViewController2?.dispose();
    listViewController3?.dispose();
  }
}
