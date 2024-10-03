import '/flutter_flow/flutter_flow_util.dart';
import 'environment_choice_carousel_widget.dart'
    show EnvironmentChoiceCarouselWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EnvironmentChoiceCarouselModel
    extends FlutterFlowModel<EnvironmentChoiceCarouselWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
