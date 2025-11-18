import '/components/fire_nature_meditation_widget.dart';
import '/components/thunderstorms_nature_meditation_widget.dart';
import '/components/waterfalls_nature_meditation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nature_choice_comp_widget.dart' show NatureChoiceCompWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NatureChoiceCompModel extends FlutterFlowModel<NatureChoiceCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for FireNatureMeditation component.
  late FireNatureMeditationModel fireNatureMeditationModel;
  // Model for WaterfallsNatureMeditation component.
  late WaterfallsNatureMeditationModel waterfallsNatureMeditationModel;
  // Model for ThunderstormsNatureMeditation component.
  late ThunderstormsNatureMeditationModel thunderstormsNatureMeditationModel;

  @override
  void initState(BuildContext context) {
    fireNatureMeditationModel =
        createModel(context, () => FireNatureMeditationModel());
    waterfallsNatureMeditationModel =
        createModel(context, () => WaterfallsNatureMeditationModel());
    thunderstormsNatureMeditationModel =
        createModel(context, () => ThunderstormsNatureMeditationModel());
  }

  @override
  void dispose() {
    fireNatureMeditationModel.dispose();
    waterfallsNatureMeditationModel.dispose();
    thunderstormsNatureMeditationModel.dispose();
  }
}
