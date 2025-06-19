import '/components/fire_nature_meditation_widget.dart';
import '/components/thunderstorms_nature_meditation_widget.dart';
import '/components/waterfalls_nature_meditation_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'nature_mediation_choice_widget.dart' show NatureMediationChoiceWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NatureMediationChoiceModel
    extends FlutterFlowModel<NatureMediationChoiceWidget> {
  ///  State fields for stateful widgets in this page.

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
