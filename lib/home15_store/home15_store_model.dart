import '/flutter_flow/flutter_flow_util.dart';
import 'home15_store_widget.dart' show Home15StoreWidget;
import 'package:flutter/material.dart';

class Home15StoreModel extends FlutterFlowModel<Home15StoreWidget> {
  ///  State fields for stateful widgets in this page.

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
