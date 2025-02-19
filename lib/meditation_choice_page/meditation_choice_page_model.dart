import '/components/basic_breathing_page_comp_widget.dart';
import '/components/box_breathing_meditation_card_f_i_n_a_l_widget.dart';
import '/components/microcosmic_orbit_meditation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'meditation_choice_page_widget.dart' show MeditationChoicePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeditationChoicePageModel
    extends FlutterFlowModel<MeditationChoicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for BoxBreathingMeditationCardFINAL component.
  late BoxBreathingMeditationCardFINALModel
      boxBreathingMeditationCardFINALModel;
  // Model for MicrocosmicOrbitMeditation component.
  late MicrocosmicOrbitMeditationModel microcosmicOrbitMeditationModel;
  // Model for BasicBreathingPageComp component.
  late BasicBreathingPageCompModel basicBreathingPageCompModel;

  @override
  void initState(BuildContext context) {
    boxBreathingMeditationCardFINALModel =
        createModel(context, () => BoxBreathingMeditationCardFINALModel());
    microcosmicOrbitMeditationModel =
        createModel(context, () => MicrocosmicOrbitMeditationModel());
    basicBreathingPageCompModel =
        createModel(context, () => BasicBreathingPageCompModel());
  }

  @override
  void dispose() {
    boxBreathingMeditationCardFINALModel.dispose();
    microcosmicOrbitMeditationModel.dispose();
    basicBreathingPageCompModel.dispose();
  }
}
