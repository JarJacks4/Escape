import '/auth/firebase_auth/auth_util.dart';
import '/components/subscription_comp2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/headers/header_provider_community/header_provider_community_widget.dart';
import '/provider_community/tabbar_home_community/tabbar_home_community_widget.dart';
import 'user_community_page_view_f_i_n_a_l_widget.dart'
    show UserCommunityPageViewFINALWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UserCommunityPageViewFINALModel
    extends FlutterFlowModel<UserCommunityPageViewFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderProviderCommunity component.
  late HeaderProviderCommunityModel headerProviderCommunityModel;
  // Model for tabbarHomeCommunity component.
  late TabbarHomeCommunityModel tabbarHomeCommunityModel;

  @override
  void initState(BuildContext context) {
    headerProviderCommunityModel =
        createModel(context, () => HeaderProviderCommunityModel());
    tabbarHomeCommunityModel =
        createModel(context, () => TabbarHomeCommunityModel());
  }

  @override
  void dispose() {
    headerProviderCommunityModel.dispose();
    tabbarHomeCommunityModel.dispose();
  }
}
