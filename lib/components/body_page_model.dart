import '/flutter_flow/flutter_flow_util.dart';
import 'body_page_widget.dart' show BodyPageWidget;
import 'package:flutter/material.dart';

class BodyPageModel extends FlutterFlowModel<BodyPageWidget> {
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
