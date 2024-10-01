import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_carousel_widget.dart' show MeditationCarouselWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MeditationCarouselModel
    extends FlutterFlowModel<MeditationCarouselWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
