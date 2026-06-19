import '/components/soundscape_card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'see_all_page_widget.dart' show SeeAllPageWidget;
import 'package:flutter/material.dart';

class SeeAllPageModel extends FlutterFlowModel<SeeAllPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // State field(s) for Row widget.
  ScrollController? rowScrollController;
  // Model for SoundscapeCard.
  late SoundscapeCard2Model soundscapeCardModel1;
  // Model for SoundscapeCard.
  late SoundscapeCard2Model soundscapeCardModel2;
  // Model for SoundscapeCard.
  late SoundscapeCard2Model soundscapeCardModel3;
  // Model for SoundscapeCard.
  late SoundscapeCard2Model soundscapeCardModel4;
  // Model for SoundscapeCard.
  late SoundscapeCard2Model soundscapeCardModel5;
  // Model for SoundscapeCard.
  late SoundscapeCard2Model soundscapeCardModel6;
  // Model for SoundscapeCard.
  late SoundscapeCard2Model soundscapeCardModel7;
  // Model for SoundscapeCard.
  late SoundscapeCard2Model soundscapeCardModel8;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    rowScrollController = ScrollController();
    soundscapeCardModel1 = createModel(context, () => SoundscapeCard2Model());
    soundscapeCardModel2 = createModel(context, () => SoundscapeCard2Model());
    soundscapeCardModel3 = createModel(context, () => SoundscapeCard2Model());
    soundscapeCardModel4 = createModel(context, () => SoundscapeCard2Model());
    soundscapeCardModel5 = createModel(context, () => SoundscapeCard2Model());
    soundscapeCardModel6 = createModel(context, () => SoundscapeCard2Model());
    soundscapeCardModel7 = createModel(context, () => SoundscapeCard2Model());
    soundscapeCardModel8 = createModel(context, () => SoundscapeCard2Model());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    rowScrollController?.dispose();
    soundscapeCardModel1.dispose();
    soundscapeCardModel2.dispose();
    soundscapeCardModel3.dispose();
    soundscapeCardModel4.dispose();
    soundscapeCardModel5.dispose();
    soundscapeCardModel6.dispose();
    soundscapeCardModel7.dispose();
    soundscapeCardModel8.dispose();
  }
}
