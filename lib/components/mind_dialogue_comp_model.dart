import '/flutter_flow/flutter_flow_util.dart';
import 'mind_dialogue_comp_widget.dart' show MindDialogueCompWidget;
import 'package:flutter/material.dart';

class MindDialogueCompModel extends FlutterFlowModel<MindDialogueCompWidget> {
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
