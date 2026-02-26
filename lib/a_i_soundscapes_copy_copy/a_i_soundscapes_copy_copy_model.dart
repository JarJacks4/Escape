import '/components/nav_bar_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_i_soundscapes_copy_copy_widget.dart' show AISoundscapesCopyCopyWidget;
import 'package:flutter/material.dart';

class AISoundscapesCopyCopyModel
    extends FlutterFlowModel<AISoundscapesCopyCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  // State field(s) for Column widget.
  ScrollController? columnController6;
  // Model for NavBarVersion5 component.
  late NavBarVersion5Model navBarVersion5Model;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    columnController5 = ScrollController();
    columnController6 = ScrollController();
    navBarVersion5Model = createModel(context, () => NavBarVersion5Model());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    tabBarController?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
    columnController6?.dispose();
    navBarVersion5Model.dispose();
  }
}
