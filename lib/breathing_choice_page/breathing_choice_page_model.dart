import '/components/basic_breathing_page_comp_widget.dart';
import '/components/before_bed_breathing_comp_widget.dart';
import '/components/calm_breathing_comp_widget.dart';
import '/components/deep_breathing_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'breathing_choice_page_widget.dart' show BreathingChoicePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  // Model for BasicBreathingPageComp component.
  late BasicBreathingPageCompModel basicBreathingPageCompModel;
  // Model for BeforeBedBreathingComp component.
  late BeforeBedBreathingCompModel beforeBedBreathingCompModel;

  @override
  void initState(BuildContext context) {
    deepBreathingCompModel =
        createModel(context, () => DeepBreathingCompModel());
    calmBreathingCompModel =
        createModel(context, () => CalmBreathingCompModel());
    basicBreathingPageCompModel =
        createModel(context, () => BasicBreathingPageCompModel());
    beforeBedBreathingCompModel =
        createModel(context, () => BeforeBedBreathingCompModel());
  }

  @override
  void dispose() {
    deepBreathingCompModel.dispose();
    calmBreathingCompModel.dispose();
    basicBreathingPageCompModel.dispose();
    beforeBedBreathingCompModel.dispose();
  }
}
