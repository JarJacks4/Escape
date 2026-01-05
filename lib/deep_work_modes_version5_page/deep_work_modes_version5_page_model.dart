import '/components/deep_work_modes_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'deep_work_modes_version5_page_widget.dart'
    show DeepWorkModesVersion5PageWidget;
import 'package:flutter/material.dart';

class DeepWorkModesVersion5PageModel
    extends FlutterFlowModel<DeepWorkModesVersion5PageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DeepWorkModesVersion5 component.
  late DeepWorkModesVersion5Model deepWorkModesVersion5Model;

  @override
  void initState(BuildContext context) {
    deepWorkModesVersion5Model =
        createModel(context, () => DeepWorkModesVersion5Model());
  }

  @override
  void dispose() {
    deepWorkModesVersion5Model.dispose();
  }
}
