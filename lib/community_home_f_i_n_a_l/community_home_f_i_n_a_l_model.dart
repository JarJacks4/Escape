import '/flutter_flow/flutter_flow_util.dart';
import 'community_home_f_i_n_a_l_widget.dart' show CommunityHomeFINALWidget;
import 'package:flutter/material.dart';

class CommunityHomeFINALModel
    extends FlutterFlowModel<CommunityHomeFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for ListView widget.
  ScrollController? listViewController4;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  // State field(s) for ListView widget.
  ScrollController? listViewController5;
  // State field(s) for Column widget.
  ScrollController? columnController6;
  // State field(s) for Column widget.
  ScrollController? columnController7;
  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    listViewController1 = ScrollController();
    columnController2 = ScrollController();
    listViewController2 = ScrollController();
    columnController3 = ScrollController();
    listViewController3 = ScrollController();
    columnController4 = ScrollController();
    listViewController4 = ScrollController();
    columnController5 = ScrollController();
    listViewController5 = ScrollController();
    columnController6 = ScrollController();
    columnController7 = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    tabBarController?.dispose();
    listViewController1?.dispose();
    columnController2?.dispose();
    listViewController2?.dispose();
    columnController3?.dispose();
    listViewController3?.dispose();
    columnController4?.dispose();
    listViewController4?.dispose();
    columnController5?.dispose();
    listViewController5?.dispose();
    columnController6?.dispose();
    columnController7?.dispose();
    rowController?.dispose();
  }
}
