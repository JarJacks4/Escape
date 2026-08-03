import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'soundscapes_see_all_page_sleep_widget.dart'
    show SoundscapesSeeAllPageSleepWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SoundscapesSeeAllPageSleepModel
    extends FlutterFlowModel<SoundscapesSeeAllPageSleepWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  AudioPlayer? soundPlayer;
  // State field(s) for Column widget.
  ScrollController? columnController2;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
  }
}
