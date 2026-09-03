import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'screen4_widget.dart' show Screen4Widget;
import 'package:flutter/material.dart';

class Screen4Model extends FlutterFlowModel<Screen4Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late Button7Model buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => Button7Model());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
