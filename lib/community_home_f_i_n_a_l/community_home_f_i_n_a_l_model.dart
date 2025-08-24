import '/flutter_flow/flutter_flow_util.dart';
import 'community_home_f_i_n_a_l_widget.dart' show CommunityHomeFINALWidget;
import 'package:flutter/material.dart';

class CommunityHomeFINALModel
    extends FlutterFlowModel<CommunityHomeFINALWidget> {
  ///  Local state fields for this page.

  List<int> reorderList = [];
  void addToReorderList(int item) => reorderList.add(item);
  void removeFromReorderList(int item) => reorderList.remove(item);
  void removeAtIndexFromReorderList(int index) => reorderList.removeAt(index);
  void insertAtIndexInReorderList(int index, int item) =>
      reorderList.insert(index, item);
  void updateReorderListAtIndex(int index, Function(int) updateFn) =>
      reorderList[index] = updateFn(reorderList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? communityForYouReorder;
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? communityBreathingReorder;
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? communityBodyReorder;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
