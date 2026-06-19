import '/flutter_flow/flutter_flow_util.dart';
import 'mindful_tracker_version7_widget.dart' show MindfulTrackerVersion7Widget;
import 'package:flutter/material.dart';

class MindfulTrackerVersion7Model
    extends FlutterFlowModel<MindfulTrackerVersion7Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    rowController?.dispose();
  }
}
