import '/components/staggered_view_affirmations/staggered_view_affirmations_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'tabbar_home_affirmations_widget.dart' show TabbarHomeAffirmationsWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabbarHomeAffirmationsModel
    extends FlutterFlowModel<TabbarHomeAffirmationsWidget> {
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
  // Model for StaggeredViewAffirmations component.
  late StaggeredViewAffirmationsModel staggeredViewAffirmationsModel;

  @override
  void initState(BuildContext context) {
    staggeredViewAffirmationsModel =
        createModel(context, () => StaggeredViewAffirmationsModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    staggeredViewAffirmationsModel.dispose();
  }
}
