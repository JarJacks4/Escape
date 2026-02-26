import '/components/mind_page_version5_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mind_page_widget.dart' show MindPageWidget;
import 'package:flutter/material.dart';

class MindPageModel extends FlutterFlowModel<MindPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MindPageVersion5Copy component.
  late MindPageVersion5CopyModel mindPageVersion5CopyModel;

  @override
  void initState(BuildContext context) {
    mindPageVersion5CopyModel =
        createModel(context, () => MindPageVersion5CopyModel());
  }

  @override
  void dispose() {
    mindPageVersion5CopyModel.dispose();
  }
}
