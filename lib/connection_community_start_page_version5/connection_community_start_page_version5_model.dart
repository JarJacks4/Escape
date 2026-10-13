import '/components/influencer_ambassador_program_button_widget.dart';
import '/components/marketplace_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'connection_community_start_page_version5_widget.dart'
    show ConnectionCommunityStartPageVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ConnectionCommunityStartPageVersion5Model
    extends FlutterFlowModel<ConnectionCommunityStartPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  AudioPlayer? soundPlayer1;
  // Model for MarketplaceButton component.
  late MarketplaceButtonModel marketplaceButtonModel;
  AudioPlayer? soundPlayer2;
  // Model for InfluencerAmbassadorProgramButton component.
  late InfluencerAmbassadorProgramButtonModel
      influencerAmbassadorProgramButtonModel;
  AudioPlayer? soundPlayer3;

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
