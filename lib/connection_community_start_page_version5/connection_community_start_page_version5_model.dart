import '/auth/firebase_auth/auth_util.dart';
import '/components/influencer_ambassador_program_button_widget.dart';
import '/components/marketplace_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import 'connection_community_start_page_version5_widget.dart'
    show ConnectionCommunityStartPageVersion5Widget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/actions/index.dart'
    as tiktokfeed_wz8en7_actions;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class ConnectionCommunityStartPageVersion5Model
    extends FlutterFlowModel<ConnectionCommunityStartPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  AudioPlayer? soundPlayer;
  // Stores action output result for [Custom Action - reorderTiktokPages] action in TabBar widget.
  List<tiktokfeed_wz8en7_data_schema.TiktokPageStruct>? reorderVideos;
  // Model for MarketplaceButton component.
  late MarketplaceButtonModel marketplaceButtonModel;
  // Model for InfluencerAmbassadorProgramButton component.
  late InfluencerAmbassadorProgramButtonModel
      influencerAmbassadorProgramButtonModel;

  @override
  void initState(BuildContext context) {
    marketplaceButtonModel =
        createModel(context, () => MarketplaceButtonModel());
    influencerAmbassadorProgramButtonModel =
        createModel(context, () => InfluencerAmbassadorProgramButtonModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    marketplaceButtonModel.dispose();
    influencerAmbassadorProgramButtonModel.dispose();
  }
}
