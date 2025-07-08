import '/components/basic_breathing_page_comp_widget.dart';
import '/components/box_breathing_meditation_card_f_i_n_a_l_widget.dart';
import '/components/microcosmic_orbit_meditation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'meditation_choice_page_widget.dart' show MeditationChoicePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MeditationChoicePageModel
    extends FlutterFlowModel<MeditationChoicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for BoxBreathingMeditationCardFINAL component.
  late BoxBreathingMeditationCardFINALModel
      boxBreathingMeditationCardFINALModel;
  // Model for BasicBreathingPageComp component.
  late BasicBreathingPageCompModel basicBreathingPageCompModel;
  // Model for MicrocosmicOrbitMeditation component.
  late MicrocosmicOrbitMeditationModel microcosmicOrbitMeditationModel;

  @override
  void initState(BuildContext context) {
    boxBreathingMeditationCardFINALModel =
        createModel(context, () => BoxBreathingMeditationCardFINALModel());
    basicBreathingPageCompModel =
        createModel(context, () => BasicBreathingPageCompModel());
    microcosmicOrbitMeditationModel =
        createModel(context, () => MicrocosmicOrbitMeditationModel());
  }

  @override
  void dispose() {
    boxBreathingMeditationCardFINALModel.dispose();
    basicBreathingPageCompModel.dispose();
    microcosmicOrbitMeditationModel.dispose();
  }
}
