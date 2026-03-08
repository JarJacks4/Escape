import '/components/explore_screen_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'explore_page_version5_widget.dart' show ExplorePageVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ExplorePageVersion5Model
    extends FlutterFlowModel<ExplorePageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for ExploreScreen component.
  late ExploreScreenModel exploreScreenModel;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    exploreScreenModel = createModel(context, () => ExploreScreenModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    exploreScreenModel.dispose();
    sideNavModel.dispose();
  }
}
