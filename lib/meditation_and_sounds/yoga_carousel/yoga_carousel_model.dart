import '/flutter_flow/flutter_flow_util.dart';
import 'yoga_carousel_widget.dart' show YogaCarouselWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class YogaCarouselModel extends FlutterFlowModel<YogaCarouselWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
