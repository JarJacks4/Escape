import '/components/reset_version5_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reset_page_copy_widget.dart' show ResetPageCopyWidget;
import 'package:flutter/material.dart';

class ResetPageCopyModel extends FlutterFlowModel<ResetPageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ResetVersion5Copy component.
  late ResetVersion5CopyModel resetVersion5CopyModel;

  @override
  void initState(BuildContext context) {
    resetVersion5CopyModel =
        createModel(context, () => ResetVersion5CopyModel());
  }

  @override
  void dispose() {
    resetVersion5CopyModel.dispose();
  }
}
