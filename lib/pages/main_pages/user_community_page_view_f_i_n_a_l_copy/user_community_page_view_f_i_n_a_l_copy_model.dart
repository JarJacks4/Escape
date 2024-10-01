import '/flutter_flow/flutter_flow_util.dart';
import '/provider_community/tabbar_home_community/tabbar_home_community_widget.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'user_community_page_view_f_i_n_a_l_copy_widget.dart'
    show UserCommunityPageViewFINALCopyWidget;
import 'package:flutter/material.dart';

class UserCommunityPageViewFINALCopyModel
    extends FlutterFlowModel<UserCommunityPageViewFINALCopyWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? providerCommunityWalkthroughController;
  // Model for tabbarHomeCommunity component.
  late TabbarHomeCommunityModel tabbarHomeCommunityModel;

  @override
  void initState(BuildContext context) {
    tabbarHomeCommunityModel =
        createModel(context, () => TabbarHomeCommunityModel());
  }

  @override
  void dispose() {
    providerCommunityWalkthroughController?.finish();
    tabbarHomeCommunityModel.dispose();
  }
}
