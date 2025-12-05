import '/flutter_flow/flutter_flow_util.dart';
import 'community_home_version5_copy_widget.dart'
    show CommunityHomeVersion5CopyWidget;
import 'package:flutter/material.dart';

class CommunityHomeVersion5CopyModel
    extends FlutterFlowModel<CommunityHomeVersion5CopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController?.dispose();
  }
}
