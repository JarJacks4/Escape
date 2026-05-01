import '/flutter_flow/flutter_flow_util.dart';
import 'chat_with_lucille_comp_widget.dart' show ChatWithLucilleCompWidget;
import 'package:flutter/material.dart';

class ChatWithLucilleCompModel
    extends FlutterFlowModel<ChatWithLucilleCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  // State field(s) for Row widget.
  ScrollController? rowController3;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    rowController3 = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController1?.dispose();
    rowController2?.dispose();
    rowController3?.dispose();
  }
}
