import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/provider_community/tabbar_home_community/tabbar_home_community_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'user_community_page_view_widget.dart' show UserCommunityPageViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserCommunityPageViewModel
    extends FlutterFlowModel<UserCommunityPageViewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for tabbarHomeCommunity component.
  late TabbarHomeCommunityModel tabbarHomeCommunityModel;

  @override
  void initState(BuildContext context) {
    tabbarHomeCommunityModel =
        createModel(context, () => TabbarHomeCommunityModel());
  }

  @override
  void dispose() {
    tabbarHomeCommunityModel.dispose();
  }
}
