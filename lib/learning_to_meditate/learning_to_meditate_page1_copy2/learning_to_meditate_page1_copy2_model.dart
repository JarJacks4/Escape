import '/flutter_flow/flutter_flow_util.dart';
import 'learning_to_meditate_page1_copy2_widget.dart'
    show LearningToMeditatePage1Copy2Widget;
import 'package:flutter/material.dart';

class LearningToMeditatePage1Copy2Model
    extends FlutterFlowModel<LearningToMeditatePage1Copy2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
  void dispose() {
    tabBarController?.dispose();
  }
}
