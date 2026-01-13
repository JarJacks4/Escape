import '/flutter_flow/flutter_flow_util.dart';
import 'soundscapes_home_comp_copy_widget.dart'
    show SoundscapesHomeCompCopyWidget;
import 'package:flutter/material.dart';

class SoundscapesHomeCompCopyModel
    extends FlutterFlowModel<SoundscapesHomeCompCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for ListView widget.
  ScrollController? listViewController4;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for ListView widget.
  ScrollController? listViewController5;
  // State field(s) for Column widget.
  ScrollController? columnController5;

  @override
  void initState(BuildContext context) {
    listViewController1 = ScrollController();
    columnController1 = ScrollController();
    listViewController2 = ScrollController();
    columnController2 = ScrollController();
    listViewController3 = ScrollController();
    columnController3 = ScrollController();
    listViewController4 = ScrollController();
    columnController4 = ScrollController();
    listViewController5 = ScrollController();
    columnController5 = ScrollController();
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    listViewController1?.dispose();
    columnController1?.dispose();
    listViewController2?.dispose();
    columnController2?.dispose();
    listViewController3?.dispose();
    columnController3?.dispose();
    listViewController4?.dispose();
    columnController4?.dispose();
    listViewController5?.dispose();
    columnController5?.dispose();
  }
}
