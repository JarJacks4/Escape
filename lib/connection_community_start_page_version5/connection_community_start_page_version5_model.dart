import '/components/influencer_ambassador_program_button_widget.dart';
import '/components/marketplace_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connection_community_start_page_version5_widget.dart'
    show ConnectionCommunityStartPageVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ConnectionCommunityStartPageVersion5Model
    extends FlutterFlowModel<ConnectionCommunityStartPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;
  int get tabBarPreviousIndex1 =>
      tabBarController1 != null ? tabBarController1!.previousIndex : 0;

  AudioPlayer? soundPlayer1;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  AudioPlayer? soundPlayer2;
  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;
  int get tabBarPreviousIndex2 =>
      tabBarController2 != null ? tabBarController2!.previousIndex : 0;

  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;
  AudioPlayer? soundPlayer13;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  AudioPlayer? soundPlayer14;
  AudioPlayer? soundPlayer15;
  // State field(s) for Column widget.
  ScrollController? columnController6;
  AudioPlayer? soundPlayer16;
  AudioPlayer? soundPlayer17;
  AudioPlayer? soundPlayer18;
  AudioPlayer? soundPlayer19;
  // State field(s) for Column widget.
  ScrollController? columnController7;
  AudioPlayer? soundPlayer20;
  AudioPlayer? soundPlayer21;
  // Model for MarketplaceButton component.
  late MarketplaceButtonModel marketplaceButtonModel;
  // Model for InfluencerAmbassadorProgramButton component.
  late InfluencerAmbassadorProgramButtonModel
      influencerAmbassadorProgramButtonModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    columnController5 = ScrollController();
    columnController6 = ScrollController();
    columnController7 = ScrollController();
    marketplaceButtonModel =
        createModel(context, () => MarketplaceButtonModel());
    influencerAmbassadorProgramButtonModel =
        createModel(context, () => InfluencerAmbassadorProgramButtonModel());
  }

  @override
  void dispose() {
    tabBarController1?.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    tabBarController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
    columnController6?.dispose();
    columnController7?.dispose();
    marketplaceButtonModel.dispose();
    influencerAmbassadorProgramButtonModel.dispose();
  }
}
