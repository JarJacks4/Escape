import '/flutter_flow/flutter_flow_util.dart';
import 'classes_page_widget.dart' show ClassesPageWidget;
import 'package:flutter/material.dart';

class ClassesPageModel extends FlutterFlowModel<ClassesPageWidget> {
  ///  State fields for stateful widgets in this page.

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
