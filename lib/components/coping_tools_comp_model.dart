import '/flutter_flow/flutter_flow_util.dart';
import 'coping_tools_comp_widget.dart' show CopingToolsCompWidget;
import 'package:flutter/material.dart';

class CopingToolsCompModel extends FlutterFlowModel<CopingToolsCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
  }
}
