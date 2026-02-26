import '/flutter_flow/flutter_flow_util.dart';
import 'new_home_version5_widget.dart' show NewHomeVersion5Widget;
import 'package:flutter/material.dart';

class NewHomeVersion5Model extends FlutterFlowModel<NewHomeVersion5Widget> {
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
