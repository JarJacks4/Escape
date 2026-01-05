import '/components/mind_page_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mind_page_widget.dart' show MindPageWidget;
import 'package:flutter/material.dart';

class MindPageModel extends FlutterFlowModel<MindPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MindPageVersion5 component.
  late MindPageVersion5Model mindPageVersion5Model;

  @override
  void initState(BuildContext context) {
    mindPageVersion5Model = createModel(context, () => MindPageVersion5Model());
  }

  @override
  void dispose() {
    mindPageVersion5Model.dispose();
  }
}
