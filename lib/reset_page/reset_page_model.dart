import '/components/reset_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reset_page_widget.dart' show ResetPageWidget;
import 'package:flutter/material.dart';

class ResetPageModel extends FlutterFlowModel<ResetPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ResetVersion5 component.
  late ResetVersion5Model resetVersion5Model;

  @override
  void initState(BuildContext context) {
    resetVersion5Model = createModel(context, () => ResetVersion5Model());
  }

  @override
  void dispose() {
    resetVersion5Model.dispose();
  }
}
