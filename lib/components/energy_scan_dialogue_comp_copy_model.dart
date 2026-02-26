import '/flutter_flow/flutter_flow_util.dart';
import 'energy_scan_dialogue_comp_copy_widget.dart'
    show EnergyScanDialogueCompCopyWidget;
import 'package:flutter/material.dart';

class EnergyScanDialogueCompCopyModel
    extends FlutterFlowModel<EnergyScanDialogueCompCopyWidget> {
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
