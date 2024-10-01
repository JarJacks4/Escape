import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_teaching_pages_widget.dart'
    show MeditationTeachingPagesWidget;
import 'package:flutter/material.dart';

class MeditationTeachingPagesModel
    extends FlutterFlowModel<MeditationTeachingPagesWidget> {
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
