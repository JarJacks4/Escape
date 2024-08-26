import '/components/classes_card_widget.dart';
import '/components/feed_video_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'tabbar_home_community_widget.dart' show TabbarHomeCommunityWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabbarHomeCommunityModel
    extends FlutterFlowModel<TabbarHomeCommunityWidget> {
  ///  State fields for stateful widgets in this component.

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
  // Model for ClassesCard component.
  late ClassesCardModel classesCardModel;
  // Model for FeedVideoComponent component.
  late FeedVideoComponentModel feedVideoComponentModel;

  @override
  void initState(BuildContext context) {
    classesCardModel = createModel(context, () => ClassesCardModel());
    feedVideoComponentModel =
        createModel(context, () => FeedVideoComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    classesCardModel.dispose();
    feedVideoComponentModel.dispose();
  }
}
