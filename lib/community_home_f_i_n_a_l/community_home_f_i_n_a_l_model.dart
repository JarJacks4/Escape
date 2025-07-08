import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'community_home_f_i_n_a_l_widget.dart' show CommunityHomeFINALWidget;
import 'package:flutter/material.dart';

class CommunityHomeFINALModel
    extends FlutterFlowModel<CommunityHomeFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - reorderItems] action in CommunityHomeFINAL widget.
  List<String>? meditationReOrder;
  // Stores action output result for [Custom Action - reorderItems] action in CommunityHomeFINAL widget.
  List<String>? bodyReOrder;
  // Stores action output result for [Custom Action - reorderItems] action in CommunityHomeFINAL widget.
  List<String>? forYouReOrder;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Custom Action - reorderItems] action in TabBar widget.
  List<String>? meditationReOrder1;
  // Stores action output result for [Custom Action - reorderItems] action in TabBar widget.
  List<String>? bodyReOrder2;
  // Stores action output result for [Custom Action - reorderItems] action in TabBar widget.
  List<String>? forYouReOrder3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
