import '/flutter_flow/flutter_flow_util.dart';
import 'recommendations_page_widget.dart' show RecommendationsPageWidget;
import 'package:flutter/material.dart';

class RecommendationsPageModel
    extends FlutterFlowModel<RecommendationsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
  }
}
