import '/flutter_flow/flutter_flow_util.dart';
import 'header02_business_summary_widget.dart'
    show Header02BusinessSummaryWidget;
import 'package:flutter/material.dart';

class Header02BusinessSummaryModel
    extends FlutterFlowModel<Header02BusinessSummaryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
