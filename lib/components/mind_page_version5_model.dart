import '/flutter_flow/flutter_flow_util.dart';
import 'mind_page_version5_widget.dart' show MindPageVersion5Widget;
import 'package:flutter/material.dart';

class MindPageVersion5Model extends FlutterFlowModel<MindPageVersion5Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
