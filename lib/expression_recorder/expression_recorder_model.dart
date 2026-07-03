import '/flutter_flow/flutter_flow_util.dart';
import 'expression_recorder_widget.dart' show ExpressionRecorderWidget;
import 'package:flutter/material.dart';

class ExpressionRecorderModel
    extends FlutterFlowModel<ExpressionRecorderWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController1;
  // State field(s) for Column widget.
  ScrollController? columnScrollController2;

  @override
  void initState(BuildContext context) {
    columnScrollController1 = ScrollController();
    columnScrollController2 = ScrollController();
  }

  @override
  void dispose() {
    columnScrollController1?.dispose();
    columnScrollController2?.dispose();
  }
}
