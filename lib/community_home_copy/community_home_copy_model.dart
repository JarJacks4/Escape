import '/components/customdrawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_home_copy_widget.dart' show CommunityHomeCopyWidget;
import 'package:flutter/material.dart';

class CommunityHomeCopyModel extends FlutterFlowModel<CommunityHomeCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for customdrawer component.
  late CustomdrawerModel customdrawerModel;

  @override
  void initState(BuildContext context) {
    customdrawerModel = createModel(context, () => CustomdrawerModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    customdrawerModel.dispose();
  }
}
