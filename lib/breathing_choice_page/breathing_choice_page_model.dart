import '/components/before_bed_breathing_comp_widget.dart';
import '/components/calm_breathing_comp_widget.dart';
import '/components/deep_breathing_comp_widget.dart';
import '/components/long_breathe_meditation_f_i_n_a_l_widget.dart';
import '/components/short_breathe_meditation_f_i_n_a_l_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'breathing_choice_page_widget.dart' show BreathingChoicePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BreathingChoicePageModel
    extends FlutterFlowModel<BreathingChoicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for DeepBreathingComp component.
  late DeepBreathingCompModel deepBreathingCompModel;
  // Model for CalmBreathingComp component.
  late CalmBreathingCompModel calmBreathingCompModel;
  // Model for LongBreatheMeditationFINAL component.
  late LongBreatheMeditationFINALModel longBreatheMeditationFINALModel;
  // Model for BeforeBedBreathingComp component.
  late BeforeBedBreathingCompModel beforeBedBreathingCompModel;
  // Model for ShortBreatheMeditationFINAL component.
  late ShortBreatheMeditationFINALModel shortBreatheMeditationFINALModel;

  @override
  void initState(BuildContext context) {
    deepBreathingCompModel =
        createModel(context, () => DeepBreathingCompModel());
    calmBreathingCompModel =
        createModel(context, () => CalmBreathingCompModel());
    longBreatheMeditationFINALModel =
        createModel(context, () => LongBreatheMeditationFINALModel());
    beforeBedBreathingCompModel =
        createModel(context, () => BeforeBedBreathingCompModel());
    shortBreatheMeditationFINALModel =
        createModel(context, () => ShortBreatheMeditationFINALModel());
  }

  @override
  void dispose() {
    deepBreathingCompModel.dispose();
    calmBreathingCompModel.dispose();
    longBreatheMeditationFINALModel.dispose();
    beforeBedBreathingCompModel.dispose();
    shortBreatheMeditationFINALModel.dispose();
  }
}
