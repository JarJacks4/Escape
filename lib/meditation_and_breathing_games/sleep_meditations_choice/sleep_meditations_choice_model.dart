import '/components/deep_sleep_meditation_widget.dart';
import '/components/insomnia_meditation_comp_widget.dart';
import '/components/nap_meditation_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'sleep_meditations_choice_widget.dart' show SleepMeditationsChoiceWidget;
import 'package:flutter/material.dart';

class SleepMeditationsChoiceModel
    extends FlutterFlowModel<SleepMeditationsChoiceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for DeepSleepMeditation component.
  late DeepSleepMeditationModel deepSleepMeditationModel;
  // Model for NapMeditationComp component.
  late NapMeditationCompModel napMeditationCompModel;
  // Model for InsomniaMeditationComp component.
  late InsomniaMeditationCompModel insomniaMeditationCompModel;

  @override
  void initState(BuildContext context) {
    deepSleepMeditationModel =
        createModel(context, () => DeepSleepMeditationModel());
    napMeditationCompModel =
        createModel(context, () => NapMeditationCompModel());
    insomniaMeditationCompModel =
        createModel(context, () => InsomniaMeditationCompModel());
  }

  @override
  void dispose() {
    deepSleepMeditationModel.dispose();
    napMeditationCompModel.dispose();
    insomniaMeditationCompModel.dispose();
  }
}
