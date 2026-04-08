import '/components/a_d_h_d_binaural_beats_widget.dart';
import '/components/binaural_beats_anxiety_relief_widget.dart';
import '/components/nature_sounds_page_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'binaural_beats_choice_comp_widget.dart'
    show BinauralBeatsChoiceCompWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BinauralBeatsChoiceCompModel
    extends FlutterFlowModel<BinauralBeatsChoiceCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for NatureSoundsPageComp component.
  late NatureSoundsPageCompModel natureSoundsPageCompModel;
  // Model for BinauralBeatsAnxietyRelief component.
  late BinauralBeatsAnxietyReliefModel binauralBeatsAnxietyReliefModel;
  // Model for ADHDBinauralBeats component.
  late ADHDBinauralBeatsModel aDHDBinauralBeatsModel;

  @override
  void initState(BuildContext context) {
    natureSoundsPageCompModel =
        createModel(context, () => NatureSoundsPageCompModel());
    binauralBeatsAnxietyReliefModel =
        createModel(context, () => BinauralBeatsAnxietyReliefModel());
    aDHDBinauralBeatsModel =
        createModel(context, () => ADHDBinauralBeatsModel());
  }

  @override
  void dispose() {
    natureSoundsPageCompModel.dispose();
    binauralBeatsAnxietyReliefModel.dispose();
    aDHDBinauralBeatsModel.dispose();
  }
}
