import '/components/before_bed_breathing_comp_widget.dart';
import '/components/short_breathe_meditation_f_i_n_a_l_widget.dart';
import '/components/tai_chi_fair_lady_works_at_shuttle_comp_widget.dart';
import '/components/tai_chi_wild_horses_mane_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'tai_chi_moves_choice_comp_widget.dart' show TaiChiMovesChoiceCompWidget;
import 'package:flutter/material.dart';

class TaiChiMovesChoiceCompModel
    extends FlutterFlowModel<TaiChiMovesChoiceCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for TaiChiWildHorsesManeComp component.
  late TaiChiWildHorsesManeCompModel taiChiWildHorsesManeCompModel;
  // Model for TaiChiFairLadyWorksAtShuttleComp component.
  late TaiChiFairLadyWorksAtShuttleCompModel
      taiChiFairLadyWorksAtShuttleCompModel;
  // Model for BeforeBedBreathingComp component.
  late BeforeBedBreathingCompModel beforeBedBreathingCompModel;
  // Model for ShortBreatheMeditationFINAL component.
  late ShortBreatheMeditationFINALModel shortBreatheMeditationFINALModel;

  @override
  void initState(BuildContext context) {
    taiChiWildHorsesManeCompModel =
        createModel(context, () => TaiChiWildHorsesManeCompModel());
    taiChiFairLadyWorksAtShuttleCompModel =
        createModel(context, () => TaiChiFairLadyWorksAtShuttleCompModel());
    beforeBedBreathingCompModel =
        createModel(context, () => BeforeBedBreathingCompModel());
    shortBreatheMeditationFINALModel =
        createModel(context, () => ShortBreatheMeditationFINALModel());
  }

  @override
  void dispose() {
    taiChiWildHorsesManeCompModel.dispose();
    taiChiFairLadyWorksAtShuttleCompModel.dispose();
    beforeBedBreathingCompModel.dispose();
    shortBreatheMeditationFINALModel.dispose();
  }
}
