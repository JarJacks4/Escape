import '/components/a_d_h_d_binaural_beats_widget.dart';
import '/components/binaural_beats_anxiety_relief_widget.dart';
import '/components/nature_sounds_page_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'binaural_beats_choice_widget.dart' show BinauralBeatsChoiceWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BinauralBeatsChoiceModel
    extends FlutterFlowModel<BinauralBeatsChoiceWidget> {
  ///  State fields for stateful widgets in this page.

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
