import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'community_home_f_i_n_a_l_widget.dart' show CommunityHomeFINALWidget;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? updateForYou;
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? updateBreathing;
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? updateBody;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
