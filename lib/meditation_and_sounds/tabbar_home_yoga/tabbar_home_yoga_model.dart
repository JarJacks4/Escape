import '/components/beginners_yoga_comp/beginners_yoga_comp_widget.dart';
import '/components/grounding_videos/grounding_videos_widget.dart';
import '/components/pilates_videos_comp/pilates_videos_comp_widget.dart';
import '/components/tai_chi_videos_comp/tai_chi_videos_comp_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabbar_home_yoga_widget.dart' show TabbarHomeYogaWidget;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabbarHomeYogaModel extends FlutterFlowModel<TabbarHomeYogaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for BeginnersYogaComp component.
  late BeginnersYogaCompModel beginnersYogaCompModel;
  // Model for PilatesVideosComp component.
  late PilatesVideosCompModel pilatesVideosCompModel;
  // Model for TaiChiVideosComp component.
  late TaiChiVideosCompModel taiChiVideosCompModel;
  // Model for GroundingVideos component.
  late GroundingVideosModel groundingVideosModel;

  @override
  void initState(BuildContext context) {
    beginnersYogaCompModel =
        createModel(context, () => BeginnersYogaCompModel());
    pilatesVideosCompModel =
        createModel(context, () => PilatesVideosCompModel());
    taiChiVideosCompModel = createModel(context, () => TaiChiVideosCompModel());
    groundingVideosModel = createModel(context, () => GroundingVideosModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    beginnersYogaCompModel.dispose();
    pilatesVideosCompModel.dispose();
    taiChiVideosCompModel.dispose();
    groundingVideosModel.dispose();
  }
}
