import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'explore_page_version5_f_i_n_a_l_widget.dart'
    show ExplorePageVersion5FINALWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ExplorePageVersion5FINALModel
    extends FlutterFlowModel<ExplorePageVersion5FINALWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for component widget.
  bool componentHovered1 = false;
  AudioPlayer? soundPlayer4;
  // State field(s) for component widget.
  bool componentHovered2 = false;
  AudioPlayer? soundPlayer5;
  // State field(s) for component widget.
  bool componentHovered3 = false;
  AudioPlayer? soundPlayer6;
  // State field(s) for component widget.
  bool componentHovered4 = false;
  AudioPlayer? soundPlayer7;
  // State field(s) for component widget.
  bool componentHovered5 = false;
  AudioPlayer? soundPlayer8;
  // State field(s) for component widget.
  bool componentHovered6 = false;
  AudioPlayer? soundPlayer9;
  // State field(s) for component widget.
  bool componentHovered7 = false;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
  }
}
